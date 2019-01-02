<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <%@ page isELIgnored="false" %>
 
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

	<title>微旅WeTrip-${ud.username }的空间</title>
	<link rel="shortcut icon" href="zone/images/icon.ico" type="zone/image/x-icon">





	<!-- Main style sheet -->
	<link rel="stylesheet" type="text/css" href="zone/css/style.css">
	<!-- responsive style sheet -->
	<link rel="stylesheet" type="text/css" href="zone/css/responsive.css">
	<!-- Theme-Color css -->
	<link rel="stylesheet" id="jssDefault" href="zone/css/color.css">
	<!-- BASE CSS -->
	<link href="zone/css/bootstrap.min.css" rel="stylesheet">
	<link href="zone/css/banner-style.css" rel="stylesheet">
	<link href="zone/css/vendors.css" rel="stylesheet">


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
			<img src="zone/images/logo_white.png" width="150" height="36" data-retina="true" alt="" class="logo_normal">
			<img src="zone/images/logo_black.png" width="150" height="36" data-retina="true" alt="" class="logo_sticky">
		</a>
	</div>
	<!--这是旁边的三个按钮-->
	<ul id="top_menu">
		<li><a href="toEditor"><img src="zone/images/add_button1.png" width="24" height="24" ></a></li>
		<li><a href="zone?zonePageNum=1&collectPageNum=1&username=${userDetail.username}&correctDate=20""><img src="zone/images/personal_button1.png" width="24" height="24"></a></li>
		<li><a href="cart"><img src="zone/images/shopping_button1.png" width="24" height="24" ></a></li>
		<li><a href="personalinfo"><img src="zone/images/config_button1.png" width="24" height="24" ></a></li></ul>

		<ul id="top_menu2">
			<li><a href="toEditor"><img src="zone/images/add_button.png" width="24" height="24" ></a></li>
			<li><a href="zone?zonePageNum=1&collectPageNum=1&username=${userDetail.username}&correctDate=20""><img src="zone/images/personal_button.png" width="24" height="24"></a></li>
			<li><a href="cart"><img src="zone/images/shopping_button.png" width="24" height="24" ></a></li>
			<li><a href="personalinfo"><img src="zone/images/config_button.png" width="24" height="24" ></a></li>
			

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
<div class="container" style="margin-top: 110px;">
	<div class="row">	
		<div class="col-lg-8 col-12 blog-grid-style hover-effect-one">
			<!--每篇日记的展示-->
			<c:forEach items="${travelMap}" var="travel"  >
			<div class="single-blog-post" style="margin-bottom: 15px;">
				<div class="post-meta-box bg-box">
					<ul class="author-meta clearfix">
						
						<li class="tag">
						<c:forEach items="${travel.key.tagTravelNote}" var="tagi">
								<div class="recent-posts-widget-category">
										<c:if test="${tagi.tags.parentTag==null }">
											<a href="archives.html">${tagi.tags.tagName}</a>
										</c:if>
								</div>
						
						</c:forEach>
						</li>    
						<li class="date"><a href="##"><fmt:formatDate value="${travel.key.publishtime}" pattern="yyyy年MM月dd日  HH:mm"/></a></li>
					</ul>
					<!--文章标题-->
					<h4 class="title"><a href="detail?travelid=${travel.key.id }">${travel.key.title }</a></h4>
					<ul class="share-meta clearfix">
						<!--标题下面的三个功能按键-->
						<li><a href="##"><i class="icon flaticon-comment"></i>评论(${travel.key.praiseCount })</a></li>
						<li>
							<a href="##" onclick="praise_col(${travel.key.id},this)" 
								onmouseover="praise_on(this)" onmouseout="praise_off(this)">
								<img src="${pageContext.request.contextPath }/zone/images/like.png" id="like" width="14" height="14">点赞(${travel.key.commentNum })</a></li>						
						<li>
							<c:if test="${travel.value!=1}">
								<a href="##" onclick="collected_col(${travel.key.id},this)"><img src="zone/images/star.png" id="star" onmouseover="star_on(this)" onmouseout="star_off(this)"  width="16" height="16" title="收藏" >
								收藏(${travel.key.getCollectTravels().size()})</a>
							</c:if>
							<c:if test="${travel.value==1}">
								<a href="##" onclick="collected_col(${travel.key.id},this)"><img src="zone/images/star1.png" id="star" width="16" height="16" title="收藏" >收藏(${travel.key.getCollectTravels().size()})</a>
							</c:if>
						</li> <!-- /.share-option -->
						<li><a href="##" onclick="report_col(${travel.key.id},this)" onmouseover="report_on(this)" onmouseout="report_off(this)"><img src="zone/images/report.png" id="tip" width="14" height="14" title="举报" >举报</a>
						</li>
					</ul>
					<!--图片位置-->
					<c:if test="${travel.key.getImgs().toArray()[0]!=null}">
					<div class="image-box"><img src="${travel.key.getImgs().toArray()[0].getPath() }" alt="" title="封面"></div>
					</c:if>
					<c:if test="${travel.key.getImgs().toArray()[0]==null}">
					<div class="image-box"><img src="image/avatar/avatar1.png" alt="" title="封面"></div>
					</c:if>
					
					<!--文本位置-->
					<div class="post-article">
						<p>${travel.key.content }</p>
					</div>
					
					<c:if test="${ud.username!=loginUsername }">
						<div style="clear:both" class="change" >
	
						</div>
					</c:if>
					
					<c:if test="${ud.username==loginUsername }">
						<div style="clear:both" class="change" >
							<a href="delete?travelId=${travel.key.id }&zonePageNum=${zonePageNum }&username=${ud.username }&collectPageNum=${collectPageNum }&correctDate=${correctDate}">删除</a>
							<a href="reEditor?travelId=${travel.key.id }">修改</a>
						</div>
					</c:if>
				</div> <!-- /.post-meta-box -->
			</div> <!--每篇日记的展示-->
			</c:forEach>
			<!--分页 -->
			
			
			<div class="theme-pagination text-center">
				<ul class="clearfix">
				
			<c:if test="${zonePageNum>1}">
				<li>
					<a href="zone?zonePageNum=${zonePageNum-1 }&username=${username }&collectPageNum=${collectPageNum }&correctDate=${correctDate}">
						<i class="icon flaticon-left-arrow" title="上一页"></i>
					</a>
				</li>
			</c:if>
					<li>
						第
						<select onchange="myfunction();" id="_pn">  
						<c:forEach var="num" begin="1" end="${count}">
						<c:if test="${zonePageNum==num}">
						<option value="${num}" selected="selected">${num}</option>
						</c:if>
						<c:if test="${zonePageNum!=num}">
						<option value="${num}" >${num}</option>
						</c:if>
						</c:forEach>
					</select>

						页
					</li>
					<li>共${count }页</li>
				<c:if test="${zonePageNum<count}">
					<li>
						<a href="zone?zonePageNum=${zonePageNum+1 }&username=${username }&collectPageNum=${collectPageNum }&correctDate=${correctDate}">
							<i class="icon flaticon-right-arrow" title="下一页"></i>
						</a>
					</li>
				</c:if>
			
				</ul>
			</div>
			
			
			
		</div> <!-- /.col- -->

		<!-- ======================== Theme Sidebar =============================== -->
		<div class="col-lg-4 col-md-7 col-12 theme-main-sidebar">
			<div class="sidebar-box bg-box about-me">
				<h6 class="sidebar-title">关于我</h6>
				<img src="${ud.userhead }" alt="" width="200px" height="200px" style="margin:0 auto">
				<div class="userii">
					<div  class="useri">
						<h5 >${ud.username }</h5>
					</div>
					
					<c:if test="${ud.sex=='女' }">
					<div class="useri_img">
						<img src="zone/images/sexy-woman.png" >
					</div>
					</c:if>
					
					<c:if test="${ud.sex=='男' }">
					<div class="useri_img">
						<img src="detail/img/icons8-男-16.png" >
					</div>
					</c:if>
					
					<c:if test="${ud.sex=='秘密' }">
					<div class="useri_img">
						
					</div>
					</c:if>
					
				</div>
				<div style="clear: both;"></div>
				<h6>${ud.city }</h6>
				<p>${ud.description }</p>

			</div> <!-- /.about-me -->
			<div class="sidebar-box bg-box sidebar-categories">
				<h6 class="sidebar-title" style="color:#5db688; font-weight:bold">时间归档</h6>
				<c:forEach items="${dateList }" var="date"  >
				<ul>
					<li><a href="zone?zonePageNum=1&username=${ud.username }&collectPageNum=1&correctDate=${date }">${date }</a></li>
				</ul>
				</c:forEach>
			</div> 
			<div class="sidebar-box bg-box sidebar-categories">
				<h6 class="sidebar-title" style="color:#5db688; font-weight:bold">我的收藏</h6>
				<ul>
					<c:forEach items="${collectList }" var="c">
						<li><a href="detail?travelid=${c.getTravelNote().getId()}">${c.getTravelNote().getTitle() }</a></li>
					</c:forEach>
				</ul>
				
				<div class="newpage">
				<c:if test="${collectPageNum>1}">
					<a href="zone?zonePageNum=${zonePageNum }&username=${ud.username }&collectPageNum=${collectPageNum-1}&correctDate=${correctDate}" id="new_leftpage"><i class="icon flaticon-left-arrow"></i></a>
				</c:if>	
					<!--页码-->
				<c:if test="${collectPageNum<collectCount}">
					<a href="zone?zonePageNum=${zonePageNum }&username=${ud.username }&collectPageNum=${collectPageNum+1 }&correctDate=${correctDate}" id="new_rightpage"><i class="icon flaticon-right-arrow"></i></a>
					<!--页码-->
				</c:if>		
				</div>
			</div> 
			<!-- /.sidebar-categories -->
		</div> <!-- /.theme-main-sidebar -->
	</div> <!-- /.row -->
</div> <!-- /.container -->

	<!--
	=====================================================
		Footer
	=====================================================
-->
<!--footer-->
	<footer class="theme-footer">
		<div class="container">
			<div class="logo"><a href="main.jsp"><img src="${pageContext.request.contextPath }/index/img/footer130.png" alt=""></a></div>		
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
<script src="zone/fonts/font-awesome/fontawesome-all.min.js"></script>
<!-- COMMON SCRIPTS -->
<script src="zone/js/jquery-2.2.4.min.js"></script>
<script src="zone/js/common_scripts.js"></script>
<script src="zone/js/main.js"></script>


<!-- Map -->

<!-- DATEPICKER  -->
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

<!--收藏js-->




<!-- INPUT QUANTITY  -->


<!-- INSTAGRAM FEED  -->
<script type="text/javascript" src="zone/js/zone_ajax.js"></script>
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
	

	function myfunction(){
		var select = document.getElementById("_pn").value;
			document.location.href="zone?zonePageNum="+select+"&username=${username }&collectPageNum=${collectPageNum }&correctDate=${correctDate}";
		
	}
</script>
<!-- Theme js -->
<script src="zone/js/theme.js"></script>
</div> <!-- /.main-page-wrapper -->
</body>
</html>
