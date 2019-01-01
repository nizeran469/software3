 $(function(){
        window.setTimeout(setmap,100);//一秒后再调用赋值方法
    });
//给ueditor插入值
    function setmap(){
    	// 百度地图API功能
		var map = new BMap.Map("allmap");
		var point = new BMap.Point(116.331398,39.897445);
		map.centerAndZoom(point,13);
		// 创建地址解析器实例
		var myGeo = new BMap.Geocoder();
		// 将地址解析结果显示在地图上,并调整地图视野
		var address=$('#mapAddress').val()
		console.log(address);
		myGeo.getPoint(address , function(point){
			if (point) {
				map.centerAndZoom(point, 13);
				map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
				map.addOverlay(new BMap.Marker(point));
			}else{
				alert("您选择地址没有解析到结果!");
			}
		}, "北京市");
    }
