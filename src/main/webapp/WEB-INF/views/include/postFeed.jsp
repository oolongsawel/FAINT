<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<header>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</header>
<style>
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    border: 1px solid #888;
    width: 80%;
    height: 70%;
    overflow: auto;
}

/* The Close Button */
.close {
    color: #fefefe;
    float: right;
    font-size: 50px;
    font-weight: bold;
    right:1.5%;
    top:0%;
    cursor: pointer;
    
    background: 0 0;
    border: 0;
    cursor: pointer;
    height: 36px;
    outline: 0;
    position: absolute;
    z-index: 2;
}

.postContainer{
	text-align: center;
}
.postLiner{
	display:flex !important; 
	width:100%;
	max-width:935px;
	max-height:293px;
}
.imageContainer{
	height:100%;
	width:33%;
	max-width: 293px;
	max-height: 293px;
	text-align: center;
}
.imageContainer > img{
	overflow:hidden;
}

._header > div{
	display: inline-block;
}
._sideSeparator{
	display: inline-block;
	vertical-align: middle;
}
._sideSeparator:eq(0){
	max-height:100%
}
._sideSeparator:eq(2){
	overflow:auto;
}
</style>

<body>

<script id="modalPost" type="text/x-handlebars-template">
<div id="myModal" class="modal">
	<span class="close">&times;</span>
	<div class="modal-content">
		<article class="post" data-filter="{{cateid}}">
				<div class="_sideSeparator">
					<div class="popImageContainer" >
					</div>
				</div>
				<div class="_sideSeparator">
					<header class="_header">
						<div>
							<a class="_profileImageContainer" href="/member/profile?nickname={{usernickname}}">
								<!-- 프로필 이미지 -->
								<img class="_profileImage" src="/displayFile?fileName={{profilephoto}}" style="width:30px; height:30px;"/>
							</a>
						</div>
						<div class="_writerContainer">
							<div>
								<a class="_writerName" href="/member/profile?nickname={{usernickname}}">
								{{usernickname}}
								</a>
							</div>
							<div>
								<a class="_postLocation" href="">지역명(미구현)</a>
							</div>
						</div>
					</header>
					<div class="captionContainer">
						<ul class="_captionContainer" id="post{{postid}}" >
							<li><a href="/member/profile?nickname={{usernickname}}">{{usernickname}}</a>	<span>{{caption}}</span></li>
							<li class="moreReply"><a href="javascript:;">댓글더보기</a></li>
							<div class="replyContainer" title="{{postid}}" data-limit=0>
							</div>
							<time datetime=""+{{regdate}}>{{regdate}}</time>
						</ul>
					</div>
					<section class="btnContainer" title="{{postid}}">
						<button class="replyBtn">댓글(미구현)</button>
						<button class="storeBtn">저장하기(미구현)</button>
					</section>
				
					<section>
						<a class="likeContainer" title="{{postid}}">좋아요 <span>0</span>개(링크미구현)</a>
					</section>
				</div>
			</div>
		</article>
	</div>
</div>
</script>

<script>

console.log(jsonList);

