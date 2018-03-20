<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--헤더-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAINT</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<style>
section{
	padding-top:60px;
	max-width:600px;
	width:100%;
}

article{
	align-items: stretch;
	margin-bottom: 60px;
	border: 0 solid #000;
	border-radius: 3px;
    border: 1px solid #e6e6e6;
}
</style>

<body>

<ul id="categoryList">
	<li><a href="javascript:;" data-filter="all" tabindex="-1">ALL</a></li>
	<li><a href="javascript:;" data-filter="1" tabindex="-1">1</a></li>
	<li><a href="javascript:;" data-filter="2" tabindex="-1">2</a></li>
	<li><a href="javascript:;" data-filter="3" tabindex="-1">3</a></li>
</ul>

<section>

<c:forEach items="${list}" var="postDTO">
	<article class="post" data-filter="${postDTO.cateid}">
		<header class="_header">
			<div>
				<a class="_profileImageContainer" href="/member/profile?nickname=${postDTO.usernickname}">
					<!-- 프로필 이미지 -->
					<img class="_profileImage" src="/displayFile?fileName=${postDTO.profilephoto}" style="width:30px; height:30px;"/>
				</a>
			</div>
			<div class="_writerContainer">
				<div>
					<a class="_writerName" href="/member/profile?nickname=${postDTO.usernickname}">
					${postDTO.usernickname}
					</a>
				</div>
				<div>
					<a class="_postLocation" href="">지역명(미구현)</a>
				</div>
			</div>
		</header>
		<div class="imageContainer" >
			<c:set var="urlList" value="${fn:split(postDTO.url, '[|]')}"/>
			<c:forEach var="i" begin="0" end="${fn:length(urlList)-1}" step="1">
				<c:choose>
					<c:when test="${i==0}">
						<img class="_postImage" src="/displayFile?fileName=${urlList[i]}" class="mainImg" style="width:370px; height:370px;" />
					</c:when>
					<c:otherwise>
						<img class="_postImage" src="/displayFile?fileName=${urlList[i]}" class="mainImg" style="width:370px; height:370px; display:none;" />
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<div>
			<section title="${postDTO.postid}">
				<c:choose>
				    <c:when test="${postDTO.isLike=='1'}">
				    	<button class="likeBtn">♥</button>
				    </c:when>
				    <c:otherwise>
						<button class="likeBtn">♡</button>
				    </c:otherwise>
			    </c:choose>
				<button class="replyBtn">댓글(미구현)</button>
				<button class="storeBtn">저장하기(미구현)</button>
			</section>
			
			<section>
				<a class="likeContainer" title="${postDTO.postid}">좋아요 <span>0</span>개(링크미구현)</a>
			</section>
			
			<div class="captionContainer">
				<ul class="_captionContainer" id="post${postDTO.postid}" >
					<li><a href="/member/profile?nickname=${postDTO.usernickname}">${postDTO.usernickname}</a>	<span>${postDTO.caption}</span></li>
					<li class="moreReply"><a href="javascript:;">댓글더보기</a></li>
					<div class="replyContainer" title="${postDTO.postid}" data-limit=0>
					</div>
					<time datetime=""+${postDTO.regdate}>${postDTO.regdate}</time>
				</ul>
			</div>
		</div>
	</article>
</c:forEach>

</section>

<script>

//postid 가져와서 댓글달기
$(document).ready(function(){
	reply();
	searchFilter();
})

//각 게시물에 댓글리스트 등록 처음 4개 이후 +20개씩('댓글 더보기' 기능이 수행)
function reply(){
	$(".replyContainer").each(function(){
		var moreReply=$(this).children("#moreReply");
		var pid=$(this).attr("title"); //게시물 id값 title에 넣어서 이동
		var limit = $(this).data("limit"); //댓글 출력제한자
		var replyContainer = this;
		
		$.getJSON("/reply/post/" + pid, function(rpldata){
			//게시물의 댓글 등록창
			var replyRegist=
				"<div class='_replyRegister' title="+pid+">"
					+"<input type='textarea' onkeypress='registReply(this, event);' class='replyRegist' placeholder='댓글입력'/>"
				+"</div>";
			$(replyContainer).html(replyRegist);
			
			//전체 댓글 수가 4개 이하 or 제한자*20+4개면 댓글더보기 삭제
		 	if(rpldata.length<=4+5*limit){ //20개씩 더 출력
		 		$(replyContainer).siblings(".moreReply").remove();
			}else if($(replyContainer).siblings(".moreReply")[0]==undefined){
				$(replyContainer).before("<li class='moreReply' data-limit='0'><a href='javascript:;'>댓글더보기</a></li>");
			}
			
			// 게시물에 대한 댓글리스트 + 삭제버튼(해당 유저의 게시글일 경우만)
			var replystr="";
			$(rpldata).each(function(index){
				
				//댓글 최신 4개까지만 우선 출력 및 제한자에 따른 댓글 출력
				if( $(rpldata).length-(4+5*limit) <= index && index < $(rpldata).length ){ //20개씩 더 출력
					replystr +="<li title='"+this.id+"'>"+
						"<a href='/member/profile?nickname="+this.username+"'>" + this.username +"</a>	<span>"+this.comment+"</span>";
					
					if(this.userid==${login.id}){
						replystr+="<button class='replyDelete' onclick='deleteReply(this);' ><strong>Ｘ</strong></button></li>";
					}else{
						replystr+="</li>";
					};
					
					$(replyContainer).html(replystr+replyRegist);
				}
			});
			
			//댓글더보기 클릭시 제한자 +1 및 댓글 목록 재출력
			$(replyContainer).siblings(".moreReply").children().on("click", function(){
				$(replyContainer).data("limit", limit+1);
				reply();
			})
			//댓글 및 게시물에 태그 검색 필터
			searchFilter();
		});
	});
}

