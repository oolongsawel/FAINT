<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>프로필 편집</title>

</head>
<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">

<script>
//프로필 수정 후 로딩 될때 메시지 띄우기
	if ('${result}' == "passwordChange") {
		//프로필 수정일 경우 프로필 편집 활성화
		alert("비밀번호가 저장되었습니다.");
	}
</script>
<body class style="">
<span id="react-root" aria-hidden="false">
	<section class="_sq4bv _29u45"> 
	<main class="_8fi2q _2v79o">
	<div class="_28rsa">
	<!-- 사이드바 -->
	<jsp:include page="editSide.jsp" flush="false"></jsp:include>
	<article class="_75z9k"> 
	<!-- 프로필 사진 -->
	<jsp:include page="modifyProfilePhoto.jsp" flush="false"></jsp:include>
	
	<input type="file" name="file" id="inputfile" accept="image/*"	style="display: none;">
		<!-- 비밀번호 변경 폼 -->
		<form class="_fx423" id="pwChangeForm" method="post" > 
			<!-- 이전 비밀번호 -->
			<div class="_e1xik"><aside class="_kx10g"><label for="prevPw">이전 비밀번호</label></aside>
			<div class="_cd2n1"><input type="password" class="_jh9m1 _o716c" aria-required="true" id="prevPw" value=""></div></div>
			<!-- 에러 메세지 표시 -->
			<div class="_e1xik">
				<aside class="_kx10g _ldhkl"> <label></label></aside>
				<div class="_cd2n1">
					<h2 class="_49rz2 err" id="chkprevPw">비밀번호를 입력해 주세요.</h2> 
				</div>
			</div>
			<!-- 새 비밀번호 -->
			<div class="_e1xik"><aside class="_kx10g"><label for="newPw">새 비밀번호</label></aside>
			<div class="_cd2n1"><input type="password" class="_jh9m1 _o716c" aria-required="true" id="newPw" value="" name="password" ></div></div>
		
			<!-- 에러 메세지 표시 -->
			<div class="_e1xik">
				<aside class="_kx10g _ldhkl"> <label></label></aside>
				<div class="_cd2n1">
					<h2 class="_49rz2 err" id="chkNewPW1">비밀번호를 입력해 주세요.</h2> 
				</div>
			</div>
			<!-- 새 비밀번호 확인 -->
			<div class="_e1xik"><aside class="_kx10g"><label for="newPwChk">새 비밀번호 확인</label></aside>
			<div class="_cd2n1"><input type="password" class="_jh9m1 _o716c" aria-required="true" id="newPwChk" value=""></div></div>
			<!-- 에러 메세지 표시 -->
			<div class="_e1xik">
				<aside class="_kx10g _ldhkl"> <label></label></aside>
				<div class="_cd2n1">
					<h2 class="_49rz2 err" id="chkNewPW2">비밀번호를 입력해 주세요.</h2> 
				</div>
			</div>
		
			<!-- 제출 -->
			<div class="_e1xik"><aside class="_kx10g _ldhkl"><label></label></aside>
			<div class="_cd2n1"><div class="_qr7ez">
			<span class="_ov9ai"><button class="_qv64e _gexxb _r9b8f _jfvwv" id="btnChangePW" disabled="">비밀번호 변경</button></span></div></div></div>
			<input type="hidden" name="id" value="${userVO.id }">
		</form>
		
	</div>
	</article> 
	</main>
	<jsp:include page="../../common/footer.jsp" flush="false"></jsp:include>
	</section>
	</span>
	<input type="file" name="file" id="inputfile" accept="image/*"
		style="display: none;">
</body>


