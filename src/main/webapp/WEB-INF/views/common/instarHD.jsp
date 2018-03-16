<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--데이터 보내는거니까 form -->
<!--키워드 넣는 박스  -->
<center>
<nav class="navbar navbar-default"  >
        <div class="nav-wrap">
             <a class="logo pull-left" href="#"></a>
            <form class="search-form" action="/search/search" method="get">
                <input class="textInput" type="text" name='inputKeyword' id='keywordInput' value="#"
                placeholder="검색" title="사람검색@ 태그검색# 위치검색*"
                list="results"  data-toggle="modal" data-target="#searchModal" data-backdrop="true">
                <span class="search-icon"></span>
            </form>
             <span class="pull-right">
                <a class="explore" href="/#" ></a>
                <a class="new-post" href="#"></a>
                <a class="follow-list" href="#"></a>
                <a class="account" href="#"></a>
            </span> 
        </div>
    </nav>  
<div>
</div>
</body>
</html>