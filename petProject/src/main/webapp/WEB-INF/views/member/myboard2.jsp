<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 게시글</title>
	<style>
			div{
		box-sizing : border-box;
	}
	
	#submenubar{
		width : 1200px;
		height: 150px;
		margin : auto;
	}
	#submenubar > searchForm{
		float : left;
	}
	#searchForm{
		width : 50%;
		height : 100%;
		position: relative;
		float: left;
	}
	#search{
		width : 300px;
		height : 40%;
		position : absolute;
		left: 30px;
		top : 50px;
	}
	#searchcon{
		width : 200px;
		height : 100%;
		border-bottom : 1px solid rgb(235, 235, 235);
	}
	#searchContent{
		outline : none;
		margin-top: 25px;
		margin-left: 5px;
		border : 0;
	}
	#searchImg{
		width : 30px;
		height: 60%;
		padding-top : 25px;
	}
	#searchimg{
		width : 30px;
		height: 30px;
		cursor: pointer;
	}
	#searchimg:hover{
		width : 31px;
		height: 31px;
	}
	#search > div{
		float: left;
	}

	.selectctg{
		width : 40%;
		height: 100%;
		float: left;
		position: relative;
	}
	#select{
		width : 220px;
	 	justify-content: space-between;
		height: 200px;
		position: absolute;
		right: 0;
        flex-direction: column;
        top : 30%;
	}
	#styleboardform, #styleaniform{
		width: 110px;
		height : 100%;
		float: left;
	}
	#selectstyle, #selectani{
		width : 110px;
		height : 30px;
	    display: flex;	
    	justify-content: center;
	}
	#styleboard, #styleani{
		width : 90px;
		height : 30px;
		font-size: 15px;
		font-weight: bold;
		background-color: rgb(248, 243, 221);
		color: rgba(122, 88, 33, 0.92);
		text-align : center;
		line-height: 30px;
	    border-top-left-radius: 10px;
	    border-top-right-radius: 10px; 
	    cursor: pointer;
	    float: left;
   		margin-right: 10px;
   	}
	#styleboard:hover, #styleani:hover{
		font-size: 16px;
	}
	#line{
		width : 300px;
		margin-left: 180px;
		margin-top : 15%;
		border: 1px solid rgba(190, 190, 190, 0.2);
	}
	
	#boardinfo, #aniinfo {
		display: none;
	}
	
	#boardinfo{
		width : 90%;
		height: 30%;
		background-color: rgba(190, 190, 190, 0.2);
	    border-radius: 10px;
        margin-top : 10px;
	}
	#aniinfo{
		width : 90%;
		height: 75%;
		background-color: rgba(190, 190, 190, 0.2);
	    border-radius: 10px;
	    margin-top : 10px;
	    top : 0;
	}
	span{
		text-align: center;
		cursor: pointer;
		font-size: 15px;
	}
	span:hover{
		font-size: 16px;
	}
	#needgongan1{
		width : 800px;
		height: 80px;
		margin :auto;
	}
	#boardoutput{
		width :900px;
		height: auto;
		margin : auto;
	}
	#myboard{
		width : 900px;
		height: 150px;
		border: 1px solid rgb(214, 214, 214);
		margin : auto;
		border-radius: 10px;
		display: flex;
		position : relative;
		cursor :pointer;
	}
	#myboard:hover{
    	box-shadow : 1px 1px 1px;
	}
	#thumbnail{
		width :150px;
		height: 150px;
	}
	#boardlist{
		width :670px;
		height: 150px;
		margin-left :5px;
	}
	#thumbnail img{
		width :99%;
		height: 99%;
		border : 1px solid rgb(214, 214, 214);
	}
	#gomain{
		width: 900px;
		height: 120px;
		margin : auto;
		position : relative;
	}
	#mainbtn{
		width: 140px;
		height: 50px;
		position : absolute;
		right: 0;
		transform: translate(0, 10%);
	    font-size: 15px;
	    border-radius: 10px;
	    background-color: rgb(94, 87, 59);
	    color:white;
	    font-weight: bold;
	    bolder: 0;
	    cursor :pointer;
	}
	#mainbtn:hover{
		font-size: 16px;
		width: 141px;
		height: 51px;
	}
	#boardheader{
		width :670px;
		height: 25%;
		display: flex;
	}
	#boardme{
		width :100px;
		height: 100%;
		font-size : 20px;
		font-weight :bold;
	}
	#myboardAni{
		width : 470px;
		height: 100%;
	}
	.animalAndCategory{
		width :60px;
		height: 25px;
		background-color: rgb(255, 239, 175);	
		line-height: 30px;
		margin-top : 5px;
		font-weight: bold;
		margin-right: 5px;
		float : left;
	}	
	#boardCreate{
		width : 80px;
		height: 100%;
	}
	#boardtitle{
		width :670px;
		height: 25%;
	}
	#boardcontent{
		width :670px;
		height: 50%;
	}
	#boardLike{
		width :70px;
		height :100%;	
		position :absolute;
		right: 0;	
	}
	#likeinfo{
		width : 100%;
		height: 25%;
	}
	#likeboard{
		width : 100%;
		height: 25%;
	}
	#seeboard{
		width : 100%;
		height: 25%;
		line-height: 30px;
	}
	#replyboard{
		width : 100%;
		height: 25%;
	}
	#boardoutput >a{
	    text-decoration: none;
	    color: black; 
	}
	#detailbtn{
		border: 0;
		background-color: white;
		color : black;
		width :30px;
		height: 20px;
		margin-left: 10px;
	}
	#likeboard>img{
		width : 35px;
		height: 35px;
	}
	#replyboard>img{
		width : 35px;
		height: 35px;
	}
	#myani{
		background-color: rgba(242, 189, 108, 0.82);
	}
	</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<c:set value="${ sessionScope.path }" var="path" />
	
	<div id="submenubar">
	
		<div id="searchForm">
			<div id="search">
				<div id="searchcon">
					<input type="text" name="searchContent" id="searchContent"/>
				</div>
				<div id="searchImg">
					<img src="${path}/resources/img/common/searchform.png" alt="" id="searchimg">
				</div>
			</div>
		</div>
		
		<div class="selectctg">
			<div id="select">
				<div id="styleboardform">
					<div id="selectstyle" class="boardCategory">
						<span id="styleboard">글 성격</span>
					</div>
					<div id="boardinfo">
						<span class="category_info" value="I0"># 전체</span><br>
						<span class="category_info" value="I1"># 자유</span><br>
						<span class="category_info" value="I2"># 질문</span><br>
					</div>
				</div>
				<div id="styleaniform">
					<div id="selectani" class="aniCategory">	
						<span id="styleani">반려 동물</span>
					</div>
					<div id="aniinfo">
						<span class="animal_info" value='A0'># 전체</span><br>
						<span class="animal_info" value='A1'># 강아지</span><br>
						<span class="animal_info" value='A2'># 고양이</span><br>
						<span class="animal_info" value='A3'># 토끼</span><br>
						<span class="animal_info" value='A4'># 물고기</span><br>
						<span class="animal_info" value='A5'># 새</span><br>
						<span class="animal_info" value='A6'># 햄스터</span><br>
					</div>
				</div>
			</div>
			
			<div id="line"></div>
		</div>
		
	</div>
	
	<div id="needgongan1"></div>
		<div class="content_wrap" id="boardoutput"></div>
			
	<div id="gomain">
		<div class="btnDiv"><button>더 보기</button></div>
		<a href=""><button id="mainbtn">메인으로</button></a>
	</div>
	
	<script>
	
		// 초기 변수 선언
		let animal='A0',
		category = 'I0', 
		page = 1,
		text = '',
		resultStr = '',
		animalListStr = '',
		memberNo = ${sessionScope.loginUser.memberNo};
		
		
		
		$(() => {
			
			selectMyBoard(animal, category, page, memberNo);
			
			$('.category_info').click(function(){
				
				var categoryInfo = $(this).attr("value");
				category = categoryInfo;
				
				resultStr = '';
				selectMyBoard(animal, category, page, memberNo);
				
				$('#styleboard').text($(this).text().replace(/[# ]/g, ''));
				$('#boardinfo').css('display', 'none');
				
			});
			
			$('.animal_info').click(function(){
				
				var animalInfo = $(this).attr("value");
				animal = animalInfo;
				
				resultStr = '';
				selectMyBoard(animal, category, page, memberNo);
				
				$('#styleani').text($(this).text().replace(/[# ]/g, ''));
				$('#aniinfo').css('display', 'none');
				
			});
			
			$('.boardCategory').click(function(){
			     $('#boardinfo').toggle();
			});
			
			$('.aniCategory').click(function(){
			    $('#aniinfo').toggle();
			});
			$('#btncom').click(function(){
				$('#inscom').toggle();
			});
			
			$('.btnDiv > button').click(() => {
				selectMyBoard(animal, category, ++page, memberNo);
			});
			
		function dateFormat(date) {
	        let month = date.getMonth() + 1;
	        let day = date.getDate();
	        let hour = date.getHours();
	        let minute = date.getMinutes();
	        let second = date.getSeconds();
	        month = month >= 10 ? month : '0' + month;
	        day = day >= 10 ? day : '0' + day;
	        hour = hour >= 10 ? hour : '0' + hour;
	        minute = minute >= 10 ? minute : '0' + minute;
	        second = second >= 10 ? second : '0' + second;
	        
	        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
		}
				
		function selectMyBoard(animal, category, page, memberNo){
			
			console.log(animal);
			console.log(category);
			console.log(page);
			console.log(memberNo);
			
			$.ajax({
				url : 'selectMyBoard',
				data : {
					animal : animal,
					category : category,
					page : page,
					memberNo : memberNo
				},
				success : result => {
					console.log(result);
					for(let i in result){
						
						var animalListStr = '';
						var animalListResult = result[i].animalList;
						
						for(let i in animalListResult){
							animalListStr += '<div class="animalAndCategory">' 
										  + animalListResult[i].animalName
										  + '</div>'
						}
						
						animalListStr += '<br clear="both">';
						
						resultStr += '<div id="myboard" class="communityList">'
										+ '<div class="thumbnailImg" id="thumbnail"><img src="'
										+ result[i].attachmentList.attPath + result[i].attachmentList.changeName
										+ '"></div>'
										+ '<div class="center_content" id="boardlist">'
										+ '<input type="hidden" value="' + result[i].boardNo + '">'
											+ '<div id="boardheader">'
												+ '<div class="content_writer" id="boardme">' + result[i].memberNo + '</div>'
												+ '<div id="myboardAni"><span class="category" id="myani">' + animalListStr + '</span></div>'
												+ '<div class="create_date" id="boardCreate">' + result[i].boardCreateDate + '</div>'
											+ '</div>'
											+ '<div class="board_Title" id="boardtitle">' + result[i].boardTitle + '</div>'
											+ '<div class="content_text" id="boardcontent">' + result[i].boardContent + '</div>'
										+ '</div>'
											+ '<div class="content_reaction" id="boardLike">'
												+ '<div id="likeinfo"><button id="detailbtn">&nbsp;&nbsp;&nbsp;˚&nbsp;˚&nbsp;˚</button></div>'
												+ '<div id="likeboard"><img id="like_board" src="${sessionScope.path }/resources/img/common/like.png">&nbsp;&nbsp;(' + result[i].boardLike + ')</div>'
												+ '<div id="seeboard"><span>조회</span>&nbsp;&nbsp;&nbsp;(' + result[i].sumCount + ')</div>'
												+ '<div id="replyboard"><img src="${sessionScope.path }/resources/img/common/reply.png">&nbsp;&nbsp;(' + result[i].boardCount + ')</div>'
											+ '</div>'
									+ '</div>'
					};
					
					$('#like_board').click(function(){
						 var a = "${sessionScope.path}/resources/img/common/like2.png";
	                        $('#like_board img').attr('src', a);
					})
					
					$('.content_wrap').html(resultStr);
					
					$('.center_content').click(function() {
						
						var $communityDetail = $(this).next('.communityDetail');
						var boardNo = $(this).find('input[type="hidden"]').val();
						
						location.href = 'communityDetail?boardNo=' + boardNo;
					});
					
					if(result[0].pageInfo.currentPage != result[0].pageInfo.maxPage){
						$('.btnDiv').css('display', 'block');
					}
					else{
						$('.btnDiv').css('display', 'none');
					}
				}
			});
		}
		});
		
	</script>
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>