<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html lang="ch">
<head>
<meta charset="UTF-8">
<title>微旅WeTrip-周边</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/part/img/icon.ico" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath }/part/img/icon.ico" type="image/x-icon">

<link href="${pageContext.request.contextPath }/part/headcss/style.css" rel="stylesheet">

<!-- BASE CSS -->
<link href="${pageContext.request.contextPath }/part/headcss/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/part/headcss/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/part/headcss/vendors.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="part/footcss/style.css">
	<!-- responsive style sheet -->
<link rel="stylesheet" type="text/css" href="part/footcss/responsive.css">
	<!-- Theme-Color css -->
<link rel="stylesheet" id="jssDefault" href="part/footcss/color.css">

<!-- YOUR CUSTOM CSS -->
<link href="${pageContext.request.contextPath }/part/headcss/custom.css" rel="stylesheet">
<link rel="${pageContext.request.contextPath }/stylesheet" type="text/css" href="${pageContext.request.contextPath }/part/footcss/style.css">
<!-- responsive style sheet -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/part/footcss/responsive.css">
<!-- Theme-Color css -->
<link rel="stylesheet" id="jssDefault" href="${pageContext.request.contextPath }/part/footcss/color.css">

<!-- mobile menu css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/part/css/meanmenu.min.css">
<!-- animate css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/part/css/animate.css">
<!-- nivo slider css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/part/css/nivo-slider.css">
<!-- owl carousel css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/part/css/owl.carousel.min.css">
<!-- slick css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/part/css/slick.css">
<!-- price slider css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/part/css/jquery-ui.min.css">
<!-- fontawesome css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/part/css/font-awesome.min.css">
<!-- fancybox css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/part/css/jquery.fancybox.css">
<!-- bootstrap css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/part/css/bootstrap.min.css">
<!-- default css  -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/part/css/default.css">
<!-- style css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/part/style.css">
<!-- responsive css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/part/css/responsive.css">
<style>
* {
	padding: 0;
	margin: 0;
}

ul, ol, li {
	list-style: none;
}

a {
	text-decoration: none;
}

.box {
	width: 1224px;
	height: 750px;
	background-color: #fff;
	margin: 15px auto;
	border: 1px solid #0000;
}

.box>div {
	float: left;
}

.content2 {
	text-indent: 2em;
	text-align: justify;
	overflow: hidden;
}

.right {
	width: 991px;
	height: 720px;
	background: #fff;
	padding-left: 35px;
	margin-left: 55px;
}

.right>ul>li {
	width: 240px;
	height: 350px;
	float: left;
	position: relative;
	text-align: center;
	margin: 0 0 14px 14px;
	background-color: #fff;
	box-shadow: 0px 5px 40px 0px rgba(0, 0, 0, 0.04);
}

.img {
	margin: 55px 0 30px;
	width:240px;
	height:160px;
}

.right .p1 {
	font-size: 12px;
	color: #333;
}

.right .p2 {
	font-size: 12px;
	color: #b0b4be;
}

.p3 {
	margin-top: 15px;
}

.p3 span {
	color: #ff6700;
}

.p3 del {
	color: #b0b0b4;
}

.hide {
	width: 240px;
	height: 135px;
	background: #a2bfa0;
	position: absolute;
	left: 0;
	bottom: 0;
	display: none;
	padding-left: 7px;
	padding-right: 7px;
	text-indent: 2em;
	text-align: justify;
}

.right>ul>li:hover .hide {
	display: block;
}

.like {
	margin-top: 12px;
	margin-right: 8px;
}

#star {
	margin-top: 10px;
	margin-right: 10px;
}

#star2 {
	margin-top: 3px;
	margin-left: 10px;
}

#like2 {
	margin-top: 5px;
}

.fa-th {
	margin-top: 1px;
}

</style>

