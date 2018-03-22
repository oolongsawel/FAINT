<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cssgram-cssgram.netdna-ssl.com/cssgram.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.preview-images-zone > .image-zone {
    width: 100%;
    height: 100%;
    text-align: center;
}
.preview-images-zone {
    width: 100%;
    border: 1px solid #ddd;
    min-height: 220px;
    /* display: flex; */
    padding: 5px 5px 0px 5px;
    position: relative;
    overflow:auto;
    white-space: nowrap;
}
/* .preview-images-zone > .preview-image:first-child {
    height: 150px;
    width: 150px;
    position: relative;
    margin-right: 5px;
} */
.preview-images-zone > .preview-image {
	border: 1px solid;
	height: 200px;
    width: 200px;
    position: relative;
    margin-right: 5px;
   	/* float: left; */
    margin-bottom: 5px;
    display: inline-block;
    vertical-align: top;
}

.preview-images-zone > .preview-image > .image-zone {
    width: 100%;
    height: 100%;
    text-align: center;
}
.preview-images-zone > .preview-image > .image-zone > img {
    width: 100%;
    height: 100%;
    cursor: pointer;
}
.preview-images-zone > .preview-image > .image-zone > video {
    width: 100%;
    height: 100%;
    cursor: pointer;
}

.preview-images-zone > .preview-image > .image-cancel {
    font-size: 18px;
    position: absolute;
    top: 0;
    right: 0;
    font-weight: bold;
    margin-right: 10px;
    cursor: pointer;
    display: none;
    z-index: 100;
}
.preview-image:hover > .image-zone {
    cursor: move;
    opacity: .5;
}
.preview-image:hover > .image-cancel {
    display: block;
}
.ui-sortable-helper {
    width: 90px !important;
    height: 90px !important;
}

.container {
    padding-top: 50px;
}

.image-preview-input {
    position: relative;
    overflow: hidden;
    margin: 0px;    
    color: #333;
    background-color: #fff;
    border-color: #ccc;    
}
.hide-bullets {
    list-style:none;
    margin-left: -40px;
    margin-top:20px;
}

.thumbnail {
    padding: 0;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
    width: 100%;
}
figcaption {
    position: absolute;
    bottom: 1em;
    right: 0;
    padding: .25em 1em .25em .25em;
    background: #000;
    color: #fff;
    font-weight: 200;
}
.hide-bullets > li > a, a:visited {
cursor: pointer;
color:#003569;
text-decoration:none;
}

.preview-image.selected {
    box-shadow: 0 0 0 4px #00c09e;
}
</style>
<body>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<div class="container">
    <fieldset class="form-group" style="text-align: right;">
    	<div class="btn btn-default image-preview-input" onclick="$('#pro-image').click()"> 
    	<span class="glyphicon glyphicon-folder-open"></span> 
    	<span class="image-preview-input-title">Browse</span>
		</div>
	        <input type="file" id="pro-image" name="pro-image" accept="image/*|video/*"style="display: none;" class="form-control" multiple>
		<button type="button" id="upload" class="btn btn-labeled btn-default"> <span class="btn-label"><i class="glyphicon glyphicon-upload"></i> </span>Upload</button>
    </fieldset>
    <div class="preview-images-zone"> </div>
    <form id="uploadForm" method="post" />
</div>

<div class="container">
    <div id="main_area">
        <!-- Slider -->
        <div class="row">
            <div class="col-sm-22" id="slider-thumbs" >
                <!-- Bottom switcher of slider -->
                <ul class="hide-bullets">
                    <li class="col-sm-2">
                        <a class="thumbnail " id="nofilter" title="" style="position: relative;"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>#nofilter</figcaption>
                        </a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail _1977" id="1977" title="_1977"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>1977</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail aden" id="Aden" title="aden"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Aden</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail brannan" id="Brannan" title="brannan"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Brannan</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail brooklyn" id="Brooklyn" title="brooklyn"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Brooklyn</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail clarendon" id="Clarendon" title="clarendon"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Clarendon</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail earlybird" id="Earlybird" title="earlybird"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Earlybird</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail gingham" id="Gingham" title="gingham"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Gingham</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail hudson" id="Hudson" title="hudson"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Hudson</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail inkwell" id="Inkwell" title="inkwell"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Inkwell</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail kelvin" id="Kelvin" title="kelvin"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Kelvin</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail lark" id="Lark" title="lark"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Lark</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail lofi" id="Lo-Fi" title="lofi"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Lo-Fi</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail maven" id="Maven" title="maven"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Maven</figcaption></a>
                    </li>

                    <li class="col-sm-2">
                        <a class="thumbnail mayfair" id="Mayfair" title="mayfair"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Mayfair</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail moon" id="Moon" title="moon"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Moon</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail nashville" id="Nashville" title="nashville"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Nashville</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail perpetua" id="Perpetua" title="perpetua"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Perpetua</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail reyes" id="Reyes" title="reye"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Reyes</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail rise" id="Rise" title="rise"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Rise</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail slumber" id="Slumber" title="slumber"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Slumber</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail stinson" id="Stinson" title="stinson"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Stinson</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail toaster" id="Toaster" title="toaster"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Toaster</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail valencia" id="Valencia" title="valencia"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Valencia</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail walden" id="Walden" title="walden"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Walden</figcaption></a>
                    </li>
                    <li class="col-sm-2">
                        <a class="thumbnail willow" id="Willow" title="willow"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>Willow</figcaption></a>
                    </li>
                     <li class="col-sm-2">
                        <a class="thumbnail xpro2" id="X-pro II" title="xpro2"><img src="https://una.im/CSSgram/img/atx.jpg">
                        <figcaption>X-pro II</figcaption></a>
                    </li>
                </ul>
            </div>
            
        </div>

    </div>
