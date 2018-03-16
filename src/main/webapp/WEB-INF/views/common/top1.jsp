<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header id="header2" class="fixed">
	<div class="header-content clearfix">
		<a class="logo" href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt=""> &nbsp; Our Planners</a>
		<nav class="navigation" role="navigation">
			<ul class="primary-nav">
				<li><a href="${pageContext.request.contextPath}/board/service?board_type=C">기술자 게시판 리스트</a></li>
				<li><a href="${pageContext.request.contextPath}/board/service?board_type=C">의뢰인 게시판 리스트</a></li>
				<c:choose>
					<c:when test="${empty loginUserInfo}">
						<li><a href="${pageContext.request.contextPath}/member/login">로그인</a></li>
						<li><a href="${pageContext.request.contextPath}/member/join">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
						<li><a href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		<a href="#" class="nav-toggle">Menu<span></span></a>
	</div>
</header>


