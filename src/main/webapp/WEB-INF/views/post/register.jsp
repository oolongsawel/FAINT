<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--헤더-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시물 등록</title>
</head>
<style>
.btncatelist li {
	display: inline;
}
</style>
<body>
	<form id="registerForm" role="form" method="post">
		<div>
			<div>
			<label>카테고리</label>
				<ul class="btncatelist">
					<li><input type="button" class="btncate" value="1">여행</li>
					<li><input type="button" class="btncate" value="2">영화</li>
					<li><input type="button" class="btncate" value="3">공연</li>
					<li><input type="button" class="btncate" value="4">음식</li>
					<li><input type="button" class="btncate" value="5">일상</li>
				</ul>
			</div>
			<label>cateid</label><input type="text"  id='cateid' name='cateid'
				placeholder="Enter cateid">
		</div>
		<div>
			<label>caption</label> <input type="text" name='caption'
				style="width: 500px;">
		</div>
		<div>
			<ul class="uploadedList"></ul>
		</div>

		<div>
			<input type="file" name="file" id="inputfile"
				accept="image/*|video/*" style="display: none;" multiple></br> <input
				type="button" id="btnUpload" value="UPLOAD">
			<div class="fileDrop"
				style="width: 100px; height: 100px; background-color: gray;">File
				DROP Here</div>
		</div>
		<input type="submit">
		<!-- <input type="hidden" id='cateid' name='cateid' value=0> -->
	</form>
</body>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<li style="list-style:none;">
	<div>
	<span >
{{#if fileType 'image'}}
	<img src="{{imgsrc}}" alt="Attachment">
{{/if}}
{{#if fileType 'video'}}
	<video src="{{imgsrc}}" style="width:300px;" loop="true" autoplay>
{{/if}}
</span>
  	<small class="delbtn" data-src="{{fullName}}">X</small></div>
</li>          
</script>
<script>
	//핸들바 정의
	var template = Handlebars.compile($("#template").html());

	//핸들바 조건문
	Handlebars.registerHelper('if', function(fileType, type, options) {
		if (fileType == type) {
			return options.fn(this);
		}
	});
	//드래그 영력에서 드래그에 대한 이벤트 막음
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	//파일 드롭 시 업로드 처리
	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();

		var files = event.originalEvent.dataTransfer.files;
		uploadFiles(event.originalEvent.dataTransfer.files);

	});

	//첨부파일 삭제
	$(".uploadedList").on("click", "small", function(event) {
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
					that.parent("div").remove();
				}
			}
		});
	});
	
	//form submit 처리
	$("#registerForm").submit(function(event) {
		event.preventDefault();

		var that = $(this);

		var str = "";
		$(".uploadedList .delbtn").each(
			function(index) {
				str += "<input type='hidden' name='files[" + index
					+ "]' value='" + $(this).attr("data-src")
					+ "'> ";
			});

		that.append(str);

		that.get(0).submit();
	});

	//file input 강제발생
	$("#btnUpload").on("click", function() {
		$("#inputfile").click();
	});

	//파일탐색기에서 OK누른 후 처리
	//파일 업로드
	$("#inputfile").on("change", function() {
		event.preventDefault();
		uploadFiles(this.files);
	});

	//업로드 리스트에 업로드 파일 보이기
	//서버에 업로드
	function uploadFiles(files) {
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

					var html = template(fileInfo);

					//업로드 리스트에 파일 보이기
					$(".uploadedList").append(html);
				}
			}); //ajax end
		});
	}

	//카테고리 버튼클릭시 슴겨진 cateid 항목 값 설정
	$(".btncate").on("click", function() {
		$("#cateid").val(this.value);
	});
</script>
</html>