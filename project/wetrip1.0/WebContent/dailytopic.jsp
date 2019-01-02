<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ch">
<head>
	<meta charset="UTF-8">
	<!-- For IE -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- For Resposive Device -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- For Window Tab Color -->
	<!-- Chrome, Firefox OS and Opera -->
	<meta name="theme-color" content="#2c2c2c">
	<!-- Windows Phone -->
	<meta name="msapplication-navbutton-color" content="#2c2c2c">
	<!-- iOS Safari -->
	<meta name="apple-mobile-web-app-status-bar-style" content="#2c2c2c">

	<title>微旅WeTrip</title>
	<link rel="shortcut icon" href="dailytopic/images/icon.ico" type="zone/image/x-icon">

	<!-- Main style sheet -->
	<link rel="stylesheet" type="text/css" href="dailytopic/css/style.css">
	<!-- responsive style sheet -->
	<link rel="stylesheet" type="text/css" href="dailytopic/css/responsive.css">
	<!-- Theme-Color css -->
	<link rel="stylesheet" id="jssDefault" href="dailytopic/css/color.css">
	<!-- BASE CSS -->
	<link href="dailytopic/css/bootstrap.min.css" rel="stylesheet">
	<link href="dailytopic/css/banner-style.css" rel="stylesheet">
	<link href="dailytopic/css/vendors.css" rel="stylesheet">


	<!-- Fix Internet Explorer ______________________________________-->

