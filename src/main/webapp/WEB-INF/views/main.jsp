<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--헤더-->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FAINT</title>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cssgram-cssgram.netdna-ssl.com/cssgram.min.css">
</head>
<style>

._owark{-webkit-box-flex:1;-webkit-flex-grow:1;-ms-flex-positive:1;flex-grow:1;margin:0 auto;max-width:600px;position:relative;width:100%}
._gsusx{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-flow:row nowrap;-ms-flex-flow:row nowrap;flex-flow:row nowrap;max-width:935px}
._62ky5{display:block}
._k46tg{display:inline-block;margin-top:2px;vertical-align:middle}
._14b0y{margin-bottom:30px}
._d4oao{float:left;margin-right:28px;max-width:614px;width:100%}
._s5vjd:last-child{margin-bottom:0}
._7axot{-webkit-align-self:center;-ms-flex-item-align:center;align-self:center}
._qgv8j{-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;-webkit-box-pack:justify;-webkit-justify-content:space-between;-ms-flex-pack:justify;justify-content:space-between;padding-top:8px}
._m0zxo{position:fixed;bottom:0;left:0}._hw7lt{background:0 0;border:0;margin:0;padding:0}
@media (min-width:640px){._owark{padding-top:60px}._2wxtj{background:#fff;border-radius:3px;border:1px solid #efefef}._4sf0r,._7g4gl,._nx5in,._ouv75,._psd08,._s5vjd{background-color:#fff;margin-left:-1px;margin-right:-1px}._4sf0r,._nx5in,._ouv75,._psd08,._s5vjd{border-radius:3px;border:1px solid #e6e6e6}._2wxtj,._7g4gl,._s5vjd{margin-bottom:60px}._nx5in,._ouv75,._psd08{margin-bottom:20px}}
@media (max-width:640px){._owark{margin-bottom:10px}._nx5in,._ouv75,._psd08{border-bottom:1px solid #e6e6e6}._nx5in,._ouv75{background-color:#fff}}
@media (max-width:735px){._2wxtj,._s5vjd{margin-bottom:15px}._7g4gl{margin-bottom:30px}}

._havey,._sfpqp{-webkit-box-orient:vertical;-webkit-box-direction:normal;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column}._sfpqp{-webkit-box-orient:horizontal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row}


<!--헤더 -->
._622au{padding:0}._9dpug{border-bottom:1px solid #efefef}._9dpug._msz04{height:76px;padding:0 16px 16px}._5mwg7{height:60px;-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center;position:absolute}._ebcx9{padding:0 16px}
._8oo9w{margin-top:4px}._nlmjy{margin-bottom:8px}._277v9{-webkit-box-flex:1;-webkit-flex-grow:1;-ms-flex-positive:1;flex-grow:1;-webkit-flex-shrink:1;-ms-flex-negative:1;flex-shrink:1;min-height:0;overflow:auto}._277v9,._6d44r{margin-bottom:4px}._ti7l3{margin-top:4px}._e34hf{display:none}._fsupd ._ti7l3{min-height:48px}._5lms4 ._ti7l3{padding-right:26px}._fsupd ._9dpug{padding-right:40px}._fsupd ._5mwg7{right:10px;top:0}._5lms4 ._5mwg7{bottom:0;height:52px;right:10px;top:auto}._8n9ix._9445e ._8oo9w{margin-top:-34px}._4kplh{width:100%}._4kplh ._sxolz{background-color:#000;-webkit-box-pack:center;-webkit-justify-content:center;-ms-flex-pack:center;justify-content:center;margin-right:335px;min-height:450px}._4kplh ._sxolz._mi48x{background-color:#fafafa}._4kplh ._9dpug{border-bottom:1px solid #efefef;height:78px;margin-right:0;padding:20px 0;position:absolute;right:24px;top:0;width:287px}._4kplh ._9dpug._msz04{height:98px;padding:0 0 20px}._4kplh ._ebcx9{bottom:0;-webkit-box-sizing:border-box;box-sizing:border-box;padding-left:24px;padding-right:24px;position:absolute;right:0;top:78px;width:335px}._4kplh ._ebcx9._6zn4x{top:98px}._4kplh ._8oo9w{border-top:1px solid #efefef;margin:0;-webkit-box-ordinal-group:3;-webkit-order:2;-ms-flex-order:2;order:2;padding-top:2px}._4kplh ._nlmjy{margin-bottom:4px;-webkit-box-ordinal-group:4;-webkit-order:3;-ms-flex-order:3;order:3}._4kplh ._277v9{margin:0 -24px auto;-webkit-box-ordinal-group:2;-webkit-order:1;-ms-flex-order:1;order:1;padding:12px 24px}._4kplh ._6d44r{margin-bottom:0;-webkit-box-ordinal-group:5;-webkit-order:4;-ms-flex-order:4;order:4}._4kplh ._ti7l3{-webkit-box-ordinal-group:6;-webkit-order:5;-ms-flex-order:5;order:5}._4kplh._5lms4 ._5mwg7{right:18px}@media (-webkit-min-device-pixel-ratio:2){._8n9ix ._9dpug{border-bottom-width:.5px}}
._7b8eu,._csp04{-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row}._7b8eu{height:60px;padding:16px;-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center}._iuvin button{line-height:18px;padding:0}._csp04{-webkit-box-align:baseline;-webkit-align-items:baseline;-ms-flex-align:baseline;align-items:baseline}._6y8ij{max-width:100%}._s7b66{display:inline}._74oom{-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;-webkit-box-align:baseline;-webkit-align-items:baseline;-ms-flex-align:baseline;align-items:baseline;max-width:240px}._j56ec{-webkit-box-align:start;-webkit-align-items:flex-start;-ms-flex-align:start;align-items:flex-start;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-flex:1;-webkit-flex-grow:1;-ms-flex-positive:1;flex-grow:1;-webkit-flex-shrink:1;-ms-flex-negative:1;flex-shrink:1;margin-left:12px;overflow:hidden}._k32zm{padding-top:20px}._60iqg{display:block;max-width:100%;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}._eeohz{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;max-width:100%}._iadoq,._iadoq:visited{color:#262626;-webkit-box-flex:0;-webkit-flex-grow:0;-ms-flex-positive:0;flex-grow:0;-webkit-flex-shrink:1;-ms-flex-negative:1;flex-shrink:1}._hz9vr{-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0;margin-left:5px}._elp6f{color:#999;display:inline-block;max-width:100%}
._82odm{-webkit-align-self:center;-ms-flex-item-align:center;align-self:center;display:block;-webkit-box-flex:0;-webkit-flex:none;-ms-flex:none;flex:none}._qtgjd{cursor:pointer}._15vpm{-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;-webkit-tap-highlight-color:transparent;-webkit-touch-callout:none}
._pg23k{background-color:#fafafa;border-radius:50%;-webkit-box-sizing:border-box;box-sizing:border-box;display:block;-webkit-box-flex:0;-webkit-flex:0 0 auto;-ms-flex:0 0 auto;flex:0 0 auto;overflow:hidden;position:relative}._pg23k::after{border:1px solid rgba(0,0,0,.0975);border-radius:50%;bottom:0;content:"";left:0;pointer-events:none;position:absolute;right:0;top:0}._jpwof{cursor:pointer}._rewi8{height:100%;width:100%}
._2g7d5{font-weight:600;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;padding-left:5px;margin-left:-5px}

._km7ip {
    border-top: 1px solid #efefef;
    color: #999;
    -webkit-flex-shrink: 0;
    -ms-flex-negative: 0;
    flex-shrink: 0;
    font-size: 14px;
    line-height: 18px;
    min-height: 56px;
    -webkit-box-pack: center;
    -webkit-justify-content: center;
    -ms-flex-pack: center;
    justify-content: center;
    padding: 16px 0;
}

<!-- 게시물 내용 -->
._b6i0l,._bilrf{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-flex:1;-webkit-flex-grow:1;-ms-flex-positive:1;flex-grow:1}._b6i0l{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center;-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;-webkit-flex-shrink:1;-ms-flex-negative:1;flex-shrink:1;position:relative}._bilrf{background:0 0;border:0;color:#262626;font-size:inherit;height:18px;max-height:80px;outline:0;padding:0;resize:none}
._bilrf:disabled{opacity:.3;pointer-events:none}
._bilrf::-webkit-input-placeholder,._bilrf:focus::-webkit-input-placeholder{color:#999}
._bilrf:-ms-input-placeholder,._bilrf::-ms-input-placeholder,._bilrf:focus:-ms-input-placeholder,._bilrf:focus::-ms-input-placeholder{color:#999}
._bilrf::placeholder,._bilrf:focus::placeholder{color:#999}
._55p7a{background:0 0;border:0;color:#3897f0;-webkit-box-flex:0;-webkit-flex-grow:0;-ms-flex-positive:0;flex-grow:0;-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0;font-size:16px;font-weight:500;padding:0 8px;margin-right:-8px}
._55p7a:disabled{color:#b4daff}

<!--이미지 보이는 부분 -->
._pak6p{left:0}._by8kl{right:0}._by8kl,._pak6p{cursor:pointer;display:block;margin-left:12px;margin-right:12px;opacity:0;overflow:hidden;position:absolute;pointer-events:auto;text-indent:0;top:50%}._k7ih4:hover ._by8kl,._k7ih4:hover ._pak6p{opacity:1;-webkit-transition:opacity .2s ease-out;transition:opacity .2s ease-out;-webkit-transition-delay:.1s;transition-delay:.1s}._8kphn{margin-top:-15px}._5wmqs{margin-top:-38px}._5zbvx,._jzfl1{border-radius:50%;height:6px;margin-left:2px;margin-right:2px;-webkit-transition:all .2s ease-in-out;transition:all .2s ease-in-out;width:6px}._5zbvx{background:#dbdbdb}._jzfl1{background:#fff;opacity:.4}._i22oc{opacity:1}._c0g09{background:#3897f0}._4ag49{table-layout:fixed}._4c7y4,._g5463{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center}._4c7y4{bottom:15px;left:6px;position:absolute;right:6px}._g5463{margin-bottom:15px;margin-top:15px}._8bjpz,._k7ih4{left:0;position:relative;top:0}._8bjpz,._l5mmu{display:block}._k7ih4 ._l4l38{left:0;position:absolute;right:0;top:0}
._e3il2{background-color:#efefef;display:block;width:100%}._4rbun{display:block;overflow:hidden;padding-bottom:100%}._2di5p,._si7dy{left:0;position:absolute;top:0}
._2di5p{
/* height:100%; */
-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;width:100%}._si7dy{bottom:0;right:0}
._6p9ga{background-color:transparent;border:0;cursor:pointer;padding:8px}
<!--하단 -->
._8scx2{display:block;overflow:hidden;text-indent:110%;white-space:nowrap}._gvoze:active{opacity:1}._fkers,._fkers:visited{color:#3897f0}
._hmd6j{-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row}
._eszkz{margin-left:-8px}
._eszkz,._mpkky,._p6oxf{display:inline-block}
._6p9ga {background-color: transparent; border: 0; cursor: pointer; padding: 8px;}
._mpkky{margin-left:auto;margin-right:-8px}
._et4ho {background-color: transparent; border: 0; padding: 8px;}
._l9yih{background-color:transparent;border:0;cursor:pointer;padding:8px}._fyy4z{cursor:default;opacity:.3}
._nlmjy {margin-bottom: 8px;}
._1w76c{-webkit-box-orient:horizontal;-webkit-box-direction:normal;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;-webkit-box-pack:end;-webkit-justify-content:flex-end;-ms-flex-pack:end;justify-content:flex-end}._3gwk6{-webkit-box-flex:1;-webkit-flex-grow:1;-ms-flex-positive:1;flex-grow:1;-webkit-flex-shrink:1;-ms-flex-negative:1;flex-shrink:1}
._nt9ow{display:block}._de460,._de460:visited,._nt9ow{color:#262626}._nzn1h,._nzn1h:visited{font-weight:600;color:#262626}._gu6vm{cursor:pointer}

._4a48i{margin-top:-5px;padding-top:5px;overflow-anchor:none;-webkit-overflow-scrolling:touch}._b0tqa{-webkit-box-flex:1;-webkit-flex-grow:1;-ms-flex-positive:1;flex-grow:1}._56pd5{margin-bottom:8px}._m3m1c{background:0 0;border:0;color:#999;font-size:inherit;margin:0;padding:0}._1s3cd{cursor:pointer}._9whrc{display:inline-block;margin:0 0 0 2px;position:static}._9whrc,._m3m1c{vertical-align:middle}

<!--댓글 -->
._277v9, ._6d44r {
    margin-bottom: 4px;
}
._277v9 {-webkit-box-flex: 1;-webkit-flex-grow: 1;-ms-flex-positive: 1;flex-grow: 1;-webkit-flex-shrink: 1;-ms-flex-negative: 1;flex-shrink: 1;min-height: 0;overflow: auto;}
._4a48i {margin-top: -5px;padding-top: 5px;overflow-anchor: none; -webkit-overflow-scrolling: touch;}
._b0tqa {-webkit-box-flex: 1; -webkit-flex-grow: 1; -ms-flex-positive: 1;  flex-grow: 1;}
._ezgzd { overflow: hidden; position: relative; word-wrap: break-word; margin-top: -5px;  padding-top: 5px;}
._56pd5 {margin-bottom: 8px;}
._2g7d5 {font-weight: 600;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;padding-left: 5px; margin-left: -5px;}
     
.coreSpriteRightChevron, .coreSpriteRightPaginationArrow {
    background-position: -395px -430px;
    height: 30px;
    width: 30px;
    background-repeat: no-repeat;
}
.coreSpriteLeftChevron, .coreSpriteLeftPaginationArrow {
    background-position: -378px -317px;
    height: 30px;
    width: 30px;
}

<!-- 사진 넘기기 -->
._jad47{display:block}._pak6p{left:0}._by8kl{right:0}
._by8kl,._pak6p{cursor:pointer;display:block;margin-left:12px;margin-right:12px;opacity:0;overflow:hidden;position:absolute;pointer-events:auto;top:50%}
._k7ih4:hover ._by8kl,._k7ih4:hover ._pak6p{opacity:1;-webkit-transition:opacity .2s ease-out;transition:opacity .2s ease-out;-webkit-transition-delay:.1s;transition-delay:.1s}._8kphn{margin-top:-15px}._5wmqs{margin-top:-38px}
._5zbvx,._jzfl1{border-radius:50%;height:6px;margin-left:2px;margin-right:2px;-webkit-transition:all .2s ease-in-out;transition:all .2s ease-in-out;width:6px}._5zbvx{background:#dbdbdb}._jzfl1{background:#fff;opacity:.4}._i22oc{opacity:1}._c0g09{background:#3897f0}._4ag49{table-layout:fixed}._4c7y4,._g5463{-webkit-box-align:center;-webkit-align-items:center;-ms-flex-align:center;align-items:center}._4c7y4{bottom:15px;left:6px;position:absolute;right:6px}._g5463{margin-bottom:15px;margin-top:15px}._8bjpz,._k7ih4{left:0;position:relative;top:0}._8bjpz,._l5mmu{display:block}._k7ih4 ._l4l38{left:0;position:absolute;right:0;top:0}


.likeModal {
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
.likeModal-content {
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
</style>

<body>

<ul id="categoryList">
	<li><a href="javascript:;" data-filter="all" tabindex="-1">ALL</a></li>
	<li><a href="javascript:;" data-filter="1" tabindex="-1">1</a></li>
	<li><a href="javascript:;" data-filter="2" tabindex="-1">2</a></li>
	<li><a href="javascript:;" data-filter="3" tabindex="-1">3</a></li>
</ul>


<span id="react-root" aria-hidden="false">

	<section class="_sq4bv _29u45">
	<main class="_8fi2q _2v79o" role="main">
	
	<c:forEach items="${list}" var="postDTO">
	
	<section class ="_owark">
	<div class>
	<div>
	<div class="_havey">

		<article class="post _s5vjd _622au _5lms4 _8n9ix _9445e" data-filter="${postDTO.cateid}">
			<header class="_7b8eu _9dpug">
				<div class="_82odm _i2o1o">
					<a class="_pg23k _jpwof _gvoze" href="/member/${postDTO.usernickname}" style="width: 30px; height: 30px;">
						<!-- 프로필 이미지 -->
						<img class="_rewi8" src="
							<c:if test="${postDTO.profilephoto ne null && postDTO.profilephoto != '' }">
								/displayFile?fileName=${postDTO.profilephoto}
							</c:if>
							<c:if test="${postDTO.profilephoto eq null || postDTO.profilephoto == '' }">
								../../resources/img/emptyProfile.jpg
							</c:if>
						">
					</a>
				</div>
				<div class="_j56ec">
					<div>
						<div class="_eeohz">
							<a class="_2g7d5 notranslate _iadoq" href="/member/${postDTO.usernickname}">
							${postDTO.usernickname}
							</a>
						</div>
					</div>
					<div class="_60iqg">
						<a class="_q8ysx _6y8ij" id="address" href="">지역명(미구현)</a>
					</div>
				</div>
			</header>
			
			<div class="_sxolz">
				<div>
					<div class="_k7ih4">
						<div>
							<div class="_e3il2 _gxii9">
								<div class="imageContainer _4rbun" >
									<c:set var="urlList" value="${fn:split(postDTO.url, '[|]')}"/>
									<c:forEach var="url" items="${urlList}" varStatus="status">
										<img alt="이미지" class="_2di5p" src="/displayFile?fileName=${url}"
										style=" <c:out value="${status.index eq 0 ? '' : 'display: none;'}"/> ">
										<c:if test = "${status.index eq 0}">
											<script>
												$('#imgdiv').css("padding-bottom", ${url.naturalHeight}/6+"%");
											</script>
										</c:if>
									</c:forEach>]
								</div>
								<div class="_si7dy"></div>
							</div>
						</div>
						
						<!-- 왼쪽 이미지 이동 버튼 -->
						<a class="_5wmqs _pak6p coreSpriteLeftChevron" role="button" id="moveLeft" style ="display: none"><i class="fa fa-chevron-circle-left"style="font-size: 30px; color: lightgray;"></i></a>
						<!-- 오른쪽 이미지 이동 버튼 -->
						<a class="_5wmqs _by8kl coreSpriteRightChevron" role="button" id="moveRight" style="<c:out value="${fn:length(urlList) eq 1 ? 'display: none;' : ''}"/>">
						<i class="fa fa-chevron-circle-right" style="font-size: 30px; color: lightgray;"></i></a>
						<!-- 사진 몇개인지 표시 -->
						<div class=" _g5463"> 
							<table class="_4ag49">
								<tbody>
								<tr>
								<c:forEach var="url" items='${urlList}' varStatus='status'>
								<!-- 현재 표시중인 이미지 위치는  _c0g09 -->
								<c:choose>
								<c:when test="${status.index eq 0}">
								</c:when>							
								<c:when test="${status.index eq 1}">
									<td><div class="_5zbvx _c0g09"></div></td>
									<td><div class="_5zbvx"></div></td>
								</c:when>
								<c:otherwise>
									<td><div class="_5zbvx"></div></td>
								</c:otherwise>
								</c:choose>
								</c:forEach>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			
			<div class="_ebcx9">
				<section class="_hmd6j _8oo9w" style="display: inline-block" title="${postDTO.postid}">
					<a class="_eszkz _l9yih" href="javascript:;" role="button">
						<span class="likeBtn _8scx2 coreSpriteHeartOpen"><c:out value="${postDTO.isLike == '1' ? '♥' : '♡'></span>
					</a>
					<a class="replyBtn _p6oxf _6p9ga" href="javascript:;" role="button">
						<span class="_8scx2 coreSpriteComment">댓글 달기</span>
					</a>
					<a class="_mpkky _et4ho" href="javascript:;" role="button" aria-disabled="false">
						<span class="storeBtn _8scx2 coreSpriteSaveOpen"><c:out value="${postDTO.isStore == '1' ? '■' : '□'></span>
					</a>
				</section>
				
				<section class="_1w76c _nlmjy">
					<div class="_3gwk6 _nt9ow">
						<a class="_nzn1h" href="javascript:;" class="likeContainer" title="${postDTO.postid}">좋아요 <span>0</span>개</a>
					</div>
				</section>
				
				<div class="_4a48i _277v9"><ul class="_b0tqa"><li class="_ezgzd"><a class="_2g7d5 notranslate _95hvo" title="oolongsawel" href="/oolongsawel/">oolongsawel</a><span><span><span>수미 우려마시기 끓여마시는 차이도 배우고 쟈스민백차 이야기도 했더니 샘플시음!! 무이암 알싸한 탄향이 나는 수선하고 홍차까지 마셨다 배려해주셔서 정말 좋은 시간이었습니다 </span><a href="/explore/tags/공부차/">#공부차</a><span> </span><a href="/explore/tags/공부차티하우스/">#공부차티하우스</a><span> </span><a href="/explore/tags/공부차서포터즈/">#공부차서포터즈</a></span><a class="_kq8rw" href="#">&nbsp;문구 더 보기</a></span></li><li class="_ezgzd"><a class="_2g7d5 notranslate _95hvo" title="dayei_kim" href="/dayei_kim/">dayei_kim</a><span><span><span>너머너무너무머누머너무 좋앗오!!🙆‍♀️🙆‍♀️❤️</span></span></span></li><li class="_ezgzd"><a class="_2g7d5 notranslate _95hvo" title="oolongsawel" href="/oolongsawel/">oolongsawel</a><span><span><a class="notranslate" href="/dayei_kim/">@dayei_kim</a><span> 다음에 나 학원끝나면 더 오래같이 함께해요..♡ 족발최고</span></span></span></li></ul></div>
				
				<div class="captionContainer _4a48i _277v9">
					<ul class="_b0tqa" id="post${postDTO.postid}" >
						<li class="_ezgzd"><a href="/member/${postDTO.usernickname}">${postDTO.usernickname}</a>	<span>${postDTO.caption}</span></li>
						<li class="moreReply _56pd5">
							<a class="_m3m1c _1s3cd" href="javascript:;">댓글더보기</a>
						</li>
						<div class="replyContainer" title="${postDTO.postid}" data-limit=0>
						</div>
					</ul>
				</div>
				
				<section class="_km7ip _ti7l3">
					<form class="_b6i0l">
						<textarea aria-label="댓글 달기..." placeholder="댓글 달기..." class="_bilrf" autocomplete="off" autocorrect="off">
						</textarea>
					</form>
				</section>
				
			</div>
			<div class="_lj408 _5mwg7">
				<button class="_tauyc">
					<span class="coreSpriteOptionsEllipsis _8scx2">옵션 더 보기</span>
				</button>
			</div>
		</article>
	
	</div>
	</div>
	</div>
	</section>
	
	</c:forEach>
	
	</main>
</section>

</span>

<script id="modalLike" type="text/x-handlebars-template">
<div id="myModal" class="likeModal">
	<span class="close">&times;</span>
	<div class="likeModal-content">
		<ul id="likersContainer">
		</ul>
	</div>
</div>
</script>

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
				$(replyContainer).before("<li class='moreReply _56pd5' data-limit='0'><a class='_m3m1c _1s3cd' href='javascript:;'>댓글더보기</a></li>");
			}
		 	
			// 게시물에 대한 댓글리스트 + 삭제버튼(해당 유저의 게시글일 경우만)
			var replystr="";
			$(rpldata).each(function(index){
				
				//댓글 최신 4개까지만 우선 출력 및 제한자에 따른 댓글 출력
				if( $(rpldata).length-(4+5*limit) <= index && index < $(rpldata).length ){ //20개씩 더 출력
					replystr +="<li class='_ezgzd' title='"+this.id+"'>"+
						"<a href='/member/"+this.username+"'>" + this.username +"</a>	<span>"+this.comment+"</span>";
					
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
	var comment=$(thisTag).val();
	//enter친 순간 앞뒤 공백 제거된 value값의 길이확인 
	if(enter==13 && comment.trim().length>0){
		var userid=${login.id};
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
				comment:comment.trim()
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

//게시물 저장 + 저장 취소
store();
function store(){
	$(".storeBtn").on("click", function(){
		var postid=$(this).parent().attr("title");
		var storeBtn=this;
		if($(this).html()=="□"){
			var type="post";
			var url ="/post/"+postid+"/store";
			var headers="{'X-HTTP-Method-Override' : 'POST'}";
			var val="■";
			
		}else if($(this).html()=="■"){
			var type="delete";
			var url ="/post/"+postid+"/takeaway";
			var headers="{'X-HTTP-Method-Override' : 'DELETE'}";
			var val="□";
		}
		$.ajax({
			type: type,
			url: url,
			headers: headers,
			dataType:"text",
			success:function(result){
				if(result=="SUCCESS"){
					$(storeBtn).html(val);
				};
			}
		});
	});
};

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
			headers: headers,
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

//좋아요 count+likerlist
likerList();
function likerList(){
	$(".likeContainer").each(function(){
		var pid=$(this).attr("title");
		var likeContainer = this;
		$.getJSON("/post/" + pid + "/likerlist", function(data){
			var likerList="";
			$(data).each(function(){
				if(this.isFollow>0){
					likerList+="<li><a href='/member/"+this.nickname+"'>" + this.nickname + "</a><button class='isFlw' title='"+this.id+"'>팔로잉</button></li>";
				}else if(this.isFollow==0 && this.id!=${login.id}){
					likerList+="<li><a href='/member/"+this.nickname+"'>" + this.nickname + "</a><button class='isFlw' title='"+this.id+"'>팔로우</button></li>";
				}else{
					likerList+="<li><a href='/member/"+this.nickname+"'>" + this.nickname + "</a></li>";
				}
			})
			
			if($(data).length>0){
				$(likeContainer).children("span").html($(data).length);
				$(likeContainer).on("click", function(){
					
					var source=$("#modalLike").html();
					var likers=Handlebars.compile(source);
					var likersModal=likers(data);
					$("body").append(likersModal);
					$("#likersContainer").html(likerList);
					
					//팔로우 + 언팔로우
					follow();
					
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
					
				});
			}else if($(data).length==0){
				$(likeContainer).children("span").html(0);
			}
		}); 
	});
};

//follow여부확인하여 팔로우/팔로우취소
function follow(){
	$(".isFlw").on("click", function(){
		var userid=$(this).attr("title");
		var isFlw=this;
		if(($(this).html()=="팔로우")){
			var type="post";
			var url ="/member/follow/"+userid;
			var header="{'X-HTTP-Method-Override' : 'POST'}";
			$(isFlw).html("팔로잉");
			
		}else if(($(this).html()=="팔로잉")){
			var type="delete";
			var url ="/member/unfollow/"+userid;
			var header="{'X-HTTP-Method-Override' : 'DELETE'}";
			$(isFlw).html("팔로우");
		}
		$.ajax({
			type: type,
			url: url,
			headers:{header},
			dataType:"text",
			success:function(result){
				if(result=="SUCCESS"){
					console.log("팔로우/언팔 성공")
				};
			}		
		});
	});
};

//댓글내용 및 글내용 검색처리
function searchFilter(){
	$(".intro, .captionContainer").find("span").each(function(){
		var text =$(this).text();
		var splitArray = text.split(" ");

		for(var i in splitArray){
			word = splitArray[i];
			if(word.indexOf("#")==0){
				var hash=word.substring(word.lastIndexOf("#")+1);
				splitArray[i] = "<a href='/search/tags?name="+hash+"'>"+splitArray[i]+"</a>";
				
			}else if(word.indexOf("@")==0){
				var person=word.substring(word.lastIndexOf("@")+1);
				splitArray[i] = "<a href='/member/"+person+"'>"+splitArray[i]+"</a>";
			
			}
 			else if(splitArray[i]==""){
				splitArray[i] = splitArray[i].replace("", "&nbsp;"); 
			}
		}
		
		var linkedContent = "";
		linkedContent=splitArray.join(" ");
		
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