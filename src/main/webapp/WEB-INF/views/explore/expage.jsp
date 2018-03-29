<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--헤더-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 모달 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
   
<!--검색창 부트스트랩  -->  
<link rel="stylesheet" href="/resources/bootstrap/css/nav-style.css"> 
  
<title>Insert title here</title>
<!-- jquery 2.1.4. -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<style>

/* .tit {
	text-overflow: ellipsis;
} */

/* 인기 검색어 스타일 */
h2 {
	text-align: center;
}
.topTag {
	border: 1px solid black;
	width: 50%;
	margin: auto;
}

ol  { list-style-type: decimal; }

em { 
	font-style: normal;
	cursor : pointer;
}


.num {
	display: block;
    float: left;
    min-width: 13px;
    _width: 13px;
    height: 12px;
    margin-right: 9px;
    border: 1px solid #e0e0e0;
    color: #666;
    line-height: 12px;
    font-size: 11px;
    text-align: center;
    font-family: tahoma,sans-serif;
}

li {
	width: 30%;
	margin: auto;
    display: list-item;
    text-align: -webkit-match-parent;
}

 li .keyword .tit {
    display: block;
    overflow: hidden;
    _width: 210px;
    font-size: 12px;
    color: #000;
    white-space: nowrap;
    text-overflow: ellipsis;
    word-wrap: normal;
}

span {
	display : inline-block;
	margin: 0;
    padding: 0;
    border: 0;
    font: inherit;
    vertical-align: baseline;
}
</style>


</head>
<body>

<!-- 인기 검색어 -->
<br/>
<br/>
<h2>인기 태그 검색어</h2>
<br/>

<div class="topTag">
<br/>
<c:forEach items="${toptag}" var="tagVO">
<ol>
<li style="list-style-type:none;">
	<a class="tagname" href='/search/tags?name=${tagVO.name}'>
	<span class="keyword">
	<em class="num"></em>
	<span class="tit">${tagVO.name}</span>
	</span>
	</a>
</li>
</ol>
</c:forEach>
</div>



<script type="text/javascript"> 

$(document).ready(function() {
	
    var len = document.getElementsByTagName("li").length;
    var em = document.getElementsByTagName("em");
        for(var i=0; i<len; i++){
        	em[i].innerText = i+1;
        }
    });

</script>



<!-- 인기 게시글 -->
<br/>
<br/>

<!-- 모달 적용한 것 -->

<h2>=====인기 게시물=====</h2>
<br/>


<script>
var jsonList=${jsonList};
console.log(jsonList);

</script>

<!-- 메인피드 -->
<jsp:include page="/WEB-INF/views/include/postFeed.jsp" flush="false" />

</body>
</html>