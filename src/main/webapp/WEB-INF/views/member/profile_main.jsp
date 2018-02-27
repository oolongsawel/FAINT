<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach items="${list}" var="UserVO">

<div>

	<label>profile test</label>
		<ul>
			<li><a href="/member/profile?id=${UserVO.id}">email = ${UserVO.email}</a></li>
			<li>password = ${UserVO.password}</li>
			<li>name = ${UserVO.name}</li>
			<li>nickname = ${UserVO.nickname}</li>
			<li>phonenumber = ${UserVO.phonenumber}</li>
			<li>website = ${UserVO.website}</li>
			<li>intro = ${UserVO.intro}</li>
		</ul>
</div>

</c:forEach>

<h1>----------------------------------------------</h1>

	<article>
		<header>
			<div>
				<a href="">
					<!-- 프로필 이미지 -->
					<img src="" alt="" />
				</a>
			</div>
			<div>
				<a href="">게시자 이름</a>
			</div>
			<div>
				<a href="">장소태그</a>
			</div>
		</header>
		<div>
			<img src="" alt="" />
		</div>
		<div>
			<section>
				<a href="">좋아요 아이콘</a>
				<a href="">댓글</a>
				<a href="">공유하기</a>
			</section>
			
			<section>
				<a href="">좋아요</a>
			</section>
			
			<div>
				<ul>
					<li><a href="">주인</a> 게시물 내용 내용 <a href="">내용더보기</a></li>
					<li><a href="">댓글 더보기</a></li>
					<li><a href="">댓글 작성자1</a> 댓글 내용</li>
					<li><a href="">댓글 작성자2</a> 댓글 내용</li>
				</ul>
			</div>
			
		</div>
	</article>
	
	
</body>
</html>