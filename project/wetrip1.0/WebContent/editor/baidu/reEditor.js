/**
* 从后台获取正文的数据 等待js加载完毕之后进行编辑框的赋值
* @returns
*/
    $(function(){
        window.setTimeout(setCon,100);//一秒后再调用赋值方法
        window.setTimeout(setTopic,100);//一秒后再调用赋值方法
        window.setTimeout(setStatus,100);//一秒后再调用赋值方法
        window.setTimeout(setParentTag,100);//一秒后再调用赋值方法
        window.setTimeout(setchildTag,100);//一秒后再调用赋值方法
//        window.setTimeout(setMap,100);//一秒后再调用赋值方法
    });
//给ueditor插入值
    function setCon(){
    	console.log("加载到了这一步content");
        UM.getEditor('myEditor').setContent($('#testcon').val(),false);
    }
    function setTopic(){
        var topic=$('#getTopicId').val();
        console.log("加载到了这一步topic========="+topic);        
        //之后进行判断
        if(topic!=null){
        	console.log("id这块进来了");
        	document.getElementById("topicId").checked = true;
        }
    }
 //status  根据后台数据进行select的默认值设置
    function setStatus(){  
        var key=$("#statusValue").val();
        //根据值让option选中 
        if(key=="仅自己可见"){
        	document.getElementById("status")[1].selected=true;
        }
   };
 //ParentTag  根据后台数据进行select的默认值设置
    function setParentTag() { 
	   var tagObj=document.getElementById("tagSelect");
	   var objItemText=$("#tagPName").val();
	   console.log("加载到了这一步parentTag"+objItemText);
		for (var i = 0; i < tagObj.options.length; i++) { 
			if (tagObj.options[i].value == objItemText) { 
				tagObj.options[i].selected = true; 
				break; 
				} 
			}
		}; 
//childTag 根据前台接收的p标签的数组
	function setchildTag() { 
		var newtag=$(".tags");
	    var test=newtag.text();
	    console.log(test);
		//初始化已有标签
		var tag1 = new Tag("tagValue");
		tag1.tagValue = test;
		tag1.initView();
		}; 	
////Map给map传值
//	    function setMap(){
//	    	// 百度地图API功能
//			var map = new BMap.Map("allmap");
//			var point = new BMap.Point(116.331398,39.897445);
//			map.centerAndZoom(point,13);
//			// 创建地址解析器实例
//			var myGeo = new BMap.Geocoder();
//			// 将地址解析结果显示在地图上,并调整地图视野
//			var address=$('#cmbprovince').val()
//			console.log(address);
//			myGeo.getPoint(address , function(point){
//				if (point) {
//					map.centerAndZoom(point, 13);
//					map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
//					map.addOverlay(new BMap.Marker(point));
//				}else{
//					alert("您选择地址没有解析到结果!");
//				}
//			}, "北京市");
//	    }