$(document).ready(function(){
	getPostList();
	function getPostList(){
		
		//포스트 피드
		$("body").append("<div class='postContainer' style='width:100%; height:auto;'></div>");
		
		//데이터 담을 변수
		var data="";

		//태그 or 지역 검색 일때
		var elseList=jsonList;
		console.log("123");
		
		//태그 or 지역검색이 아니고 user정보를 가져올때(user프로필 페이지)
		if(elseList.length==0){
			jsonList="{}";
			
			$.ajax({
				url:"/post/" + uid,
				datatype:"json",
				async:false,
				success:function(userdata){
					data=$(userdata);
				}
			})
			
			console.log(data);
			//게시물이 없을 때
			if($(data).length==0 && uid!=${login.id}){
				$(".postContainer").html("<div>이 유저는 아직 게시글이 없어요 ㅠㅠ</div>");
				return;
			}else if($(data).length==0 && uid==${login.id}){
				$(".postContainer").html("<div>소중한 순간들을 포착하여 공유해보세요</div>");
				return;
			}
			
		}else{
			try{
				data = elseList;
				console.log(data);
				throw new SyntaxError();
			}catch(e){
				console.log(e);
			}
		}
		
		$("#keywordTitle").after("<h5>게시물 "+data.length+" 개</h5>")
		

		//게시물이 있을 때
		if(data.length%3==0){
			for (i = 0; i < data.length/3; i++) {
				$(".postContainer").append("<div class='postLiner' style='display:inline-block;'>")
			}
		}else{
			for (i = 0; i < parseInt(data.length/3)+1; i++) {
				$(".postContainer").append("<div class='postLiner' style='display:inline-block;'>")
			}
		}
		
		for (i = 0; i < $(".postLiner").length; i++) {
			for (j = 0; j < 3; j++) {
				$(".postLiner:eq("+i+")").append("<div class='imageContainer' style='height:100%; width:auto;'>")
			}
		}
		console.log("!23")
		$(data).each(function(index){
			var url=this.url.split('|');
			var img = "<img class='postImage' title='"+this.id+"' style='height:100%; width:100%;' src='/displayFile?fileName="+url[0]+"' />";
			var str = "<div><span>좋아요:"+this.likeCount+" / 댓글:"+this.replyCount+"</span></div>";
			$(".imageContainer:eq("+index+")").append(img);
			
			$(".imageContainer:eq("+index+")").on("click", function(){
				var pid=$(this).children("img").attr("title");
				$.ajax({
					type:"post",
					url:"/post/detail",
					headers:{
						"X-HTTP-Method-Override" : "POST"
					},
					data:{postid:pid},
					datatype:"json",
					success:function(data){
						if(data!=null){
							//이미지 배열화
							data.urlList=data.url.split('|');
							//handlebar추가
							var source=$("#modalPost").html();
							var post=Handlebars.compile(source);
							var postmodal=post(data);
							$("body").append(postmodal);
							//이미지 잘라서 삽입
							for (var i in data.urlList) {
								$(".popImageContainer").append("<img class='popPostImage' src='/displayFile?fileName="+data.urlList[i]+"' style='display:none;' />")
							}
							//처음 이미지만 보이도록
							$(".popPostImage:eq(0)").css("display", "block");
							
							//좋아요버튼 삽입
							if(data.isLike=='1'){
								$(".btnContainer").prepend("<button class='likeBtn'>♥</button>")
							}else{
								$(".btnContainer").prepend("<button class='likeBtn'>♡</button>")
							}
							//modal창 보이기
							$("#myModal").css("display","block");
							
							//modal끄기 메서드-바깥부분
							$("#myModal").click(function(event){
								if(event.target==this){
									$("#myModal").css("display","none");
									$("#myModal").remove();	
								}
							})
							
							//modal끄기 메서드-버튼부분
							$(".close:eq(0)").on("click", function(){
								$("#myModal").css("display","none");
								$("#myModal").remove();
							})
							
							$("#modal-content").on("click",function(){
								
							})
							reply();
							changePic();
							like();
							likerList();
							searchFilter();
						}
					}
				})
			})
		})
		
			
		$("#postCnt").html("게시물 "+$(data).length);
	};
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
	            word = "<a href='/explore/tagInfo?name="+hash+"'>"+word+"</a>";
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
function changePic(){
	$(".popImageContainer").children().on("click", function(event){
		if($(this).parent().children(":first")==$(this).parent().children(":last")){
			return;
		}else if($(this)[0]==$(this).parent().children(":last")[0]){
			$(this).css("display", "none");
			$(this).parent().children(":first").css("display", "");
		}else{
			$(this).css("display", "none");
			$(this).next().css("display", "");
		}
	})
}

//css - 카테고리별 게시물 필터링
$("#categoryList li a").click(function(){
	var customType=$(this).data("filter");
	$(".post").hide().filter(function(){
		return $(this).data("filter") === customType || customType==="all";
		}).show();
})

</script>

</body>
</html>