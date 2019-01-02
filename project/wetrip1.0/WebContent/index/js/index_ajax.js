/*
 * 控制翻页箭头颜色的js们
 * -arrow_color_blue_left(obj) 鼠标移入今日话题页的左箭头时，箭头变为蓝色
 * -arrow_color_blue_right(obj) 鼠标移入今日话题页的右箭头时，箭头变为蓝色
 * -arrow_color_green_left(obj) 鼠标移入说说页的左箭头时，箭头变为绿色
 * -arrow_color_green_right(obj) 鼠标移入说说页的右箭头时，箭头变为绿色
 * -arrow_color_away_left(obj) 鼠标移出左箭头时，箭头变为黑色
 * -arrow_color_away_right(obj) 鼠标移出右箭头时，箭头变为黑色
 * 孙亦璇 - v 0.0.1(2018-12-17 19:03:40)
 */
function arrow_color_blue_left(obj){
	$(obj).attr("src","index/img/left2.png")
}
function arrow_color_blue_right(obj){
	$(obj).attr("src","index/img/right2.png")
}
function arrow_color_green_left(obj){
	$(obj).attr("src","index/img/left3.png")
}
function arrow_color_green_right(obj){
	$(obj).attr("src","index/img/right3.png")
}
function arrow_color_away_left(obj){
	$(obj).attr("src","index/img/left.png")
}
function arrow_color_away_right(obj){
	$(obj).attr("src","index/img/right.png")
}
/*------------------------------------------------------------------------------------------------------------
                                                                 鼠标划入划出三个功能按键时所调用的js
 ------------------------------------------------------------------------------------------------------------*/
/*鼠标划入划出收藏链接时调用的js
 * -star_on(obj) 鼠标划上收藏链接时，星星将变为粉色
 * -star_off(obj) 鼠标划出收藏链接时，星星将变为黑色
 * 孙亦璇 - v 0.0.1(2018-12-17 19:18:12)
 */
function star_on(obj){
	$(obj).attr("src","index/img/star1.png");
}
function star_off(obj){
	$(obj).attr("src","index/img/star.png");
}
/*鼠标划入划出点赞链接时调用的js
 * -praise_on(obj) 鼠标划上点赞链接时，心将变为粉色
 * -praise_off(obj) 鼠标划出点赞链接时，心将变为黑色
 * 孙亦璇 - v 0.0.1(2018-12-17 19:18:29)
 */
function praise_on(obj){
	$(obj).children().attr("src","index/img/like2.png");
}
function praise_off(obj){
	$(obj).children().attr("src","index/img/like.png");
}
/*鼠标划入划出举报链接时调用的js
 * -report_on(obj) 鼠标划上举报链接时，举报标志将变为黄色
 * -report_off(obj) 鼠标划出举报链接时，举报标志将变为黑色
 * 孙亦璇 - v 0.0.1(2018-12-17 19:18:22)
 */
function report_on(obj){
	$(obj).children().attr("src","index/img/report3.png");
}
function report_off(obj){
	$(obj).children().attr("src","index/img/report2.png");
}

/*------------------------------------------------------------------------------------------------------------
                                                           鼠标点击三个功能按键时所调用的js(用了ajax)
------------------------------------------------------------------------------------------------------------*/

/*
 * 点击收藏按钮的时候，对文章进行收藏或取消收藏操作的ajax的方法
 *
 * 若文章已收藏，点击后会取消收藏
 * 若文章未收藏，则点击后会加入收藏
 *
 * 并在数据返回后，更改对应位置的收藏数和收藏标志的状态
 *
 * 参数:
 *	-travelNoteId 游记的id，将传给后台，用于后台操作	
 *  -obj 触发点击事件的对象
 *
 * 后台服务器地址:
	 changeCollectStatus
     包:com.asay.wetrip.collect.controller
	 
 * 返回值
   -error 用户未登录
    -success 用户已登录，且:
     	-collected 该文章现被该用户收藏
     	-uncollected 该文章现未被该用户收藏
 *    	
 * 孙亦璇 - v 0.0.1(2018-12-13 08:55:32)
 */