<script src="${pageContext.request.contextPath }/part/js/vendor/modernizr-2.8.3.min.js"></script>
<script src="${pageContext.request.contextPath }/part/headjs/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath }/part/headjs/common_scripts.js"></script>
<script src="${pageContext.request.contextPath }/part/headjs/main.js"></script>
<script src="${pageContext.request.contextPath }/part/assets/validate.js"></script>
<!-- jquery 3.12.4 -->
<script src="${pageContext.request.contextPath }/part/js/vendor/jquery-1.12.4.min.js"></script>
<!-- mobile menu js  -->
<script src="${pageContext.request.contextPath }/part/js/jquery.meanmenu.min.js"></script>
<!-- scroll-up js -->
<script src="${pageContext.request.contextPath }/part/js/jquery.scrollUp.js"></script>
<!-- owl-carousel js -->
<script src="${pageContext.request.contextPath }/part/js/owl.carousel.min.js"></script>
<!-- slick js -->
<script src="${pageContext.request.contextPath }/part/js/slick.min.js"></script>
<!-- wow js -->
<script src="${pageContext.request.contextPath }/part/js/wow.min.js"></script>
<!-- price slider js -->
<script src="${pageContext.request.contextPath }/part/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath }/part/js/jquery.countdown.min.js"></script>
<!-- nivo slider js -->
<script src="${pageContext.request.contextPath }/part/js/jquery.nivo.slider.js"></script>
<!-- fancybox js -->
<script src="${pageContext.request.contextPath }/part/js/jquery.fancybox.min.js"></script>
<!-- bootstrap -->
<script src="${pageContext.request.contextPath }/part/js/bootstrap.min.js"></script>
<!-- popper -->
<script src="${pageContext.request.contextPath }/part/js/popper.js"></script>
<!-- stellar -->
<script src="${pageContext.request.contextPath }/part/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath }/part/js/parallax.js"></script>
<!-- plugins -->
<script src="${pageContext.request.contextPath }/part/js/plugins.js"></script>
<!-- main js -->
<script src="${pageContext.request.contextPath }/part/js/main.js"></script>
</head>
<body>
	<header class="header menu_fixed">
		<div id="preloader">
			<div data-loader="circle-side"></div>
		</div>
		<!-- /Page Preload -->
		<div id="logo">
			<a href="main.jsp"> 
			<img src="${pageContext.request.contextPath }/part/img/logo_white.png" width="150" height="36" data-retina="true" alt="" class="logo_normal"> 
			<img src="${pageContext.request.contextPath }/part/img/logo_black.png"width="150" height="36" data-retina="true" alt="" class="logo_sticky">
			</a>
		</div>
		<ul id="top_menu" class="logo_normal">
			<c:if test="${not empty userEmail}">
			<li><a href="toEditor"><img src="${pageContext.request.contextPath }/part/img/add_button.png" width="24" height="24" ></a></li>
			</c:if>
			<c:if test="${empty userEmail}">
			<li><a href="login"><img src="${pageContext.request.contextPath }/part/img/add_button.png" width="24" height="24" ></a></li>
			</c:if>
			<c:if test="${empty userEmail}">
			<li><a href="login"><img src="part/img/personal_button.png" width="24" height="24"></a></li>
			</c:if>
			<c:if test="${not empty userEmail}">
			<li><a href="zone?zonePageNum=1&collectPageNum=1&username=${userDetail.username}&correctDate=20"><img src="part/img/personal_button.png" width="24" height="24"></a></li>
			</c:if>
			<li><a href="cart"><img src="${pageContext.request.contextPath }/part/img/shopping_button.png" width="24" height="24"></a></li>
			<li><a href="personalinfo"><img src="${pageContext.request.contextPath }/part/img/config_button.png" width="24" height="24"></a></li>
			
		</ul>

		<ul id="top_menu" class="logo_sticky">
			<c:if test="${empty userEmail}">
			<li><a href="login"><img src="part/img/add_button1.png" width="24" height="24"></a></li>
			</c:if>
			<c:if test="${not empty userEmail}">
			<li><a href="toEditor"><img src="part/img/add_button1.png" width="24" height="24"></a></li>
			</c:if>
			<c:if test="${empty userEmail}">
			<li><a href="login"><img src="part/img/personal_button1.png" width="24" height="24"></a></li>
			</c:if>
			<c:if test="${not empty userEmail}">
			<li><a href="zone?zonePageNum=1&collectPageNum=1&username=${userDetail.username}&correctDate=20"><img src="part/img/personal_button1.png" width="24" height="24"></a></li>
			</c:if>
			<li><a href="cart"><img src="part/img/shopping_button1.png" width="24" height="24"></a></li>
			<li><a href="personalinfo"><img src="part/img/config_button1.png" width="24" height="24"></a></li>
			
		</ul>

		<!-- /top_menu -->
		<a href="#menu" class="btn_mobile">
			<div class="hamburger hamburger--spin" id="hamburger">
				<div class="hamburger-box">
					<div class="hamburger-inner"></div>
				</div>
			</div>
		</a>
		<nav id="menu" class="main-menu" style="font-family: 'Roboto';">
			<ul>
				<li><span><a href="main.jsp">首页</a></span></li>
				<li><span><a href="part?tagName=风景">风景</a></span></li>
				<li><span><a href="part?tagName=美食">美食</a></span></li>
				<li><span><a href="part?tagName=玩耍">玩耍</a></span></li>
				<li><span><a href="part?tagName=小贴士">小贴士</a></span></li>
				<li><span><a href="producthot">周边商城</a></span></li>				
				<li><span><a href="dailytopic?pageNum=1&topicId=${topicId }">今日话题</a></span></li>
			</ul>
		</nav>
	</header>
	<!-- #header -->
	<div class="main-shop-page ptb-70">
		<div class="container">
			<!-- Row End -->
			<div class="row">
				<!-- Sidebar Shopping Option Start -->
				<div class="col-lg-3  order-2">
					<div class="sidebar white-bg">
						<div class="single-sidebar category-sidebar">
							<div class="search-box-view">
								<form action="#">
									<input type="text" class="email" placeholder="搜索标签">
									<button type="submit" class="submit"></button>
								</form>
							</div>
							<div class="group-title">
								<h2>热门标签</h2>
							</div>
							<ul>
								<li><a href="part.jsp">美食</a></li>
								<li><a href="part.jsp">美景</a></li>
								<li><a href="part.jsp">玩耍</a></li>
								<li><a href="part.jsp">Tips</a></li>
								<li><a href="part.jsp">烧烤</a></li>
								<li><a href="part.jsp">山</a></li>
								<li><a href="part.jsp">海</a></li>
								<li><a href="part.jsp">游乐场</a></li>
								<li><a href="part.jsp">火锅</a></li>
								<li><a href="part.jsp">冰激凌</a></li>
							</ul>

							<a href="##">换一批>></a>
						</div>
					</div>
				</div>
				<!-- Sidebar Shopping Option End -->
					
				
				<!-- Product Categorie List Start -->
				<div class="col-lg-9 order-lg-2">
					<!-- Grid & List View Start -->
					<div class="grid-list-top fix mb-10">
						<!-- Toolbar Short Area Start -->
						<div class="main-toolbar-sorter f-left">
							<div class="toolbar-sorter">
								<label>排序方式</label> 
								<select id="select" class="sorter" name="select" onchange="window.location=this.value;">
									<option value="producthot" selected="selected">-请选择-</option>
									<option value="productprice">价格</option>
									<option value="producthot">热度</option>
								</select>
							
							</div>
						</div>
						<!-- Toolbar Short Area End -->
						<div class="grid-list-view f-right">
							<ul class="list-inline nav">
								<li><a data-toggle="tab" href="#grid-view"><i
										class="fa fa-th"></i></a></li>&nbsp;
								<li><a data-toggle="tab" href="#list-view"><i
										class="fa fa-list-ul"></i></a></li>
							</ul>
						</div>
					</div>
					
					
					
					
					
					<!-- Grid & List View End -->
					<div class="main-categorie product-area">
						<!-- Grid & List Main Area End -->
						<div class="tab-content fix">
							<!-- 格子式展示商品 -->
							<div id="grid-view" class="tab-pane active">
								<div class="row">
									<!-- 主体-->
									<div class="box">
										<div class="right">
											<ul>
												<c:forEach items="${page.list}" var="p">
													<li>
														<img class="img" src="${p.pic}"
														alt="">
														<p class="p1">${p.name}</p>
														<p class="p3">¥${p.price}</p>
														<div class="hide">
															${p.description}
															<div>
																<a href="good?id=${p.id}" style="color: #fff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;更多>></a>
															</div>
														</div>
													</li>
												</c:forEach>
											</ul>
										</div>
										<!-- right -->
									</div>
									<!-- box -->
								</div>
								<!-- row -->
							</div>
							<!-- #grid view End -->

							<!-- 列表式展示商品 -->
							<div id="list-view" class="tab-pane">
								<!-- Single Product Start -->
								<c:forEach items="${page.list}" var="p">
									<div class="single-product">
										<!-- Product Image Start -->
										<div class="kiosk-product-img" style="float:left;margin-left:30px;margin-top:-30px;">
											<a href="good?id=${p.id}"><img class="img" src="${p.pic}"
												alt=""></a>
										</div>
										<!-- Product Image End -->
										<!-- Product Content Start -->
										<div class="kiosk-product-content" style="float:left;margin-left:30px;margin-top:10px;">
											<h4>
												商品名称：${p.name}
											</h4>
											<p>
												现价：<span class="price">¥${p.price}</span>
											</p>
											<p>
												折扣：<span class="price">${p.discount * 10}%</span>
											<p class="content2">
												商品描述：${p.description}
												<a href="good?id=${p.id}">更多>></a>
											</p>
											
										</div>
										<!--kiosk-product-content-->
									</div>
									<!-- single-product -->
								</c:forEach>
							</div>
							<!-- list-view -->
						</div>
						<!-- tab-content -->
					</div>
					<!-- Grid & List View End -->			
					
					<!--通过判断选择页码跳转 -->
					<!-- 按热度的上下页跳转 -->
					<c:if test="${pagetype == 1}">
						<div class="kiosk-pagination-box fix">
							<ul class="blog-pagination ">
								<li><a href="producthot?pageNum=1">首</a></li>
								<li><a href="producthot?pageNum=${page.prePageNum }"><i class="fa fa-angle-left"></i></a></li>
								<li><a href="producthot?pageNum=${page.nextPageNum }"><i class="fa fa-angle-right"></i></a></li>
								<li><a href="producthot?pageNum=${page.totalPageNum}">末</a></li>
							</ul>
						</div>
					</c:if>

					<!-- 按价格的上下页跳转 -->
					<c:if test="${pagetype == 2}">
						<div class="kiosk-pagination-box fix">
							<ul class="blog-pagination ">
								<li><a href="productprice?pageNum=1">首</a></li>
								<li><a href="productprice?pageNum=${page.prePageNum }"><i class="fa fa-angle-left"></i></a></li>
								<li><a href="productprice?pageNum=${page.nextPageNum }"><i class="fa fa-angle-right"></i></a></li>
								<li><a href="productprice?pageNum=${page.totalPageNum}">末</a></li>
							</ul>
						</div>
					</c:if>
				</div>
				<!-- product Categorie List End -->		
				
			</div>
			<!-- Row End -->
		</div>
		<!-- Container End -->
	</div>

	<footer class="theme-footer">
				<div class="logo1"><a href="main.jsp"><img src="part/img/footer130.png" alt="" /></a></div>
				<p class="copyright">Copyright &copy; 2018.微旅wetrip项目组 All rights reserved.</p>
	</footer> <!-- /.theme-footer -->


<script>
	// 删除元素节点removeChild();
	var list = document.getElementsByTagName('li');
	// list[7].parentNode.removeChild(list[7]);
	// 删除属性节点
	// list[0].removeAttribute('id');
	// list[0].id = "";//把属性的值赋为空，和上面方法效果一样

	
        $(function() {
        if (localStorage.getItem('select')) {
            $("#select option").eq(localStorage.getItem('select')).prop('selected', true);
        }

       $("#select").on('change', function() {
          localStorage.setItem('select', $('option:selected', this).index());
            
        });
      });
 
</script>
</body>


</html>