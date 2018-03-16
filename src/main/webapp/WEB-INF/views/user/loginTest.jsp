<%@page import="com.sun.org.apache.xalan.internal.xsltc.compiler.Template"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
    var memberID=Boolean(${login.memberID});
    if(memberID){
        alert("이미 로그인 되어있습니다. 로그아웃 해주세요");
        self.location = "/";
    }

</script>
	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                    <input 
                        type="text"
                        id="memberEmail"
                        name="memberEmail"
                        placeholder="전화번호 또는 이메일 "
                        
                       
       
                        class="login__input"
                    />
                    <div class="form-control">
                        <input 
                            type="password"
                            name="memberPassword"
                            placeholder="비밀번호"
                            required
                            class="login__input"
                        />
                        <a href="/user/findPassword">Forgot?</a>
                       
                    </div>
                    <input type="submit" value="Log in" class="form-control btn btn-primary" >
                </form>
                <span class="login__form-divider">or</span>
           	<a class="btn btn-block btn-social btn-google" href="/user/googleLogin" onclick="_gaq.push(['_trackEvent', 'btn-social', 'click', 'btn-google']);">
                        <span class="fa fa-google mt-1 ml-2"></span> Sign in with Google
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
				<%-- <input type="checkbox" name="id_rem" <%if(id.length()>1)out.println("checked") ;%> value="1">아이디 저장 --%>
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
</html>