</div>
    
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script>
$(document).ready(function() {

    $("#pro-image").on("change",function(){
    	readImage(this.files);
    })

    $(".preview-images-zone").sortable();
    
    $(document).on('click', '.image-cancel', function() {
        let no = $(this).data('no');
    
        $.ajax({
			url : "/deleteFile",
			type : "post",
			data : {
				fileName : $(this).attr("data-src")
			},
			dataType : "text",
			success : function(result) {
				if (result == 'deleted') {
				    $(".preview-image.preview-show-"+no).remove();
				}
			}
		}); 
    });
  	//드래그 영력에서 드래그에 대한 이벤트 막음
	$(".preview-images-zone").on("dragenter dragover", function(event) {
		event.preventDefault();
		console.log("dragover");
	});

	//파일 드롭 시 업로드 처리
	$(".preview-images-zone").on("drop", function(event) {
		event.preventDefault();
		console.log("drop");
		var droplist = event.originalEvent.dataTransfer.files;
		readImage(droplist);

	});
    $("#upload").on("click", function(event){
    	event.preventDefault();

		var form = $("#uploadForm");
		//파일 개수
		var cnt = 0;
		
		var str = "";
    	$(".image-cancel").each(function(index){
			var data = new Object();
			var obj;
			//파일 url 추가
    		data.fileUrl =$(this).attr("data-src");
			//파일 type 추가
    		data.fileType = $(this).siblings("div",".image-zone").attr("data-type");
    		
    		if(data.fileType == 'image'){
				obj = $(this).siblings("div",".image-zone").children("img");
    			//타입 이미지인경우
    			data.naturalHeight = obj[0].naturalHeight;
    		}
    		else{
				obj = $(this).siblings("div",".image-zone").children("video");
    			//타입 동영상인 경우
    			data.naturalHeight = obj[0].videoHeight;
    		}
    		console.log(obj[0]);
    		data.filter = obj.attr("class");
    		console.log(JSON.stringify(data));
			str += "<input type='hidden' name='files' value='" + JSON.stringify(data) + "'> ";
			
			cnt++;
    	});
    	//사진 없으면 업로드 실패
		if(cnt==0){
			alert("이미지나 동영상을 추가하세요.");
			return false;
		}
		
		//첨부파일 추가
		form.append(str);
		form.attr("action", "/post/register");
		
		form.submit();
    });
    
    //필터 적용
   $(".hide-bullets > li > a").on("click", function(){
	   //선택된 이미지가 없을때
	   //전체 필터 적용
	   if($(".selected").length == 0){
		   $(".image-zone > img, .image-zone > video").attr("class", this.title);
	   }else{
		   //선택된 이미지만 필터 적용
		   $(".selected > div > img, .selected > div > video").attr("class" , this.title);
		   
	   }
   });
});



var num = 0;
function readImage(files) {
    if (window.File && window.FileList && window.FileReader) {
    
    	console.log(files);
        var output = $(".preview-images-zone");
        $(files).each(function() {
			var file = this;

			console.log(this);
			var formData = new FormData();
			formData.append("file", this);
			console.log(formData);
			$.ajax({
				url : '/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					var fileInfo = getFileInfo(data);
					
	                var html =  '<div class="preview-image preview-show-' + num + '" onclick="selectUploadImaage(this)">' +
	                            '<div class="image-cancel" data-no="' + num + '" data-src="'+ fileInfo.fullName+'">x</div>' +
	                            '<div class="image-zone" data-type="'+fileInfo.fileType+'">' ;
	                if(fileInfo.fileType == "image"){
	                	html =  html + '<img id="pro-img-' + num + '" src="' + fileInfo.imgsrc + '"></div>' +
                           '</div>';
	                }else{
	                	html =  html + '<video id="pro-img-' + num + '" src="' + fileInfo.imgsrc + '" loop="true" autoplay></div>' +
                           '</div>';
	                }
	              
	                output.append(html);
	                
	                //처음 업로드 되는 이미지로 필터 이미지 변경
	                if(num == 0){
	                	if(fileInfo.fileType != 'video'){
	                		$(".thumbnail > img").attr("src", fileInfo.imgsrc);
	                	}
	                }
	                num = num + 1;
	                
	               
				}
			}); //ajax end
		}); 
        
        $("#pro-image").val('');
    } else {
        console.log('Browser not support');
    }
}  
 
function selectUploadImaage(obj){
	$(obj).toggleClass("selected");
}
</script>
</html>