        /*
         * 用于初始化cropper的方法
         * 在页面初始时就会被调用
         * 孙亦璇 v0.0.1(2018-12-19 09:29:17)
         * */
		var image = document.getElementById('container_img'); 
        console.log(image);
        var cropper = new Cropper(image, {
            movable: false,  
            zoomable: false,
            rotatable: false,
            scalable: false,
            aspectRatio: 1,
            viewMode: 1,
            background:true,  //是否显示网格背景
            zoomable: true,   //是否允许放大图像
            guides: true,   //是否显示裁剪框虚线
            crop: function (event) { //剪裁框发生变化执行的函数。
                canvas = cropper.getCroppedCanvas({  //使用canvas绘制一个宽和高200的图片
                    width: 200,
                    height: 200,
                });
                $('#preview_img').attr("src", canvas.toDataURL("image/png", 0.3))  //使用canvas toDataURL方法把图片转换为base64格式
            }
          });
        
        /*
         * 当点击上传图片时，会调用的方法
         * 孙亦璇 v0.0.1(2018-12-19 09:30:03)*/
        $('#userhead').change(function(e){
            var file;
            var files = e.target.files; //接收获得了的文件
             if (files && files.length > 0) {
                file = URL.createObjectURL(files[0]);
                //验证图片格式  
	            if (!/\.(gif|jpg|jpeg|png|GIF|JPG|JPEG|PNG|bmp|BMP)$/.test(files[0].name)){
	            	alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
	            	return false;
	            }
	            //验证图片类型  
	            var size = files[0].size;   //注意，这里读到的是字节数
	            var maxSize = 2;
	            maxSize = maxSize*1024*1024;   //转化为字节
	            if(size> maxSize){
	        	   alert("图片不能大于2M！");
	        	   return false;
	           }
	            //将正在编辑的图片替换掉
	           cropper.replace(file);
            }
        })
 
        /*
         * 当点击确认时，会调用的方法
         * 孙亦璇 v0.0.1(2018-12-19 09:31:13)*/
        $('button').click(function () {
            var new_userhead = dataURLtoBlob($('#preview_img').attr("src"));  //将base64格式图片转换为文件形式
            var formData = new FormData();
            var newImg ='userhead.png';   //给图片添加文件名   如果没有文件名会报错
            formData.append("file", new_userhead, newImg);  //formData对象添加文件
            console.log(formData.get("file"));
            //调用ajax，将图片传到后台
            $.ajax({
                type: "POST",
                url: "avatarUploader",
                data: formData,
                processData: false,  // 不处理数据
                contentType: false,  // 不设置内容类型
                success: function (data) {
                	//上传成功后，对当前界面进行修改
                    alert("上传成功");
                    $("#tx01").children().attr("src",data.newUserheadUrl);
                    $("#tx02").attr("src",data.newUserheadUrl);
                    $("#upload_userhead_view").css("display","none");
                	$("#default_userhead_view").css("display","block");
                }
            })
        })
        
        //将base64格式图片转换为文件形式
        function dataURLtoBlob(dataurl) {  
            var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
                bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
            while (n--) {
                u8arr[n] = bstr.charCodeAt(n);
            }
            return new Blob([u8arr], { type: mime });
        }