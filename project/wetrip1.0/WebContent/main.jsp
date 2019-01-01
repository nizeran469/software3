<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微旅WeTrip</title>
</head>
<body>
<script src="${pageContext.request.contextPath }/index/js/jquery-1.9.1.min.js"></script>
<!-- 用于获取ip地址的接口 -->	
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/javascript">			
	//获取得到当前电脑的ip
	var ip=returnCitySN['cip'];	
	//将ip传到controller里面进行处理。暂时实现的是重定向的方法，可能有些不安全
	window.location.href="indexs?pageNumshort=1&TopicpageNum=1&ip="+ip;
	//post请求实现请求转发
	//$.post('indexs', {pageNumshort:1,TopicpageNum:1,ip:ip  }, function () { console.log("ok"); });	
</script>

</body>

</html>
