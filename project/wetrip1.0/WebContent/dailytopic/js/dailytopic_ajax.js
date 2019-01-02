/*------------------------------------------------------------------------------------------------------------
                                                                 鼠标划入划出三个功能按键时所调用的js
 ------------------------------------------------------------------------------------------------------------*/
/*鼠标划入划出收藏链接时调用的js
 * -star_on(obj) 鼠标划上收藏链接时，星星将变为粉色
 * -star_off(obj) 鼠标划出收藏链接时，星星将变为黑色
 * 孙亦璇 - v 0.0.1(2018-12-17 19:18:12)
 */
function star_on(obj){
	$(obj).attr("src","dailytopic/images/star1.png");
}
function star_off(obj){
	$(obj).attr("src","dailytopic/images/star.png");
}
/*鼠标划入划出点赞链接时调用的js
 * -praise_on(obj) 鼠标划上点赞链接时，心将变为粉色
 * -praise_off(obj) 鼠标划出点赞链接时，心将变为黑色
 * 孙亦璇 - v 0.0.1(2018-12-17 19:18:29)
 */
function praise_on(obj){
	$(obj).children().attr("src","dailytopic/images/like2.png");
}
function praise_off(obj){
	$(obj).children().attr("src","dailytopic/images/like.png");
}
/*鼠标划入划出举报链接时调用的js
 * -report_on(obj) 鼠标划上举报链接时，举报标志将变为黄色
 * -report_off(obj) 鼠标划出举报链接时，举报标志将变为黑色
 * 孙亦璇 - v 0.0.1(2018-12-17 19:18:22)
 */
function report_on(obj){
	$(obj).children().attr("src","dailytopic/images/report3.png");
}
function report_off(obj){
	$(obj).children().attr("src","dailytopic/images/report.png");
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
					$(obj).append('<img src="dailytopic/images/star1.png" id="star" width="16" height="16" title="已收藏">'); //添加图片
				}
				/*若用户现未收藏*/
				if(data.status=="uncollected"){
					$(obj).children().remove(); //删除收藏链接下的子元素（图片及收藏字样）
					$(obj).text("收藏("+data.collectNum+")" ); //添加收藏字样
					$(obj).append('<img src="dailytopic/images/star.png" id="star" onmouseover="star_on(this)" onmouseout="star_off(this)" width="16" height="16" title="未收藏">');//添加图片
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
					$(obj).append("<img src='dailytopic/images/like2.png'  width='14px' height='14px'  id='like'>"); //添加点赞连接下的图片
					$(obj).append("点赞(<span class='praise_num'>"+data.praiseNum+"</span>)"); //添加点赞连接下的文字
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
				$(obj).children().attr("src","dailytopic/images/report3.png"); //更改举报的图标
				alert("举报成功"); //提示已举报成功
			}	
	});
}

/*
 * 已举报成功后的一些小彩蛋
 * 一直点击已举报的按钮，最后会跳到404页面
 */
function already_report_col(obj){
	alert("已举报"); 
}