<!-- 공통 처리 import -->
<script type="text/javascript" src="../../resources/js/common.js"></script>
<script type="text/javascript" src="../../resources/js/upload.js"></script>
<script>
	$(document).ready(function() {
		//제출 버튼
		$("#btnSubmit").on("click", function(event) {
			event.preventDefault();
			//에러난 항목 있으면 다시 체크
			if (errFlg) {
				alert("올바른 정보를 입력하세요.");
				return false;
			}
			var form = $("#profileForm");

			//비공개 체크 데이터 입력
			if ($("#chkPri").is(":checked")) {
				//비공개 체크 되어있으면 1
				$("#userlevel").val(1);
			} else {
				//안되있으면 0
				$("#userlevel").val(0);
			}
			form.submit();
		});

		//닉네임 중복체크
		$("#nickname").keyup( function() {
			var orgNick = "${userVO.nickname}";
			var nick = $(this).val();

			//입력값 없으면 아무거도 안함
			if (nick == null || nick == "") return;

			//원래 이름과 같으면
			if (orgNick == nick) {
				//글자색 빨강
				$("#chkResult").css("color", "#999");
				$("#chkResult").text("");
				errFlg = false;
				return;
			}
			//유효성 검사
			validCheck(this);
			if(errFlg) return;
			//errFlg False면 정상, true면 error 유효하지 않으면
			$.getJSON("/member/profile/edit/chkNick", {nick: nick}, function(data) {
				//data = 0 중복아님, != 0  중복
				if (data == 0) {
					//글자색 검정
					$("#chkResult").css("color", "black");
					$("#chkResult").text("사용가능한 닉네임입니다.");
				} else {
					//글자색 빨강
					$("#chkResult").css("color", "red");
					$("#chkResult").text("중복된 닉네임입니다.");
				}
			});
		});
		
		//이전 비밀번호 입력
		$("#prevPw").keyup(function(){
			changePwBtn();
			validCheck(this);
			
		});
		//새 비밀번호 입력
		$("#newPw").keyup(function(){
			changePwBtn();			
			validCheck(this);
		});
		//새 비밀번호 확인 입력
		$("#newPwChk").keyup(function(){
			changePwBtn();			
			validCheck(this);
		});
		
		//비번 변경
		$("#btnChangePW").on("click", function(event) {
			event.preventDefault();
			errFlg = false;
			$(".err").each(function(){
				if($(this).css("color") == "rgb(255, 0, 0)"){
					alert("올바른 정보를 입력하세요.");
					errFlg =true;
					return false;	
				}
			});
			if(errFlg) return;
			var formObj = $("#pwChangeForm");
			
			formObj.submit();
		});
	}); //end ready
	
	//유효성 검사 에러 체크
	var errFlg = false;
	
	//유효성 검사
	function validCheck(obj) {
		errFlg = true;
		var chkStr = "";
		var maxLen = 0;

		switch (obj.id) {
		//새비번
		case "newPw":
			var errMsg = "";
			maxLen = 15;
			if(obj.value.length < 8){
				errMsg="8자 이상의 비밀번호를 입력하시오";
				$("#chkNewPW1").text(errMsg);
				$("#chkNewPW1").css("color", "red");
				return;
			}
			//길이체크
			if (!lengthCheck(obj, maxLen)) return;
			
			//적어도 소문자 하나, 숫자 하나가 포함되어 있는 문자열(8글자 이상 15글자 이하) 
			chkStr = /(?=.*\d)(?=.*[a-z]).{3,15}/;

			//입력값 형식에 맞는지 비교
			if (!chkStr.test(obj.value)) {
				errMsg= "적어도 하나의 영어, 숫자를 입력하시오. ";
				$("#chkNewPW1").text(errMsg);
				$("#chkNewPW1").css("color", "red");
			} else {
				errMsg= "적합한 비밀번호 입니다.";
				$("#chkNewPW1").css("color", "#999");
				$("#chkNewPW1").text(errMsg);
			}
			
			break;
		//새 비번 확인
		case "newPwChk":
			var errMsg = "";
			maxLen = 15;
			if (!lengthCheck(obj, maxLen)) return;
			if(obj.value !=$("#newPw").val()){
				errMsg = "비밀번호가 일치하지 않습니다."
				$("#chkNewPW2").css("color", "red");
				$("#chkNewPW2").text(errMsg);
			}else{
				errMsg = "비밀번호가 일치합니다."
				$("#chkNewPW2").css("color", "#999");
				$("#chkNewPW2").text(errMsg);
			}
		
			break;
		case "prevPw":
			var errMsg = "";
			var color =""
			maxLen = 15;
			if($(obj).val().length<3) {
				//글자색 빨강
				errMsg="8자 이상의 비밀번호를 만드세요";
				$("#chkprevPw").css("color", "red");
				$("#chkprevPw").text(errMsg);
				return;
			}
			if (!lengthCheck(obj, maxLen)) return;
			//비밀번호 일치 확인
			$.getJSON("/member/profile/edit/chkPW", {userid:${userVO.id}, pw: $(obj).val()}, function(data) {
				//data != 1 불일치, 1 일치
				if (data == 1) {
					//글자색 검정
					errMsg= "비밀번호가 일치합니다.";
					color ="#999";
				} else {
					//글자색 빨강
					errMsg= "비밀번호가 일치하지 않습니다.";
					color ="red";
				}
				$("#chkprevPw").css("color", color);
				$("#chkprevPw").text(errMsg);
			});
			break;
		default:
			return;
		}
	}
	
	//비번 변경 버튼 활성화
	function changePwBtn(){
		var prevPw = $("#prevPw").val();
		var newPw = $("#newPw").val();
		var newPwChk = $("#newPwChk").val();
		//모두 최소 한글자씩 입력 되어 있어야지 버튼 활성화
		if(prevPw.length >0 &&  newPw.length > 0 && newPwChk.length > 0 ){
			$("#btnChangePW").attr("class", "_qv64e _gexxb _r9b8f _njrw0");
			$("#btnChangePW").attr("disabled",false);
		}
		else {
			$("#btnChangePW").attr("class", "_qv64e _gexxb _r9b8f _jfvwv");
			$("#btnChangePW").attr("disabled",true);
		}
	}
</script>
</html>