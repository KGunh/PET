<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="resources/css/hospital/hospitalMain.css"/>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=265dcb92e33a3dc46e2d0249640f425e"></script>
	
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

		<div id="menu_wrap" class="bg_white">
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>
	
	
	<script>
	
		/* 지도 생성 */
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3 // 지도의 확대 레벨 
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var zoomControl = new kakao.maps.ZoomControl(); // 지도에 확대 축소 컨트롤을 생성한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); // 지도의 우측에 확대 축소 컨트롤을 추가한다
		var lastInfowindow = null; // 인포 윈도우 상태확인용
		
		
		/* HTML5의 geolocation으로 사용할 수 있는지 확인합니다 */
		if (navigator.geolocation) { // GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(position => {
				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude, // 경도
				locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				
				map.setCenter(locPosition);
			});
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..';
			displayMarker(locPosition, message);
		}
	
		
		// 마커를 담을 배열입니다
		var markers = [];
		
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});
		
		$(() => {
			moveMarkers();
		});
		
		kakao.maps.event.addListener(map, 'dragend', function () {
			moveMarkers();
		});
		
		mapContainer.addEventListener ('wheel', event => {
			moveMarkers();
		});
		
		
		// 지도 영역에 해당하는 DB값 불러오기
	    function moveMarkers(){
		    var bounds = map.getBounds();
		    var neLat = bounds.getNorthEast().getLat();
		    var neLng = bounds.getNorthEast().getLng();
		    var swLat = bounds.getSouthWest().getLat();
		    var swLng = bounds.getSouthWest().getLng();

		    $.ajax({
		    	url : "places/P1/" + neLat + "/" + neLng + "/" + swLat + "/" + swLng,
		    	success : result => {
		    		
    		    	var listEl = document.getElementById('placesList'),
		            itemEl = '',
		            list = '',
		            fragment = document.createDocumentFragment(),
		            menuEl = document.getElementById('menu_wrap');
    		    	
    		    	// 검색 결과 목록에 추가된 항목들을 제거합니다
    			    removeAllChildNods(listEl);

    		    	// 지도에 표시되고 있는 마커를 제거합니다
    			    removeMarker();
    		    	
		            result.forEach((result, index) => {
		            	markersAndInfowindow(result, map);
		            	// 페이지 번호를 표출합니다
		            	/*
		                displayPagination(pagination);
		                */
		            	list += '<li>'
           					  + '<span>' + (index+1) + '</span>'
		                      + '<div class="info">'
		             	      + '<h5>' + places.placeName + '</h5>'
							  + '<span>' + places.newAddr + '</span>' 
							  + '<span class="jibun gray">' +  places.oldAddr  + '</span>'
		            		  + '<span class="tel">' + places.placeTel  + '</span>' 
		            		  + '</div></li>';    
		            	
		            	// itemEl = getListItem(index, result);
		                
		                // fragment.appendChild(itemEl);
		                
		            });
		            
		           // listEl.appendChild(fragment);
		            menuEl.scrollTop = 0;

		            
		            //$('#menu_wrap').html(list);
		    		

		    		// console.log(lastInfowindow)
    			
		    		    
		    		    
		    		    
		    		    
		    		    
		    		    
		    		
		    			
		    		
				}
			});
	    }
	    
		
		/* 마커랑 인포윈도우 추가 */
	    function markersAndInfowindow(result, map){
			
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png'; 
			
			// 마커 이미지의 이미지 크기 입니다
		    imageSize = new kakao.maps.Size(24, 35),  // 마커 이미지의 크기
        	
        	markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize)
			
			// 마커 좌표를 생성합니다    
		    var position = new kakao.maps.LatLng(result.placeLat, result.placeLon);
			   
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: position, // 마커를 표시할 위치
		        image : markerImage // 마커 이미지 
		    });
		    
    		// 인포윈도우를 생성합니다
    		var infowindow = new kakao.maps.InfoWindow({
    		    position : position, 
    		    content : '<div>' + result.placeName + '</div>'
    		});
    		  
    		// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
    		kakao.maps.event.addListener(marker, 'click', function() {
    			if (lastInfowindow) {
		            lastInfowindow.close();
		        }
		        infowindow.open(map, marker);
		        lastInfowindow = infowindow;
    		});
		}
		
		// 검색결과 항목을 Element로 반환하는 함수입니다
	    function getListItem(index, places) {
			
	        var el = document.createElement('li');
	       
	        let itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>'
	                    + '<div class="info">'
	             	    + '<h5>' + places.placeName + '</h5>'
						+ '<span>' + places.newAddr + '</span>' 
						+ '<span class="jibun gray">' +  places.oldAddr  + '</span>'
	            		+ '<span class="tel">' + places.placeTel  + '</span>' +
	                    '</div>';           


	        el.innerHTML = itemStr;
	        el.className = 'item';
	        return el;
	    }
	    
	    // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	    function removeAllChildNods(el) {   
	        while (el.hasChildNodes()) {
	            el.removeChild (el.lastChild);
	        }
	    }
	    
	    function removeMarker() {
	        for ( var i = 0; i < markers.length; i++ ) {
	            markers[i].setMap(null);
	        }   
	        markers = [];
	    }
	    
	 	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	    function displayPagination(pagination) {
	        var paginationEl = document.getElementById('pagination'),
	            fragment = document.createDocumentFragment(),
	            i; 

	        // 기존에 추가된 페이지번호를 삭제합니다
	        while (paginationEl.hasChildNodes()) {
	            paginationEl.removeChild (paginationEl.lastChild);
	        }

	        for (i=1; i<=pagination.last; i++) {
	            var el = document.createElement('a');
	            el.href = "#";
	            el.innerHTML = i;

	            if (i===pagination.current) {
	                el.className = 'on';
	            } else {
	                el.onclick = (function(i) {
	                    return function() {
	                    	moveMarkersByPage(i); // 페이지 번호에 따라 마커를 이동시키는 함수 호출
	                    }
	                })(i);
	            }

	            fragment.appendChild(el);
	        }
	        paginationEl.appendChild(fragment);
	    }
	 	
	 	// 페이지 번호에 따라 마커를 이동시키는 함수
	    function moveMarkersByPage(pageNumber) {
	        // 이전에 있던 마커들을 제거합니다
	        removeMarker();

	        // 서버에 해당 페이지의 데이터를 요청하고, 그에 따라 마커를 추가합니다
	        $.ajax({
	            url: "places/P1/" + neLat + "/" + neLng + "/" + swLat + "/" + swLng + "?page=" + pageNumber, // 페이지 번호를 파라미터로 전달
	            success: result => {
	                var listEl = document.getElementById('placesList'),
	                    itemEl = '',
	                    fragment = document.createDocumentFragment(),
	                    menuEl = document.getElementById('menu_wrap');

	                // 검색 결과 목록에 추가된 항목들을 제거합니다
	                removeAllChildNods(listEl);

	                result.forEach((result, index) => {
	                    markersAndInfowindow(result, map, index);

	                    itemEl = getListItem(index, result);
	                    fragment.appendChild(itemEl);
	                });

	                listEl.appendChild(fragment);
	                menuEl.scrollTop = 0;

	                // 페이징 처리
	                displayPagination(pagination);
	            }
	        });
	 	}
	    
		
	</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>