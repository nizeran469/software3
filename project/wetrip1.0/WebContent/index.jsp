<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ch">
<head>
<!--< taglib prefix="s" uri="/struts-tags" %>-->	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>微旅WeTrip</title>

	<link href="${pageContext.request.contextPath }/index/css/reset.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/index/css/index.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/index/css/iconfont.css" rel="stylesheet">
	<!-- Favicons-->
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/index/img/icon.ico" type="image/x-icon">
	<!-- BASE CSS -->
	<link href="${pageContext.request.contextPath }/index/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/index/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/index/css/vendors.css" rel="stylesheet">

	<!-- YOUR CUSTOM CSS -->
	<link href="${pageContext.request.contextPath }/index/css/custom.css" rel="stylesheet">
	<script type="text/javascript">
	function tips(){
		alert("请先登录！");
	}
	
	</script>
</head>

<body>	
	<div id="page" class="theia-exception">		
		<header class="header menu_fixed">
			<div id="logo">
				<a href="main.jsp">
					<img src="${pageContext.request.contextPath }/index/img/logo_white.png" width="163" height="36" data-retina="true" alt="" class="logo_normal">
					<img src="${pageContext.request.contextPath }/index/img/logo_black.png" width="163" height="36" data-retina="true" alt="" class="logo_sticky">
				</a>
			</div>
			<ul id="top_menu">				
				<c:if test="${empty userEmail}">
				<li><a href="login"><img src="${pageContext.request.contextPath }/index/img/add_button.png" width="24" height="24" class="logo_sticky"></a></li>
				</c:if>
				<c:if test="${not empty userEmail}">
				<li><a href="toEditor"><img src="${pageContext.request.contextPath }/index/img/add_button.png" width="24" height="24" class="logo_sticky"></a></li>
				</c:if>
				<c:if test="${not empty userEmail}">
				<li><a href="zone?zonePageNum=1&collectPageNum=1&username=${userDetail.username}&correctDate=20"><img src="${pageContext.request.contextPath }/index/img/personal_button.png" width="24" height="24" class="logo_sticky" onmouseover="over(this)" onclick="openUser(event)"></a></li>
				</c:if>
				<c:if test="${empty userEmail}">
				<li><a href="login"><img src="${pageContext.request.contextPath }/index/img/personal_button.png" width="24" height="24" class="logo_sticky"  onclick="openUser(event)"></a></li>
				</c:if>
				<li><a href="cart"><img src="${pageContext.request.contextPath }/index/img/shopping_button.png" width="24" height="24" class="logo_sticky"></a></li>
				<c:if test="${empty userEmail}">
				<li><a href="login"><img src="${pageContext.request.contextPath }/index/img/config_button.png" width="24" height="24" class="logo_sticky"  onclick="openUser(event)"></a></li>
				</c:if>
				<c:if test="${not empty userEmail}">
				<li><a href="personalinfo"><img src="${pageContext.request.contextPath }/index/img/config_button.png" width="24" height="24" class="logo_sticky"></a></li>
				</c:if>
				<c:if test="${empty userEmail}">
				<li><a href="login"><img src="${pageContext.request.contextPath }/index/img/add_button1.png" width="24" height="24" class="logo_normal"></a></li>
				</c:if>
				<c:if test="${not empty userEmail}">
				<li><a href="toEditor"><img src="${pageContext.request.contextPath }/index/img/add_button1.png" width="24" height="24" class="logo_normal"></a></li>
				</c:if>
				<c:if test="${not empty userEmail}">				
				<li><a href="zone?zonePageNum=1&collectPageNum=1&username=${userDetail.username}&correctDate=20"><img src="${pageContext.request.contextPath }/index/img/personal_button1.png" width="24" height="24" class="logo_normal" onmouseover="over(this)" onclick="openUser(event)"></a></li>
				</c:if>
				<c:if test="${empty userEmail}">				
				<li><a href="login"><img src="${pageContext.request.contextPath }/index/img/personal_button1.png" width="24" height="24" class="logo_normal"></a></li>
				</c:if>
				<li><a href="cart"><img src="${pageContext.request.contextPath }/index/img/shopping_button1.png" width="24" height="24" class="logo_normal"></a></li>
				<c:if test="${not empty userEmail}">
				<li><a href="personalinfo"><img src="${pageContext.request.contextPath }/index/img/config_button1.png" width="24" height="24" class="logo_normal" ></a></li>
				</c:if>
				<c:if test="${empty userEmail}">
				<li><a href="login"><img src="${pageContext.request.contextPath }/index/img/config_button1.png" width="24" height="24" class="logo_normal" ></a></li>
				</c:if>
				
			</ul>
			<div id="User">
				<a href="">${userEmail }</a><br>
				<a href="zone?zonePageNum=1&collectPageNum=1&username=${userDetail.username}&correctDate=20" >我的空间</a><br>
				<a href="cancel">注销</a>
			</div>
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
					<c:forEach items="${tags }" var="t">
					<li><span><a href="part?tagName=${t.tagName}">${t.tagName }</a></span></li>
					</c:forEach>
					<li><span><a href="producthot">周边商城</a></span></li>
					<li><span><a href="dailytopic?pageNum=1&topicId=${topicId}">今日话题</a></span></li>
					
				</ul>
			</nav>

		</header>	
		<!-- /header -->

		<main>
			<!--banner 开始-->

			<div class="banner">   
				<div class="banner1">
					<ul>
						<li><img src="${pageContext.request.contextPath }/index/img/banner6.jpg" alt=""></li>
						<li><img src="${pageContext.request.contextPath }/index/img/banner8.jpg" alt=""></li>
						<li><img src="${pageContext.request.contextPath }/index/img/banner5.jpg" alt=""></li>
						<li><img src="${pageContext.request.contextPath }/index/img/banner6.jpg" alt=""></li>
					</ul>    	
				</div>
				<div class="nav_right fr">
						<form action="getip">
							<input type="hidden" name="ip" value="returnCitySN['cip']"/>
						</form>
						<div class="search fl clearfix" >
						<form action="indexs">
						<!-- onclick="openDialog(event)" -->
						 
								<div>	
								<input type="hidden" name="pageNumshort" value="1"/>
								<input type="hidden" name="TopicpageNum" value="1"/>				
								<input type="text" name="text" id="searchText" class="search_box fl" value="城市查询" 
								onblur="if(this.value==''){this.value='城市查询'}" onfocus="if(this.value=='城市查询'){this.value=''}"/>
								<input type="submit" class="search_btn fr" value="">
								</div>	
						</form>	
								<div id="dialog" style="display: none;">	</div>						
						</div>
						
					
				</div>
				<div class="bannerText">
					<p class="bt1">${province}</p>
					<p class="bt2">${city}</p>
					<i></i>					
				</div>   
				<ul class="arrows">
					<li class="prev"><img src="index/img/prev.png" alt="" title="前一张"></li>
					<li class="next"><img src="index/img/next.png" alt="" title="后一张"></li>
				</ul>
			</div>

			<!--banner 结束-->
			<!-- 今日话题 -->
			<div class="topic">
		
				<div class="main_title_2">
					<span><em></em></span>
				</div>
				<div class="topic_left">
					<div class="topic_left1">
						<h1>今日</h1>
						<h1>话题</h1>
					</div>
					<div class="topic_left2">
						<img src="${pageContext.request.contextPath }/index/img/line3.png" height="250px">
					</div>
				</div>
		
					<div class="topic_middle">
				<!-- 话题 -->
				<div class="topic_middle_title">
					<a href="dailytopic?pageNum=1&topicId=${topicId}">
					<div class="topic_middle_title_1">
							<h3>${topic.name}</h3>
						</div></a>
					<div class="topic_middle_title_2">
						<p>
							@ ${topic.getManager().getUserDetail().getUsername()}&nbsp;&nbsp;&nbsp;
							<fmt:formatDate value="${topic.topictime}"
								pattern="yyyy年MM月dd日  HH:mm" />
						</p>
					</div>

				</div>
				<div class="topic_middle_content">
					<!-- 头像 -->
					<div class="topic_middle_content_1">
						<a href="zone?zonePageNum=1&collectPageNum=1&username=${travelNote.getUserDetail().getUsername()}&correctDate=20"> <img
							src="${travelNote.getUserDetail().getUserhead()}" style="border-radius: 10px;" style="border-radius: 10px;"
							id="topic_userhead">
						</a>
					</div>
					<div class="topic_middle_content_2">
						<ul class="author-meta clearfix">
							<li class="tag"><a href="zone?zonePageNum=1&collectPageNum=1&username=${travelNote.getUserDetail().getUsername()}&correctDate=20" id="topic_user_name">${travelNote.getUserDetail().getUsername()}</a></li>
							<li class="date"><a href="##" id="topic_publish_time"><fmt:formatDate
										value="${travelNote.publishtime}" pattern="yyyy年MM月dd日  HH:mm" /></a></li>
						</ul>
						<p id="topic_content">${travelNote.content }</p>
						<!--这是下面用来出现照片的部分-->
						<div class="post-img">
							<div id="topic_imgs">
								<c:forEach items="${topicImg }" var="i">
									<img src="${pageContext.request.contextPath }/${i.getPath()}">
								</c:forEach>
							</div>
						</div>
						<ul class="share-meta clearfix">
							<!--标题下面的三个功能按键-->
							<!-- 这地方的controller是？ -->
							<li><a href="detail?travelid=${travelNote.id}"
								id="topic_comment"><img
									src="${pageContext.request.contextPath }/index/img/comment.png">&nbsp;&nbsp;评论
									(<span id="topic_comment_num">${travelNote.commentNum}</span>)
							</a></li>
							<li><a href="##" onclick="praise_col(${travelNote.id},this)" onmouseover="praise_on(this)"
									onmouseout="praise_off(this)" id="topic_praise"><img
									src="${pageContext.request.contextPath }/index/img/like.png"
									>点赞
									(<span class="praise_num">${travelNote.praiseCount}</span>)</a></li>
							<c:if test="${!topicTravelNoteCollected}">
								<li><a href="##" id="topic_collect"
									onclick="collected_col(${travelNote.id},this)"> <img
										src="${pageContext.request.contextPath }/index/img/star.png"
										class="star" onmouseover="star_on(this)"
										onmouseout="star_off(this)" width="13" height="13" title="未收藏">收藏
										(${travelNote.getCollectTravels().size()})
								</a></li>
							</c:if>
							<c:if test="${topicTravelNoteCollected}">
								<li><a href="##" id="topic_collect"
									onclick="collected_col(${travelNote.id},this)"><img
										src="${pageContext.request.contextPath }/index/img/star1.png"
										class="star" width="13" height="13" title="已收藏">收藏
										(${travelNote.getCollectTravels().size()})</a></li>
							</c:if>
							<li><a href="##" id="topic_report" onmouseover="report_on(this)" onmouseout="report_off(this)"
									onclick="report_col(${travelNote.id},this)">
							<img src="index/img/report2.png"
								width="12px" height="12px" style="margin-left: -1px">举报</a></li>
						</ul>
					</div>
				</div>
			</div>
			
				<div class="topic_right"> 
					<div class="topic_right_img">
						<a href="dailytopic?pageNum=1&topicId=${topicId}">
							<div class="topic_right_readmore"></div>
						</a>
					</div>
				<!--分页 -->
					<div class="page">
					<img src="index/img/left4.png" class="a2">
					<c:if test="${count>1}">
						<!-- 这里是鼠标移入移出的效果 -->
						<img src="${pageContext.request.contextPath }/index/img/right.png"
							onmouseover="arrow_color_blue_right(this)"
							onmouseout="arrow_color_away_right(this)"
							onclick="topic_page_col(1,${count},this)" class="a1">
					</c:if>
					<!-- 为1的情况，没有右边的箭头 -->
					<c:if test="${count<=1}">
						<img src="index/img/right4.png" class="a1">
					</c:if>
				</div>
			</div>

		</div>
			<!-- 今日话题结束 -->
			<!-- 热门说说 -->
			<!-- 热门说说 -->
		<div class="shuo">
			<div class="main_title_2">
				<span><em></em></span>
			</div>
			<div class="shuo_right">
				<div class="shuo_right2">
					<img src="${pageContext.request.contextPath }/index/img/line4.png"
						height="250px">
				</div>
				<div class="shuo_right1">
					<h1>热门</h1>
					<h1>说说</h1>
				</div>
			</div>
			<div class="shuo_middle">
				<!--用户名 -->
				<div class="shuo_middle_title">
					<div class="shuo_middle_title_1">
						<a href="zone?zonePageNum=1&collectPageNum=1&username=${shortNote.getUserDetail().getUsername()}&correctDate=20"><h3 id="short_user_name">${shortNote.getUserDetail().getUsername()}</h3></a>
					</div>
				</div>
				<div class="shuo_middle_content">
					<!--头像-->
					<div class="shuo_middle_content_1">
						<a href="zone?zonePageNum=1&collectPageNum=1&username=${shortNote.getUserDetail().getUsername()}&correctDate=20"> <img
							src="${shortNote.getUserDetail().getUserhead()}" width="100px"  style="border-radius: 10px;"
							
							height="100px" id="short_userhead" >
						</a>
					</div>
					<div class="shuo_middle_content_2">
						<ul class="author-meta clearfix">
							<li class="tag"><a href="part?tagName=${shortTag}" id="short_tag">${shortTag}</a></li>
							<li class="date"><a href="zone?zonePageNum=1&collectPageNum=1&username=${shortNote.getUserDetail().getUsername()}&correctDate=20" id="short_publish_time"><fmt:formatDate
										value="${shortNote.getPublishtime()}"
										pattern="yyyy年MM月dd日  HH:mm" /></a></li>
						</ul>
						<p id="short_content">	${fn:substring(shortNote.getContent(), 0, 150)}......</p>
						<!--这是下面用来出现照片的部分-->
						
						<div class="post-img" id="short_imgs">
							<c:forEach items="${shortImg}" var="imgi">
								<img
									src="${pageContext.request.contextPath }/${imgi.getPath()} ">
							</c:forEach>
						</div>
						
						<ul class="share-meta2 clearfix">
							<!--标题下面的三个功能按键-->
							<li><a href="detail?travelid=${shortNote.id}" id="short_comment"><img
									src="${pageContext.request.contextPath }/index/img/comment.png">&nbsp;&nbsp;评论
									(<span id="short_comment_num">${shortNote.getCommentNum() }</span>)</a></li>
							<li><a href="##" id="short_praise" onclick="praise_col(${shortNote.id},this)" onmouseover="praise_on(this)" onmouseout="praise_off(this)"><img
									src="${pageContext.request.contextPath }/index/img/like.png"
									>点赞(
									<span class="praise_num">${shortNote.getPraiseCount() }</span>)</a></li>
							<c:if test="${!shortTravelNoteCollected}">
								<li><a href="##" onclick="collected_col(${shortNote.id},this)"
									id="short_collect"> <img src="index/img/star.png"
										class="star" onmouseover="star_on(this)" onmouseout="star_off(this)"
										width="13" height="13" title="未收藏">收藏 (${shortNote.getCollectTravels().size()})
								</a></li>
							</c:if>
							<c:if test="${shortTravelNoteCollected}">
								<li><a href="##" onclick="collected_col(${shortNote.id},this)"
									id="short_collect"><img src="index/img/star1.png"
										class="star"  width="13" height="13"
										title="已收藏">收藏(${shortNote.getCollectTravels().size()}) </a></li>
							</c:if>
							<li><a href="##" id="short_report" onmouseover="report_on(this)" onmouseout="report_off(this)"
									onclick="report_col(${shortNote.id},this)"><img
									src="${pageContext.request.contextPath }/index/img/report2.png"
									width="12px" height="12px">举报</a></li>
						</ul>
						</ul>
					</div>
				</div>
			</div>
			<div class="shuo_left">
				<div class="shuo_left_img">
					<a href="detail?travelid=${shortNote.id}">
						<div class="shuo_left_readmore"></div>
					</a>
				</div>
				<div class="page2">
					<!-- 说说的分页 -->
					<c:if test="${shortCount>1}">
						<img src="index/img/right.png"
							onmouseover="arrow_color_green_right(this)"
							onmouseout="arrow_color_away_right(this)" class="a1"
							onclick="short_page_col(1,${shortCount},'${city}',this)">
					</c:if>
					<!-- 为1的情况，没有右边的箭头 -->
					<c:if test="${shortCount<=1}">
						<img src="index/img/right4.png" class="a1">
					</c:if>
					<img src="index/img/left4.png" class="a2">
				</div>
			</div>

		</div>
	

		<!--热门说说结束-->
		<!-- 热点文章-->
		<div class="container-fluid margin_80_0">
			<div class="main_title_2">
				<span><em></em></span>
				<h2>热点文章</h2>
			</div>
			<div id="reccomended" class="owl-carousel owl-theme">
				<!--单个文章推荐-->
				<c:forEach items="${longMap}" var="longi" varStatus="status">
				<div class="item">
					<div class="box_grid">
						<figure>
							<a href="##" class="star_bt" onclick="long_collected_col(${longi.key.id},this)">
								<c:if test="${longi.value!=1}">
									<img src="index/img/star3.png">
								</c:if>
								<c:if test="${longi.value==1}">
									<img src="index/img/star4.png">
								</c:if>
							</a> 
							<a href="#0" class="wish_bt" onclick="long_praise_col(${longi.key.id},this)"> <img src="index/img/like3.png"></a> 
							<a href="detail?travelid=${longi.key.id}">
								<img src="${longi.key.getImgs().toArray()[0].getPath()}" class="img-fluid" alt="" width="800" height="533">
								<div class="read_more">
									<span>阅读更多</span>
								</div>
							</a>
							<small>${longTag[status.index]}</small> 
						</figure>
						<div class="wrapper">
							<h3><a href="detail?travelid=${longi.key.id}">${longi.key.getTitle()}</a></h3>
					
			
							
							
							<span class="price">${longi.key.getUserDetail().getUsername()}</span>
						</div>
						<ul>
							<li><i class="icon_clock_alt"></i><fmt:formatDate value="${longi.key.getPublishtime()}" pattern="yyyy年MM月dd日  HH:mm"/></li>
							<li><div class="score"><span>评论<em>${longi.key.getCommentNum()}</em></span></div></li>
						</ul>
					</div>
				</div>
				</c:forEach>
				
			</div>
			<!-- /carousel -->
		</div>
		<!-- 热点文章结束 -->
		<br>
		<!-- 商品推荐-->
		<div class="container-fluid margin_30_95 pl-lg-5 pr-lg-5">
			<section>
				<div class="main_title_3">
					<span><em></em></span>
					<h2>商品推荐</h2>
				</div>
				<div class="row">
					<div class="col-xl-3 col-lg-6 col-md-6">
						<a href="producthot" class="grid_item">
							<figure>
								<a href="good?id=39"><img src="image\goods\tent3.png" class="img-fluid" alt=""></a>
								<div class="info">
									<h4>碎花帐篷</h4>
								</div>
							</figure>
						</a>
					</div>
					<!-- /grid_item -->
					<div class="col-xl-3 col-lg-6 col-md-6">
						<a href="producthot" class="grid_item">
							<figure>
								<a href="good?id=38"><img src="image\goods\tent2.png" class="img-fluid" alt=""></a>
								<div class="info">
									<h4>树洞帐篷</h4>
								</div>
							</figure>
						</a>
					</div>
					<!-- /grid_item -->
					<div class="col-xl-3 col-lg-6 col-md-6">
						<a href="producthot" class="grid_item">
							<figure>
								<a href="good?id=41"><img src="image\goods\tent5.png" class="img-fluid" alt=""></a>
								<div class="info">
									<h4>气泡帐篷</h4>
								</div>
							</figure>
						</a>
					</div>
					<!-- /grid_item -->
					<div class="col-xl-3 col-lg-6 col-md-6">
						<a href="producthot" class="grid_item">
							<figure>
								<a href="good?id=44"><img src="image\goods\tent8.png" class="img-fluid" alt=""/></a>
								<div class="info">
									<h4>常用帐篷</h4>
								</div>
							</figure>
						</a>
					</div>
					<!-- /grid_item -->
				</div>
				<!-- /row -->
				<div class="container">
					<br>
					<p class="btn_home_align"><a href="producthot" class="btn_1 rounded">查看所有商品</a></p>
				</div>
			</section>
		</div>

	</main>
	<!-- /main -->
	<!--footer-->
	<footer class="theme-footer">
		<div class="container">
			<div class="logo"><a href="main.jsp"><img src="${pageContext.request.contextPath }/index/img/footer130.png" alt=""></a></div>		
			<p class="copyright">Copyright &copy; 2018.微旅wetrip项目组 All rights reserved.</p>
		</div> <!-- /.container -->
	</footer> <!-- /.theme-footer -->
	<!--/footer-->