//댓글등록함수 = 댓글입력창에서 onkeypress로 작동 (태그 객체와 event키값 매개변수로 받음)
function registReply(thisTag, key){
	var enter=key.keyCode||key.which;
	if(enter==13){
		var userid=${login.id};
		var comment=$(thisTag).val();
		var postid=$(thisTag).parent().attr("title");
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
					reply();
				};
			}
		});
	}
}

//댓글 삭제함수 = 댓글 삭제버튼에서 사용(태그객체 받음)
function deleteReply(thisTag){
	var rid=$(thisTag).parent().attr("title");
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
				//리플리스트 초기화 및 게시물의 댓글 피드 재호출
				reply();
			};
		}
	});
}


//게시물 좋아요 + 좋아요 취소
like();
function like(){
	$(".likeBtn").on("click", function(){
		var postid=$(this).parent().attr("title");
		var likeBtn=this;
		
		if($(this).html()=="♡"){
			var type="post";
			var url ="/post/"+postid+"/like";
			var headers="{'X-HTTP-Method-Override' : 'POST'}";
			var val="♥";
			
		}else if($(this).html()=="♥"){
			var type="delete";
			var url ="/post/"+postid+"/unlike";
			var headers="{'X-HTTP-Method-Override' : 'DELETE'}";
			var val="♡";
		}
		$.ajax({
			type: type,
			url: url,
			headers: {headers},
			dataType:"text",
			success:function(result){
				if(result=="SUCCESS"){
					$(likeBtn).html(val);
					likerList();
				};
			}		
		});
	});
};

//좋아요 count+list
likerList();
function likerList(){
	$(".likeContainer").each(function(){
		var pid=$(this).attr("title");
		var likeContainer = this;
		$.getJSON("/post/" + pid + "/likerlist", function(data){
			var likerList="";
			var data=$(data)
			if(data.length>0){
				$(likeContainer).children("span").html(data.length);
				$(likeContainer).on("click", function(){
					///list append 추가예정
				});
			}else if(data.length==0){
				$(likeContainer).children("span").html(0);
			}
		}); 
	});
};

//댓글내용 및 글내용 검색처리
function searchFilter(){
	$(".captionContainer").find("span").each(function(){
	   var text =$(this).text();
	   //console.log("text : "+text);
	   var splitArray = text.split(' ');
	   //console.log("splitArray : "+splitArray);
	   var linkedContent = '';
	   for(var word in splitArray) {
	      word = splitArray[word];
	         if(word.indexOf("#")==0){
	            var hash=word.substring(word.lastIndexOf("#")+1);
	            word = "<a href='/search/tags?name="+hash+"'>"+word+"</a>";
	         }else if(word.indexOf("@")==0){
	            var person=word.substring(word.lastIndexOf("@")+1);
	               word = "<a href='/member/profile?nickname="+person+"'>"+word+"</a>";
	         }
	         linkedContent += word+' ';
		}
		$(this).html(linkedContent);
   })
}

//css - 사진클릭시 이동
$(".imageContainer").children().on("click", function(event){
	if($(this).parent().children(":first")==$(this).parent().children(":last")){
		return;
	}else if($(this)[0]==$(this).parent().children(":last")[0]){
		console.log(1);
		$(this).css("display", "none");
		$(this).parent().children(":first").css("display", "");
	}else{
		$(this).css("display", "none");
		$(this).next().css("display", "");
	}
})

//css - 카테고리별 게시물 필터링
$("#categoryList li a").click(function(){
	var customType=$(this).data("filter");
	$(".post").hide().filter(function(){
		return $(this).data("filter") === customType || customType==="all";
		}).show();
})

</script>
</div>

</body>
</html>