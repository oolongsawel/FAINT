<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header class="header-wrapper">
	<div class="main-header">
		<div class="container">
			<div class="row">
				<div class="logo-wrapper">
					<a href="${pageContext.request.contextPath}" class="logo"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Our Planners"></a>
				</div>
				<div class="col-sm-12 col-md-10">
					<nav class="navbar-right">
						<ul class="menu">
							<li class="toggle-menu"><span class="title">Menu</span> <span class="icon"><i></i><i></i><i></i></span></li>
							<li><a  href="${pageContext.request.contextPath}/board/service?board_type=E">기술자 게시판 리스트</a></li>
							<li><a  href="${pageContext.request.contextPath}/board/service?board_type=C">의뢰인 게시판 리스트</a></li>

							<c:choose>
								<c:when test="${empty loginUserInfo}">
									<li><a  href="${pageContext.request.contextPath}/member/login">로그인</a></li>
									<li><a  href="${pageContext.request.contextPath}/member/join">회원가입</a></li>
								</c:when>
								<c:otherwise>
									<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><span class="text-uppercase">${loginUserInfo.user_id}님</span> <span class="caret"></span></a>
										<ul class="dropdown-menu">
											<c:if test="${not empty loginUserInfo && loginUserInfo.is_admin=='Y'}">
												<li><a href="${pageContext.request.contextPath}/admin/">관리자페이지</a></li>
											</c:if>
											<li><a href="${pageContext.request.contextPath}/mypage/myplan">마이플랜</a></li>
											<li><a href="${pageContext.request.contextPath}/message">쪽지함</a></li>
											<li><a href="${pageContext.request.contextPath}/profile/${loginUserInfo.user_id}">프로필</a></li>
											<li><a href="${pageContext.request.contextPath}/member/myinfo">계정정보</a></li>
											<li><a href="${pageContext.request.contextPath}/member/change_password">비밀번호 변경</a></li>
											<li><a href="${pageContext.request.contextPath}/member/withdraw">회원탈퇴</a></li>
										</ul></li>

									<li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
								</c:otherwise>
							</c:choose>
							
						</ul>

					</nav>
				</div>
			</div>
		</div>
	</div>
</header>