<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>


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
<script src="/resources/js/postFeed.js"></script>

<style>

/* 검색창 스타일 */

a, a:visited {
    color: #003569;
    text-decoration: none; ! important
}

a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: none; ! important
}

._4jr79 {
    background: #fafafa;
}

._ndl3t {
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    border-bottom: solid 1px #efefef;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: horizontal;
    -webkit-box-direction: normal;
    -webkit-flex-direction: row;
    -ms-flex-direction: row;
    flex-direction: row;
    -webkit-flex-shrink: 0;
    -ms-flex-negative: 0;
    flex-shrink: 0;
    height: 50px;
    padding: 8px 14px;
}

._ig0cz, ._po4xn {
    display: block;
    margin: 0 18px 0 10px;
    width: 14px;
}

.coreSpriteHashtag {
   /*  background-image: url("http://edgerank.co.kr/wp-content/uploads/2017/01/%EA%B8%B0%ED%83%80.jpg"); */
    background-repeat: no-repeat;
    background-position: -546px -395px;
    height: 17px;
    width: 13px;
}

._2ph7c{
    font-size: 14px;
    text-align: left;
}


._b01op {
    line-height: 22px;
    margin-bottom: -4px;
    overflow: hidden;
    font-weight: 600;
    text-overflow: ellipsis;
}

._etpgz {
	max-height: 362px;
    overflow-y: auto;
    overflow-x: hidden;
    padding: 0;
    align-items: stretch;
    border: 0 solid #000;
    box-sizing: border-box;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    flex-direction: column;
    flex-shrink: 0;
    margin: 0;
    position: relative;
	font: inherit;
    vertical-align: baseline;

}

._o92vn{
    align-items: center;
    margin-right: 0;
    white-space: nowrap;
    width: 100%;
    -webkit-box-orient: horizontal;
	flex-direction: row;
    display: flex;
    -webkit-box-direction: normal;
    box-sizing: border-box;
    flex-shrink: 0;
    margin: 0;
    padding: 0;
    position: relative;
    font: inherit;
    vertical-align: baseline;

}

._poxna{

    -webkit-box-orient: vertical;
    flex-direction: column;
    flex-shrink: 1;
    -webkit-box-pack: center;
    justify-content: center;
    min-width: 0;
	display: flex;
    -webkit-box-direction: normal;
	-webkit-box-align: stretch;
    align-items: stretch;
    border: 0 solid #000;
    margin: 0;
    padding: 0;
    position: relative;
    font: inherit;
    vertical-align: baseline;

}

._lv0uf{

    color: #262626;
    -webkit-box-orient: horizontal;
    -webkit-box-direction: normal;
	flex-direction: row;
    font-size: 14px;
    text-align: left;
	-webkit-box-align: stretch;
    align-items: stretch;
    border: 0 solid #000;
	box-sizing: border-box;
    display: flex;
    flex-shrink: 0;
    margin: 0;
    padding: 0;
    position: relative;
    font: inherit;
    vertical-align: baseline;

}

._2ph7c{

    font-weight: 300;
    line-height: 22px;
    overflow: hidden;
    text-overflow: ellipsis;
    color: #999;
    font-size: 14px;
    text-align: left;
    -webkit-box-align: stretch;
	align-items: stretch;
    border: 0 solid #000;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    flex-direction: column;
	flex-shrink: 0;
    margin: 0;
    padding: 0;
    position: relative;
    font: inherit;
    vertical-align: baseline;

}


span {
	display : inline-block;
	margin: 0;
    padding: 0;
    border: 0;
    font: inherit;
    vertical-align: baseline;
}

/* .img {
	display: inline-block;
	align : left;
}

img {
	width: 150px;
	height: 150px;
 }
 */

/* modal 배경 지우기 갓명호!!!!!!쏴리질러 */
/* 이 주석 머얔ㅋㅋㅋㅋ 웃김 */
.modal-backdrop{
	background-color: transparent !important;
}

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


<!--데이터 보내는거니까 form -->
<!--키워드 넣는 박스  -->

<center>
<nav class="navbar navbar-default"  >
        <div class="nav-wrap">
             <a class="logo pull-left" href="#"></a>
            <form class="search-form" action="/search/search" method="get">
                <input class="textInput" type="text" name='inputKeyword' id='keywordInput' value="${cri.keyword}"
                placeholder="검색" title="사람검색@ 태그검색# 위치검색*"
                list="results"  data-toggle="modal" data-target="#searchModal" data-backdrop="true">
                <span class="search-icon"></span>
            </form>
             <span class="pull-right">
                <a class="new-post" href="#"></a>
                <a class="follow-list" href="#"></a>
                <a class="account" href="#"></a>
            </span> 
        </div>
    </nav>  
<div>
</div>
		
<!-- Modal -->
<div class="modal fade" id="searchModal" role="dialog" aria-hidden="false">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<div id="results"></div>
			</div>
		</div>
	</div>
</div>
</form>
</center>


<script>

