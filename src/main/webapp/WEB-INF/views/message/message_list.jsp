<%@page import="com.faint.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>|OUR PLANNERS</title>
<jsp:useBean id="today" class="java.util.Date" scope="page" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel='stylesheet'
	href='http://fonts.googleapis.com/css?family=Open+Sans:300,400,400italic,600,700|Raleway:300,400,500,600'>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<!-- CSS작업부분 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/commonTop_1.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/commonTop_2.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/commonBottom.css?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />">

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/images/icons/favicon.ico">


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js?ver=<fmt:formatDate value="${today}" pattern="yyyyMMddHHmmss" />"></script>

<script type="text/javascript">
	$(document).ready(function() {
		getListMessage(1, 1, 1);
	});
	//쪽지 쓰기
	$(document).ready(
			function() {
				$("#writeMessageBtn").on("click", function() {
					getWriteFormMessage();
				});
				//글쓰기 폼 가져오기
				function getWriteFormMessage() {
					$("#messageHead").text("전체 메세지");
					$.ajax({
						url : "${pageContext.request.contextPath}/message/new",
						type : "get",
						dataType : "html",
						contentType : "text/html; charset=UTF-8",
						success : function(d) {
							//alert(d);
							$("#messageBody").empty();
							$("#messageBody").html(d);
						},
						error : function(e) {
							popLayerMsg("AJAX Error 발생" + e.status + ":"
									+ e.statusText);
						}
					});
				}
			});
	//받은 쪽지함
	 $(document).ready(
	function() {
		$("#receivedMessage").on("click", function() {
			getReceivedMessage();
		});
		
		function getReceivedMessage() {
			$("#messageHead").text("받은 메세지");
			$.ajax({
				url : "${pageContext.request.contextPath}/message",
				type : "get",
				dataType : "html",
				contentType : "text/html; charset=UTF-8",
				success : function(d) {
					//alert(d);
					$("#messageBody").empty();
					$("#messageBody").html(d);
				},
				error : function(e) {
					popLayerMsg("AJAX Error 발생" + e.status + ":"
							+ e.statusText);
				}
			});
		}
	}); 
	//보낸 쪽지함
	$(document)
			.ready(
					function() {
						$("#sendedMessage").on("click", function() {
							getSendedMessage();
						});
						function getSendedMessage() {
							$("#messageHead").text("보낸 메세지");
							$
									.ajax({
										url : "${pageContext.request.contextPath}/message/sendedMessage",
										type : "get",
										dataType : "html",
										contentType : "text/html; charset=UTF-8",
										success : function(d) {
											//alert(d);
											$("#messageBody").empty();
											$("#messageBody").html(d);
										},
										error : function(e) {
											popLayerMsg("AJAX Error 발생"
													+ e.status + ":"
													+ e.statusText);
										}
									});
						}
					});
	//쪽지 보관함
	$(document)
			.ready(
					function() {
						$("#messageStorage").on("click", function() {
							getMessageStorage();
						});
						function getMessageStorage() {
							$("#messageHead").text("쪽지 보관함");
							$
									.ajax({
										url : "${pageContext.request.contextPath}/message/messageStorage",
										type : "get",
										dataType : "html",
										contentType : "text/html; charset=UTF-8",
										success : function(d) {
											//alert(d);
											$("#messageBody").empty();
											$("#messageBody").html(d);
										},
										error : function(e) {
											popLayerMsg("AJAX Error 발생"
													+ e.status + ":"
													+ e.statusText);
										}
									});
						}
					});
	$('#writeActionBtn').click(function() {
		//폼값 검증
		if ($("input[type='text'][name='receiver_srl']").val() == "") {
			popLayerMsg("받는 이를 입력해주세요");
			$("input[type='text'][name='receiver_srl']").focus();
			return;
		}
		if ($("input[type='text'][name='title']").val() == "") {
			popLayerMsg("제목을 입력해주세요");
			$("input[type='text'][name='title']").focus();
			return;
		}
		if ($("input[type='text'][name='contents']").val() == "") {
			popLayerMsg("내용 입력해주세요");
			$("input[type='text'][name='contents']").focus();
			return;
		}
		//글쓰기 처리
		var params = $('#writeMessageFrm').serialize();
		$.ajax({
			cache : false, // 캐시 사용 없애기
			url : "${pageContext.request.contextPath}/message",
			type : "post",
			dataType : "json",
			data : params,
			success : function(d) {
				if (d.result == "success") {
					popLayerMsg("쪽지를 보냈습니다.");
					getListMessage(1, 1, "");
				}
			},
			error : function(e) {
				alert("요청실패:" + e.status + " " + e.statusText);
			}
		});
	});
	function messagePaging(message_srl) {
		getListMessage(message_srl);
	}
	//리스트 가져오기
	function getListMessage(message_srl) {
		message_srl = typeof message_srl !== 'undefined' ? message_srl : 1;
		var url = "${pageContext.request.contextPath}/message/json/message_list.json";
		var inHTML = "";
		inHTML += "<div class=\"panel-group panel-accordion dark-accordion\">";
		inHTML += "		<div class=\"row\" >";
		var inHTMLPaging = "";
		$("#messageBody").empty();
		var params = "message_srl=" + message_srl;
		$
				.ajax({
					url : url,
					dataType : "json",
					type : "get",
					data : params,
					contentType : "text/html; charset=utf-8",
					success : function(data) {
						$
								.each(
										data.messageLists,
										function(index, messageList) { // each로 모든 데이터 가져와서 items 배열에 넣고
											inHTML += "<div id=\"messageDiv_"
													+messageList.message_srl
													+ "\" class=\"mix  col-lg-12 panel panel-default\" data-value=\""
													+ (index + 1)
													+ "\" style=\"display: inline-block;\">";
											inHTML += "	<div class=\"panel-heading\">";
											inHTML += "		<h4 class=\"panel-title\">";
											inHTML += "			<a class=\"collapsed\" data-toggle=\"collapse\" data-parent=\"#messageBody\" href=\"#question"
													+ (index + 1)
													+ "\"> <strong class=\"c-gray-light\">"
													+ "보낸사람 : "
													+ messageList.sender_srl
													+ "</br>"
													+ "</strong> "
													+ messageList.title;
											inHTML += "			</a>";
											inHTML += "		</h4>";
											inHTML += "	</div>";
											inHTML += "	<div id=\"question"
													+ (index + 1)
													+ "\" class=\"panel-collapse collapse\" style=\"height: 0px;\">";
											inHTML += "		<div class=\"panel-body\">";
											inHTML += "			<p>"
													+ messageList.contents
													+ "</p>";
											inHTML += "		</div>";
											inHTML += "		<div class=\"panel-footer\">";
											inHTML += messageList.postdate
											inHTML += "		</div>";
											inHTML += "		<div class=\"panel-footer\">";
											inHTML +="<button type=\"button\" class=\"btn btn-danger\" onclick=\"javascript:deleteMessage('" + messageList.message_srl + "');\" >삭제</button>";
											inHTML += "		</div>";
											inHTML += "	</div>";
											inHTML += "</div>";
										});//each끝
						inHTML += "<div class=\"row text-center\">";
						inHTML += "<ul class=\"pagination\" id=\"messagePagingDiv\">";
						inHTML += "</ul> </div>";
						inHTML += "		</div>";
						inHTML += "		</div>";
						$("#messageBody").html(inHTML);
						$("#messagePagingDiv").html(data.pagingDiv);
					},
					error : function(e) {
						popLayerMsg("AJAX Error 발생" + e.status + ":"
								+ e.statusText);
					}
				});
	}
	function deleteMessage(message_srl) {
		if (confirm("정말로 삭제 하시겠습니까?")) {
			var url = "${pageContext.request.contextPath}/message/" + message_srl;
			//alert(url);
			$.ajax({
				url : url,
				type : 'delete',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				
				dataType : "json",
				contentType : "text/html; charset:utf-8",
				success : function(d) {
					if (d.result == "fail") {
						popLayerMsg("게시물 삭제에 실패하였습니다.");
					} else if (d.result == "success") {
						popLayerMsg("게시물 삭제에 성공하였습니다.");
						$("#messageDiv_" + message_srl).hide(1000);
						$(document).ready(function() {
							getListMessage(1, 1, 1);
						});
					}
				},
				error : function(e) {
					popLayerMsg("AJAX Error 발생" + e.status + ":" + e.statusText);
				}
			});
		}
	}
	//setInterval("${pageContext.request.contextPath}/message/", 3000);
		