function collected_col(travelNoteId,obj){
	$.ajax({
		url:"changeCollectStatus?travelNoteId="+travelNoteId,
		type: "GET",
		dataType:"json",
		error(){
			/*返回无效的json时，即用户没有登录，出现弹框提示*/
			alert("登陆后才能收藏哟~");
			},
		success(data){	
				/*
				 * 用户已登录，并成功的更改了收藏的状态后
				 * -data.status  返回后台操作的状态
				 *       -collected 状态变为已收藏
			     *		 -uncollected 状态变为未收藏
			     * -data.collectNum 返回目前的收藏数量
			     * -data.travelNoteId 返回目前游记的id
				 */
				$(obj).attr("onclick","collected_col("+data.travelNoteId+",this)");
				/*若用户现已收藏*/
				if(data.status=="collected"){ 
					$(obj).children().remove(); //删除收藏链接下的子元素（图片及收藏字样）
					$(obj).text("收藏("+data.collectNum+")"); //添加收藏字样
					$(obj).append('<img src="index/img/star1.png" class="star" width="13" height="13" title="已收藏">'); //添加图片
				}
				/*若用户现未收藏*/
				if(data.status=="uncollected"){
					$(obj).children().remove(); //删除收藏链接下的子元素（图片及收藏字样）
					$(obj).text("收藏("+data.collectNum+")" ); //添加收藏字样
					$(obj).append('<img src="index/img/star.png" class="star" onmouseover="star_on(this)" onmouseout="star_off(this)" width="13" height="13" title="未收藏">');//添加图片
				}
			}	
	});
}
/*
 * 点击长文章部分的收藏按钮的时候，对长文章进行收藏操作的ajax的方法
 *
 * 若未收藏，则将文章变为收藏状态
 * 若已收藏，则将文章变为未收藏状态
 
 * 并在数据返回后，更改对应位置的收藏数和收藏标志的状态
 *
 * 参数:
 *	-travelNoteId 游记的id，将传给后台，用于后台操作	
 *  -obj 触发点击事件的对象
 *
 * 后台服务器地址:
	 changeCollectStatus
     包:com.asay.wetrip.collect.controller
	 
 * 返回值
   -error 用户未登录
    -success 用户已登录，且:
     	-collected 该文章现被该用户收藏
     	-uncollected 该文章现未被该用户收藏
 *    	
 * 孙亦璇 - v 0.0.1(2018-12-17 19:46:33)
 */
function long_collected_col(travelNoteId,obj){
	$.ajax({
		/*传到后台服务器的地址
		 *其中travelNoteId是必须的*/
		url:"changeCollectStatus?travelNoteId="+travelNoteId,
		type: "GET",
		dataType:"json",
		error(){
			/*返回无效的json时，即用户没有登录，出现弹框提示*/
			alert("登陆后才能收藏哟~");
			},
		success(data){	
				if(data.status=="collected"){ 
					$(obj).children().attr("src","index/img/star4.png"); //已收藏，将图片改为已收藏状态
				}
				if(data.status=="uncollected"){
					$(obj).children().attr("src","index/img/star3.png"); //未收藏，将图片改为未收藏状态
				}
			}	
	});
}
/*
 * 点击点赞按钮的时候，对文章进行点赞操作的ajax的方法
 *
 * 点赞之后，点赞按钮即变成不可点击的状态（再次刷新网页之后可以点赞），并更新点赞数
 *
 *
 * 参数:
 *	-travelNoteId 游记的id，将传给后台，用于后台操作	
 *  -obj 触发点击事件的对象
 *
 * 后台服务器地址:
	 executePraise
     包:com.asay.wetrip.praise.controller
	 
 * 返回值
   -error 用户未登录
    -success 用户已登录，且:
     	-praiseNum 该文章现被点赞的数量
 *    	
 * 孙亦璇 - v 0.0.1(2018-12-17 19:33:17)
 */
 function praise_col(travelNoteId,obj){
		$.ajax({
			/*传到后台服务器的地址
			 *其中travelNoteId是必须的*/
			url:"executePraise?travelNoteId="+travelNoteId,
			type: "GET",
			dataType:"json",
			error(){
				/*返回无效的json时，即用户没有登录，出现弹框提示*/
				alert("登陆后才能点赞啊RUA!");
				},
			success(data){	
					/*
					 * 用户已登录
					 * -data.praiseNum  返回点赞的数量
					 */
					$(obj).attr("onclick","already_praise_col()"); //更改链接的onclick事件，变为触发已点赞后的事件
					$(obj).attr("onmouseover",""); //清除鼠标的移入效果
					$(obj).attr("onmouseout",""); //清除鼠标的移出效果
					$(obj).children().remove();  //移出子元素
					$(obj).text(""); //清空点赞连接下的值
					$(obj).append("<img src='index/img/like2.png'>"); //添加点赞连接下的图片
					$(obj).append("点赞(<span class='praise_num'>"+data.praiseNum+"</span>)"); //添加点赞连接下的文字
				}	
		});
	}
 
 /*
  * 点击长文章部分的点赞按钮的时候，对长文章进行点赞操作的ajax的方法
  *
  * 点赞之后，点赞按钮即变成不可点击的状态（再次刷新网页之后可以点赞）
  *
  * 参数:
  *	-travelNoteId 游记的id，将传给后台，用于后台操作	
  *  -obj 触发点击事件的对象
  *
  * 后台服务器地址:
	  executePraise
      包:com.asay.wetrip.praise.controller
 	 
  * 返回值
    -error 用户未登录
     -success 用户已登录，且:
      	-praiseNum 该文章现被点赞的数量
  *    	
  * 孙亦璇 - v 0.0.1(2018-12-17 19:39:06)
  */
