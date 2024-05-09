<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Document</title>
<style>
    div {
        box-sizing: border-box;
    }
    * {
        box-sizing: border-box;
    }
    #header{
        width: 1200px;
        height: 260px;
        margin: auto;
    }
    #header1{
        width: 1200px;
        height: 140px;
        float: left;
        position: relative;
        border-bottom: 2px solid rgb(230, 230, 230)
    }
    #logo{
        width: 150px;
        height: 100px;
        float: left;
        padding-top: 30px;
    }
    #header1 > *{
        float: left;
    }
    #search_form{
        margin: auto;
        position: absolute;
        left: 50%;
        top: 60%;
        transform: translate(-50%, -50%);
    }
    #in_text{
        width: 380px;
        height: 50px;
        border-radius: 10px;
        border: 1px solid rgb(179, 179, 179);
        margin: 0;
        padding: 0;
    }
    #search_img{
        width: 40px;
        height: 40px;
        color: rgb(204, 204, 204);
        margin-left: 10px;
    }
    #menubar{
        width: 310px;
        height: 140px;
        float: right;
    }
    #navigator{
        width: 1200px;
        height: 120px;
        font-size: 24px;
        font-weight: bold;
    }
    #navi{
        list-style: none;
        height: 100%;
    }
    #navi>li{
        float: left;
        width: 16%;
        height: 100%;
        text-align: center;
    }
    #navi a{
        text-decoration: none;
        color: rgba(122, 88, 33, 0.92);
        font-weight: 700;
        width: 100%;
        height: 100%;
        display: block;
        line-height: 100px;
    }
    #loginMenu{
    	float:left;
    	padding-top:23%;
    	width:30%;
		height:100%;
    }
    #menubarItem{
    	float:left;
    	padding-top:25%;
    	width:70%;
		height:100%;
    }
    #menubarItem img{
    	width:100%;
    	height:100%;
    }
    #navi a:hover{
        font-size: 25px;
        color: rgba(196, 132, 30, 0.92);
    }
    
    #navi2{
        list-style: none;
        float: left;
    }

    #loginForm{
    	display: none;
    	background-color:rgb(233, 231, 231);
    	border-radius: 25px;
    }
    #loginForm a{
    	color: black;
    	text-align: center;
    }
    #login-area{
    	width:100%;
    	height:500px;
    	padding:30px 100px;
    }
    #login-area input{
   	    border: none;
	    box-shadow: none;
	    padding: 12px 16px;
	    width: 100%;
	    line-height: 1.2;
    }
    #login-area .input_form{
    	border: 1px solid #e0e0e0;
	    background: #fff;
	    border-top: 1px solid #e0e0e0;
	    box-sizing: border-box;
	    position: relative;
    }
    .input_pwd{
    	
    }]
</style>
</head>
<body>
    <div id="header">
        <div id="header1">
            <div id="logo"><img src="resources/img/logo.png" alt="로고" width="150px" height="100px"></div>
            <div id="search_form">
                <form action="#">
                    <input type="text" name="query" id="in_text" placeholder="  검색어를 입력하세요">
                    <img src="resources/img/searchform.png" alt="" id="search_img">
                </form>
            </div>
            <div id="menubar">
            	<div id="loginMenu">
            		<ul class="nav flex-column"id="loginForm">
            			<li class="nav-item"  >
            				<a class="nav-link" style="padding:.2rem .5rem;" href="#" data-toggle="modal" data-target="#myModal">로그인</a>
            			</li>
            			<li class="nav-item">
            				<a class="nav-link" style="padding:.2rem .5rem;" href="#">회원가입</a>
            			</li>
            		</ul>
            	</div>
            	
            	<div id="menubarItem">
            		<ul class="nav nav-pills nav-justified">
    					<li class="nav-item">
    						<a class="nav-link" href="#" id="login_btn"><img src="resources/img/login.png" alt=""></a>
    					</li>
    					<li class="nav-item">
      						<a class="nav-link" href="#"><img src="resources/img/mypage.png" alt=""></a>
    					</li>
    					<li class="nav-item">
      						<a class="nav-link" href="#"><img src="resources/img/cart.png" alt=""></a>
    					</li>
  					</ul>
            	</div>
                
            </div>
        </div>
        <script>
            	$(() => {
					$('#login_btn').click(()=>{
						const display = $('#loginForm').css('display');
						if(display === 'block'){
							$('#loginForm').css('display','none');
						}
						else{
							$('#loginForm').css('display','block');
						}
						
					});   
            	});
            	</script>
        <div id="navigator">
            <ul id="navi">
                <li><a href="#">커뮤니티</a></li>
                <li><a href="#">지식</a></li>
                <li><a href="#">쇼핑</a></li>
                <li><a href="#">데이트</a></li>
                <li><a href="#">동물병원</a></li>
                <li><a href="#">공지사항</a></li>
            </ul>
        </div>
    </div>
    
    
    <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        
        <!-- Modal body -->
        <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h3 align="center">로그인</h3>
        
        
			<div id="login-area">
				<form>
					<div class="input_form">
						<input type="text" placeholder="아이디를 입력해주세요">
					</div>
          			<div class="input_form">
          				<input type="text" placeholder="비밀번호를 입력해주세요">
          			</div>
          			<a>아이디찾기</a>/<a>비밀번호찾기</a>
          		</form>
			</div>
          
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</body>
</html>