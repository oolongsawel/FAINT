<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%--  <jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/> --%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
       <link rel="stylesheet" href="/resources/css/feed.css">
       <link rel="stylesheet" href="/resources/css/style11.css">
    <link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon">
       <%--첨부파일--%>
    <script src="/resources/dist/js/upload.js"></script>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    
<title>Insert title here</title>
</head>
<body>

<jsp:include page="/WEB-INF/views/include/headerA.jsp" flush="false"/>
    
       <main id="feed">
            <article class="photo">
                <header class="photo__header">
                <!--     <img src="/resources/images/user.jpg" alt="martinacordioli" class="photo__user"> -->
                  <img  class="rounded-circle Photo profileHeader" src="" >${login.memberName}
                    
                    <div class="photo__info">
                      
                    </div>
                </header>
                <img src="/resources/images/_DSC4900.jpg" class="photo__image" />
              
                <div class="photo__main">
                    <div class="photo__actions">
                        <i class="fa heart fa-heart-o fa-2x"></i>
                        <i class="fa fa-comment-o fa-2x"></i>
                    </div>

                    <span class="photo__likes"><span class="photo__likes-number">175</span> likes</span>

                    <ul class="photo__comments">
                    <p>#사진#포토그래퍼#하늘공원#서울#나들이#맞팔#일반인모델#출사#</p>
                        <p class="photo__comment">
                            <span class="photo__comment-author"></span> 사진 쩔어
                        </p>
                        <p class="photo__comment">
                            <span class="photo__comment-author">hye_min:</span>우리 소통해
                        </li>
                        <li class="photo__comment">
                            <span class="photo__comment-author">kingdom</span>저희 맞팔해
                        </p>
      
                    </ul>
                    <span class="photo__date">13 hours ago</span>
                    <div class="photo__add-comment-container">
                        <textarea class="photo__add-comment" name="comment" placeholder="Add a comment..."></textarea>
                        <i class="fa fa-ellipsis-h"></i>
                    </div>
                </div>
            </article>
            <article class="photo">
                <header class="photo__header">
                    <img  class="rounded-circle Photo profileHeader" src="" >${login.memberName}
                    <div class="photo__info">
                      
                    </div>
                </header>
                <img src="/resources/images/_DSC4900.jpg" class="photo__image" />
                <div class="photo__main">
                    <div class="photo__actions">
                        <i class="fa heart fa-heart-o fa-2x"></i>
                        <i class="fa fa-comment-o fa-2x"></i>
                    </div>

                    <span class="photo__likes"><span class="photo__likes-number">175</span> likes</span>

                    <ul class="photo__comments">
                    <p>#사진#포토그래퍼#하늘공원#서울#나들이#맞팔#일반인모델#출사#</p>
                        <p class="photo__comment">
                            <span class="photo__comment-author"></span> 사진 쩔어
                        </p>
                        <p class="photo__comment">
                            <span class="photo__comment-author">hye_min:</span>우리 소통해
                        </li>
                        <li class="photo__comment">
                            <span class="photo__comment-author">kingdom</span>저희 맞팔해
                        </p>
      
                    </ul>
                    <span class="photo__date">13 hours ago</span>
                    <div class="photo__add-comment-container">
                        <textarea class="photo__add-comment" name="comment" placeholder="Add a comment..."></textarea>
                        <i class="fa fa-ellipsis-h"></i>
                    </div>
                </div>
            </article>
            
        </main>
          <script
 	 src="https://code.jquery.com/jquery-3.2.1.min.js"
  	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  	crossorigin="anonymous"></script>
        <script src="/resources/js/app.js"></script>
        		
    
</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="false"/>
</html>