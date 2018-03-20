
//길이 제한
function lengthCheck(obj, limit) {
	var msg = "이 값이 최대 " + limit + "개의 글자인지 확인하세요.";
	//길이 초과 할 경우 알림 발생, 초과 글자 제거
	if (obj.value.length > limit) {
		alert(msg);
		obj.value = obj.value.substr(0, limit);
		return false;
	}

	return true;
}