searchAjax();
function searchAjax(){
	$("#keywordInput").keyup(function(){
		var words = $("#keywordInput").val();
		 //$(this).val( $(this).val().replace(/ /g, '') );		//공백삭제
		 
		/* 키워드 받아서 공백 제거하고 저장 */
		var chgwords = words;
		var splitArray = chgwords.split(' ');
		var searchwords = '';
		for(chgwords  in splitArray) {
			chgwords  = splitArray[chgwords];
			if(chgwords .indexOf(" ")==0) {
				var chgwords  = words.substring(chgwords.lastIndexOf(" "));
			}
				searchwords += chgwords;
		}

		console.log("words :          >>>>>>" + words);
		console.log("searchword : -----------" + searchwords);
		console.log("첫글자가 뭐야:"+searchwords[0]);
		
		/* 검색 단어가 있으면 일치하는 것 출력 */
		if(searchwords!=''){
			$.ajax({
				type:"POST",
				url: "/explore/searchData/",
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				data: searchwords,
				//dataType: "text",
				success: function(result){
					
					// 검색 단어가 그냥 문자인 경우
					if(searchwords[0]!='#' && searchwords[0]!='@' && searchwords[0]!='%' && result.length>0){
						console.log("결과값: "+result);
						var str=' ';
						for(var i=0; i<result.length; i++){
								if(result[i].charAt(0)=='#'){
									str+="<a class='_ndl3t _4jr79' href='/search/tags?name="+result[i].substring(1)+"'>"
											+"<div class='_o92vn'>"
											+"<span class='_po4xn coreSpriteHashtag'><img src='/resources/image/hashtag.jpg' style='height:23px; width:23px;'></span>"
											+"<div class='_poxna'>"

											+"<div class='_lv0uf'>"
											+"<span class='_b01op'>"+result[i]+"</span>"
											+"</div><br/>"

											+"<div class='_2ph7c'>"
											+"<span class=''>게시물 <span class=''>1000개</span></span>"
											+"</div></div></div></a><br/>"
								}
								else if(result[i].charAt(0)=='@') {
									str+="<a class='_ndl3t _4jr79' href='/member/profile?nickname="+result[i].substring(1)+"'>"
									+"<div class='_o92vn'>"
									+"<span class='_po4xn coreSpriteHashtag'></span>"
									+"<div class='_poxna'>"

									+"<div class='_lv0uf'>"
									+"<span class='_b01op'>"+result[i]+"</span>"
									+"</div><br/>"

									+"<div class='_2ph7c'>"
									+"<span class=''>게시물 <span class=''>1000개</span></span>"
									+"</div></div></div></a><br/>"
								}
								else if(result[i].charAt(0)=='%') {
									str+="<a class='_ndl3t _4jr79' href='/search/locations?location="+result[i].substring(1)+"'>"
									+"<div class='_o92vn'>"
									+"<span class='_po4xn coreSpriteHashtag'><img src='/resources/image/location.jpg' style='height:23px; width:23px;'></span>"
									+"<div class='_poxna'>"

									+"<div class='_lv0uf'>"
									+"<span class='_b01op'>"+result[i].substring(1)+"</span>"
									+"</div><br/>"

									+"<div class='_2ph7c'>"
									+"</div></div></div></a><br/>"
								}
								else
									str+="<span><a href=''>"+result[i]+"</a></span><br/>"
						}
						$("#results").html(str);
					}
					
					// 검색 단어 첫 글자가 #으로 시작하는 경우
					else if(searchwords[0]=='#' && result.length>0) {
						console.log("#로 검색 결과값: "+result);
						var str=' ';
						for(var i=0; i<result.length; i++){
							if(result[i].charAt(0)=='#') {
								str+="<a class='_ndl3t _4jr79' href='/search/tags?name="+result[i].substring(1)+"'>"
								+"<div class='_o92vn'>"
								+"<span class='_po4xn coreSpriteHashtag'><img src='/resources/image/hashtag.jpg' style='height:23px; width:23px;'></span>"
								+"<div class='_poxna'>"

								+"<div class='_lv0uf'>"
								+"<span class='_b01op'>"+result[i]+"</span>"
								+"</div>"

								+"<div class='_2ph7c'>"
								+"<span class=''>게시물 <span class=''>1000개</span></span>"
								+"</div></div></div></a><br/>"
							}
							else
								result[i] = null;
						}
						console.log("걸러진 결과값 : "+result);
						$("#results").html(str);
					}
					
					// 검색 단어 첫 글자가 @으로 시작하는 경우
					else if(searchwords[0]=='@' && result.length>0) {
						console.log("@로 검색 결과값: "+result);
						var str=' ';
						for(var i=0; i<result.length; i++){
							if(result[i].charAt(0)=='@') {
								str+="<a class='_ndl3t _4jr79' href='/member/profile?nickname="+result[i].substring(1)+"'>"
								+"<div class='_o92vn'>"
								+"<span class='_po4xn coreSpriteHashtag'></span>"
								+"<div class='_poxna'>"

								+"<div class='_lv0uf'>"
								+"<span class='_b01op'>"+result[i]+"</span>"
								+"</div><br/>"

								+"<div class='_2ph7c'>"
								+"<span class=''>게시물 <span class=''>1000개</span></span>"
								+"</div></div></div></a><br/>"
							}
							else
								result[i] = null;
						}
						console.log("걸러진 결과값 : "+result);
						$("#results").html(str);
					}
					
					// 검색 단어 첫 글자가 %으로 시작하는 경우
					else if(searchwords[0]=='%' && result.length>0) {
						console.log("%로 검색 결과값: "+result);
						var str=' ';
						for(var i=0; i<result.length; i++){
							if(result[i].charAt(0)=='%') {
								str+="<a class='_ndl3t _4jr79' href='/search/locations?location="+result[i].substring(1)+"'>"
								+"<div class='_o92vn'>"
								+"<span class='_po4xn coreSpriteHashtag'><img src='/resources/image/location.jpg' style='height:23px; width:23px;'></span>"
								+"<div class='_poxna'>"

								+"<div class='_lv0uf'>"
								+"<span class='_b01op'>"+result[i].substring(1)+"</span>"
								+"</div><br/>"

								+"<div class='_2ph7c'>"
								+"</div></div></div></a><br/>"
							}
							else
								result[i] = null;
						}
						console.log("걸러진 결과값 : "+result);
						$("#results").html(str);
					}
					
					else{
						$("#results").html("");
					}
				},
				error: function(e){console.log('error: '+e.status);}
			});
		}
		
		else{
			$("#results").html("");
		}
	})
}