function long_praise_col(travelNoteId,obj){
	$.ajax({
		/*传到后台服务器的地址
		 *其中travelNoteId是必须的*/
		url:"executePraise?travelNoteId="+travelNoteId,
		type: "GET",
		dataType:"json",
		error(){
			/*返回无效的json时，即用户没有登录，出现弹框提示*/
			alert("登陆后才能点赞啊RUA!");
			},
		success(data){	
				/*
				 * 用户已登录，并成功的更改了收藏的状态后
				 * -data.praiseNum  返回点赞的数量
				 */
				$(obj).attr("onclick","already_praise_col()"); //更改图片的onclick事件，变为触发已点赞后的事件
				$(obj).append("<img src='index/img/like4.png'>");//更改图片
			}	
	});
}
 /*
 * 用于对已经点赞的文章再次点击点赞时候的提示
 * 孙亦璇 - v 0.0.1(2018-12-17 19:40:44)
 */
function already_praise_col(){
	alert("你已经点赞过了啊=-=");
}
 
/*
 * 点击举报按钮的时候，对文章进行举报操作的ajax的方法
 *
 * 举报之后，举报按钮即变成不可点击的状态（再次刷新网页之后可以举报
 *
 * 参数:
 *	-travelNoteId 游记的id，将传给后台，用于后台操作	
 *  -obj 触发点击事件的对象
 *
 * 后台服务器地址:
	 executeReport
     包:com.asay.wetrip.report.controller
	 
 * 返回值
   -error 用户未登录
    -success 用户已登录，且举报成功
 *    	
 * 孙亦璇 - v 0.0.1(2018-12-17 19:44:31)
 */
function report_col(travelNoteId,obj){
	$.ajax({
		/*传到后台服务器的地址
		 *其中travelNoteId是必须的*/
		url:"executePraise?travelNoteId="+travelNoteId,
		type: "GET",
		dataType:"json",
		error(){
			/*返回无效的json时，即用户没有登录，出现弹框提示*/
			alert("乖，登录去");
			},
		success(data){	
				/*
				 * 用户已登录，并成功的举报了之后
				 */
				$(obj).attr("onclick","already_report_col(this)");//更改链接的onclick事件，变为触发已举报后的事件
				$(obj).attr("onmouseover","");//清空链接的划入效果
				$(obj).attr("onmouseout","");//清空链接的划出效果
				$(obj).children().attr("src","index/img/report3.png"); //更改举报的图标
				alert("举报成功"); //提示已举报成功
			}	
	});
}

/*
 * 已举报成功后的一些小彩蛋
 * 一直点击已举报的按钮，最后会跳到404页面
 */
