<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

    <link rel="shortcut icon" href="/resources/images/favicon/idea.ico" type="image/x-icon" />
    <link rel="icon"  href="/resources/images/favicon/idea.ico"  type="image/x-icon"  />
    <title>FFFFAAAAIIIINNT</title>
    <!--필수 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=0.5, maximum-scale=1, user-scalable=no">

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
    var memberID=Boolean(${login.id});
    if(memberID){
        alert("이미 로그인 되어있습니다. 로그아웃 해주세요");
        self.location = "/";
    }

</script>
<link href="/resources/dist/css/login.css" rel="stylesheet">
<div  id="login">
    <div class="wrapper fadeInDown text-center">

        <div class="card border-secondary mb-3" style="max-width: 20rem;" id="formContent">

            <div class="card-header" style="background-color: black">


                <h1 class="text-white hn">Log in</h1>

            </div>
            <div class="card-body text-secondary" id="formFooter">

                <!-- Login Form -->
                <form name="login" action="/user/loginPost" method="post">


                    <input type="text" class="form-control" id="email" name="email" placeholder="가입한 Email을 입력해주세요" autofocus>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password를 입력해주세요" >
                    <input type="submit" class="form-control btn btn-primary" value="로그인"/>

                </form>

             
                <div>
                    <%--<a href="/user/githubLogin">--%>
                    <%--<img width="100%" height="50" src="/resources/images/github.png"/>--%>
                    <%--</a>--%>
                    <a class="btn btn-block btn-social btn-google naver"  href="/user/naverLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-google']);">
                        <img class="naverImg ml-2" src="/resources/images/naver.png"/> Sign in with Naver
                    </a>
                    <a class="btn btn-block btn-social btn-google" href="/user/googleLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-google']);">
                        <span class="fa fa-google mt-1 ml-2"></span> Sign in with Google
                    </a>
                   <!--  <a class="btn btn-block btn-social btn-github" href="/user/githubLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-github']);">
                        <span class="fa fa-github mt-1 ml-2"></span> Sign in with GitHub
                    </a> -->
                </div>

                <button type="button" class="btn btn-block btn-social btn-tumblr" style="width:49%;margin-top: 4px;display: inline-block;text-align: center;padding-left: 0px;padding-right:0px;" onclick="location.href='/user/register'">회원가입</button>
                <button type="button" class="btn btn-block btn-social btn-tumblr" style="width:49%;margin-top: 4px;;display: inline-block;text-align: center;padding-left: 0px;padding-right:0px;" onclick="location.href='/user/findPassword'">비밀번호 찾기</button></div>


        </div>
    </div>

</div>
	

<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/dist/css/login1.css" rel="stylesheet">
  <link rel="stylesheet" href="/resources/dist/css/footer1.css">  
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<title>Insert title here</title>
<script type="text/javascript" src="script/member.js"></script>
</head>

<body>
    <main class="login">
        <div id="phone-image">
            <img 
                src="/resources/images/phoneImage.png"
                alt="Phone image"
                title="Phone image" 
            />
        </div>
        <section id="login">
            <div class="login__box login__box--form">
                <img
                    src="/resources/images/logoLogin.png" 
                    alt="Logo login"
                    title="Logo login"
                    class="login__logo"
                />
                <form name="login" action="/user/loginPost" method="post">
                <input type="hidden" name="command" value="main_form">
                    <input type="text" id="email" name="email" placeholder="전화번호 또는 이메일 " class="login__input" />
                    <div class="form-control">
                        <input type="password" name="password" placeholder="비밀번호" required class="login__input" />
                        <a href="/user/findPassword">Forgot?</a>
                    </div>
                    <input type="submit" value="Log in" class="form-control btn btn-primary" >
                </form>
                <span class="login__form-divider">or</span>
           	<a class="btn btn-block btn-social btn-google" href="/user/googleLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-google']);">
                        <span class="fa fa-google mt-1 ml-2"></span> Sign in with Google
                    </a>
                    <a class="btn btn-block btn-social btn-google naver"  href="/user/naverLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-google']);">
                        <img class="naverImg ml-2" src="/resources/images/naver.png"/> Sign in with Naver
                    </a>
            </div>
            <div class="login__box login__box--account">
                <span class="login__text">
                    Don't have an account?
                </span>
                <a href="/user/register" class="login__link">Sign up</a>
            </div>
            <div class="login__box--transparent">
            <div style="text-align: left; margin: 5px; margin-bottom: 30px;">
				<input type="checkbox" name="id_rem" <%if(id.length()>1)out.println("checked") ;%> value="1">아이디 저장
			</div>
                <span class="login__text">Get the app.</span>
                <div class="login__appstores">
                    <img src="/resources/images/ios.png" />
                    <img src="/resources/images/android.png" />
                                        
                </div>
            </div>
        </section>
    </main>
    <footer>
        <nav class="footer__nav">
            <ul class="footer__list">
                <li class="footer__item"><a href="#" class="footer__link">about us</a></li>
                <li class="footer__item"><a href="#" class="footer__link">support</a></li>
                <li class="footer__item"><a href="#" class="footer__link">blog</a></li>
                <li class="footer__item"><a href="#" class="footer__link">press</a></li>
                <li class="footer__item"><a href="#" class="footer__link">api</a></li>
                <li class="footer__item"><a href="#" class="footer__link">jobs</a></li>
                <li class="footer__item"><a href="#" class="footer__link">privacy</a></li>
                <li class="footer__item"><a href="#" class="footer__link">terms</a></li>
                <li class="footer__item"><a href="#" class="footer__link">directory</a></li>
                <li class="footer__item"><a href="#" class="footer__link">language</a></li>
		        <span class="footer__copyright">© 2018 instagram</span>
            </ul>
        </nav>
    </footer>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"
  			integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  			crossorigin="anonymous"></script>
    <script src="js/app.js"></script>


</body>
</html> --%>