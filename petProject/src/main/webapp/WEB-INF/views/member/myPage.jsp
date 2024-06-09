<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>마이페이지</title>
<style>
    #myoutput{
        width: 1200px;
        height: 1600px;
        border-top: 1px solid rgb(230, 230, 230);
        margin: auto;
    }
    #myheader{
        width: 100%;
        height: 200px;
        border-bottom: 2px solid rgb(230, 230, 230);
    }
    #mycontent{
        width: 100%;
        height: 1200px;
    }
    #myback{
        width: 1000px;
        height: 1300px;
        transform: translate(10%, 3%);
        border-radius: 50px;
    }
    #myname > *{
        transform: translate(0%, 5%);
    }
    #myname{
        width: 80%;
        height: 70%;
        margin: auto;
        transform: translate(0%, 20%);
    }
    #myname > div{
        float: left;
    }
    #profile{
        width: 130px;
        height: 130px;
        border-radius: 50%;
        overflow: hidden;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 4px solid #000; 
        cursor : pointer;
    }
    #name{
        width: 500px;
        height: 130px;
        line-height: 180px;
        font-size: 23px;
        font-weight: 700;
    }
    #update{
        width: 140px;
        height: 130px;
    }
    #update button {
    	cursor : pointer;
    }
    #profile_img{
        width: 100%;
        height: 100%;
        object-fit: cover;  
    }
    #profile_img img{
        width: 150px;
        height: 150px;
    }
    #update_info{
        float: right;
        border-radius: 15px;
        background-color: rgba(197, 173, 135, 0.82);
        border: 0;
        color: white;
        height: 30px;
        font-weight: bold;
    }
    #mycontent{
        width: 100%;
        height: 1200px;
    }
    #content1{
        width: 100%;
        height: 20%;
    }
    #down{
        width: 95%;
        height: 10%;
        font-size: 20px;
        line-height: 7;
        margin: auto;
    }
    #down > div{
        width: 25%;
        height: 100%;
        font-size: 20px;
        font-weight: bold;
        line-height: 4;
        color: rgb(94, 87, 59);
        text-align:center;
        float: left;
    }
    #content2{
        width: 100%;
        height: 70%;
        border-top: 2px solid rgb(230, 230, 230);
        padding-top: 30px;
        padding-left: 10px;
    }
    #content1{
        list-style: none;
        border-top: 1px solid rgb(230, 230, 230);
    }
    #content1>li{
        float: left;
        text-align: center;
        width: 15%;
        margin-left: 8.2%;
        transform: translate(0%, 40%);
        height:62%;
        border-radius: 60% 60%;
        border: 1px solid rgba(255, 231, 192, 0.82);
        background-color: rgba(243, 222, 189, 0.82);
        font-weight: bold;
        color: rgb(78, 97, 114);
    }
    #shipment, #truck{
        margin-top: 20px;
    }
    #transit{
        margin-top: 10px;
    }
    #content2 > div{
        width: 33%;
        height: 30%;
        float: left;
        text-align: center;
        padding: 50px 80px;
    }
    #content > a{
        text-decoration: none;
        display: block;
        font-size: 17px;
        color: rgb(73, 73, 73);
        font-weight: bold;
        line-height: 70px;
    }
    #content > a:hover {
   		font-size: 18px;
   		color: rgba(197, 173, 135, 0.82);
    }
    #content > a > img{
        width: 70px;
        height: 70px;
    }
    #main{
        margin: auto;
        width: 200px;
        height: 50px;
    }
    #main_btn{
        width: 200px;
        height: 50px;
        border: 0;
        background-color: rgb(94, 87, 59);
        color: white;
        font-size: 20px;
        font-weight: bold;
        border-radius: 10px;
    }
    
    #info-btn{
    	width: 100%;
	    height: 40px;
	    font-size: 14px;
	    border-radius: 10px;
	    background-color: rgb(94, 87, 59);
	    color:white;
	    font-weight: bold;
    }
    #info-area input{
   	    border: none;
	    box-shadow: none;
	    padding: 12px 16px;
	    line-height: 1.2;
		outline:none;
		border-radius : 15px;
		border: 1px solid #e0e0e0;
		width :80%;
	    height :40px;
    }
    
    #info-area .input_form{
	    background: #fff;
	    box-sizing: border-box;
	    position: relative;
	    margin-bottom:15px;
	    width :100%;
   	    height :auto;
    }
        
    .animalList{
    	width:450px;
    	height:100px;
    	margin:auto;
    	position : relative;
    }
	.new > label{
		cursor:pointer;
    	width:70px;
    	height:25px;
    	border-radius : 30px;
	    display: inline-block;
	    padding: 10px;
	    cursor: pointer;
	    font-size:13px;
	    text-align:center;
	    line-height:0;
	    border:1px solid black;
	    font-weight:bold;
	}
	.clicked {
	  	background-color: rgba(242, 189, 108, 0.82);
	    color:white;
    	font-weight:bold;
    	border: 0;
	}
    
  	#myInfo{
		margin:30px 0px 20px;
	}
   	.up{
   		position: absolute;
        width : 40px;
        height: 25px;
        font-size :12px;
        right : 15px;
        top : 6px;
        border-radius : 5px;
        border: 0;
        background-color:rgba(197, 173, 135, 0.82);
    }
   	.up:hover {
        font-size :13px;
        color: white;
    }	
   	.up_A{
   		position: absolute;
        width : 40px;
        height: 25px;
        font-size :12px;
        right : 15px;
        top : 6px;
        border-radius : 5px;
        border: 0;
        background-color:rgba(197, 173, 135, 0.82);
    }
   	.up_A:hover {
        font-size :13px;
        color: white;
    }	
    .new{
    	width : 80%;
		position : relative;
    }
    .new input{
    	margin-top:15px;
    }
  	.checkPwd{
		position : absolute;
		right : 0;
		width: 30px;
		height : 30px;
		margin : 15px 10px;
	}
  	.checkOriginPwd{
		position : absolute;
		right : 0;
		width: 30px;
		height : 30px;
		margin : 17px 10px;
	}
	#profile_1{
        width: 110px;
        height:110px; 
	}
	#myAnimal{
    	width:100px;
    	height:40px;
    	border-radius : 30px;
	    font-size:11px;
	    text-align:center;
	    line-height:0;
	    font-weight:bold;
	  	background-color: rgba(242, 189, 108, 0.82);
    	font-weight:bold;
    	border: 0;	    
	}
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	<c:set var="loginUser" value="${ sessionScope.loginUser }" scope="session" />
	<div id="myoutput">
        <div id="myback">
            <div id="myheader">
                <div id="myname">
                    <div id="profile" >
                    <c:choose>
                    <c:when test='${loginUser.memberStatus.equals("K")}'>
	                    <form id="uploadForm" method="post" enctype="multpart/form-data">
	                        <input type="file" name="profile" id="my_profile" multiple="true">
	                        <div id="profile_img">
	                       		<img src="${ loginUser.profile }" alt="프로필사진">
	                        </div>
	                        <input type="hidden" name="memberNo" value="${loginUser.memberNo }">
	                   </form>
                   </c:when>
                   <c:otherwise>
	                    <form id="uploadForm" method="post" enctype="multpart/form-data">
	                        <input type="file" name="profile" id="my_profile" multiple="true">
	                        <div id="profile_img">
	                       		<img id="profile_1" src="${sessionScope.path}/resources/img/profile/${ loginUser.profile }" alt="프로필사진">
	                        </div>
	                        <input type="hidden" name="memberNo" value="${loginUser.memberNo }">
	                   </form>
                   </c:otherwise>
                   </c:choose>
                   </div>
                    <div id="name">
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;${ loginUser.nickname }</span><span id="nim"><small>&nbsp;님</small></span>
                    </div> 
                    <c:choose>
                    <c:when test='${loginUser.memberStatus.equals("K") or loginUser.memberStatus.equals("S")}'>
                    <div id="update">
                    </div> 
                   </c:when>
                   <c:otherwise>
                    <div id="update">
                        <button id="update_info" type="button" data-toggle="modal" data-target="#myInfo">정보 수정</button>
                    </div> 
                   </c:otherwise>
                   </c:choose>
                </div>
            </div>
            <div id="mycontent">
                <div id="content1">
                    <li class="circle"><img src="${sessionScope.path}/resources/img/common/deposit.png" alt="입금완료" width="140px" height="140px"></li>
                    <li class="circle"><img id="shipment" src="${sessionScope.path}/resources/img/common/shipment.png" alt="상품발송" width="110px" height="110px"></li>
                    <li class="circle"><img id="truck" src="${sessionScope.path}/resources/img/common/truck.png" alt="배송중" width="110px" height="110px"></li>
                    <li class="circle"><img id="transit" src="${sessionScope.path}/resources/img/common/transit.png" alt="배송완료" width="130px" height="130px"></li>
                </div>
                <div id="down">
                    <div>입금완료</div>
                    <div>상품발송</div>
                    <div>배송중</div>
                    <div>배송완료</div>
                </div>
                <div id="content2">
                    <div id="content"><a href="" data-toggle="modal" data-target="#myInfo"><img src="${sessionScope.path}/resources/img/common/selectmyinfo.png" alt=""><br>내 정보 조회</a></div>
                    <div id="content"><a href="myBoard"><img src="${sessionScope.path}/resources/img/common/board.png" alt=""><br>내가 쓴 게시글</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/common/comment.png" alt=""><br>내가 쓴 댓글</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/common/like.png" alt=""><br>내 좋아요</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/common/shopping.png" alt=""><br>내 결제 내역</a></div>
                    <!-- 
	                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/common/heart.png" alt=""><br>내가 찜한 상품</a></div>
	                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/common/mycart.png" alt=""><br>내 장바구니</a></div>
	                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/common/coupon.png" alt=""><br>내 쿠폰</a></div>
	                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/common/reser.png" alt=""><br>내 예약 내역</a></div>
               		-->
                </div>
                <div id="main"><button type="button" id="main_btn" onclick="location.href='${sessionScope.path}'">메인화면</button></div>
            </div>
        </div>
    </div>

    <script>
	    $(() => {
           	console.log('${sessionScope.loginUser.memberStatus}');
	    	$('#my_profile').hide();
	    	$('#profile_img').click(() => {
	    		$('#my_profile').click();
	    	});
            $('#my_profile').change(() => {
            	var form = $('#uploadForm')[0];
            	var formData = new FormData(form);
                $.ajax({
                    url: 'upProfile',
                    type : 'POST',
                    data : formData,
       			    processData:false,
       			    contentType:false,
       			    cache:false,
                    success: result => {
                        alert('프로필 사진이 성공적으로 업로드되었습니다.');
                        $('#profile_img').html('<img id="profile_1" src="${sessionScope.path}' + result + '" alt="프로필사진">');
                    },
                    error: result => {
                        alert('프로필 사진 업로드에 실패했습니다.');
                    }
                });
            });
	    });  
    </script>
    
    <div class="modal fade" id="myInfo">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        
        <!-- Modal body -->
        <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3 align="center" id="myInfo">내 정보 조회</h3>
        
		<div id="info-area">
			<input type="hidden" name="code" id="myCode">
			<input type="hidden" name="memberNo" id="loginNo" value="${loginUser.memberNo }">
			<div class="input_form">
				<input type="text" id="memberId" maxlength="10" value="${loginUser.memberId }" readonly>
			</div>
          		<c:choose>
           		<c:when test='${loginUser.memberStatus.equals("S") or loginUser.memberStatus.equals("K") }' >
					<div class="input_form">
					</div>
   				</c:when>
   				<c:otherwise>
					<div class="input_form">
						<input type="password" id="memberPwd1" name="memberPwd" value="${pwd }" required readonly>
						<button type="button" class="up_P" id="upPassword">수정</button>
						<div class="new" style="display:none;">
							<img src="${sessionScope.path}/resources/img/common/check.png" class="checkOriginPwd" style="display:none;">
							<input type="password" id="newPwd" maxlength="16" required placeholder="새로운 비밀번호를 입력하세요">
							<input type="password" id="newPwdCheck" maxlength="16" required placeholder="새로운 비밀번호를 한번 더 입력하세요">
							<div id="checkPwd" class="danger" style="font-size:0.7em; display:none;"></div>
							<img src="${sessionScope.path}/resources/img/common/check.png" class="checkPwd" style="display:none;">
						</div>
					</div>
   				</c:otherwise>
  				</c:choose>
  				
			<c:choose>
           		<c:when test='${loginUser.memberStatus.equals("S") or loginUser.memberStatus.equals("K") }' >
					<div class="input_form">
					</div>
   				</c:when>
   				<c:otherwise>	
				<div class="input_form">
					<input type="text" value="${loginUser.memberName }" id="loginName" readonly>
					<button type="button" class="up" id="upName">수정</button>
					<div class="new" style="display:none;"><input type="text" maxlength="10"></div>
				</div>
				</c:otherwise>
  				</c:choose>
  				
			<div class="input_form">
				<input type="text" id="newNickname" value="${loginUser.nickname }" required readonly>
				<button type="button" class="up" id="upNickname">수정</button>
				<div class="new" style="display:none;"><input type="text" id="nickname" maxlength="30" required></div>
			</div>
			<c:choose>
           		<c:when test='${loginUser.memberStatus.equals("S") or loginUser.memberStatus.equals("K") }' >
					<div class="input_form">
					</div>
   				</c:when>
   				<c:otherwise>	
				<div class="input_form">
					<input type="text" value="${loginUser.phone }" id="loginPhone" required readonly>
					<button type="button" class="up" id="upPhone">수정</button>
					<div class="new" style="display:none;"><input type="text" id="phone" maxlength="13" required></div>
				</div>
				</c:otherwise>
  				</c:choose>					
			
			<c:choose>
           		<c:when test='${loginUser.memberStatus.equals("S") or loginUser.memberStatus.equals("K") }' >
					<div class="input_form">
					</div>
   				</c:when>
   				<c:otherwise>		
				<div class="input_form">
					<input type="text" value="${loginUser.email }" id="loginEmail" required readonly>
					<button type="button" class="up" id="upEmail">수정</button>
					<div class="new" style="display:none;"><input type="text" id="email" maxlength="30" required></div>
				</div>
				</c:otherwise>
  				</c:choose>					
			<div class="animalList">
			<span>
			<c:forEach var="animal" items="${loginUser.animalList }">
				내 추천 동물 <span id="myAnimal">${animal.animalName }</span>
			</c:forEach>
			</span><br><br>
			<button type="button" class="up_A" id="upAnimal">수정</button>
			<div class="new" style="display:none;">
				<label for="animaldog"><input type="checkbox" class="animal1" name="animal" value="A1" id="animaldog" style="display:none;">강아지</label>
				<label for="animalcat"><input type="checkbox" class="animal1" name="animal" value="A2" id="animalcat" style="display:none;">고양이</label>
				<label for="animalrab"><input type="checkbox" class="animal1" name="animal" value="A3" id="animalrab" style="display:none;">토끼</label>
				<label for="animalfish"><input type="checkbox" class="animal1" name="animal" value="A4" id="animalfish" style="display:none;">물고기</label>
				<label for="animalbird"><input type="checkbox" class="animal1" name="animal" value="A5" id="animalbird" style="display:none;">새</label>
				<label for="animalham"><input type="checkbox" class="animal1" name="animal" value="A6" id="animalham" style="display:none;">햄스터</label>
			</div>
			</div>
			<div class="input_btn2"><button type="submit" id="info-btn" class="btn">수정 완료</button></div>
		</div>
		</div>
		</div>
	</div>
