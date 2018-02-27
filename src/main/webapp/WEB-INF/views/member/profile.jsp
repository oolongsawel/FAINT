<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${userVO.name}(@${userVO.nickname})</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<style>

a{color:#000;}
 
.mask{width:100%; height:100%; position:fixed; left:0; top:0; z-index:10; background:#000; opacity:.5; filter:alpha(opacity=50);}
 
#modalLayer{display:none; position:relative;}
#modalLayer .modalContent{width:440px; height:200px; padding:20px; border:1px solid #ccc; position:fixed; left:50%; 
top:50%; z-index:11; background:#fff;}
#modalLayer .modalContent .exit{position:absolute; right:0; top:0; cursor:pointer;}


</style>
</head>
<body>

	<table>
		<tr>
			<td>${userVO.nickname}</td>
			<td class="isFlw"></td>
			<td><button>...</button></td>
		</tr>
		<tr>
			<td id="postCnt">게시물 0</td>
			<td id="followed">팔로워 0</td>
			<td id="following">팔로우 0</td>
		</tr>
		<tr>
			<td>${userVO.name}</td>
			<td>${userVO.intro}</td>
		</tr>
		<tr>
			<td><a href="${userVO.website}" >${userVO.website}</a></td>
		</tr>
	</table>
	
	<h1>-------------아래부터 피드---------------</h1>

	<!-- 프로필피드 -->
	<ul id="postList">
		<!-- 포스트 li 들어올 예정 -->
	</ul>
	
	<!-- 팔로우 팔로워 리스트(모달) -->
	<div id="modalLayer">
		<div class="modalContent">
			<button id="exit" type="button">X</button>
			<ul id="followList"></ul>
		</div>
	</div>


<script>

/* 각 게시물 표시 */
var uid=${userVO.id};

//게시물 피드 호출
getPostList();

//게시물 피드 함수 선언
function getPostList(){
	$.getJSON("/post/" + uid, function(data){
		var str="";
		var addreply="";
		var postCnt=0;
		$(data).each(function(){
			str = "<div id='feed"+this.id+"'><li>"+this.userid+ ":" +this.caption+"<ul id='post"+this.id+"'></ul></li></div><br />";
			$("#postList").append(str);
			postCnt++;
			
			//게시물마다 댓글 등록창 등록
			var replystr="";
			var pid=this.id; //게시물 id값
			getReplyList();
			
			//getReplyList() 함수정의
			function getReplyList(){
				$.getJSON("/reply/post/" + pid, function(rpldata){
					
					var postid=pid;
					var sid ='${login.id}'; //세션저장된 유저의 id값(로그인한 유저의 아이디 값)
					
					//게시물의 댓글 등록창
					var replyRegist=
						"<li>"
						+"<div>"
							+"<input type='text' id='comment"+pid+"' placeholder='댓글입력'/></div>"
							+"<button type='submit' id='replyRegist"+pid+"'>ADD REPLY</button>" //엔터치면 처리되게 어찌하나
						+"</div>"
						+"</li>";
	
					$("#post"+postid).html(replyRegist);
					
					$(rpldata).each(function(){
						
						// 게시물에 대한 댓글리스트 + 삭제버튼(해당 유저의 게시글일 경우만)
						var rid=this.id;
						
						
						replystr +="<li id='reply"+this.id+"'>"+ this.userid +":"+this.comment;
						if(this.userid==sid){ //댓글 작성자와 로그인 유저값이 같을때로 수정해야함
							replystr+="<button id='replyDelete"+this.id+"'>X</button></li>";
						}else{
							replystr+="</li>";	
						};
						
						// 각 게시물의 댓글 등록창
						$("#post"+postid).html(replystr+replyRegist);


						//댓글삭제 함수
						$("#replyDelete"+rid).on("click", function(){
							console.log("함수안: "+rid);
							$.ajax({
								type:"delete",
								url:"/reply/"+rid,
								headers:{
									"Content-Type" : "application/json",
									"X-HTTP-Method-Override" : "DELETE"
								},
								dataType:"text",
								success:function(result){
									if(result=="SUCCESS"){
										console.log("삭제성공")
										//리플리스트 초기화 및 게시물의 댓글 피드 재호출
										replystr="";
										getReplyList();
									};
								}
							});
						});
						//댓글삭제 함수 end
					});
					
					// 댓글 등록 함수
					$("#replyRegist"+pid).on("click", function(){
						var userid=sid; //나중에 입력값이 아닌 로그인한 유저정보가 들어가야함
						var postid=pid;
						var comment=$("#comment"+pid).val();
						console.log('hi');
						$.ajax({
							type:"post",
							url:"/reply",
							headers:{
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "POST"
							},
							dataType:"text",
							data:JSON.stringify({
								postid:postid,
								userid:userid,
								comment:comment
							}),
							success:function(result){
								if(result=="SUCCESS"){
									console.log("등록성공")
									replystr="";
									getReplyList();
								};
							}
						});
					});//댓글 등록함수 end
					
					
				});
			}; //함수 getReplyList end
			
		});
		
		$("#postCnt").html("게시물 "+postCnt);
		
	});//게시물 피드 end
};

//followedCnt 입력 및 링크걸기
followedCnt();

function followedCnt(){
	var uid = ${userVO.id};
	$.getJSON("/member/followedCnt/" + uid, function(data){
		console.log(data);
		if(data!=0){
			var followedCnt="<a href='#modalLayer' class='modalLink'>팔로워 "+data+"</a>";
			$("#followed").html(followedCnt);
		}else{
			var followedCnt="팔로워 "+data;
			$("#followed").html(followedCnt);
		}
	});
};

//followingCnt 입력 및 링크걸기
followingCnt();

function followingCnt(){
	var uid = ${userVO.id};
	$.getJSON("/member/followingCnt/" + uid, function(data){
		if(data!=0){
			var followingCnt="<a href='#modalLayer' class='modalLink'>팔로우 "+data+"</a>";
			$("#following").html(followingCnt);
		};
	});
};

//followList modal관련 메서드
$(document).ready(function() {
	var modalLayer = $("#modalLayer");
	var modalLink = $(".modalLink");
	var modalCont = $(".modalContent");
	var marginLeft = modalCont.outerWidth() / 2;
	var marginTop = modalCont.outerHeight() / 2;

	modalLink.click(function() {
		modalLayer.fadeIn("slow");
		modalCont.css({
			"margin-top" : -marginTop,
			"margin-left" : -marginLeft
		});
		$(this).blur();
		$(".modalContent > a").focus();
		return false;
	});

	$(".modalContent > button").click(function() {
		modalLayer.fadeOut("slow");
		modalLink.focus();
	});
});

//followList 에 followedList부여
$("#followed").on("click", function(){
	var modalLayer = $("#modalLayer");
	modalLayer.fadeIn("slow");
	$.getJSON("/member/followed/" + uid, function(data){
		var followedList="";
		$(data).each(function(){
			console.log(this);
			followedList+="<li>" + this.nickname + "<button>팔로우</button></li>";
		})
		$("#followList").html(followedList);
	});
});

//followList 에 followingList부여
$("#following").on("click", function(){
	var modalLayer = $("#modalLayer");
	modalLayer.fadeIn("slow");
	$.getJSON("/member/following/" + uid, function(data){
		var followingList="";
		$(data).each(function(){
			console.log(this);
			followingList+="<li>" + this.nickname + "<span class='isFlw'></span></li>";
		})
		$("#followList").html(followingList);
	});
});

//follow여부확인하여 팔로우/팔로잉 버튼 생성
var relation = ${relation} ;
relationBtn();

function relationBtn(){
//	if(relation == -1){
//		$("#isFlw").html("<button id='admin'>프로필 편집</button>")		
//	}else
		if(relation == 1){
		//언팔로우 버튼표시
		$("#isFlw").html("<button id='unfollow'>팔로잉</button>");
		
		//언팔로우 함수
		$("#unfollow").on("click", function(){
			$.ajax({
				type:"delete",
				url:"/member/unfollow",
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType:"text",
				data:JSON.stringify({
					userid: ${login.id},
					followedid: ${userVO.id},
				}),
				success:function(result){
					if(result=="SUCCESS"){
						console.log("팔로우 해제성공")
						if($("#unfollw").val() == "팔로우"){
							//언팔
							$("#unfollw").val("팔로잉");
						}else{
							//팔로처리
							$("#unfollw").val("팔로우");
						}
						//팔로워 카온트 초기화+버튼 초기화
						relation=0;
						relationBtn();
						followedCnt();
					};
				}
			});
		})
	}else if(relation == 0){
		//팔로우 시작 버튼표시
		$("#isFlw").html("<button id='followstart'>팔로우</button>")
		//팔로우 시작 함수
	 	$("#followstart").on("click", function(){
			$.ajax({
				type:"post",
				url:"/member/follow",
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType:"text",
				data:JSON.stringify({
					userid: ${login.id},
					followedid: ${userVO.id},
				}),
				success:function(result){
					if(result=="SUCCESS"){
						console.log("팔로우 등록성공")
						//팔로워 카온트 초기화+버튼 초기화
						relation=1;
						relationBtn();
						followedCnt();
					};
				}
			});
		})
	}
};


</script>
	
</body>
</html>