<!--[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<script src="vendor/html5shiv.js"></script>
	<script src="vendor/respond.js"></script>
	<![endif]-->


</head>

<body>

	<div class="main-page-wrapper">
	<!-- 
	=============================================
					Banner
	============================================== 
-->
<header class="header menu_fixed">

	<div id="logo">
		<a href="main.jsp">
			<img src="dailytopic/images/logo_white.png" width="150" height="36" data-retina="true" alt="" class="logo_normal">
			<img src="dailytopic/images/logo_black.png" width="150" height="36" data-retina="true" alt="" class="logo_sticky">
		</a>
	</div>
	<!--这是旁边的三个按钮-->
	<ul id="top_menu">
		<li><a href="toEditor"><img src="dailytopic/images/add_button1.png" width="24" height="24"></a></li>
		<li><a href="zone?zonePageNum=1&collectPageNum=1&username=${userDetail.username}&correctDate=20"><img src="dailytopic/images/personal_button1.png" width="24" height="24"></a></li>
		<li><a href="cart"><img src="dailytopic/images/shopping_button1.png" width="24" height="24"></a></li>
		<li><a href="personalinfo"><img src="dailytopic/images/config_button1.png" width="24" height="24"></a></li>

	</ul>
	<ul id="top_menu2">
		<li><a href="toEditor"><img src="dailytopic/images/add_button.png" width="24" height="24"></a></li>
		<li><a href="zone?zonePageNum=1&collectPageNum=1&username=${userDetail.username}&correctDate=20"><img src="dailytopic/images/personal_button.png" width="24" height="24" ></a></li>
		<li><a href="cart"><img src="dailytopic/images/shopping_button.png" width="24" height="24"></a></li>
		<li><a href="personalinfo"><img src="dailytopic/images/config_button.png" width="24" height="24"></a></li>

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
			<!--
				------------------------------------------
							这是banner上的分栏
				------------------------------------------
			-->
			<ul>
					<li><span><a href="main.jsp">首页</a></span></li>
					<c:forEach items="${tags }" var="t">
					<li><span><a href="part?tagName=${t.tagName}">${t.tagName }</a></span></li>
					</c:forEach>
					<li><span><a href="producthot">周边商城</a></span></li>
					<li><span><a href="dailytopic?pageNum=1&topicId=${topicId}">今日话题</a></span></li>
				</ul>
		</nav>
	</header>

	<!-- 
	=============================================
					文章展示页
	============================================== 
-->
<div class="container" style="margin-top: 80px;" style="margin: 0 auto">
	<!--上方标题-->
	<div style="width: 1200px;height: 260px;margin: 0 auto;background-color: #f5f5f5;background-image: url(dailytopic/images/topic/background.png);background-repeat: no-repeat;background-position: 95% 70%">  
		<h2 style="font-size: 36px;font-weight: 700;margin: 60px 0px 20px 50px;padding-top: 20px;">${topic.name}</h2>
		<p style="line-height: 1.75;color: #333;font-size: 14px;margin-left: 50px;width: 700px">
			${topic.description}</p>
			<div style="margin-left: 50px;height: 20px;line-height: 20px;margin-top: 10px;margin-bottom: 10px;font-size: 12px">
				<span style="float: left;margin-right: 12px;color: #808080;line-height: 20px;font-size: 12px"><a href="##" style="color: #808080">${topic.manager.userDetail.username}</a></span>
				<span style="float: left;margin-right: 12px;color: #808080;line-height: 20px;font-size: 12px"><fmt:formatDate value="${topic.topictime}" pattern="yyyy年MM月dd日  "/></span>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-12 blog-grid-style hover-effect-one">
				<!--每篇日记的展示-->
					<c:forEach items="${travelMap}" var="traveli">
					<div class="single-blog-post" style="margin-bottom: 15px;">
					<div class="post-meta-box bg-box">
						<!--图片位置-->
						<div class="image-box"><img src="${traveli.key.userDetail.userhead }" alt=""></div>
						<!--文本位置-->
						<div class="post-article">
							<ul class="author-meta clearfix">
								<li class="tag"><a href="zone.html">${traveli.key.userDetail.username}</a></li>
								<li class="date"><a href="##"><fmt:formatDate value="${traveli.key.publishtime}" pattern="yyyy年MM月dd日  HH:mm"/></a></li>
							</ul><p style="text-indent:2em;text-align: justify">${traveli.key.content}</p>
							<!--这是下面用来出现照片的部分-->
							<div class="post-img">
							<c:forEach items="${traveli.key.imgs}" var="imgi" varStatus="status">	
							<c:if test="${status.index<4}">						
								<img src="${imgi.getPath()}">
							</c:if>
							</c:forEach>							
							</div>
						<ul class="share-meta clearfix">
								<!--标题下面的三个功能按键-->
								<li><a href="detail?travelid=${traveli.key.id}"><i class="icon flaticon-comment"></i>评论(${traveli.key.commentNum})</a></li>
								<li>
									<a href="##" onclick="praise_col(${traveli.key.id},this)" 
										onmouseover="praise_on(this)" onmouseout="praise_off(this)">
										<img src="dailytopic/images/like.png" width="14px" height="14px"  id="like">点赞(${traveli.key.praiseCount})
									</a>
								</li>
								<li>
									<a href="##" class="collect" onclick="collected_col(${traveli.key.id},this)">
									<c:if test="${traveli.value!=1}">
										<img src="dailytopic/images/star.png" id="star" onmouseover="star_on(this)" onmouseout="star_off(this)"  width="16" height="16" title="收藏">								
											收藏(${traveli.key.getCollectTravels().size()})
									</c:if>
									<c:if test="${traveli.value==1}">
										<img src="dailytopic/images/star1.png" width="16" height="16" title="收藏" id="star">								
											收藏(${traveli.key.getCollectTravels().size()})
									</c:if>
									</a>
								</li>
								<li>
									<a href="##" onmouseover="report_on(this)" onmouseout="report_off(this)"
									onclick="report_col(${traveli.key.id},this)">
										<img src="${pageContext.request.contextPath }/index/img/report2.png" width="12px" height="12px" id="tip">举报
									</a>
								</li>
							</ul></div>
							<div style="clear:both"></div>
						</div> <!-- /.post-meta-box -->
					</div> 
					</c:forEach>
					
					
					<!--分页 -->
				</div> <!-- /.col- -->
				<!-- ======================== Theme Sidebar =============================== -->
			</div> <!-- /.row -->
			<!--分页-->
			<div class="theme-pagination text-center" >
				<ul class="clearfix">
					<c:if test="${pageNum>1}">
					<li><a href="dailytopic?pageNum=${pageNum-1 }&topicId=${topicId}"><i class="icon flaticon-left-arrow" title="上一页"></i></a></li>
					</c:if>
					<!--页码-->
					<li >
					<a href="##">
					第
					<select onchange="myfunction();" id="_pn">  
						<c:forEach var="num" begin="1" end="${pageCount}">
						<c:if test="${pageNum==num}">
						<option value="${num}" selected="selected">${num}</option>
						</c:if>
						<c:if test="${pageNum!=num}">
						<option value="${num}" >${num}</option>
						</c:if>
						</c:forEach>
					</select>
					
					页
					</a>
					</li>
					<li style="padding:4px 12px">共${pageCount}页</li>
					<c:if test="${pageNum<pageCount}">
					<li><a href="dailytopic?pageNum=${pageNum+1}&topicId=${topicId}"><i class="icon flaticon-right-arrow" title="下一页"></i></a></li>
					</c:if>
					<!--页码-->
				</ul>
			</div> <!--分页 -->
			<div style="clear:both"></div>
			<!--这些是超链接啊啊啊呜-->
			<div class="links">
				<span style="color: rgb(204, 51, 51);font-size: 14px;letter-spacing: 1px;">▼</span>
				<p style="margin: 0px;padding: 0px;margin-bottom: 20px;margin-top: 20px;margin-left: -16px;width:343px;height:80px;background-repeat: no-repeat;background-size: 343px 80px;background-image: url(dailytopic/images/topic.png);font-size: 25px;line-height: 70px;">往期话题:</p>

				<c:forEach items="${topicList}" var="listi">
				<a href="dailytopic?pageNum=1&topicId=${listi.id }">${listi.getName() }</a>
				</c:forEach>
			</div><!--这些是超链接啊啊啊呜-->
		</div> <!-- /.container -->

	<!--
	=====================================================
		Footer
	=====================================================
-->
<!--footer-->
<footer class="theme-footer">
	<div class="container">
		<div class="logo"><a href="main.jsp"><img src="dailytopic/images/footer130.png" alt=""></a></div>		
		<p class="copyright">Copyright &copy; 2018.微旅wetrip项目组 All rights reserved.</p>
	</div> <!-- /.container -->
</footer> <!-- /.theme-footer -->
<!--/footer-->

<!-- Scroll Top Button -->
<button class="scroll-top tran3s">
	<!-- <i class="fa fa-angle-up" aria-hidden="true"></i> -->
</button>



<!-- Optional JavaScript _____________________________  -->

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!-- Font Awesome -->
<script type="text/javascript" src="dailytopic/js/dailytopic_ajax.js"></script>
<script src="dailytopic/fonts/font-awesome/fontawesome-all.min.js"></script>
<!-- COMMON SCRIPTS -->
<script src="dailytopic/js/jquery-2.2.4.min.js"></script>
<script src="dailytopic/js/common_scripts.js"></script>
<script src="dailytopic/js/main.js"></script>


<!-- Map -->

<!-- DATEPICKER  -->

<script type="text/javascript">
function myfunction(){
	var select = document.getElementById("_pn").value;
		document.location.href="dailytopic?pageNum="+select+"&topicId="+${topicId};
}
</script>
<script>
	$('input[name="dates"]').daterangepicker({
		"singleDatePicker": true,
		"autoApply": true,
		parentEl:'#input_date',
		"linkedCalendars": false,
		"showCustomRangeLabel": false
	}, function(start, end, label) {
		console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	});	
</script>

<!-- INPUT QUANTITY  -->


<!-- INSTAGRAM FEED  -->
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



<!-- Theme js -->
<script src="dailytopic/js/theme.js"></script>
</div> <!-- /.main-page-wrapper -->
</body>
</html>
