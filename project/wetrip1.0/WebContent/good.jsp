<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<link href="good/css/dataslider.css" rel="stylesheet">
<link href="good/css/chosen.css" rel="stylesheet">
<link href="good/css/flexslider.css" rel="stylesheet">

<!--[if IE 7]>
      
        <link href="css/font-awesome/css/font-awesome-ie7.min.css" rel="stylesheet">
        
        <![endif]-->


<link rel="stylesheet" href="good/css/style.css">

<link rel="stylesheet" href="good/css/responsive.css">
<style type="text/css">
/*-------------------------- Theme Footer ----------------------*/
.theme-footer {
	height: 168px;
	text-align: center;
	background: #76a68d;
	padding: 25px 0 1px 0;
}

.theme-footer .footer-text {
	font-size: 11px;
	letter-spacing: 0.4px;
	text-transform: uppercase;
	padding: 5px 0 5px 0;
}

.theme-footer .copyright {
	margin-top: 10px;
	font-family: 微软雅黑;
	font-size: 13px;
	color: #313131;
}

.container {
	height: 100%;
}
</style>
</head>
<body>
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
					<li><a href="toEditor"><img src="${pageContext.request.contextPath }/personalinfo/img/add_button1.png" width="24" height="24"/></a></li>			
					<li><a href="zone?zonePageNum=1&collectPageNum=1&username=${userDetail.username}&correctDate=20"><img src="${pageContext.request.contextPath }/personalinfo/img/personal_button1.png" width="24" height="24" onmouseover="over(this)" onclick="openUser(event)"/></a></li>										
					<li><a href="cart"><img src="${pageContext.request.contextPath }/personalinfo/img/shopping_button1.png" width="24" height="24"/></a></li>
					<li><a href="personalinfo"><img src="${pageContext.request.contextPath }/personalinfo/img/config_button1.png" width="24" height="24"/></a></li>			
				</ul>
				<ul id="top_menu2">
					<li><a href="toEditor"><img src="${pageContext.request.contextPath }/personalinfo/img/add_button.png" width="24" height="24" /></a></li>			
					<li><a href="zone?zonePageNum=1&collectPageNum=1&username=${userDetail.username}&correctDate=20"><img src="${pageContext.request.contextPath }/personalinfo/img/personal_button.png" width="24" height="24" class="logo_sticky" onmouseover="over(this)" onclick="openUser(event)"/></a></li>									
					<li><a href="cart"><img src="${pageContext.request.contextPath }/personalinfo/img/shopping_button.png" width="24" height="24" /></a></li>
					<li><a href="personalinfo"><img src="${pageContext.request.contextPath }/personalinfo/img/config_button.png" width="24" height="24" /></a></li>
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



		<section class="section-two-columns">
			<div class="container">
				<div class="row-fluid">
					<div class="span3">
						<div class="sidebar"></div>
						<div class="accordion-widget filter-accordions">
							<div class="accordion"></div>
						</div>
					</div>
				</div>
				<div class="span9 ">
					<div class="page-content">
						<div class="products-page-head">
							<h1>WeTrip</h1>
							<div class="tag-line">- ${good.get(0).name}</div>
						</div>
						<div class="row-fluid">
							<div class="span7">
								<div class="flexslider product-gallery">
									<ul class="slides">
										<li data-thumb="${good.get(0).pic}"><img alt=""
											src="${good.get(0).pic}" /></li>
										<li data-thumb="good/images/p2.jpg"><img alt=""
											src="good/images/p2.jpg" /></li>
										<li data-thumb="good/images/p3.jpg"><img alt=""
											src="good/images/p3.jpg" /></li>
										<li data-thumb="good/images/p4.jpg"><img alt=""
											src="good/images/p4.jpg" /></li>
										<li data-thumb="good/images/p5.jpg"><img alt=""
											src="good/images/p5.jpg" /></li>
									</ul>
								</div>
							</div>
							<div class="span5">
								<div class="product-info-box">
									<form action="addcart">
										<div class="info-holder">
											<h4>${good.get(0).name}</h4>
											<input type=hidden name=id value="${good.get(0).id}">
										
											<p>描述：${good.get(0).description}</p>
										</div>
										<hr>

										<div class="drop-downs-holder">
											<div class="drop-selector capacity-selector"></div>
											<span style="display:block;font-size: 10px;margin-top:-10px;margin-bottom:5px;color:#ababab">*购买数量不能大于100</span>
											<div class="drop-selector">
												<span>数量</span> <input min="1" type="number" id="quantity"
													name="num" value="1" max="100" min="1" class="quantity_one">
											</div>
										</div>
										<hr>
										<div class="price-holder">
											<div class="price">
												<span>¥${good.get(0).price}</span> <span class="old"></span>
											</div>
										</div>
										<div class="buttons-holder">
											<input type="submit" class="cusmo-btn add-button"
												value="加入购物车" />
											<!--a class="cusmo-btn add-button" href="addCart">加入购物车</a-->
											<a class="add-to-wishlist-btn" href="##"> <i
												class="icon-plus"></i> 加入心愿单
											</a>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="product-tabs">
							<div class="controls-holder nav-tabs">
								<ul class="inline">
									<li class="active"><a data-toggle="tab"
										href="#description">描述</a>
											<li><a data-toggle="tab" href="#how-to-use">如何使用</a></li>
											<li><a data-toggle="tab" href="#reviews">评论(2)</a></li>
								</ul>
							</div>

							<div class="tab-content">
								<div id="description" class=" active tab-pane ">
									<p
										style="text-align: justify; font-family: 微软雅黑; font-size: 16px">
										${good.get(0).description}</p>

								</div>

								<div id="how-to-use" class=" tab-pane ">
									<p
										style="text-align: justify; font-family: 微软雅黑; font-size: 16px">
										${good.get(0).how_use}</p>
									<!-- 				<ul
										style="text-align: justify; font-family: 微软雅黑; font-size: 16px">
										<li>1、拧开瓶盖，将电蚊香液液瓶向上旋入加热器；</li>
										<li>2、配合插座方向，转动加热器插头，确保工作时液瓶呈竖直向上状态；接通电源（220V)，指示灯亮即表示加热器开始工作；</li>
										<li>3、使用完毕请将加热器拔离插座，无需旋下液瓶，但保持液瓶竖直向上；</li>
										<li>4、当药液用完，请将加热器拔离插座，然后更换补充药液。</li>
									</ul> -->
								</div>

								<div id="reviews" class=" tab-pane ">
									<textarea placeholder="请在这写下你的评论" class="span12"
										id="write-review-text"></textarea>

									<div class="review-info">
										<div class="remaining-chars">
											<span id="counter">210</span> characters left
										</div>

										<div class="star-holder">


											<button type="submit" class="cusmo-btn">评论</button>
										</div>
									</div>
									<hr>

									<div class="recent-reviews">
										<div class="review-item">
											<div class="row-fluid">
												<div class="span2">
													<div class="thumb">
														<img alt="avatar" src="good/images/default-avatar.png" />
													</div>
												</div>
												<div class="span10">
													<div class="body">
														<h4>Angela</h4>
														<span class="date">2018.10.06</span>
														<p
															style="text-indent: 2em; text-align: justify; font-family: 微软雅黑; font-size: 16px">
															春眠不觉晓,处处蚊子咬。</p>
													</div>
												</div>
											</div>
										</div>

										<div class="review-item">
											<div class="row-fluid">
												<div class="span2">
													<div class="thumb">
														<img alt="avatar" src="good/images/default-avatar.png" />
													</div>
												</div>
												<div class="span10">
													<div class="body">
														<h4>Kate</h4>
														<span class="date">2018.06.06</span>
														<p
															style="text-indent: 2em; text-align: justify; font-family: 微软雅黑; font-size: 16px">
															春眠不觉晓,处处蚊子咬。</p>
													</div>
												</div>
											</div>
										</div>

										<hr>
									</div>

								</div>

							</div>
						</div>
						<br> <br>
						<!--  <div class="middle-header-holder">
                           <div class="middle-header"> 你还可能喜欢</div>
                       </div> -->
						<!-- <div class="products-holder related-products">
                       <div class="row-fluid"> -->
						<!--  <div class="span4">
                                <div class="product-item">
                                    <img src="img/good1.jpg" width="200px" height="200px;">
                                </div>
                            </div>
                            <div class="span4">
                                <div class="product-item">
                                    <img src="img/good1.jpg" width="200px" height="200px;">
                                </div>
                            </div>
                            <div class="span4">
                                <div class="product-item">
                                    <img src="img/good1.jpg" width="200px" height="200px;">
                                </div>
                            </div> -->
						<!--     </div>
                </div> -->
					</div>
				</div>
			</div>
		</section>
	</div>
	

	<!-- <section class="section-homepage-subscribe">
    <div class="container">

    </div>
	</section> -->

	<!--footer-->
	<footer class="theme-footer">
		<div class="container">
			<div class="logo"><a href="main.jsp"><img src="${pageContext.request.contextPath }/index/img/footer130.png" alt=""></a></div>		
			<p class="copyright">Copyright &copy; 2018.微旅wetrip项目组 All rights reserved.</p>
		</div> <!-- /.container -->
		<!-- /.container -->
	</footer>
	<!-- /.theme-footer -->
	<!--/footer-->



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
	<script type="text/javascript" src="good/js/chosen.jquery.min.js"></script>
	<script type="text/javascript" src="good/js/jquery.raty.min.js"></script>
	<script type="text/javascript" src="good/js/jquery.flexslider-min.js"></script>

	<script type="text/javascript" src="good/js/bootstrap-slider.js"></script>

	<script type="text/javascript" src="good/js/script.js"></script>

	<script>
    $(window).on('load', function() {
        "use strict";
        $.instagramFeed({
            'username': 'restaurantetanit',
            'container': "#instagram-feed-restaurant",
            'display_profile': false,
            'display_biography': false,
            'display_gallery': true,
            'get_raw_json': false,
            'callback': null,
            'styling': true,
            'items': 12,
            'items_per_row': 6,
            'margin': 1
        });
    });

</script>
</body>


</html>
