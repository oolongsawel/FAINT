<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#sidebar">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a id="menu-medium" class="sidebar-toggle tooltips"> <i class="fa fa-outdent"></i>
				</a> <a class="#" href="${pageContext.request.contextPath}/admin/"></a>
			</div>
			<div class="navbar-center">관리자들만의 </div>
			<div class="navbar-collapse collapse">
				<!-- BEGIN TOP NAVIGATION MENU -->
				<ul class="nav navbar-nav pull-right header-menu">
					<!-- BEGIN NOTIFICATION DROPDOWN -->
					<li class="dropdown" id="notifications-header"><a href="${pageContext.request.contextPath}/admin/notification" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> <i class="glyph-icon flaticon-notifications"></i> <span class="badge badge-danger badge-header">6</span>
					</a>
						<ul class="dropdown-menu">
							<li class="dropdown-header clearfix">
								<p class="pull-left">알림</p>
							</li>
							<li>
								<ul class="dropdown-menu-list withScroll" data-height="220">
									<li><a href="#"> <i class="fa fa-star p-r-10 f-18 c-orange"></i> Steve have rated your photo <span class="dropdown-time">Just now</span>
									</a></li>
									<li><a href="#"> <i class="fa fa-heart p-r-10 f-18 c-red"></i> John added you to his favs <span class="dropdown-time">15 mins</span>
									</a></li>
									<li><a href="#"> <i class="fa fa-file-text p-r-10 f-18"></i> New document available <span class="dropdown-time">22 mins</span>
									</a></li>
									<li><a href="#"> <i class="fa fa-picture-o p-r-10 f-18 c-blue"></i> New picture added <span class="dropdown-time">40 mins</span>
									</a></li>
									<li><a href="#"> <i class="fa fa-bell p-r-10 f-18 c-orange"></i> Meeting in 1 hour <span class="dropdown-time">1 hour</span>
									</a></li>
									<li><a href="#"> <i class="fa fa-bell p-r-10 f-18"></i> Server 5 overloaded <span class="dropdown-time">2 hours</span>
									</a></li>
									<li><a href="#"> <i class="fa fa-comment p-r-10 f-18 c-gray"></i> Bill comment your post <span class="dropdown-time">3 hours</span>
									</a></li>
									<li><a href="#"> <i class="fa fa-picture-o p-r-10 f-18 c-blue"></i> New picture added <span class="dropdown-time">2 days</span>
									</a></li>
								</ul>
							</li>
							<li class="dropdown-footer clearfix"><a href="${pageContext.request.contextPath}/admin/notification" class="pull-left">모든 알림 보기</a> <a href="${pageContext.request.contextPath}/admin/notification" class="pull-right"> <i class="fa fa-cog"></i>
							</a></li>
						</ul></li>
					<!-- END NOTIFICATION DROPDOWN -->
					<!-- BEGIN MESSAGES DROPDOWN -->
					<li class="dropdown" id="messages-header"><a href="${pageContext.request.contextPath}/admin/message" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> <i class="glyph-icon flaticon-email"></i> <span class="badge badge-primary badge-header"> 8 </span>
					</a>
						<ul class="dropdown-menu">
							<li class="dropdown-header clearfix">
								<p class="pull-left">메시지</p>
							</li>
							<li class="dropdown-body">
								<ul class="dropdown-menu-list withScroll" data-height="220">
									<li class="clearfix"><span class="pull-left p-r-5"> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3">
									</span>
										<div class="clearfix">
											<div>
												<strong>SONGMINSEOK</strong> <small class="pull-right text-muted"> <span class="glyphicon glyphicon-time p-r-5"></span>12 mins ago
												</small>
											</div>
											<p>Lorem ipsum dolor sit amet, consectetur...</p>
										</div></li>
									<li class="clearfix"><span class="pull-left p-r-5"> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar4.png" alt="avatar 4">
									</span>
										<div class="clearfix">
											<div>
												<strong>John Smith</strong> <small class="pull-right text-muted"> <span class="glyphicon glyphicon-time p-r-5"></span>47 mins ago
												</small>
											</div>
											<p>Lorem ipsum dolor sit amet, consectetur...</p>
										</div></li>
									<li class="clearfix"><span class="pull-left p-r-5"> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar5.png" alt="avatar 5">
									</span>
										<div class="clearfix">
											<div>
												<strong>Bobby Brown</strong> <small class="pull-right text-muted"> <span class="glyphicon glyphicon-time p-r-5"></span>1 hour ago
												</small>
											</div>
											<p>Lorem ipsum dolor sit amet, consectetur...</p>
										</div></li>
									<li class="clearfix"><span class="pull-left p-r-5"> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar6.png" alt="avatar 6">
									</span>
										<div class="clearfix">
											<div>
												<strong>James Miller</strong> <small class="pull-right text-muted"> <span class="glyphicon glyphicon-time p-r-5"></span>2 days ago
												</small>
											</div>
											<p>Lorem ipsum dolor sit amet, consectetur...</p>
										</div></li>
								</ul>
							</li>
							<li class="dropdown-footer clearfix"><a href="${pageContext.request.contextPath}/admin/message" class="pull-left">모든 메시지 보기</a> <a href="${pageContext.request.contextPath}/admin/message" class="pull-right"> <i class="fa fa-cog"></i>
							</a></li>
						</ul></li>
					<!-- END MESSAGES DROPDOWN -->
					<!-- BEGIN USER DROPDOWN -->
					<li class="dropdown" id="user-header"><a href="#" class="dropdown-toggle c-white" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> <img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar2.png" alt="user avatar" width="30" class="p-r-5"> <span class="username">Bob Nilson</span> <i class="fa fa-angle-down p-r-10"></i>
					</a>
						<ul class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/admin/profile"> <i class="glyph-icon flaticon-account"></i> 나의 프로필
							</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/profile/modify"> <i class="glyph-icon flaticon-settings21"></i> 계정 설정
							</a></li>
							<li class="dropdown-footer clearfix"><a href="javascript:;" class="toggle_fullscreen" title="Fullscreen"> <i class="glyph-icon flaticon-fullscreen3"></i>
							</a> <a href="${pageContext.request.contextPath}/admin/lockscreen" title="Lock Screen"> <i class="glyph-icon flaticon-padlock23"></i>
							</a> <a href="${pageContext.request.contextPath}/admin/logout" title="Logout"> <i class="fa fa-power-off"></i>
							</a></li>
						</ul></li>
					<!-- END USER DROPDOWN -->
					<!-- BEGIN CHAT HEADER -->
					<li id="chat-header"><a href="#" class="c-white" id="chat-toggle"> <i class="glyph-icon flaticon-speech76 f-24"></i> <span id="chat-notification" class="notification notification-danger hide" data-delay="2000"></span>
					</a>
						<div id="chat-popup" class="chat-popup hide" data-delay="2000">
							<div class="arrow-up"></div>
							<div class="chat-popup-inner bg-blue">
								<div>
									<div class="clearfix w-600">
										<img src="${pageContext.request.contextPath}/resources/pixit/admin/assets/img/avatars/avatar3.png" alt="avatar 3" width="30" class="pull-left img-circle p-r-5">Alexa Johnson
									</div>
									<div class="message m-t-5">Hey you there?</div>
								</div>
							</div>
						</div></li>
					<!-- END CHAT HEADER -->
				</ul>
				<!-- END TOP NAVIGATION MENU -->
			</div>
		</div>
	</nav>