function already_report_col(obj){
	$(obj).attr("onclick","already_report_col1(this)");
	alert("已举……你干啥？？？"); 
}
function already_report_col1(obj){
	$(obj).attr("onclick","already_report_col2(this)");
	alert("……别点了");
}
function already_report_col2(obj){
	$(obj).attr("onclick","already_report_col3(this)");
	alert("说辣别点辣！没东西辣！");
}
function already_report_col3(obj){
	$(obj).attr("onclick","already_report_col4(this)");
	alert("蛤？上瘾了");
}
function already_report_col4(obj){
	$(obj).attr("onclick","already_report_col5(this)");
	alert(":)我报警了哦？？？");
}
function already_report_col5(obj){
	$(obj).attr("onclick","already_report_col6(this)");
	alert("……别点了，我生气了！！");
}
function already_report_col6(obj){
	$(obj).attr("onclick","already_report_col7(this)");
	alert("真我生气了！！！");
}
function already_report_col7(obj){
	$(obj).attr("onclick","already_report_col8(this)");
	alert("你再点你就完了=A=");
}
function already_report_col8(obj){
	$(obj).attr("onclick","already_report_col9(this)");
	alert("……");
}
function already_report_col9(obj){
	$(obj).attr("onclick","already_report_col10(this)");
	alert("…………");
}
function already_report_col10(obj){
	$(obj).attr("onclick","already_report_col11(this)");
	alert("……………………");
}
function already_report_col11(obj){
	$(obj).attr("onclick","already_report_col12(this)");
	alert("别点了。");
}
function already_report_col12(obj){
	$(obj).attr("onclick","already_report_col13(this)");
	alert("凑");
}
function already_report_col13(obj){
	alert(":)再见");
	window.location.href="404.html";
}

/*------------------------------------------------------------------------------------------------------------
							鼠标点击翻页后，为进行翻页所调用的js(用了ajax)
------------------------------------------------------------------------------------------------------------*/
 /* 今日话题处翻页的效果
  * 在点击翻页后，先对翻页的图标进行设置
  * 若此时为第一页或最后一页，则先把对应的箭头的颜色设置为灰色
  *
  * 之后调用的ajax，更新新的一页今日话题部分的数据
  * 后台服务器地址 : indextopic
  	   包:com.asay.wetrip.index.controller
  *
  * 参数：
  *	-topic_page 游记翻动的页数，值为-1或1，即向前翻动一页或向后翻动一页	
  *  -count  目前游记的总页数，用于判断第一页和最后一页
  *  -obj 发生点击事件的当前对象
  * 孙亦璇 - v 0.0.2(2018-12-17 19:50:03)
  */