</div><!-- page -->

<div id="toTop"></div><!-- 返回到顶端 -->

<!-- 通用js -->
<script src="${pageContext.request.contextPath }/index/js/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath }/index/js/common.js"></script>
<script src="${pageContext.request.contextPath }/index/js/index.js"></script>
<script src="${pageContext.request.contextPath }/index/js/common_scripts.js"></script>
<script src="${pageContext.request.contextPath }/index/js/main.js"></script>
<!-- 用于控制页面ajax的js
 	 孙亦璇 v0.0.2(2018-12-17 20:17:07) -->
<script src="${pageContext.request.contextPath }/index/js/index_ajax.js"></script>

<!-- DATEPICKER  -->

<script>
/**
*搜索城市的下拉框
*/
	window.onload=function(){
		document.onclick = function fun1(e){
			e = e || window.event;
			var dom =  e.srcElement|| e.target;
			if(dom.id != "User" && document.getElementById("User").style.display == "block") {
				document.getElementById("User").style.display = "none";				
			}				

		};
	
				//获取文本输入框
				var textElment = document.getElementById("searchText");
				//获取下拉提示框
				var div = document.getElementById("dialog");
				textElment.onkeyup=function(){
					//获取用户输入的值
					var text = textElment.value;
					//如果文本框中没有值，则下拉框被隐藏，不显示
					if(text==""){
						div.style.display="none";
						return;
					}
					
					//获取XMLHttpRequest对象
					var xhr = new XMLHttpRequest();
					//编写回调函数
					xhr.onreadystatechange=function(){
						//判断回调的条件是否准备齐全
						if(xhr.readyState==4){
							if(xhr.status==200){
								//取的服务器端传回的数据
								var str = xhr.responseText;
								
								//判断传回的数据是否为空,若是则直接返回，不显示
								if(str==""){
									return;
								}
								//我们将会在服务器端把数据用 , 隔开，当然这里也可以使用json
								var result = str.split(",");
								var childs = "";
								//遍历结果集，将结果集中的每一条数据用一个div显示，把所有的div放入到childs中
								for(var i=0; i<result.length;i++){
									childs += "<div onclick='Write(this)' onmouseout='recoverColorwhenMouseout(this)' onmouseover='changeColorwhenMouseover(this)' id='dialogdiv'>"+result[i]+"</div>";
								}
								//把childs 这div集合放入到下拉提示框的父div中，上面我们已经获取了
								div.innerHTML=childs;
								div.style.display="block";								
							}
						}
					}					
					//创建与服务器的连接
					xhr.open("GET","${pageContext.request.contextPath}/test?text="+text);
					
					//发送
					xhr.send();
				}
			}
			//鼠标悬停时改变div的颜色
			function changeColorwhenMouseover(div){
				div.style.backgroundColor="#76a68d";
			}
			//鼠标移出时恢复div颜色
			function recoverColorwhenMouseout(div){
				div.style.backgroundColor="";
			}
			//当鼠标点击div时，将div的值赋给输入文本框				
			function Write(div){										
				//将div中的值赋给文本框
				document.getElementById("searchText").value=div.innerHTML;			
				//让下拉提示框消失			
				div.parentNode.style.display="none";
			}
		//搜索
		function display(id){  
			var traget=document.getElementById(id);  
			if(traget.style.display=="none"){  
				traget.style.display="";  
			}else{  
				traget.style.display="none";  
			}  
		}
		//点击出现div，移开消失
		function openDialog(e) {
			document.getElementById("dialog").style.display = "block";
			e = e||window.event;
			if(+'\v1') {
				e.stopPropagation();
			} else  {
				e.cancelBubble = true;
			}
		}

//用户登录后的状态注销等
function over(obj){        
   document.getElementById("User").style.display = "block";
            }			

	</script>
	<c:if test="${notLogin }">
<img src="index/img/logo_white.png" style="display:none;" onload="tips()"/> <% session.removeAttribute("notLogin"); %>
</c:if>	
</body>
</html>
