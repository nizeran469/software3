<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html lang="ch">
<head>
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
<meta name="author" content="Ansonika">
<title>微旅WeTrip</title>
<!-- Favicons-->
<link rel="shortcut icon" href="good/images/icon.ico"
	type="zone/image/x-icon">
<!-- BASE CSS -->
<!--link href="css/bootstrap.min.css" rel="stylesheet"-->
<link href="good/css/vendors.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href='http://fonts.googleapis.com/css?family=Raleway:400,500,700,600,800'
	rel='stylesheet' type='text/css'>
<link href="good/css/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="good/css/bootstrap/css/bootstrap-responsive.min.css"
	rel="stylesheet">
<link href="good/css/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="good/css/chosen.css" rel="stylesheet">
<!--[if IE 7]>
      
        <link href="css/font-awesome/css/font-awesome-ie7.min.css" rel="stylesheet">
        
        <![endif]-->
<link rel="stylesheet" href="good/css/style.css">
<link rel="stylesheet" href="good/css/cart.css">
<link rel="stylesheet" href="good/css/responsive.css">
</head>
<style type="text/css">
.wrapper {
	margin-top: -100px;
	/*background-color: #ff6666;*/
}

body {
	padding-top: 100px;
}

.cart_all {
	font-size: 50px;
	line-height: 100px;
	/*background-color: #aaa;*/
	height: 100px;
	width: 72%;
	margin-left: 14%;
	font-family: 幼圆;
}
</style>
<body>
	<div class="cart_all">我的购物车</div>
	<div class="wrapper">
		<section class="section-head">
			<header class="header menu_fixed">
				<div id="logo">
					<a href="main.jsp"> <img src="good/images/logo_white.png"
						width="150" height="36" data-retina="true" alt=""
						class="logo_normal"> <img src="good/images/logo_black.png"
						width="150" height="36" data-retina="true" alt=""
						class="logo_sticky">
					</a>
				</div>
				<ul id="top_menu">
					<li><a href="toEditor"><img
							src="good/images/add_button1.png" width="24" height="24"></a></li>
					<li><a href="zone?zonePageNum=1&collectPageNum=1&username=${userDetail.username}&correctDate=20"><img
							src="good/images/personal_button1.png" width="24" height="24"></a></li>
					<li><a href="cart"><img
							src="good/images/shopping_button1.png" width="24" height="24"></a></li>
					<li><a href="personalinfo.jsp"><img
							src="good/images/config_button1.png" width="24" height="24"></a></li>
				</ul>
				<ul id="top_menu2">
					<li><a href="toEditor"><img
							src="good/images/add_button.png" width="24" height="24"></a></li>
					<li><a href="zone?zonePageNum=1&collectPageNum=1&username=${userDetail.username}&correctDate=20""><img
							src="good/images/personal_button.png" width="24" height="24"></a></li>
					<li><a href="cart"><img
							src="good/images/shopping_button.png" width="24" height="24"></a></li>
					<li><a href="personalinfo"><img
							src="good/images/config_button.png" width="24" height="24"></a></li>
				</ul>
				<!-- /top_menu -->
				<a href="#menu" class="btn_mobile">
					<div class="hamburger hamburger--spin" id="hamburger">
						<div class="hamburger-box">
							<div class="hamburger-inner"></div>
						</div>
					</div>
				</a>
				<nav id="menu" class="main-menu">
					<ul>
						<li><span><a href="main.jsp">首页</a></span></li>
						<li><span><a href="part?tagName=风景">风景</a></span></li>
						<li><span><a href="part?tagName=美食">美食</a></span></li>
						<li><span><a href="part?tagName=玩耍">玩耍</a></span></li>
						<li><span><a href="part?tagName=小贴士">小贴士</a></span></li>
						<li><span><a href="producthot">周边商城</a></span></li>
						<li><span><a href="dailytopic?pageNum=1&topicId=${topicId}">今日话题</a></span></li>
					</ul>
				</nav>
			</header>
		</section>
		<section class="section-shopping-cart">
			<div class="container">
				<div class="row-fluid">
					<div class="span12">
						<div class="page-content shopping-cart-page ">
							<table class="table ">
								<thead>
									<tr>
										<th class="span2">&nbsp;商品名称</th>
										<th class="span5">&nbsp;</th>
										<th class="span2 price-column">价格</th>
										<th class="span2">&nbsp;&nbsp;&nbsp;&nbsp;数量</th>
										<th class="span1 price-column">总计</th>
										<th class="span2">&nbsp;</th>
									</tr>
								</thead>
								<!-- 循环展示购物车内的商品 -->
								<tbody>
									<c:forEach items="${cart.container}" var="map">
										<form action="updatecart">
											<tr>
												<!-- 商品图片 -->
												<td>
													<div class="thumb">
														<img alt="" src="${map.value.product.pic}" />
													</div>
												</td>
												<!-- 商品id、名称和描述 -->
												<td>
													<div class="desc">
														<input id="pid" type=hidden name=id value="${map.value.product.id}" >
														<h3>${map.value.product.name}</h3>
														<div class="tag-line">
															${map.value.product.description}</div>
													</div>
												</td>
												<!-- 商品价格 -->
												<td>
													<div class="price">¥${map.value.product.price}</div>
												</td>
												<!-- 商品数量 -->
												<td>
													<div class="quantity">
														<input min="1" max="100" type="number" id="quantity" name="quantity"
															value="${map.value.count}" class="quantity_one" onblur="update(this)">
													</div>
												</td>
												<!-- 商品总价 -->
												<td>
													<div class="price">¥${map.value.product.price * map.value.count}
													</div>
												</td>
												<!-- 商品删除-->
												<td>
													<div class="delete">
														<a class="close-btn" onclick="window.open('removecart?id=${map.value.product.id}&num=${map.value.count}','_self')"></a>
													</div>
												</td>
											</tr>
										</form>
									</c:forEach>
									<!-- 循环展示购物车内的商品结束 -->
								</tbody>
							</table>
							<div class="buttons-holder">
								<a class="cusmo-btn gray narrow" href="producthot">继续购物</a> <a
									class="cusmo-btn narrow"
									href="addorder">提交订单</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<br> <br>
	</div>
	<!--footer-->
	<footer class="theme-footer">
		<div class="container">
			<div class="logo">
				<a href="main.jsp"><img src="good/images/footer130.png" alt=""></a>
			</div>
			<p class="copyright">Copyright &copy; 2018.微旅Wetrip项目组 All rights
				reserved.</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- /.theme-footer -->
	<script src="good/js/updatecart.js"></script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.1.1.min.js"></script>
	<script src="good/css/bootstrap/js/bootstrap.min.js"></script>
	<script src="good/js/jquery-2.2.4.min.js"></script>
	<script src="good/js/common_scripts.js"></script>
	<script src="good/js/main.js"></script>
	<script type="text/javascript" src="good/js/css_browser_selector.js"></script>
	<script type="text/javascript"
		src="good/js/twitter-bootstrap-hover-dropdown.min.js"></script>
	<script type="text/javascript" src="good/js/jquery.easing-1.3.js"></script>
	<script type="text/javascript" src="good/js/jquery.validate.js"></script>
	<script type="text/javascript" src="good/js/jquery.flexslider-min.js"></script>
	<script type="text/javascript"
		src="good/js/jquery.carouFredSel-6.2.1-packed.js"></script>
	<script type="text/javascript" src="good/js/bootstrap-slider.js"></script>
	<script type="text/javascript" src="good/js/jquery.raty.min.js"></script>
	<script type="text/javascript" src="good/js/chosen.jquery.min.js"></script>
	<script type="text/javascript" src="good/js/script.js"></script>

	<script>
		$(window).on('load', function() {
			"use strict";
			$.instagramFeed({
				'username' : 'restaurantetanit',
				'container' : "#instagram-feed-restaurant",
				'display_profile' : false,
				'display_biography' : false,
				'display_gallery' : true,
				'get_raw_json' : false,
				'callback' : null,
				'styling' : true,
				'items' : 12,
				'items_per_row' : 6,
				'margin' : 1
			});
		});
		/*
         * 当点击确认时，会调用的方法
         * 靳若琪 v0.0.1(2018-12-19 09:31:13)*/
         
		function update(obj){
			var $obj=$(obj);
			var count=$obj.val();
			console.log($obj.val());	 
        	var pid=$("#pid").val();
        	console.log(pid);
        	 $.ajax({
	                type: "POST",
	                url: "updatecart?id="+pid+"&num="+count,
	                processData: false,  // 不处理数据
	                contentType: false  // 不设置内容类型
	            })
		}
	</script>
</body>


</html>
