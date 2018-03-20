<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<title>프로필 편집</title>
<body>
</head>
<div>
	<ul>
		<!-- 프로필 편집 -->
		<li><a class="profileMod" href="/member/profile/edit">프로필 편집</a></li>
		<!-- 비밀번호 변경 -->
		<li><a class="passwordMod" href="/member/profile/pwchange">비밀번호 변경</a></li>
	</ul>
	<!-- 프로필 사진 -->
	<div>
		<button>
			<img src="" style="width: 38px; height: 38px;">
		</button>
		<div>
			<h1>닉네임</h1>
			<a>프로필 사진 수정</a>
		</div>
	</div>
	<form id="profile">
		<!-- 이름 -->
		<!-- 이 값이 최대 30 개의 글자인지 확인하세요 -->
		<div>
			<label>이름</label> <input type="text" id="name"
				onkeyup="validCheck(this)" value="" style="width: 500px">
		</div>
		<!-- 사용자 이름 -->
		<!-- 이 값이 최대 30 개의 글자인지 확인하세요 -->
		<!-- 사용자 이름에는 문자, 숫자, 밑줄 및 마침표만 사용할 수 있습니다 -->
		<!-- 닉네임 -->
		<div>
			<label>사용자 이름</label> <input type="text" id="nickname"
				onkeyup="validCheck(this)" value="" style="width: 500px"> 
				<img id="imgErrorNick" src="../../resources/img/typeError.png" style="display: none;">
		</div>
		<!-- 웹사이트 -->
		<!-- url 양식에 맞게 -->
		<div>
			<label>웹사이트</label> <input type="text" id="website"
			onkeyup="validCheck(this)" value="" style="width: 500px">
			<img id="imgErrorWeb" src="../../resources/img/typeError.png" style="display: none;">
		</div>
		<!-- 소개 -->
		<!-- 전부 -->
		<!-- 소개는 150자 이하여야 합니다. -->
		<div>
			<label>소개</label>
			<textarea id="intro" 
			onkeyup="validCheck(this)" style="width:500px; resize: vertical; overflow: hidden;"></textarea> 
			
		</div>
		<!-- 개인정보 -->
		<div>
			<label>개인정보</label>
		</div>
		<!-- email -->
		<!-- 수정불가 -->
		<div>
			<label>이메일</label> <input type="text" readonly="readonly">
		</div>
		<!-- 전화번호 -->
		<!-- 전화번호 양식에 맞게 -->
		<div>
			<label>전화번호</label> <input type="text" id="phoneNumber"
			onkeyup="validCheck(this)" value="" style="width: 500px">
			<img id="imgErrorPhone" src="../../resources/img/typeError.png"  style="display: none;">
		</div>
		<!-- 성별 -->
		<div>
			<label>성별</label> <select>
				<option value = "0">선택 안함</option>
				<option value = "1">남성</option>
				<option value = "2">여성</option>
			</select>
		</div>
		<!-- 비공개유무 -->
		<div>
			<label>비공개</label> <input type="checkbox">
		</div>
		<!-- 제출 -->
		<div>
			<button>제출</button>
		</div>

	</form>
	<!-- 공통 처리 import -->
	<script type="text/javascript" src="../../resources/js/common.js" ></script> 
	<script>
		var validCheck = function(obj) {
			var chkStr = "";
			var maxLen = 0;
			
			switch (obj.id) {
			//이름
			case "name":
				maxLen =30;
				//길이체크
				if (!lengthCheck(obj, maxLen)) return;
	
				break;
			//사용자이름
			case "nickname":
				maxLen =30;
				console.log($("#"+obj.id).siblings("img"));
				console.log($("#"+obj.id).parent("div").children("img"));
				//입력 가능 형식 문자, 숫자, 밑줄, 마침표
				if (obj.value.length == 0) {
					//길이가 0이면 에러표시 지우고 리턴
					
					$("#"+obj.id).siblings("img").hide();
					//document.getElementById("imgErrorNick").style.visibility = "hidden";
					return;
				}
				//길이체크
				if (!lengthCheck(obj, maxLen)) return;
				
				//체크 정규식 설정
				if (obj.value.length <= 2) {
					//길이가 2보다 작으면
					chkStr = /^[A-Za-z0-9_]*$/;
				} else {
					//길이가 2보다 크면
					chkStr = /^[A-Za-z0-9_]+[a-zA-Z0-9_\.]+[A-Za-z0-9_]$/;
				}
				//입력값 형식에 맞는지 비교
				strCheck(obj, chkStr);
				break;
			//웹사이트
			case "website":
				//입력 가능 형식 문자, 숫자, 밑줄, 마침표
				if (obj.value.length == 0) {
					//길이가 0이면 에러표시 지우고 리턴
					$("#"+obj.id).siblings("img").hide();
					return;
				}
				
				chkStr = /^(((http(s?))\:\/\/)?)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/
				//입렵값 체크
				strCheck(obj, chkStr);
				
				break;
			//소개
			case "intro":
				maxLen = 150;
				//길이체크
				if (!lengthCheck(obj, maxLen)) return;
				break;
			//번호
			case "phoneNumber":
				maxLen = 13;
				//입력 가능 형식 문자, 숫자, 밑줄, 마침표
				if (obj.value.length < 13) {
					//길이가 13보다 작으면 에러표시 지우고 리턴
					//폰 번호 전부 입력해야 체크 시작
					$("#"+obj.id).siblings("img").hide();
				
				
					return;
				}
				//길이체크
				if (!lengthCheck(obj, maxLen)) return;
				chkStr = /[01](0|1|6|7|8|9)[-](\d{4}|\d{3})[-]\d{4}$/g;
				//입력값 형식에 맞는지 비교
				strCheck(obj, chkStr);
				
				
				break;
			default:
				return;
			}
		}
		//입력한 문자열 체크
		function strCheck(obj, chkStr) {
			if (!chkStr.test(obj.value)) {
				$("#" + obj.id).siblings("img").show();
			} else {
				$("#" + obj.id).siblings("img").hide();
			}
		}
	</script>
</div>
</body>
</html>