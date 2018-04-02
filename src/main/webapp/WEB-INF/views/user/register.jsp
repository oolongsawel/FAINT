
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>
<style>

	td {
		padding:2px;

	}
	input{
		width:30em;
	}
</style>
    <%--애니메이션 효과--%>
    <link rel="stylesheet" href="/resources/dist/css/animate.min.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css">
    <%--이모티콘--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="/resources/bootstrap-social.css" rel="stylesheet">

    <!-- jquery load -->

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
    <%--bootstrap--%>
    <%--<link rel="stylesheet" href="/resources/dist/css/bootstrap.css">--%>
    <%--<link rel="stylesheet" href="/resources/dist/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" href="/resources/dist/css/_bootswatch.scss">--%>
    <link href="https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0-beta.3/sketchy/bootstrap.min.css" rel="stylesheet">
    <%--<link rel="stylesheet" href="/resources/dist/css/_variables.scss">--%>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="/resources/dist/js/bootstrap.min.js"></script>



    <link href="/resources/dist/css/home.css" rel="stylesheet">
    <%--jquery--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%--스크롤 애니메이션--%>
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <%--첨부파일--%>
    <script src="/resources/dist/js/upload.js"></script>


    <style>
        .naver{
            background-color:#1EC800;
            margin-top: 5px;
            color:white;
        }
        .naverImg{
            /*background-color:#1EC800;*/
            height:32px;
            margin:auto;
            padding-right:4px;
            padding-left:4px;
            padding:3px;
        }
        /*.naverImg:hover {*/
        /*!*box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);*!*/
        /*background-color: #00b300;*/
        /*}*/
        .naver:hover{
            /*box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);*/
            background-color: #00b300;
            color:white;
        }


        .navbar {
            margin-bottom: 20px;
        }

    </style>

<script>

    var chkid=false;
    var chkName=false;
    var chkpass=false;
    //console.log(signup);
    function checkvalue() {
        // console.log('3번째: '+signup.userPassword.value);
        // console.log('4번째: '+signup.chkPassword.value);
        if(signup.password.value && signup.chkPassword.value) {
            if(signup.password.value.trim().length >40){
                alert("비밀번호는 40자 이내로 입력해 주세요.");
                return false;
            }
            if(signup.chkPassword.value.trim().length >40){
                alert("비밀번호 확인 40자 이내로 입력해 주세요.");
                return false;
            }
            if(signup.password.value!=signup.chkPassword.value){
                $('#pwsame').text('비밀번호가 일치하지 않습니다.');
                $('#pwsame').css("color","red");
                chkpass=false;
            }else if(signup.password.value===signup.chkPassword.value) {
                $('#pwsame').text('비밀번호가 일치합니다.');
                $('#pwsame').css("color","#2EFE2E");
                chkpass=true;
            }
        } else {
            $('#pwsame').text('비밀번호와 비밀번호확인을 입력해주세요.');
            $('#pwsame').css("color","red");
            chkpass=false;
        }
    }


    function signinchk(obj){
        if(!obj.email.value || obj.email.value.trim().length ==0){
            alert("이메일이 입력되지 않았습니다.");
            obj.email.value ="";
            obj.email.focus();
            return false;
        }
        if(!chkid){
            alert("이메일 중복체크를 실행해주세요.");
            obj.email.focus();
            return false;
        }
        if(!chkName){
            alert("이름 중복체크를 실행해주세요.");
            obj.nickname.focus();
            return false;
        }
        if(!obj.password.value || obj.password.value.trim().length ==0){
            alert("비밀번호를 입력해주세요.");
            obj.password.value ="";
            obj.password.focus();
            return false;
        }
        if(!obj.nickname.value || obj.nickname.value.trim().length ==0){
            alert("이름을 입력해주세요.");
            obj.nickname.value ="";
            obj.nickname.focus();
            return false;
        }
        if(!chkpass){
            alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요");
            return false;
        }
    }
</script>
<script>
    $(document).on('click','#authenticate',function(){
        var email = $('#email').val();

        var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

        if(!email || email.trim().length ==0){
            alert("이메일이 입력되지 않았습니다.");
            return false;
        }
        if(email.trim().length >40){
            alert("E-mail은 40자 이내로 입력해 주세요.");
            return false;
        }
        if(regex.test(email) === false) {
            alert("잘못된 이메일 형식입니다.");
            return false;
        } else {

            $.ajax({
                url:'/user/authenticate',
                type:'POST',
                data: {'email' : email},
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                dataType : "json",

                success:function(data){
                    console.log("success")
                    alert(decodeURIComponent(data.msg))
                    if(data.chk == "T"){
                        chkid=true;
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown){

                    alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
                }
            }); }
    });

    $(document).on('click','#authenticateName',function(){
        var nickname = $('#nickname').val();
        console.log(nickname);

        if(nickname.trim().length >20){
            alert("이름을 20자 이내로 입력해 주세요.");
            return false;
        }

        if(!nickname || nickname.trim().length ==0){
            alert("유저 네임이 입력되지 않았습니다.");
            return false;
        } else {
            $.ajax({
                url:'/user/authenticateName',
                type:'POST',
                data: {'nickname' : nickname},
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                dataType : "json",

                success:function(data){
                    console.log("success")
                    alert(decodeURIComponent(data.msg))
                    if(data.chk == "T"){
                        //alert('사용 가능한 이름입니다.' );
                        chkName=true;
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown){

                    alert('서버와의 통신이 원할하지 않습니다.\n다시 시도 해 주십시오.' );
                }
            }); }
    });
</script>
<link href="/resources/dist/css/login.css" rel="stylesheet">

<div  id="regiser">
	<div class="wrapper fadeInDown text-center">

		<div class="card border-secondary mb-3" style="max-width: 40rem;" id="formContent">

			<div class="card-header" style="background-color: black">

				<h1 class="text-white hn">회원가입</h1>

			</div>
			<div class="card-body text-secondary" id="formFooter">
				<!-- Icon -->
				<%--<div class="fadeIn first">--%>
				<%--<img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon" alt="User Icon" />--%>
				<%--</div>--%>

				<form role="form" name="signup"  method="post" onsubmit="return signinchk(this)">
					<table>
						<tr>
							<div class="control-group">
								<td></td>
								<td><input type = "text" class="form-control" name="email" id="email" placeholder="Email 주소를 입력해주세요" autofocus></td><td><button type="button" class="btn btn-warning" id="authenticate">중복체크</button></td><br>
							</div>
						<tr>
							<td></td>
							<td><input type = "text" class="form-control"  name="nickname" id="nickname"  placeholder="사용자이름" ></td><td><button type="button" id="authenticateName" class="btn btn-warning">중복체크</button></td>
						</tr>
						<tr>
							<td></td>
							<td><input type = "password" class="form-control"  name="password" id="password" onkeyup="checkvalue()" placeholder="패스워드를 입력해주세요" ></td>
						</tr>
						<tr>
							<td></td>
							<td><input type = "password" class="form-control" name="chkPassword" id="chkPassword" onkeyup="checkvalue()"  placeholder="패스워드를 다시 한 번 입력해주세요" ></td>
						</tr>
						<tr>
							<td width="96" height="36" ></td>
							<td><p id="pwsame" name="pwsame"  ></p></td>
						</tr>
						<tr>
							<td></td>
							<td><input type = "submit" value = "회원가입" class="btn btn-primary"></td>
						</tr>
					</table>

				</form>

			</div>
		</div>
	</div>
</div>