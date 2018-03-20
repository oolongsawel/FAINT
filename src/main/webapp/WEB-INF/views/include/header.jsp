<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--제이쿼리 라이브러리  -->
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- 모달 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--검색창 부트스트랩  -->  
<link rel="stylesheet" href="/resources/bootstrap/css/nav-style.css"> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

</head>
<body>

<nav class="navbar navbar-default">
	<div class="nav-wrap">
		<a class="logo pull-left" href="/main"></a>
		<form class="search-form" action="/search/search" method="get">
			<input class="textInput" type="text" name='inputKeyword' id='keywordInput' value='${keyword}' placeholder="검색" title="사람검색@ 태그검색# 위치검색*">
			<span class="search-icon"></span>
		</form>
			<a class="explore" href="/explore/expage"></a>
			<a class="new-post" href="/post/register"></a>
			<a class="follow-list" href="javascript:;"></a> 
			<a class="account" href="/member/profile?nickname=${login.nickname}"></a>

	</div>
				<div class="row col-6 justify-content-end align-items-center">
                <%--로그아웃 상태--%>
                <c:if test="${login eq null}">
					
                    <li class="nav-item">
                        <button  class="btn btn-outline-primary hn " onclick="location.href='/user/loginTest'" style="font-size: 20px ;height:50px;">로그인</button>
              
                </c:if>
                <%--로그인 상태--%>
                <c:if test="${login ne null}">
                    <%--<ul class="nav nav-pills ml-auto w-100 justify-content-end ". style="float: right;margin-right: 10%;">--%>
                    <li class="nav-item dropdown">
                    
                        <a class="nav-link dropdown-toggle  " data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <img  class="rounded-circle Photo profileHeader" src="" >${login.nickname}

                            </a>
                        <div class="dropdown-menu" x-placement="bottom-start" style="position: absolute; transform: translate3d(0px, 65px, 0px); top: 0px; left: 0px; will-change: transform;">
                            <div class="eclipsis pl-4" style="width:70% ">
                                <a class=" hn " ></a>
                            </div>
                            <div class="dropdown-divider"></div>
                        <a class="dropdown-item hn" href="/user/myinfo">마이페이지</a>
                            <a class="dropdown-item hn" href='/user/logout'>로그아웃</a>
                        </div>
                    </li>
                    <%--</ul>--%>
                </c:if>
            </div>
</nav>


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



<script>

searchAjax();
function searchAjax(){
   $("#keywordInput").keyup(function(){
      var words = $("#keywordInput").val();
       //$(this).val( $(this).val().replace(/ /g, '') );      //공백삭제
       
      // 키워드 받아서 공백 제거하고 저장
      var chgwords = words;
      var splitArray = chgwords.split(' ');
      var searchwords = '';
      for(i in splitArray) {
         chgwords = splitArray[i];
         if(chgwords.indexOf(" ")==0) {
            var chgwords = words.substring(chgwords.lastIndexOf(" "));
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
                                 +"</div>"

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
                           +"</div>"

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
                           +"</div>"

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
                        +"</div>"

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


</body>
</html>