<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
</head>
  <nav class="navigation">
            <span class="navigation__wrapper">
            <div class="navigation__column">
                <a href="feed.html">
                    <img src="images/logo.png" />
                </a>
            </div>
            <div class="navigation__column">
                <i class="fa fa-search"></i>
                <input type="text" placeholder="Search">
            </div>
            <div class="navigation__column">
                <a href="explore.html" class="navigation__link">
                    <i class="fa fa-compass"></i>
                </a>
                <a href="#" class="navigation__link">
                    <i class="fa fa-heart-o" id="heart"></i>
                </a>
                <a href="profile.html" class="navigation__link">
                    <i class="fa fa-user-o"></i>
                </a>
            </div>
            </span>
        </nav>
        <main id="feed">
            <article class="photo">
                <header class="photo__header">
                    <img src="images/avatar.jpg" alt="martinacordioli" class="photo__avatar">
                    <div class="photo__info">
                        <span class="photo__author">martinacordioli</span>
                        <span class="photo__location">Dire Dawa</span>
                    </div>
                </header>
                <img src="images/feedPhoto.jpg" class="photo__image" />
                <div class="photo__main">
                    <div class="photo__actions">
                        <i class="fa heart fa-heart-o fa-2x"></i>
                        <i class="fa fa-comment-o fa-2x"></i>
                    </div>

                    <span class="photo__likes"><span class="photo__likes-number">2990</span> likes</span>

                    <ul class="photo__comments">
                        <li class="photo__comment">
                            <span class="photo__comment-author">serranoarevalo</span> omg this is great.
                        </li>
                        <li class="photo__comment">
                            <span class="photo__comment-author">serranoarevalo</span> omg this is great.
                        </li>
                        <li class="photo__comment">
                            <span class="photo__comment-author">serranoarevalo</span> omg this is great.
                        </li>
                        <li class="photo__comment">
                            <span class="photo__comment-author">serranoarevalo</span> omg this is great.
                        </li>
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
                    <img src="images/avatar.jpg" alt="martinacordioli" class="photo__avatar">
                    <div class="photo__info">
                        <span class="photo__author">martinacordioli</span>
                        <span class="photo__location">Dire Dawa</span>
                    </div>
                </header>
                <img src="images/feedPhoto.jpg" class="photo__image" />
                <div class="photo__main">
                    <div class="photo__actions">
                        <i class="fa heart fa-heart-o fa-2x"></i>
                        <i class="fa fa-comment-o fa-2x"></i>
                    </div>
                    <span class="photo__likes">
                        <span class="photo__likes-number">80</span> likes</span>
                    <ul class="photo__comments">
                        <li class="photo__comment">
                            <span class="photo__comment-author">serranoarevalo</span> omg this is great.
                        </li>
                        <li class="photo__comment">
                            <span class="photo__comment-author">serranoarevalo</span> omg this is great.
                        </li>
                        <li class="photo__comment">
                            <span class="photo__comment-author">serranoarevalo</span> omg this is great.
                        </li>
                        <li class="photo__comment">
                            <span class="photo__comment-author">serranoarevalo</span> omg this is great.
                        </li>
                    </ul>
                    <span class="photo__date">13 hours ago</span>
                    <div class="photo__add-comment-container">
                        <textarea class="photo__add-comment" name="comment" placeholder="Add a comment..."></textarea>
                        <i class="fa fa-ellipsis-h"></i>
                    </div>
                </div>
            </article>
        </main>
        <footer>
            <nav class="footer__nav">
                <ul class="footer__list">
                    <li class="footer__item"><a href="#" class="footer__link">about us</a></li>
                    <li class="footer__item"><a href="#" class="footer__link">support</a></li>
                    <li class="footer__item"><a href="#" class="footer__link">blog</a></li>
                    <li class="footer__item"><a href="#" class="footer__link">press</a></li>
                    <li class="footer__item"><a href="#" class="footer__link">api</a></li>
                    <li class="footer__item"><a href="#" class="footer__link">jobs</a></li>
                    <li class="footer__item"><a href="#" class="footer__link">privacy</a></li>
                    <li class="footer__item"><a href="#" class="footer__link">terms</a></li>
                    <li class="footer__item"><a href="#" class="footer__link">directory</a></li>
                    <li class="footer__item"><a href="#" class="footer__link">language</a></li>
                </ul>
            </nav>
            <span class="footer__copyright">© 2017 instagram</span>
        </footer>
        <div class="popUp">
            <i class="fa fa-times fa-2x"></i>
            <div class="popUpContainer">
                <a href="#" class="popUpLink">Report inappropiate</a>
                <a href="#" class="popUpLink">Embed</a>
                <a href="http://google.com" class="popUpLink closePopUpBtn">Cancel</a>
            </div>
        </div>
        <script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
        <script src="js/app.js"></script>
    </body>
</html>