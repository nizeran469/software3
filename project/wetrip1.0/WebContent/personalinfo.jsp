<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ch" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
<meta name="author" content="Ansonika">
<title>微旅WeTrip-个人设置</title>
<link href="${pageContext.request.contextPath }/personalinfo/css/css.css" rel="stylesheet" type="text/css" />
<!-- Favicons-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/personalinfo/img/icon.ico" type="image/x-icon">

    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath }/personalinfo/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/personalinfo/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/personalinfo/css/vendors.css" rel="stylesheet">
	<link rel="stylesheet" href="personalinfo/css/cropper.css">
<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath }/personalinfo/js/jquery-2.2.4.min.js"></script>
    <script src="${pageContext.request.contextPath }/personalinfo/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath }/personalinfo/js/main.js"></script>		
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
<script>
function setTab(name,cursel){
	cursel_0=cursel;
	for(var i=1; i<=links_len; i++){
		var menu = document.getElementById(name+i);
		var menudiv = document.getElementById("con_"+name+"_"+i);
		if(i==cursel){
			menu.className="off";
			menudiv.style.display="block";
		}
		else{
			menu.className="";
			menudiv.style.display="none";
		}
	}
}
function Next(){                                                        
	cursel_0++;
	if (cursel_0>links_len)cursel_0=1
	setTab(name_0,cursel_0);
} 
var name_0='one';
var cursel_0=1;
//循环周期，可任意更改（毫秒）
var links_len,iIntervalId;
onload=function(){
	var links = document.getElementById("tab1").getElementsByTagName('li')
	links_len=links.length;
	setTab(name_0,cursel_0);

	
	document.onclick = function fun1(e){
		e = e || window.event;
		var dom =  e.srcElement|| e.target;
		if(dom.id != "User" && document.getElementById("User").style.display == "block") {
			document.getElementById("User").style.display = "none";				
		}
		/*var dom2 =  e.srcElement|| e.target;
			if(dom2.id != "dialog" && document.getElementById("dialog").style.display == "block") {
			document.getElementById("dialog").style.display = "none";
		}*/

	};
}
</script>
<script language="javascript" type="text/javascript">
        //定义 城市 数据数组
        cityArray = new Array(); 
        cityArray[0] = new Array("北京市","东城区|西城区|朝阳区|海淀区|丰台区|石景山区|房山区|通州区|顺义区|大兴区|昌平区|平谷区|怀柔区|门头沟区|密云县|延庆县"); 
        cityArray[1] = new Array("上海市"," 黄浦区|卢湾区|徐汇区|长宁区|静安区|普陀区|闸北区|虹口区|杨浦区|宝山区|闵行区|嘉定区|浦东新区|松江区|金山区|青浦区|南汇区|奉贤区");
        cityArray[2] = new Array("天津市","和平区|河西区|河东区|河北区|南开区|红桥区|东丽区|西青区|北辰区|津南区|塘沽区|大港区|汉沽区"); 
		cityArray[3] = new Array("重庆市","渝中区|大渡口区|江北区|沙坪坝区|九龙坡区|南岸区|北碚区|綦江区|双桥区|渝北区|巴南区|万州区|涪陵区|黔江区|长寿区|江津区|合川区|永川区|南川区");
		cityArray[4] = new Array("河北省","石家庄市|唐山市|秦皇岛市|邯郸市|邢台市|保定市|张家口市|承德市|沧州市|廊坊市|衡水市");
		cityArray[5] = new Array("山西省","太原市|大同市|阳泉市|长治市|晋城市|朔州市|晋中市|运城市|忻州市|临汾市|吕梁市");
		cityArray[6] = new Array("内蒙古","呼和浩特市|包头市|乌海市|赤峰市|通辽市|鄂尔多斯市|呼伦贝尔市|巴彦淖尔市|乌兰察布市|兴安市|锡林郭勒市|阿拉善市");
		cityArray[7] = new Array("辽宁省","沈阳市|大连市|鞍山市|抚顺市|本溪市|丹东市|锦州市|营口市|阜新市|辽阳市|盘锦市|铁岭市|朝阳市|葫芦岛市");
		cityArray[8] = new Array("吉林省","长春市|吉林市|四平市|辽源市|通化市|白山市|松原市|白城市|延边市");
		cityArray[9] = new Array("黑龙江","哈尔滨市|齐齐哈尔市|鸡西市|鹤岗市|双鸭山市|大庆市|伊春市|佳木斯市|七台河市|牡丹江市|黑河市|绥化市|大兴安岭市");
		cityArray[10] = new Array("江苏省","南京市|无锡市|徐州市|常州市|苏州市|南通市|连云港市|淮安市|盐城市|扬州市|镇江市|泰州市|宿迁市");
		cityArray[11] = new Array("浙江省","杭州市|宁波市|温州市|嘉兴市|湖州市|绍兴市|金华市|衢州市|舟山市|台州市|丽水市");
		cityArray[12] = new Array("安徽省","合肥市|芜湖市|蚌埠市|淮南市|马鞍山市|淮北市|铜陵市|安庆市|黄山市|滁州市|阜阳市|宿州市|巢湖市|六安市|亳州市|池州市|宣城市");
		cityArray[13] = new Array("福建省","福州市|厦门市|莆田市|三明市|泉州市|漳州市|南平市|龙岩市|宁德市");
		cityArray[14] = new Array("江西省","南昌市|景德镇市|萍乡市|九江市|新余市|鹰潭市|赣州市|吉安市|宜春市|抚州市|上饶市");
		cityArray[15] = new Array("山东省","济南市|青岛市|淄博市|枣庄市|东营市|烟台市|潍坊市|威海市|济宁市|泰安市|日照市|莱芜市|临沂市|德州市|聊城市|滨州市|菏泽市");
		cityArray[16] = new Array("河南省","郑州市|开封市|洛阳市|平顶山市|安阳市|鹤壁市|新乡市|焦作市|濮阳市|许昌市|漯河市|三门峡市|南阳市|商丘市|信阳市|周口市|驻马店市|济源市");
		cityArray[17] = new Array("湖北省","武汉市|黄石市|襄樊市|十堰市|荆州市|宜昌市|荆门市|鄂州市|孝感市|黄冈市|咸宁市|随州市|恩施市");
		cityArray[18] = new Array("湖南省","长沙市|株洲市|湘潭市|衡阳市|邵阳市|岳阳市|常德市|张家界市|益阳市|郴州市|永州市|怀化市|娄底市|湘西市");
		cityArray[19] = new Array("广东省","广州市|深圳市|珠海市|汕头市|韶关市|佛山市|江门市|湛江市|茂名市|肇庆市|惠州市|梅州市|汕尾市|河源市|阳江市|清远市|东莞市|中山市|潮州市|揭阳市|云浮市");
		cityArray[20] = new Array("广西省","南宁市|柳州市|桂林市|梧州市|北海市|防城港市|钦州市|贵港市|玉林市|百色市|贺州市|河池市|来宾市|崇左市");
		cityArray[21] = new Array("海南省","海口市|三亚市");
		cityArray[22] = new Array("四川省","成都市|自贡市|攀枝花市|泸州市|德阳市|绵阳市|广元市|遂宁市|内江市|乐山市|南充市|宜宾市|广安市|达州市|眉山市|雅安市|巴中市|资阳市|阿坝市|甘孜凉山市");
		cityArray[23] = new Array("贵州省","贵阳市|六盘水市|遵义市|安顺市|铜仁市|毕节市|黔西南市|黔东南市|黔南市");
		cityArray[24] = new Array("陕西省","西安市|铜川市|宝鸡市|咸阳市|渭南市|延安市|汉中市|榆林市|安康市|商洛市");
		cityArray[25] = new Array("甘肃省","兰州市|嘉峪关市|金昌市|白银市|天水市|武威市|张掖市|平凉市");
		cityArray[26] = new Array("云南省","昆明市|大理市|曲靖市|玉溪市|昭通市|楚雄市|红河市|文山市|思茅市|西双版纳市|保山市|德宏市|丽江市|怒江市|迪庆市|临沧市");
		cityArray[27] = new Array("其它","其它");    

        function getCity(currProvince)
        {
            //当前 所选择 的 省
            var currProvince = currProvince;
            var i,j,k;
            //清空 城市 下拉选单
            document.all.selCity.length = 0 ; 
            for (i = 0 ;i <cityArray.length;i++)
              {   
                  //得到 当前省 在 城市数组中的位置
                  if(cityArray[i][0]==currProvince)
                    {   
                        //得到 当前省 所辖制的 地市
                        tmpcityArray = cityArray[i][1].split("|")
                          for(j=0;j<tmpcityArray.length;j++)
                          {
                            //填充 城市 下拉选单
                            document.all.selCity.options[document.all.selCity.length] = new Option(tmpcityArray[j],tmpcityArray[j]); 
                          }
                    } 
              } 
        }
        $(".file").on("change","input[type='file']",function(){
    var filePath=$(this).val();
    if(filePath.indexOf("jpg")!=-1 || filePath.indexOf("png")!=-1){
        $(".fileerrorTip").html("").hide();
        var arr=filePath.split('\\');
        var fileName=arr[arr.length-1];
        $(".showFileName").html(fileName);
    }else{
        $(".showFileName").html("");
        $(".fileerrorTip").html("您未上传文件，或者您上传文件类型有误！").show();
        return false 
    }
})       
//密码框再获得焦点的时候“请填写相关信息”的提示字样消失
function xiaoshi1(){
	document.getElementById("msg1").innerHTML="";
}
function xiaoshi2(){
	document.getElementById("msg2").innerHTML="";
}
//该功能检查用户是否填写email
function checkemail(){
	var name=document.getElementById("email").value;
	if(name==""){
		document.getElementById("msg1").innerHTML="邮箱不能为空，请重新输入！";
	}else{
		document.getElementById("msg1").innerHTML="";
	}
}


