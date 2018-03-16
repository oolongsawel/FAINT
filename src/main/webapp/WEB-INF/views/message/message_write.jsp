<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/write.css" />
<script charset="utf-8">
	$(document).ready(function() {
		//전역변수선언
		$('#writeActionBtn').click(function() {

			//폼값 검증
			if ($("input[type='text'][name='receiver_srl']").val() == "") {
				popLayerMsg("받는 이를 입력해주세요");
				$("input[type='text'][name='receiver_srl']").focus();
				return;
			}

			if ($("input[type='text'][name='title']").val() == "") {
				popLayerMsg("제목을 입력해주세요");
				$("input[type='text'][name='title']").focus();
				return;
			}

			if ($("input[type='text'][name='contents']").val() == "") {
				popLayerMsg("내용 입력해주세요");
				$("input[type='text'][name='contents']").focus();
				return;
			}

			//글쓰기 처리
			var params = $('#writeMessageFrm').serialize();

			$.ajax({
				cache : false, // 캐시 사용 없애기
				url : "${pageContext.request.contextPath}/message",
				type : "post",
				dataType : "json",

				data : params,
				success : function(d) {
					if (d.result == "success") {

						popLayerMsg("쪽지를 보냈습니다.");

						getListMessage(1, 1, "");
					}

				},
				error : function(e) {
					alert("요청실패:" + e.status + " " + e.statusText);
				}
			});
		});

		function getContextPath() {
			return sessionStorage.getItem("contextpath");
		}
	});
</script>

<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#listView').click(function() {
			getListMessage(1, 1, "");
		});

	});
</script>
<form id="writeMessageFrm"
	action="${pageContext.request.contextPath}/message" method="post">

	<div class="write-body">
		<div class="service">
			<p class="p-title">받는 이</p>
			<input type="text" class="form-control " placeholder="받는 이를 입력하세요."
				name="receiver_srl" />

		</div>

		<div class="title2">

			<p class="p-title">제목</p>
			<input type="text" class="form-control" name="title" />
		</div>
		<div class="contents">
			<p class="p-title">내용</p>


			<textarea class="form-control" name="contents" id="contents"
				rows="10" cols="80"></textarea>
		</div>


	</div>
	<div class="write-btn">
		<button type="button" class="btn btn-info" id="listView">목록보기</button>
		<button type="button" class="btn btn-danger" id="writeCancel">취소</button>
		<button type="button" class="btn btn-success" id="writeActionBtn">보내기</button>
	</div>



</form>