var default_topic_page=1;
function topic_page_col(topic_page,count,obj){

	/*点击一侧箭头时，更改另一侧的效果*/
	if(topic_page<0){ //点击左箭头时，先复原右箭头的效果
    		$(obj).next().attr("src","index/img/right.png");
	    	$(obj).next().attr("onmouseover","arrow_color_blue_right(this)");
	    	$(obj).next().attr("onmouseout","arrow_color_away_right(this)");
	    	$(obj).next().attr("onclick","topic_page_col(1,"+count+",this)");
    	}else{ ////点击右箭头时，先复左箭头的效果
    		console.log($(obj).prev()); 
    		$(obj).prev().attr("src","index/img/left.png");
	    	$(obj).prev().attr("onmouseover","arrow_color_blue_left(this)");
	    	$(obj).prev().attr("onmouseout","arrow_color_away_left(this)");
	    	$(obj).prev().attr("onclick","topic_page_col(-1,"+count+",this)");
    	}
    /*若页面为第一页，则将左箭头置位灰色，并清空效果*/
    if(default_topic_page+topic_page==1){
    	$(obj).attr("src","index/img/left4.png");
    	$(obj).attr("onmouseover","");
    	$(obj).attr("onmouseout","");
    	$(obj).attr("onclick","");
    }
    /*若页面为最后一页，则将右箭头置位灰色，并清空效果*/
    if(default_topic_page+topic_page==count){
    	$(obj).attr("src","index/img/right4.png");
    	$(obj).attr("onmouseover","");
    	$(obj).attr("onmouseout","");
    	$(obj).attr("onclick","");
    }
    /*下面开始调用ajax*/
    if(default_topic_page+topic_page>0&&default_topic_page+topic_page<=count){
		default_topic_page=default_topic_page+topic_page;
	}
	$.ajax({
		url:"indextopic?pagenum="+default_topic_page,
		type: "GET",
		dataType:"json",
		error(XMLHttpRequest, textStatus, errorThrown){
			console.log(XMLHttpRequest);
			console.log(textStatus);
			console.log(errorThrown);
			},
		success(data){
				//获取了json成功后的提示，打印了传来的json
				console.log(data);
				//修改头像
				$("#topic_userhead").attr("src",data.userhead);
				$("#topic_userhead").parent().attr("href","zone?zonePageNum=1&collectPageNum=1&username="+data.username+"&correctDate=20");
				//修改用户名字
				$("#topic_user_name").text(data.username);
				$("#topic_user_name").attr("href","zone?zonePageNum=1&collectPageNum=1&username="+data.username+"&correctDate=20");
				//修改时间
				$("#topic_publish_time").text(data.publishtime);
				//修改正文
				$("#topic_content").text(data.content);
				//修改图片
				var imgs =data.imgs;
				$("#topic_imgs").children().remove(); //先把之前的清空
				for(var j = 0,len = imgs.length; j < len; j++){ //追加新的
					$("#topic_imgs").append("<img src="+imgs[j]+">")
				}
				//修改评论数
				$("#topic_comment_num").text(data.commentNum);
				//修改点赞数
				$(".praise_num").eq(0).text(data.praiseCount);
				//修改收藏数
				//$("#topic_collect_num").text(data.collectNum);
				//三个功能键的超链接还没改
				var travelNoteId =data.travelNoteId;
				$("#topic_comment").attr("href","detail?travelid="+travelNoteId); //评论
				//点赞的效果恢复初始值
				$("#topic_praise").children().attr("src","index/img/like.png");
				$("#topic_praise").attr("onmouseover","praise_on(this)");
				$("#topic_praise").attr("onmouseout","praise_off(this)");
				$("#topic_praise").attr("onclick","praise_col("+travelNoteId+",this)"); 
				//调整收藏的效果
				$("#topic_collect").attr("onclick","collected_col("+travelNoteId+",this)");
				if(data.collected){ 
					$("#topic_collect").children().remove();
					$("#topic_collect").text("收藏("+data.collectNum+")");
					$("#topic_collect").append('<img src="index/img/star1.png" class="star" width="13" height="13" title="已收藏">');
				}
				else{
					$("#topic_collect").children().remove();
					$("#topic_collect").text("收藏("+data.collectNum+")" );//收藏
					$("#topic_collect").append('<img src="index/img/star.png" class="star" onmouseover="star_on(this)" onmouseout="star_off(this)" width="13" height="13" title="未收藏">');
				}
				//举报的效果恢复了初始值
				$("#topic_report").children().attr("src","index/img/report2.png");
				$("#topic_report").attr("onmouseover","report_on(this)");
				$("#topic_report").attr("onmouseout","report_off(this)");
				$("#topic_report").attr("onclick","report_col("+travelNoteId+",this)"); 
			} 
	});
}


/* 说说处翻页的效果
 * 在点击翻页后，先对翻页的图标进行设置
 * 若此时为第一页或最后一页，则先把对应的箭头的颜色设置为灰色
 *
 * 之后调用的ajax，更新新的一页今日话题部分的数据
 * 后台服务器地址 : indextopic
 	   包:com.asay.wetrip.index.controller
 *
 * 参数：
 *	-topic_page 游记翻动的页数，值为-1或1，即向前翻动一页或向后翻动一页	
 *  -count  目前游记的总页数，用于判断第一页和最后一页
 *  -obj 发生点击事件的当前对象
 * 孙亦璇 - v 0.0.2(2018-12-17 19:56:29)
 */