//该功能检查前后密码填写是否一致
function checkpassword(){
	var password1=document.getElementById("password1").value;//第一个输入框的密码
	var password2=document.getElementById("password2").value;
	
		if(password2!=password1){
		    document.getElementById("msg2").innerHTML="密码不一致";
		}else{
		    document.getElementById("msg2").innerHTML="";
		}
		if(password1==""&&password2=="")
		document.getElementById("msg2").innerHTML="密码不能为空，请重新输入";			
}

function checkpasswordLen(){
	//第一个密码框的长度
	var l=document.getElementById("password1").value.length;
	if(l<8){
		document.getElementById("msg2").innerHTML="密码最少8个字符";
	}
	if(l>16){
		document.getElementById("msg2").innerHTML="密码最多16个字符";
	}
}
function checkOriginPwdLen(){
	//第一个密码框的长度
	var l=document.getElementById("origin_password").value.length;
	if(l<8){
		document.getElementById("msg2").innerHTML="密码最少8个字符";
	}
	if(l>16){
		document.getElementById("msg2").innerHTML="密码最多16个字符";
	}
}


//划上小人出现一个框
function over(obj){        
		   document.getElementById("User").style.display = "block";
}
/* 负责开启开始上传头像界面的方法
 * 点击后，将从头像展示界面，跳转到头像上传界面
 *
 * 孙亦璇 v0.0.1(2018-12-19 09:25:19)
 */
