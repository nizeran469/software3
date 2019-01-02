//全局定义验证码
var code; //在全局 定义验证码
function createCode()
{ //创建验证码函数
 code = "";
 var codeLength =4;//验证码的长度
 var selectChar = new Array(0,1,2,3,4,5,6,7,8,9);
 //这个也可以加上,'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
 //所有候选组成验证码的字符，当然也可以用中文的
 for(var i=0;i<codeLength;i++)
 { 
 var charIndex =Math.floor(Math.random()*10);
 code +=selectChar[charIndex]; 
 }
// 设置验证码的显示样式，并显示
 document.getElementById("discode").style.fontFamily="Fixedsys"; //设置字体
 document.getElementById("discode").style.letterSpacing="12px"; //字体间距
 document.getElementById("discode").style.color="#0ab000"; //字体颜色
 document.getElementById("discode").style.size="20px"; //字体大小
 document.getElementById("discode").innerHTML=code; // 显示
}
function but(){//验证验证码输入是否正确
 	var val1=document.getElementById("text1").value;
    var val2=code;
 	if(val1==val2){//住处判断之后的变化
 		document.getElementById("searchMsg").className="yan";
 		document.getElementById("searchMsg").style.display = "block"; 
  	}else{
  		document.getElementById("searchMsg").className="yan1";
  		document.getElementById("searchMsg").style.display = "block";  		  		   		
  	}
}

function xiaoshi3(){
	document.getElementById("searchMsg").style.display = "none"; 
}

/**
 * 关于密码的js
 * @returns
 */
//检查密码是否填写
function checkPassword(){
	var name=document.getElementById("logPass").value;
	var l=document.getElementById("logPass").value.length;
	if(name==""){
		document.getElementById("pas").innerHTML="请填写相关信息";
	}else{
		if(l<8){
			document.getElementById("pas").innerHTML="密码最少为8个字符";
		}
		if(l>16){
			document.getElementById("pas").innerHTML="密码最多为16个字符";
		}
		else{
			document.getElementById("pas").innerHTML="";
		}
	}	
}
//按键事件看邮箱的字符串的个数是否超过了最大的
function rangePassword(){
	var l=document.getElementById("logPass").value.length;
	if(l>14){
		document.getElementById("pas").innerHTML="密码最多16个字符";
	}else{
		document.getElementById("pas").innerHTML="";
	}	
}
//密码框再获得焦点的时候“请填写相关信息”的提示字样消失
function xiaoshiPassword(){
	document.getElementById("pas").innerHTML="";
	document.getElementById("password").innerHTML="";
}
/**
 * 邮箱的js
 * @returns
 */


//该功能检查用户是否填写email
function checkEmail(){
	var name=document.getElementById("userEmail").value;
	var l=document.getElementById("userEmail").value.length;
	if(name==""){
		document.getElementById("email").innerHTML="请填写相关信息";
	}else{
		if(l<10){
			document.getElementById("email").innerHTML="邮箱格式最少10个字符";
		}
		if(l>28){
			document.getElementById("email").innerHTML="邮箱格式最多30个字符";
			}
		else{
			document.getElementById("email").innerHTML="";
		}
	}	
}
//按键事件看邮箱的字符串的个数是否超过了最大的
function rangeEmail(){
	var l=document.getElementById("userEmail").value.length;
	if(l>28){
		document.getElementById("email").innerHTML="邮箱格式最多30个字符";
	}else{
		document.getElementById("email").innerHTML="";
	}	
}
//email再获得焦点的时候“请填写相关信息”的提示字样消失
function xiaoshiEmail(){
	document.getElementById("email").innerHTML="";
	document.getElementById("email2").innerHTML="";

}
function xiaoshiCode(){	
	document.getElementById("yanzheng").innerHTML="";	
}

//该功能检查前后密码填写是否一致
function checkpassword(){
	var password1=document.getElementById("logPass").value;//第一个输入框的密码
	var password=document.getElementById("logPass2").value;
		if(password!=password1){
		    document.getElementById("pas2").innerHTML="密码不一致";		    
		}else{
		    document.getElementById("pas2").innerHTML="";
		}
}
function xiaoshi1(){
	document.getElementById("pas2").innerHTML="";
	document.getElementById("password").innerHTML="";
}

//改变验证码事件
         function changeImg(){
             var img = document.getElementById('yanzhengimg');
             img.src = "${pageContext.request.contextPath }/createCode?x=" + Math.floor(Math.random()*100)
         }
         
         //提交验证并验证验证码
         function submit(){
             var input = document.getElementById('text1');
             
         //ajax提交
            var xhr = new XMLHttpRequest();
             
             xhr.onreadystatechange = function(){
                 if(xhr.readyState == 4 && xhr.status == 200) { 
                	 //alert(xhr.responseText);
                	 if(xhr.responseText){
                	 		document.getElementById("searchMsg").className="yan";
                	 		document.getElementById("searchMsg").style.display = "block"; 
                	  	}else{
                	  		document.getElementById("searchMsg").className="yan1";
                	  		document.getElementById("searchMsg").style.display = "block";  		  		   		
                	  	}
                 }  
             }
             
             xhr.open('get','${pageContext.request.contextPath }/verifyCode?code=' + input.value);
             xhr.send(null);             
         }