var default_short_page=1;
function short_page_col(short_page,count,city,obj){
	/*点击左右箭头时，先恢复另一边箭头的效果*/
	if(short_page<0){ //往左点，复原右边的效果
	$(obj).prev().attr("src","index/img/right.png");
	$(obj).prev().attr("onmouseover","arrow_color_green_right(this)");
	$(obj).prev().attr("onmouseout","arrow_color_away_right(this)");
	$(obj).prev().attr("onclick","short_page_col(1,"+count+",'"+city+"',this)");
	}else{ //点了右边的箭头
	    console.log($(obj).next());
	    $(obj).next().attr("src","index/img/left.png");
		$(obj).next().attr("onmouseover","arrow_color_green_left(this)");
		$(obj).next().attr("onmouseout","arrow_color_away_left(this)");
		$(obj).next().attr("onclick","short_page_col(-1,"+count+",'"+city+"',this)");
	    }
	 /*判断箭头是否移到了尽头*/
	 /*若箭头移到了第一个，则把第一个箭头变为灰色，清除效果*/
	if(default_short_page+short_page==1){
		$(obj).attr("src","index/img/left4.png");
		$(obj).attr("onmouseover","");
		$(obj).attr("onmouseout","");
		$(obj).attr("onclick","");
	}
	/*若箭头移到了最后一个，则把最后一个箭头变为灰色，清除效果*/
	if(default_short_page+short_page==count){
		$(obj).attr("src","index/img/right4.png");
		$(obj).attr("onmouseover","");
		$(obj).attr("onmouseout","");
		$(obj).attr("onclick","");
	}
	/*下面开始调用ajax*/
	if(default_short_page+short_page>0&&default_short_page+short_page<=count){
		default_short_page=default_short_page+short_page;
	}
	$.ajax({
		url:"indexshort?pagenum="+default_short_page+"&city="+city,
		type: "GET",
		dataType:"json",
		error(XMLHttpRequest, textStatus, errorThrown){
			console.log(XMLHttpRequest);
			console.log(textStatus);
			console.log(errorThrown);
		},
		success(data){
			//获取了json成功后的提示，打印了传来的json
			console.log(data);
			//修改头像
			$("#short_userhead").attr("src",data.userhead);
			$("#short_userhead").parent().attr("href","zone?zonePageNum=1&collectPageNum=1&username="+data.username+"&correctDate=20");
			//修改用户名字
			$("#short_user_name").text(data.username);
			$("#short_user_name").attr("href","zone?zonePageNum=1&collectPageNum=1&username="+data.username+"&correctDate=20");
			//修改时间
			$("#short_publish_time").text(data.publishtime);
			//修改正文
			$("#short_content").text(data.content);
			//修改图片
			var imgs =data.imgs;
			$("#short_imgs").children().remove(); //先把之前的清空
			for(var j = 0,len = imgs.length; j < len; j++){ //追加新的
				$("#short_imgs").append("<img src="+imgs[j]+">");
			}
			//修改标签
			$("#short_tag").text(data.travelNoteTag);
			//修改评论数
			$("#short_comment_num").text(data.commentNum);
			//修改点赞数
			$(".praise_num").eq(1).text(data.praiseCount);
			//修改收藏数
			//$("#short_collect_num").text(data.collectNum);
			//三个功能键的超链接还没改
			var travelNoteId =data.travelNoteId;
			$("#short_comment").attr("href","detail?travelid="+travelNoteId); //评论
			//点赞的效果恢复初始值
			$("#short_praise").children().attr("src","index/img/like.png");
			$("#short_praise").attr("onmouseover","praise_on(this)");
			$("#short_praise").attr("onmouseout","praise_off(this)");
			$("#short_praise").attr("onclick","praise_col("+travelNoteId+",this)"); //点赞
			$("#short_collect").attr("onclick","collected_col("+travelNoteId+",this)");
			if(data.collected){ 
				$("#short_collect").children().remove();
				$("#short_collect").text("收藏("+data.collectNum+")");
				$("#short_collect").append('<img src="index/img/star1.png" class="star" width="13" height="13" title="已收藏">');
			}else{
				$("#short_collect").children().remove();
				$("#short_collect").text("收藏("+data.collectNum+")" );//收藏
				$("#short_collect").append('<img src="index/img/star.png" class="star" onmouseover="star_on(this)" onmouseout="star_off(this)" width="13" height="13" title="未收藏">');
			}
			//举报的效果恢复了初始值
			$("#short_report").children().attr("src","index/img/report2.png");
			$("#short_report").attr("onmouseover","report_on(this)");
			$("#short_report").attr("onmouseout","report_off(this)");
			$("#short_report").attr("onclick","report_col("+travelNoteId+",this)"); //举报
		} 			
	});		
}