function start_upload_userhead(){
	upload_div=$("#con_one_3");
	$("#upload_userhead_view").css("display","block");
	$("#default_userhead_view").css("display","none");
}
function change_password(){
	formData = new FormData();
    formData.append("password",$("#origin_password").val());  //formData对象添加文件
    formData.append("password1",$("#password1").val());  //formData对象添加文件
    formData.append("password2",$("#password2").val());  //formData对象添加文件
    //调用ajax，将图片传到后台
    $.ajax({
        type: "POST",
        url: "personalPwd",
        data: formData,
        processData: false,  // 不处理数据
        contentType: false,  // 不设置内容类型
        success: function (data) {       	
        	//上传成功后，对当前界面进行修改
        	if(data.status=="1"){
        		alert("修改密码成功");
            	$("#origin_password").val("");
                $("#password1").val("");
                $("#password2").val("");
        	}
        	if(data.status=="2"){       		        		
        		alert("修改密码失败");
        	}
        	if(data.status=="3"){       		        		
        		alert("原有密码不正确");
        	}
            
        }
    })
	
}

</script>

</head>

<body>
<!--header-->
<div id="page" class="theia-exception">		
	<header class="header menu_fixed">		
		<div id="logo">
			<a href="${pageContext.request.contextPath }/main.jsp">
				<img src="${pageContext.request.contextPath }/personalinfo/img/logo_white.png" width="150" height="36" data-retina="true" alt="" class="logo_normal"/>
				<img src="${pageContext.request.contextPath }/personalinfo/img/logo_black.png" width="150" height="36" data-retina="true" alt="" class="logo_sticky"/>
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
	<!-- /header -->
	
	<main>
		<section class="hero_in restaurants_detail">			
		<div id="leftContent">
		<div class="tab1" id="tab1">
			<div class="menu">
			<ul>
				<li id="one1" onclick="setTab('one',1)">资料更改</li>
				<li id="one2" onclick="setTab('one',2)">密码更改</li>
				<li id="one3" onclick="setTab('one',3)">头像更改</li>
			</ul>
			</div><!--//menu选项卡结束-->
		<div class="menudiv">
			<!-- 资料修改开始 -->
			<div id="con_one_1">
	        <div id="1">  
	       	<form id="form1" name="form1" >
	        <table width="400" border="0" cellpadding="0" cellspacing="0" align="center" >
			  <tr>
				<td width="142" align="right">邮箱：</td>
				<td width="352">${userDetail.email } </td>
			  </tr>
			  <tr>
				<td height="30" align="right">昵称：</td>
				<td><input type="text" size="30" name="username" id="username"value="${userDetail.username }"/></td>
		 	 </tr>
		 	 <tr>
	      		<td height="30" align="right">性别：</td>
				<td height="28" >	
				<c:if test="${userDetail.sex=='男' }">  		    
			      <label><input type="radio" name="sex" value="男" id="RadioGroup1_0" checked="checked"/>男</label>
			      <label><input type="radio" name="sex" value="女" id="RadioGroup1_1" />女</label>
			      <label><input type="radio" name="sex" value="秘密" id="RadioGroup1_2" />秘密</label>
			     </c:if>
			     <c:if test="${userDetail.sex=='女' }">	
			     <label><input type="radio" name="sex" value="男" id="RadioGroup1_0" />男</label>
			      <label><input type="radio" name="sex" value="女" id="RadioGroup1_1" checked="checked"/>女</label>
			     <label><input type="radio" name="sex" value="秘密" id="RadioGroup1_2" />秘密</label>
			      </c:if>	
			      <c:if test="${userDetail.sex=='秘密' }">	
			     <label><input type="radio" name="sex" value="男" id="RadioGroup1_0" />男</label>
			      <label><input type="radio" name="sex" value="女" id="RadioGroup1_1" />女</label>
			     <label><input type="radio" name="sex" value="秘密" id="RadioGroup1_2" checked="checked"/>秘密</label>
			      </c:if>
			      		      
			      <br/>		    
			   </td>
		  	</tr>
		    <tr>
			    <td height="28" align="right">所在地：</td>
				<td>
					<select id="selProvince" name="province" onChange = "getCity(this.options[this.selectedIndex].value)">
						<option value="" >${userDetail.province }</option>
						<option value="北京市" >北京市</option>
						<option value="上海市" >上海市</option>
						<option value="天津市" >天津市</option>
						<option value="重庆市" >重庆市</option>
						<option value="河北省" >河北省</option>
						<option value="内蒙古" >内蒙古</option>
						<option value="吉林省" >吉林省</option>
						<option value="辽宁省" >辽宁省</option>
						<option value="黑龙江" >黑龙江</option>
						<option value="江苏省" >江苏省</option>
						<option value="浙江省" >浙江省</option>
						<option value="安徽省" >安徽省</option>
						<option value="福建省" >福建省</option>
						<option value="江西省" >江西省</option>
						<option value="山东省" >山东省</option>
						<option value="河南省" >河南省</option>
						<option value="湖北省" >湖北省</option>
						<option value="湖南省" >湖南省</option>
						<option value="广东省" >广东省</option>
						<option value="广西省" >广西省</option>
						<option value="海南省" >海南省</option>
						<option value="四川省" >四川省</option>
						<option value="贵州省" >贵州省</option>
						<option value="陕西省" >陕西省</option>
						<option value="甘肃省" >甘肃省</option>
						<option value="云南省" >云南省</option>
						<option value="其它">其它</option>
					</select>
				
					<select id="selCity" name="city">
						<option >${userDetail.city }</option>
					</select>
					</td>
		    </tr>
		    <tr>	
	      	    <td height="30" width="30" >个人说明：</td><td><textarea rows="5" cols="35" name="description" id="description">${userDetail.description }</textarea></td>	             
		    </tr>
	       </table>
	        <div id="bc01"><tr><input type="button" value="保存资料" class="button" id="saveBtn"/></tr></div>
		  </form>
		  </div>       
	      </div><!-- 资料修改结束 -->
	      	<!-- 密码修改开始 -->
			<div id="con_one_2" style="display:none;">
			
		     <div id="1">                         
	          <table width="400" border="0" cellpadding="0" cellspacing="0" align="center" >
		  <tr>
			<td width="142" align="right">初始密码：</td>
			<td width="352"><input type="password" style="width:200;height:40" name="password" value="" size="30" id="origin_password" onfocus="xiaoshi2()"onblur="checkOriginPwdLen()"/></td>
		  </tr>
		  <tr>
	      		<td height="30" align="right" >新密码：</td>
				<td><input type="password" id="password1" name="password1" size="30" onblur="checkpasswordLen()"  onfocus="xiaoshi2()"/></td>
		  </tr>
		  <tr>
	      		<td height="30" align="right">确认密码：</td>
				<td><input type="password" size="30" id="password2" name="password2" onblur="checkpassword()"  onfocus="xiaoshi2()"/></td>
				<div id="msg2" align="center" style="color:red">
				</div>
		  </tr>	 
	      	</table>
	      	</div>
	          <div id="bc02"><tr><input type="button" value="保存密码" class="button" id="password_change" onclick="change_password()"/></tr></div>  
	     
	      </div> <!-- 密码修改结束 -->

      	 
      	<!-- 头像修改开始 -->         
		<div id="con_one_3" style="display:none;">
			<div id="default_userhead_view">
	        	<div id="txgg">
	  			<!--一开始展示用户所拥有的头像 -->
	        		<div id="tx01"><img src="${userDetail.userhead}"/></div>
		        	<div id="wzms">
			        	<span>从电脑中选择你喜欢的图片</span> <br>  
			        	图片格式应为 JPG、JPEG、GIF、PNG、BMP（图片大小不能超过2M）。
				        <div id="tpsc">
				        	<input type="button" value="更改头像" class="button" 
				        			style="width:80px;height:40px;font-size:14px;margin-left:-25px;margin-top:-30px"
				        			onclick="start_upload_userhead()"/>
				        </div>
		        	</div>
		        </div><!-- 头像左右两块 -->
	        </div>
	        <div id="upload_userhead_view">
				 <div id='userhead_body'>
					<div class='userhead_container' style="padding:0px;margin-top:-1px;">  
					    <img src='' alt='' id='container_img'>
					</div>
				 	<div class='userhead_preview' style="padding:0px;margin-top:-1px;"> 
				     	<img src='' alt='' id='preview_img'>
				    </div>
				 </div>
				 <a href="javascript:;" class="file">
				 <input type="file"  name="upfile" id="userhead" accept="image/*">选择图片
				 </a>
				  <button class='button'>保存头像</button>
			</div>
        </div><!-- 头像修改结束 -->
		
	</div>
	</div>
	</div><!-- 左边结束 -->
	<div id="rightContent">
		<div class="sidebar-box bg-box about-me" >
					<h6 class="sidebar-title">关于我</h6>
					<div style="text-align:center;"><img src="${userDetail.userhead}" alt=""  id="tx02"/></div>									
					<h5>
					<span id="newname">${userDetail.username}</span>
					<c:if test="${userDetail.sex=='男' }">
					<img src="${pageContext.request.contextPath }/personalinfo/img/icons8-男-16.png" id="newsex"/>
					</c:if>
					<c:if test="${userDetail.sex=='女' }">
					<img src="${pageContext.request.contextPath }/personalinfo/img/icons8-女-16.png" id="newsex"/>
					</c:if>	
					<img  id="newsex"/>				
					</h5>					
					<h6><span id="newcity">${userDetail.city }</span></h6>
					<p id="newdesp">${userDetail.description }</p>					
		</div> <!-- /.about-me -->
	</div>
		</section>
		<!--/hero_in-->				
	</main><!--/main-->
	<!--footer-->
	<footer class="theme-footer">
		<div class="container">
			<div class="logo"><a href="main.jsp"><img src="${pageContext.request.contextPath }/personalinfo/img/footer130.png" alt=""/></a></div>		
			<p class="copyright">Copyright &copy; 2018.微旅wetrip项目组 All rights reserved.</p>
		</div> <!-- /.container -->
	</footer> <!-- /.theme-footer -->
	<!--/footer-->
	<!-- page -->	