function show(str){
	searchAjax();
    //modal을 띄워준다.  
    $("#myModal").modal('show');
}
	
</script>


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
	<a href='/search/tags?name=${tagVO.name}'>
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
<%-- <div id="postTable">
<table class="table table-bordered" align="center">
	<tr>
		<th style="width: 10px">POSTID</th>
		<th style="width: 10px">USERID</th>
		<th style="width: 10px">CATEID</th>
		<th>CAPTION</th>
		<th>ATTACH</th>
		<th style="width: 10px">LIKECNT</th>
		<th style="width: 10px">RPLCNT</th>
	</tr>
	
	<c:forEach items="${topPost}" var="postDTO">
	
	<tr>
	<td><a href=''>${postDTO.id}</a></td>
	<td>${postDTO.userid}</td>
	<td>${postDTO.cateid}</td>
	<td class="postCaption">${postDTO.caption} </td>
	<td><a class="postAtt" data-toggle="modal" data-target="#CID${postDTO.cateid}_PID${postDTO.id}_UID${postDTO.userid}"><img src='/displayFile?fileName=${postDTO.url}'></a></td>
	<td>${postDTO.likeCount}</td>
	<td>${postDTO.replyCount}</td>
	</tr>

	
	<!-- 포스트 모달 -->
	
<div class="modal fade" id="CID${postDTO.cateid}_PID${postDTO.id}_UID${postDTO.userid}" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Modal Header</h4>
			</div>
			
			<div class="modal-body">
				작성자 : <span class="writerNickname"><a href='/member/profile?nickname=${postDTO.nickname}'>${postDTO.nickname}</a></span><br/>
				<span class="postImg"><img src='/displayFile?fileName=${postDTO.url}'></span><br/>
				내용 : <span class="postCaption">${postDTO.caption}</span>
				좋아요 수 : <span class="postLikeCnt">${postDTO.likeCount}</span>
				댓글 수 : <span class="postRplCnt">${postDTO.replyCount}</span>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

	</c:forEach>
	
</table>
</div> --%>



<script>
var jsonList=${jsonList};
console.log(jsonList);

$(document).ready(function() {
	$(".caption").each(function(){
	var text =$(this).text();
	//console.log("text : "+text);
	var splitArray = text.split(' ');
	//console.log("splitArray : "+splitArray);
	var linkedContent = '';
	for(var word in splitArray) {
		word = splitArray[word];
		   if(word.indexOf("#")==0)
		   {
			   var hash=word.substring(word.lastIndexOf("#")+1);
		      word = "<a href='/search/tag?name="+hash+"'>"+word+"</a>";
			}
		   
		   else if(word.indexOf("@")==0)
		   {
			   var ningen=word.substring(word.lastIndexOf("@")+1);
			      word = "<a href='/member/profile?nickname="+ningen+"'>"+word+"</a>";
		   }

		   linkedContent += word+' ';
	}
		  $(this).html(linkedContent);
	})
	
	
	$(".postCaption").each(function(){
	var text =$(this).text();
	//console.log("text : "+text);
	var splitArray = text.split(' ');
	//console.log("splitArray : "+splitArray);
	var linkedContent = '';
	for(var word in splitArray) {
		word = splitArray[word];
		   if(word.indexOf("#")==0)
		   {
			   var hash=word.substring(word.lastIndexOf("#")+1);
		      word = "<a href='/search/tag?name="+hash+"'>"+word+"</a>";
			}
		   
		   else if(word.indexOf("@")==0)
		   {
			   var nickname=word.substring(word.lastIndexOf("@")+1);
			      word = "<a href='/member/profile?nickname="+nickname+"'>"+word+"</a>";
		   }

		   linkedContent += word+' ';
	}
		  $(this).html(linkedContent);
	})
	
	
})


</script>

</body>
</html>