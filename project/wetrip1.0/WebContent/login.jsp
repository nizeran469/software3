<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ch" class="no-js">
<head>
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	<title>微旅Wetrip-登录</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/loginAndRegister/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/loginAndRegister/css/demo.css" />
	<!--必要样式-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/loginAndRegister/css/component.css" />
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/loginAndRegister/img/icon.ico" type="image/x-icon">	
</head>
<!-- onload="createCode()"一开始加载的时候就生成验证码的方法-->
<body>
	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<div class="logo_box">
					<h3>欢迎你</h3>
					<form action="login" name="f" method="post">

						<div class="input_outer">
							<span class="u_user1"></span>
							<input name="email" class="text" id="userEmail" maxlength="30" style="color: #FFFFFF !important" type="text" placeholder="请输入邮箱" onblur="checkEmail()" onfocus="xiaoshiEmail()" onkeydown="rangeEmail()"/>														
							<div id="email" ></div>
							
							<c:if test="${tip==2}"><div id="email2" >请输入用户名！</div></c:if>
						</div>

						<div class="input_outer">
							<span class="us_uer"></span>
							<input name="password" id="logPass" class="text" maxlength="16" style="color: #FFFFFF !important;" value="" type="password" placeholder="请输入密码，区分大小写" onblur="checkPassword()" onfocus="xiaoshiPassword()" onkeydown="rangePassword()">
							<div id="pas"></div>
							
							<c:if test="${tip==3}"><div id="password" >请输入密码！</div></c:if>
						</div>

						<div class="input_outer1">
							<div id="all">
							<span class="us_uer2"></span>
							<div class="yan" id="searchMsg" style="display:none" ></div>
							<input name="codekey" id="text1" style="color: #FFFFFF !important; position:absolute; z-index:100;" type="text" placeholder="请输入验证码"  onfocus="xiaoshiCode()" onblur="codetip()">
							<div id="img1">
								<div id="yanzhengimg"  onclick="changeImg()"><img src="${pageContext.request.contextPath}/createCode" /></div>							
								<a href="" id="shuaxin" onclick="changeImg()" style="font-size:14px; color:#eaeaea">刷新验证码</a>
							</div>
							</div>	
							<div id="yanzheng2" ></div>						
							<c:if test="${codeError}"><div id="yanzheng" >验证码错误！</div></c:if>
							<c:if test="${tip==1}"><div id="yanzheng" >请输入相关有效信息！</div></c:if>													
							<c:if test="${tip==4}"><div id="yanzheng" >请输入验证码！</div></c:if>
							<c:if test="${userError}"><div id="yanzheng" >用户名或密码错误！</div></c:if>
							<c:if test="${pwdError}"><div id="yanzheng" >用户名或密码错误！</div></c:if>								
						</div>
						<div class="mb2"><input type="submit" value="登录" class="act-but submit" style="color: #FFFFFF" onclick="submit()"></div>
						<div id="wei">
							<a href="register" style="color: white">注册</a>
							<a href="findpassword.jsp" style="color: white">|忘记密码？</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div><!-- /container -->
	<script src="${pageContext.request.contextPath }/loginAndRegister/js/TweenLite.min.js"></script>
	<script src="${pageContext.request.contextPath }/loginAndRegister/js/EasePack.min.js"></script>
	<script src="${pageContext.request.contextPath }/loginAndRegister/js/rAF.js"></script>
	<script src="${pageContext.request.contextPath }/loginAndRegister/js/demo-1.js"></script>
	<script src="${pageContext.request.contextPath }/loginAndRegister/js/LoginAndRegister.js"></script>
</body>

</html>