</div>
    
   	<script>
	var code = "";
	var animalList = [];
	$(() => {
	   var animalList = [];
	   $('.new label').click( e => {
		   $(e.currentTarget).addClass('clicked');
	   })
	   $('.animal1').change( e => {
	        var animalList = [];
		
	        $('.animal1:checked').each( e => {
	   	  		
	        	animalList.push($(e.currentTarget).val());
	        	console.log(animalList);
	        });
	        	$('input[name=animalList]').val(animalList.join(','));
	        	console.log($('input[name=animalList]').val());
		});
 	    $('.up_A').click(e => {
	    	if($(e.currentTarget).text() === "수정"){
	    		$(e.currentTarget).text("완료");
	    		$(e.currentTarget).next().show();
	    	} else {
	    		$(e.currentTarget).text("수정");
	    		$('#myAnimal').text($('input:checked').parent().text());
	    		$(e.currentTarget).next().hide();
	    	}
	    });

		<!-- 비밀번호 일치 확인 -->
		const $nowPwd = $('.input_form #nowPwd');
		const $checkOriginPwd = $('#checkOriginPwd');
		const $checkPwdimg = $('.checkOriginPwd');
        const $up = $('.up');

		$nowPwd.keyup(() => {
					
			if($nowPwd.val().length > 0){
				$.ajax({
					url : 'pwdCheck',
					data : {memberPwd : $nowPwd.val(),
							memberNo : '${loginUser.memberNo}'
							},
					type : 'get',		
					success : result => {
    					if(result.substr(4) == "N"){
    						$checkOriginPwd.show().css('color', 'crimson').text('현재 비밀번호가 올바르지 않습니다.');
    						$nowPwd.css('border', '1px solid crimson');
    						$up.attr('disabled', true);
    					} else{
    						$nowPwd.css('border', '1px solid lightgreen');
    						$checkPwdimg.show().css();
    						$up.removeAttr('disabled');
    					}
    				},
    				error : result => {
    					console.log('아이디 중복체크용 AJAX 통신 실패~');
    				}
    			});
			} else {
				$checkOriginPwd.hide();
				$up.attr('disabled', true);
			}
		});
					
		<!-- 비밀번호 재확인 -->
	    $('.input_form #newPwd, .input_form #newPwdCheck').on('input', () => {
	        const $newPwd = $('.input_form #newPwd');
	        const $newPwdCheck = $('.input_form #newPwdCheck');
	        const $checkPwd = $('#checkPwd');
	        const $checkP = $('.checkPwd');
	        const $up = $('.up');
		
		$(() => {
		        
	        if ($newPwd.val().length >= 4 && $newPwdCheck.val().length >= 4) {
	        	
	            if ($newPwd.val() === $newPwdCheck.val()) {
	                $newPwd.css('border', '1px solid lightgreen');
	                $newPwdCheck.css('border', '1px solid lightgreen');
	                $checkP.show().css();
	                $up.removeAttr('disabled');
	                $checkOriginPwd.show().css();
	            } else {
	                $checkPwd.show().css('color', 'crimson').text('비밀번호가 일치하지 않습니다.');
	                $newPwd.css('border', '1px solid crimson');
	                $newPwdCheck.css('border', '1px solid crimson');
	                $up.attr('disabled', true);
	            }
	        } else {
                $newPwd.removeAttr.css();
                $newPwdCheck.removeAttr.css();
	            $checkPwd.hide();
	            $checkP.hide();
	            $up.attr('disabled', true);
	        }
		    });
		});
	    $('.up').click(e => {
	    	if($(e.currentTarget).text() === "수정"){
	    		$(e.currentTarget).text("완료");
	    		$(e.currentTarget).next().show();
	    	} else {
	    		$(e.currentTarget).text("수정");
	    		$(e.currentTarget).prev().val($(e.currentTarget).next().children().val());
	    		$(e.currentTarget).next().hide();
	    		console.log($(e.currentTarget).prev().val());
	    	}
	    })
   	    $('.up_P').click(e => {
	    	if($(e.currentTarget).text() === "수정"){
	    		$(e.currentTarget).text("완료");
	    		$(e.currentTarget).next().show();
	    	} else {
	    		$(e.currentTarget).text("수정");
	    		$(e.currentTarget).prev().val($(e.currentTarget).next().children().next().val());
	    		$(e.currentTarget).next().hide();
	    		console.log($(e.currentTarget).prev().val());
	    	}
	    })
	    
	    /*
        document.querySelectorAll(".up").forEach(function(button) {
            button.addEventListener("click", function() {
                var newDiv = this.nextElementSibling;
                if (newDiv.classList.contains("new")) {
                    if (newDiv.style.display === "none" || newDiv.style.display === "") {
                        newDiv.style.display = "block";
                        this.innerText = "완료";
                        this.style.width = "45px";
                        
                    } else {
                        newDiv.style.display = "none";
                        this.innerText = "수정";
                        this.style.width = "40px";
                	};
                };
            });
        });
	    */
        $('#info-btn').click(() => {
        	console.log($('#loginNo').val());
        	console.log($('#memberPwd1').val());
        	console.log($('#loginName').val());
        	console.log($('#newNickname').val());
        	console.log($('#loginPhone').val());
        	console.log($('#loginEmail').val());
        	$.ajax({
        		url : 'update',
        		type : 'post',
        		data : {
        				memberNo : $('#loginNo').val(),
        				memberPwd : $('#memberPwd1').val(),
        				memberName : $('#loginName').val(),
        				nickname : $('#newNickname').val(),
        				phone : $('#loginPhone').val(),
        				email : $('#loginEmail').val(),
        				animalList : $('myAnimal').val()
        				},
        		success :result => {
        			console.log('성공');
        		},
        		error : result => {
        			console.log('실패');
        		}
        	})
        })
		
	})			
    </script>
    
   			
	
</body>
</html>