<!-- 裁切图片用的js -->
<script src="personalinfo/js/cropper.js"></script> 
<!-- 头像上传界面调用的js，用于调用cropper.js和进行ajax的上传
	 孙亦璇 v0.0.1(2018-12-19 09:28:03) -->
<script src="personalinfo/js/userhead_uploader.js"></script>
<!-- 资料修改 -->
<script>
$('#saveBtn').click(function () {
	var username = document.getElementById('username').value; 
	console.log(username);
	var sex = $('input[name="sex"]:checked').val(); 
	console.log(sex);
	var province = document.getElementById('selProvince').value; 
	console.log(province);
	var city = document.getElementById('selCity').value; 
	console.log(city);
	var description = document.getElementById('description').value; 
	console.log(description);		    
    //调用ajax，将数据传到后台
    $.ajax({
        type: "POST",
        url: "personalDetail?username="+username+"&sex="+sex+"&province="+province+"&city="+city+"&description="+description,              
        success: function (data) {
        	//上传成功后，对当前界面进行修改
            alert("修改成功");  
            $("#newname").text(username);
            $("#newcity").text(city);
            $("#newdesp").text(description);
            if(sex=='男')
            {
            	$("#newsex").attr("src","${pageContext.request.contextPath }/personalinfo/img/icons8-男-16.png")
            }
            if(sex=='女')
            {
            	$("#newsex").attr("src","${pageContext.request.contextPath }/personalinfo/img/icons8-女-16.png")
            }
            
            
        }
    })
})
</script>

</body>

</html>
