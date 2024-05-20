<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑 메인페이지</title>
	<style>
		div{
			box-sizing: border-box;
		}
		#wrap{
			width: 1200px;
			height: auto;
			margin: auto;
		}
		.shop_header{
			width: 1200px;
			height: 200px;
			display: flex;
			justify-content: space-between;
		}
		.shop_body{
			height: auto;	
		}
		.header_search{
			height: 100%;
			width: 350px;
			padding: 65px 70px 65px 30px;
		}
		.header_category{
			height: 100%;
			width:600px;
		}
		.anmal_category{
			height: 60%;
			padding-top: 40px;
		}
		.use_category{
			height: 40%;
		}
		.nav-item > img{
			width: 90px;
			height: 70px;
		}
		.use_category > div{
			margin-top:10px;
			float: right;
		}
		.custom-col-5 {
	      flex: 0 0 20%;
	      max-width: 20%;
	    }
	    #productList{
	    	width: 1200px;
	    	margin: auto;
	    }
	    .card{
	    	margin:10px;
	    }
	    .anmal_category ul{
	    	border:none;
	    }
	    .product_img{
	    	width: 100%;
	    	height: 190px;
	    }
	    .card-text{
	   		padding-top: 5px;
	    	padding-left: 5px;
	    	height: 50px;
	    	font-size: 12px;
	    	font-weight: bold;
	    	margin-bottom: 10px;
	    }
	    .card_btn{
	    	text-align: right;
	    }
	    .card_btn img{
	    	weight:30px;
	    	height:30px;
	    }
	    .card_price{
	    	padding : 0 5px;
	    	color:rgb(211, 84, 0);
	    	font-weight:bold
	    }
	    .card_btn{
	    	padding : 0 5px;
	    }
	    .nav li> img:hover{
	    	width: 95px;
			height: 75px;
	       cursor: pointer;
	    }
	    .refresh_btn{
	    	margin: auto;
	    	text-align: center;
	    }
	    .refresh_btn > img{
	    	width: 45px;
	    	height: 45px;
	    	margin-top: 40px;
	    }
	</style>
	
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div id="wrap">
		<div class="shop_header">
			<div class="header_search">
			
			</div>
			<div class="header_category">
				<div class="anmal_category">
					<ul class="nav nav-tabs nav-justified">
						<li class="nav-item" id="A1"><img class="img_dog" src="${sessionScope.path }/resources/img/animaldog.png"></li>
						<li class="nav-item" id="A2"><img class="img_cat" src="${sessionScope.path }/resources/img/animalcat.png"></li>
						<li class="nav-item" id="A3"><img class="img_rab" src="${sessionScope.path }/resources/img/animalrab.png"></li>
						<li class="nav-item" id="A4"><img class="img_fish" src="${sessionScope.path }/resources/img/animalfish.png"></li>
						<li class="nav-item" id="A5"><img class="img_bird" src="${sessionScope.path }/resources/img/animalbird.png"></li>
						<li class="nav-item" id="A6"><img class="img_ham" src="${sessionScope.path }/resources/img/animalham.png"></li>
					</ul>
				</div>
				<div class="use_category">
					<div>
						<select id="product_category">
							<option value="P0">전체</option>
							<option value="P1">생필품</option>
							<option value="P2">식품</option>
							
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="shop_body">
			<div class="row" id="productList">

		    </div>
			<div class="refresh_btn"><img src="${sessionScope.path }/resources/img/refresh.png"></img></div>
		</div>
	
	
	</div>
	<script>
		let page = 1;
		let text = '';
		let category = 'P0';
		let animal = 'A0';
		
		$(() => {
			selectList(page, category, animal);
			let selectedAnimal = null;
			
			$('#product_category').change(function() {
                category = $(this).val();
                text = '';
                selectList(page, category, animal);
            });
			
			$('.nav-item').click(function() {
				$animal = $(this).attr('id');
				
				if(selectedAnimal != null){
					$('#'+selectedAnimal).find('img').css({
			            'width': '90px',
			            'height': '70px'
			        });
				}
				selectedAnimal = $animal;
				
				$(this).find('img').css({
		            'width': '95px',
		            'height': '75px'
		        });
				
				
				text = '';
				selectList(page, category, $animal);
			});
			
			$('.refresh_btn > img').click(function() {
				page = page+1;
				selectList(page, category, animal);
			});
		});
		
		function selectList(pageNumber,categoryCode,animalCode) {
			$.ajax({
				url : 'products/' + pageNumber + '/' + categoryCode + '/' + animalCode,
				type : 'get',
				success : result => {
					
					result.forEach( item => {
						text+='<div class="custom-col-5" >' +
								'<div class="card">' +
									'<div class="card-body">' +
										'<img class="product_img" src="${sessionScope.path }' + item.attachment.attPath + item.attachment.changeName + '">' +
					    				'<p class="card-text">' + item.productName + '</p>' +
					    				'<div class="card_price">' + item.price + '원</div>' +
					    				'<div class="card_btn"><img src="${sessionScope.path}/resources/img/cart2.png" />&ensp;<img src="${sessionScope.path}/resources/img/heart2.png" /></div>' +
									'</div>' +
								'</div>' +
							  '</div>';
					});
					$('#productList').html(text);
				}
				
				
			});
		}
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>