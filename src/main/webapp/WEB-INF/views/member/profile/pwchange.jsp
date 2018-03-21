<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<title>프로필 편집</title>
</head>

<script>
//프로필 수정 후 로딩 될때 메시지 띄우기
	if ('${result}' == "passwordChange") {
		//프로필 수정일 경우 프로필 편집 활성화
		alert("프로필이 저장되었습니다.");
	}else{
		alert("${result}");
	}
</script>
<body>
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
	<form id="pwChange">
		<!-- 이전 비밀번호 -->
		<div>
			<label>이전 비밀번호</label>
			<input type="text" id="prevPw" value="" style="width: 500px">
			<p style="margin: 0;">a</p>
		</div>
		<!-- 새 비밀번호 -->
		<div>
			<label>새 비밀번호 </label>
			<input type="text" id="newPw" value="" onkeyup="validCheck(this)"  style="width: 500px">
			<p style="margin: 0;">b</p>
		</div>
		<!-- 새 비밀번호 확인 -->
		<div>
			<label>새 비밀번호 확인</label>
			<input type="text" id="newPwChk" value=""  onkeyup="validCheck(this)" style="width: 500px">
			<p style="margin: 0;">c</p>
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
			var errMsg = "";
			var emptyStr = "";
			var maxLen = 0;
			
			switch (obj.id) {
			//이전 비번
			//새 비번
			case "newPw":
				maxLen = 15;
				if(obj.value.length < 8){
					errMsg="8자 이상의 비밀번호를 만드세요";
					$("#"+obj.id).siblings("p").text(errMsg);
					return;
				}
				
				//길이체크
				if (!lengthCheck(obj, maxLen)) return;
				
				$("#"+obj.id).siblings("p").text(emptyStr);
				//적어도 소문자 하나,  숫자 하나가 포함되어 있는 문자열(8글자 이상 15글자 이하) 
				chkStr = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}/;

				errMsg= "적어도 소문자 하나, 대문자 하나, 숫자 하나를 입력하시오.";
				//입력값 형식에 맞는지 비교
				strCheck(obj, chkStr, errMsg);
				
				break;
			
			//새 비번 확인
			case "newPwChk":
				errMsg = "비밀번호가 일치하지 않습니다."
				if(obj.value !=$("#newPw").val()){
					$("#"+obj.id).siblings("p").text(errMsg);
				}
				break;
			default:
				return;
			}
		}
		
		//입력한 문자열 체크
		function strCheck(obj, chkStr, errMsg) {
			if (!chkStr.test(obj.value)) {
				$("#"+obj.id).siblings("p").text(errMsg);
			} else {
				$("#" + obj.id).siblings("img").hide();
			}
		}
	</script>
</div>
</body>
</html>