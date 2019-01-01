	// 百度地图API功能
	var map = new BMap.Map("allmap");    // 创建Map实例
	map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别
	//添加地图类型控件
	map.addControl(new BMap.MapTypeControl({
		mapTypes:[
		BMAP_NORMAL_MAP,
		BMAP_HYBRID_MAP
		]}));

	//一些参数

    var editor = this;

    // 地图的变量存储到这个地方
    editor.mapData = {};
    var mapData = editor.mapData;
    // ---------- 地图事件 ----------
    mapData.markers = [];
 // 创建地址解析器实例
	var myGeo = new BMap.Geocoder();
    var moren=$('#cmbprovince').val();
    myGeo.getPoint(moren , function(point){
		if (point) {
			map.centerAndZoom(point, 11);
			map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
			map.addOverlay(new BMap.Marker(point));
			mapData.markers.push(new BMap.Marker(point));  //加入到数组中
		}else{
			alert("您选择地址没有解析到结果!");
		}
	}, "北京市");
//	map.setCurrentCity(moren);          // 设置地图显示的城市 此项是必须设置的 ************从这接收城市的名字
//	map.enableScrollWheelZoom(true);      //开启鼠标滚轮缩放
	
	//搜索功能
	function G(id) {
			return document.getElementById(id);
		}
	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
		{"input" : "suggestId"
		,"location" : map
	});

	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
	var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
		
		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		G("searchResultPanel").innerHTML = str;
	});

	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
	var _value = e.item.value;
		myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		
		setPlace();
	});

	function setPlace(){
		map.clearOverlays();    //清除地图上所有覆盖物
		if(mapData.markers != []){
	            //同时，清空marker数组
	          	map.removeOverlay(mapData.markers[0]);//这是remove不是clear
	          	mapData.markers = [];
	          }
		function myFun(){
			var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 15);
			lng=pp.lng;//获得经纬度
            lat=pp.lat;
            var marker = new BMap.Marker(new BMap.Point(lng,lat)); 
            console.log(lat);
	        // 清空之后在加上新标的红点 也就是加上图层
	        map.addOverlay(marker);  
	        marker.enableDragging(); //这是使红点能够拖拽
	        mapData.markers.push(marker);  //加入到数组中
	        /**
		    * @Geocoder：地址解析，提供将地址信息转换为坐标点信息的服务。
		    * @addComp.province：省
		    * @addComp.city：市
		    */
		    var geoc = new BMap.Geocoder();    
		    var point = new BMap.Point(lng,lat);

		    geoc.getLocation(point, function(rs){
	    	var addComp = rs.addressComponents;
	    	var s=addComp.province;
	    	s+=addComp.city;
	    	s+=addComp.district;
	    	s+=addComp.street;
	    	s+=addComp.streetNumber;
	    	document.getElementById("cmbprovince").value = s; 
		    });
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
		  onSearchComplete: myFun
		});
		local.search(myValue);
	}
	//鼠标点击，创建位置
	map.addEventListener("click", function(e){
        //这是通过经纬度设置标记
        var marker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat)); 
        //利用全局变量保存经纬度
        lng=e.point.lng;
        lat=e.point.lat;
        /**
        * 在这通过经纬度获得与之匹配的省市并显示在jsp页面上
        */                
        //把地图上的红点去掉
        if(mapData.markers != []){
            //同时，清空marker数组
        	map.removeOverlay(mapData.markers[0]);//这是remove不是clear
          	mapData.markers = [];
          }
        // 清空之后在加上新标的红点 也就是加上图层
        map.addOverlay(marker);  
        marker.enableDragging(); //这是使红点能够拖拽
        mapData.markers.push(marker);  //加入到数组中
        /**
	    * 在点击确定按钮的时候根据经纬度获得那一个点point
	    * @Geocoder：地址解析，提供将地址信息转换为坐标点信息的服务。
	    * @addComp.province：省
	    * @addComp.city：市
	    */
	    var geoc = new BMap.Geocoder();    
	    var point = new BMap.Point(lng,lat);

	    geoc.getLocation(point, function(rs){
    	var addComp = rs.addressComponents;
    	var s=addComp.province;
    	s+=addComp.city;
    	s+=addComp.district;
    	s+=addComp.street;
    	s+=addComp.streetNumber;
    	document.getElementById("cmbprovince").value = s; 
    }); 
}, false);