</script>
<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>

</head>

<body>
	<!-- PRELOADER -->
	<img id="preloader"
		src="${pageContext.request.contextPath}/resources/images/preloader.gif"
		alt="" />
	<!-- //PRELOADER -->
	<div class="preloader_hide">

		<!-- Top영역 1첫번째 -->
		<div class="row">
			<%@ include file="../common/commonTop_1.jsp"%>
		</div>
		<!-- Top영역 2첫번째  (마이페이지부분의 탑2 적용)-->
		<div class="row">
			<%@ include file="../common/commonTop_2_mypage.jsp"%>
		</div>

		<!-- HOME -->
		<section id="main" class="section" style="margin-top: 100px;">

			<!-- CONTAINER -->
			<div id="messageGroup" class="container ">
				<div class="row margin-top-30">
					<div class="col-xs-2">
						<h2>
							<b>메시지</b>
						</h2>
						<h4 class="margin-top-10">
							<a id="receivedMessage" href="javascript:void(0)"
								class="messageLink  plain">받은 쪽지함</a>
						</h4>


						<h4 class="margin-top-10">
							<a id="sendedMessage" href="javascript:void(0)"
								class="messageLink  plain">보낸 쪽지함</a>
						</h4>
						<h4 class="margin-top-10">
							<a id="messageStorage" href="javascript:void(0)"
								class="messageLink  plain">쪽지 보관함</a>
						</h4>
					</div>
					<div class="col-xs-10">
						<div class="row">
							<div class="col-xs-9">
								<div id="dropdownMenuGroup" class="pull-left" role="group">
									<button id="messageListDropdownBtn" type="button"
										class="border-radius padding-top-5 padding-bottom-5 padding-left-10 padding-right-10 btn btn-default dropdown-toggle"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<input id="checkboxMenu" type="checkbox" /> <span
											class="dropdown-square"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="javascript:void(0);">전체선택</a></li>
										<li><a href="javascript:void(0);">선택해제</a></li>
										<li><a href="javascript:void(0);">별표 선택</a></li>
										<li><a href="javascript:void(0);">별표 없음 선택</a></li>
									</ul>
								</div>

								<div class="pull-left margin-left-10">
									<a class="btn btn-default btn-xss" href="javascript:void(0);"
										role="button"> <i
										class="fa fa-trash-o fa-lg font-color-lighter"
										aria-hidden="true"></i>
									</a>
								</div>
								<div class="pull-left margin-left-10">
									<div class="input-group width-180px">
										<input id="searchKeywordInput" type="text"
											class="form-control input-xs padding-right-45"
											placeholder="상대방 닉네임 검색" /> <span> <a
											class="btn btn-xss btn-default message-list-search-input-group-btn"
											type="button"> <i
												class="fa fa-search fa-lg font-color-lighter"
												aria-hidden="true"></i>
										</a>
										</span>
									</div>
								</div>
							</div>
							<div class="col-xs-3">
								<div class="width-105 pull-right">
									<div class="pull-left margin-all-0 font-size-h6">
										<span class="inline-block text-left"> 메시지 응답률 </span> <span
											class="inline-block color-dark-gray pull-right">
											0&nbsp;% </span>
									</div>

									<div class="message-response-background">
										<div class="message-response-bar bg-color-danger"
											style="width: 0%;"></div>
									</div>

								</div>
							</div>
						</div>

						<!-- CONTAINER -->
						<section class="section-4">
							<div class="container">
								<div class="row">

									<div class="col-sm-7 col-md-9 space-left">
										<div class="row">
											<div class="col-sm-12">

												<div class="page-title">
													<i class="icon-custom-left"></i>

													<c:choose>

														<c:when test="${not empty loginUserInfo}">
															<button type="button" class="pull-right btn btn-success"
																id="writeMessageBtn">쪽지 쓰기</button>

														</c:when>

														<c:otherwise>

														</c:otherwise>
													</c:choose>
												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="panel panel-default">
															<div class="panel-heading" id="messageHead">메세지</div>
															<div class="panel-body" id="messageBody">

																<div class="panel-group panel-accordion dark-accordion">

																	<div class="row">
																		<div
																			class="mix category-1 col-lg-12 panel panel-default"
																			data-value="1" style="display: inline-block;">
																			<div class="panel-heading">
																				<h4 class="panel-title">
																					<a class="collapsed" data-toggle="collapse"
																						data-parent="#messageBody" href="#question1">
																						<strong class="c-gray-light">1.</strong> Our
																						Company Mission
																					</a>
																				</h4>
																			</div>
																			<div id="question1" class="panel-collapse collapse"
																				style="height: 0px;">
																				<div class="panel-body">
																					<p>The world</p>
																					<ol>
																						<li>To inspire moments of optimism and
																							happiness...</li>
																						<li>To create value and make a difference.</li>
																						<li>Pellentesque rhoncus arcu sed nisl</li>
																						<li>In eget dolor nec tortor tempor blandit.</li>
																					</ol>
																				</div>
																			</div>
																		</div>
																		<div
																			class="mix category-1 col-lg-12 panel panel-default"
																			data-value="2" style="display: inline-block;">
																			<div class="panel-heading">
																				<h4 class="panel-title">
																					<a class="collapsed" data-toggle="collapse"
																						data-parent="#messageBody" href="#question2">
																						<strong class="c-gray-light">2.</strong> Our
																						Philosophy
																					</a>
																				</h4>
																			</div>
																			<div id="question2" class="panel-collapse collapse">
																				<div class="panel-body">
																					<p>The world is changing all around us. To ing
																						partners.</p>
																					<ol>
																						<li>To inspire moments of optimism and
																							happiness...</li>
																						<li>To create value and make a difference.</li>
																						<li>Pellentesque rhoncus arcu sed nisl</li>
																						<li>In eget dolor nec tortor tempor blandit.</li>
																					</ol>
																				</div>
																			</div>
																		</div>

																	</div>


																</div>

															</div>
														</div>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</section>
						@test
						<div id="messageListDiv" class="panel panel-default hidden"
							v-show="messageGroups.length > 0">
							<ul id="messageList" class="list-group">
								<li class="list-group-item active-hover padding-all-20"
									v-for="message in messageGroups"
									:class="{'bg-color-unread': message.unreadCnt > 0}">
									<div class="row">
										<div
											class="message-list-checkbox position-relative pull-left padding-left-15 padding-right-15">
											<div class="awesome-checkbox">
												<label> <input id="chkbox_{{ message.id }}"
													type="checkbox" /> <span class="awesome-checkbox-body"></span>
													<div class="awesome-checkbox-text"></div>
												</label>
											</div>
										</div>
										<div
											class="message-list-starred cursor position-relative pull-left"
											id="STARRED_{{message.id}}" data-toggle="tooltip"
											:title="message.message_group_utilities.length == 0 ? '별표' : '별표 해제'">
											<i class="fa "
												:class="{'fa-star-o-inactive': message.message_group_utilities.length == 0 || (message.message_group_utilities.length > 0 && message.message_group_utilities[0].status == 0), 'fa-star-active': message.message_group_utilities.length > 0 && (message.message_group_utilities[0].status == 1 || message.message_group_utilities[0].status == null)}"
												aria-hidden="true"></i>
										</div>
										<div
											class="message-list-profile position-relative pull-left padding-left-15">
											<a href="https://kmong.com/message/{{message.username}}">
												<img class="width-25px border-round border-solid"
												title="{{message.username}}"
												onError="this.onerror=null;this.src='/img/tools/main_user_gray.png';" />
											</a>
										</div>
										<div
											class="message-list-text-wrapper pull-left padding-left-15">
											<a class="plain-color-default"
												href="https://kmong.com/message/{{message.username}}">
												<div class="col-xs-2 ellipsis padding-left-0 width-95px">{{message.username}}</div>
												<div
													class="col-xs-10 padding-left-0 ellipsis font-color-base"
													v-if="message.action != 'REQUEST'" v-html="message.message"></div>
												<div class="col-xs-10 padding-left-0 ellipsis"
													v-if="message.action == 'REQUEST' && message.isMine">
													<span class="label label-info">결제요청</span>&nbsp;<span
														v-if="message.action_status != -1">내가 보낸 결제요청
														메시지입니다.</span><span v-if="message.action_status == -1">내가
														보낸 결제요청을 철회했습니다.</span>
												</div>
												<div class="col-xs-10 padding-left-0 ellipsis"
													v-if="message.action == 'REQUEST' && !message.isMine">
													<span class="label label-info">결제요청</span>&nbsp;<span
														v-if="message.action_status != -1">내가 받은 결제요청
														메시지입니다.</span><span v-if="message.action_status == -1">내가
														받은 결제요청이 철회되었습니다.</span>
												</div>
												<div class="col-xs-10 padding-left-0 ellipsis"
													v-show="message.action == 'NO_ANSWERED'">
													<span class="label label-purple">상담요청</span>&nbsp;<span
														class="color-purple">부재중인 상담요청이 있습니다.</span>
												</div>

											</a>
										</div>
										<div
											class="message-list-time text-right font-color-lighter pull-left padding-left-15 padding-right-15">{{
											message.time }}</div>
									</div>
								</li>
							</ul>
						</div>

						<div
							class="panel bg-color-transparent border-solid border-radius-0"
							v-show="messageGroups.length == 0 && page > 1"
							style="display: none">
							<div
								class="panel-body text-center padding-top-40 padding-bottom-40">



								<div>
									<img class="width-50px" src="/img/seller/nothing.png"
										title="내역없음">
								</div>
								<h5 class="font-color-light">내역이 없습니다.</h5>
								@test
							</div>
						</div>

						<div id="messageGroupsLoadingImg"
							class="loadingDiv text-center margin-top-150 margin-bottom-15 hidden">
							<img class="margin-bottom-50"
								src="/img/tools/kmong_loading_f.gif" v-if="page == 1">
							<div v-if="page > 1" class="la-ball-fall color-black">
								<div></div>
								<div></div>
								<div></div>
							</div>
						</div>

						<div id="messageGroupsPageLoading"
							class="text-center margin-top-30 hidden">
							<div class="la-ball-fall color-black">
								<div></div>
								<div></div>
								<div></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //CONTAINER -->
		</section>
		<!-- //HOME -->

		<!-- 모달창 -->
		<%@ include file="../common/modal_msg.jsp"%>
		<!-- //모달창 끝 -->

		<!-- Footer section(하단부분) -->
	</div>
</body>
</html>