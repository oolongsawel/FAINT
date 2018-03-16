<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="/resources/css/nav.css">  
    <link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon">
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
         <!--필수 -->
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

    <script>
        var msg=Boolean("${msg}");
        if(msg){
            alert("${msg}");
        }
        $(document).ready(function() {
            $(".profileHeader").attr("src",getFileInfo("${login.memberPicture}"));
        });
    </script>
    <style>
   /*      .naver{
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
 */
    </style>
<title>Insert title here</title>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
    <nav class="navigation">
        <span class="navigation__wrapper">
        <div class="navigation__column">
            <a href="feed.html">
                <img src="/resources/images/logoo.png" />
            </a>
        </div>
        <div class="navigation__column">
<!--             <i class="fa fa-search"></i>
            <input type="text" placeholder="Search">
        </div>
        <div class="navigation__column">
            <a href="explore.html" class="navigation__link">
                <i class="fa fa-compass"></i>
            </a>
            <a href="#" class="navigation__link">
                <i class="fa fa-heart-o" id="heart"></i>
            </a> -->
            <span class="pull-right">
                <a class="explore" href="/explore/expage" ></a>
                <a class="new-post" href="#"></a>
                <a class="follow-list" href="#"></a>
                <a class="account" href="#"></a>
            </span> 
            
<!--             <a href="login.jsp" class="navigation__link">
                <i class="fa fa-user-o"></i>
            </a> -->
             
             
             <div class="row col-6 justify-content-end align-items-center">
                <%--로그아웃 상태--%>
                <c:if test="${login eq null}">
					
                    <li class="nav-item">
                        <button  class="btn btn-outline-primary hn " onclick="location.href='/user/loginTest'" style="font-size: 20px ;height:50px;">로그인</button>
              
                </c:if>
                <%--로그인 상태--%>
                <c:if test="${login ne null}">
                    <%--<ul class="nav nav-pills ml-auto w-100 justify-content-end ". style="float: right;margin-right: 10%;">--%>
                    <li class="nav-item dropdown">
                    
                        <a class="nav-link dropdown-toggle  " data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <img  class="rounded-circle Photo profileHeader" src="" >${login.memberName}

                            </a>
                        <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 65px, 0px); top: 0px; left: 0px; will-change: transform;">
                            <div class="eclipsis pl-4" style="width:70% ">
                                <a class=" hn " >${login.memberName}</a>
                            </div>
                            <div class="dropdown-divider"></div>
                        <a class="dropdown-item hn" href="/user/myinfo">마이페이지</a>
                            <a class="dropdown-item hn" href='/user/logout'>로그아웃</a>
                        </div>
                    </li>
                    <%--</ul>--%>
                </c:if>
            </div>
        </div>
        

            <%--</ul>--%>
        </ul>

    </div>
        </span>
    </nav>
</body>
</html>