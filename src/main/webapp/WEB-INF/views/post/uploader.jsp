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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.preview-images-zone {
    width: 100%;
    border: 1px solid #ddd;
    min-height: 180px;
    /* display: flex; */
    padding: 5px 5px 0px 5px;
    position: relative;
    overflow:auto;
}
.preview-images-zone > .preview-image:first-child {
    height: 300px;
    width: 300px;
    position: relative;
    margin-right: 5px;
}
.preview-images-zone > .preview-image {
	border: 1px solid;
	height: 150px;
    width: 150px;
    position: relative;
    margin-right: 5px;
    float: left;
    margin-bottom: 5px;
}
.preview-images-zone > .preview-image > .image-zone {
    width: 100%;
    height: 100%;
}
.preview-images-zone > .preview-image > .image-zone > img {
    width: 100%;
    height: 100%;
}
.preview-images-zone > .preview-image > .image-zone > video {
    width: 100%;
    height: 100%;
}
.preview-images-zone > .preview-image > .tools-edit-image {
    position: absolute;
    z-index: 100;
    color: #fff;
    bottom: 0;
    width: 100%;
    text-align: center;
    margin-bottom: 10px;
    display: none;
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
.preview-image:hover > .tools-edit-image,
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
		<button type="button" class="btn btn-labeled btn-default"> <span class="btn-label"><i class="glyphicon glyphicon-upload"></i> </span>Upload</button>
    </fieldset>
    <div class="preview-images-zone">
    </div>
</div>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script>
$(document).ready(function() {
    document.getElementById('pro-image').addEventListener('change', readImage, false);
    

    $( ".preview-images-zone" ).sortable();
    
    $(document).on('click', '.image-cancel', function() {
        let no = $(this).data('no');
        var that = $(this);
    
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
});



var num = 0;
function readImage() {
    if (window.File && window.FileList && window.FileReader) {
        var files = event.target.files; //FileList object
        var output = $(".preview-images-zone");
        $(files).each(function() {
			var file = this;

			console.log(this);
			var formData = new FormData();

			formData.append("file", this);

			$.ajax({
				url : '/uploadAjax',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					var fileInfo = getFileInfo(data);
					
					var picReader = new FileReader();
		            
		            picReader.addEventListener('load', function (event) {
		                var picFile = event.target;
		                var html =  '<div class="preview-image preview-show-' + num + '">' +
		                            '<div class="image-cancel" data-no="' + num + '" data-src="'+ fileInfo.fullName+'">x</div>' +
		                            '<div class="image-zone">' ;
		                if(fileInfo.fileType == "image"){
		                	html =  html + '<img id="pro-img-' + num + '" src="' + fileInfo.imgsrc + '"></div>' +
                            '</div>';
		                }else{
		                	html =  html + '<video id="pro-img-' + num + '" src="' + fileInfo.imgsrc + '" loop="true" autoplay></div>' +
                            '</div>';
		                }
		                            

		                output.append(html);
		                num = num + 1;
		            });

		            picReader.readAsDataURL(file);
				}
			}); //ajax end
		}); 
        
        $("#pro-image").val('');
    } else {
        console.log('Browser not support');
    }
}


</script>
</html>