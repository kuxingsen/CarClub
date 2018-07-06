<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>汽车管理首页</title>
	<link rel="stylesheet" href="css/index.css" />
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
	<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="/header.jsp"/>
<!-- 轮播图 -->
<div class='avs'>
	<div id='mycarousel' class='carousel slide' data-ride='carousel'>
		<!-- 幻灯片图片 -->
		<div class='carousel-inner'>
			<div class="item active">
				<img src="images/banner1.jpg" alt="">
			</div>

			<div class="item">
				<img src="images/banner2.jpg" alt="">
			</div>
			<!-- 指示灯 -->
			<ol class='carousel-indicators'>
				<li data-target='#mycarousel' data-slide-to='0' class='active'></li>
				<li data-target='#mycarousel' data-slide-to='1'></li>
			</ol>
		</div>
	</div>
</div>
<!-- 内容区 -->
<div class="content">
	<div class="width1003">
		<h2 class="title">
			提醒与记录
			<span>/ notice & records</span>
		</h2>
		<div class="notice_info">
			<ul class="info">
			<c:forEach items="${trainList}" var="train">
				<li>
					<span class="TrainMessage">${train.trainMessage}</span>
					<span class="TrainTime">${train.trainTime}</span>
				</li>
			</c:forEach>
			</ul>
		</div>
		<div class="save_info">
			<ul class="info2">
				<c:forEach items="${rescueList}" var="rescue">
					<li>
						<span class="saveInfo">在${rescue.rescuePlace}${rescue.rescueStatus}</span>
						<span class="saveTime">${rescue.rescueTime}</span>
					</li>
				</c:forEach>
			</ul>
		</div>

	</div>
	<div class="clearfix"></div>
	<div class="width1003">
		<h2 class="title">
			旅游路线
			<span>/ Travel Routes</span>
		</h2>
		<div class="travelRoutes">
			<ul class="routes">
				<li>
					<a href="">昆明-大理-丽江-香格里拉-稻城-雅安-成都</a>
					<span class="servePrice">定制价格:<span class="price" >1000</span>元</span>
				</li>
				<li>
					<a href="">西安-平凉-兰州-武威-张掖-嘉峪关-敦煌-哈密-吐鲁番</a>
					<span class="servePrice">定制价格:<span class="price">1000</span>元</span>
				</li>
				<li>
					<a href="">乌鲁木齐-和田-喀什-阿克苏-库车-吐鲁番</a>
					<span class="servePrice">定制价格:<span class="price">1000</span>元</span>
				</li>
				<li>
					<a href="">重庆-娄山关-贵阳-柳州-桂林-北海-南宁-都匀-红枫湖-重庆</a>
					<span class="servePrice">定制价格:<span class="price">1000</span>元</span>
				</li>
				<li>
					<a href="">海口-三亚-通什-万宁-文昌-海口</a>
					<span class="servePrice">定制价格:<span class="price">1000</span>元</span>
				</li>
				<li>
					<a href="">上海-同里-周庄-南浔-乌镇-西塘-上海</a>
					<span class="servePrice">定制价格:<span class="price">1000</span>元</span>
				</li>
				<li>
					<a href="">北京-太原-平遥-壶口-西安-延安-太原-北京</a>
					<span class="servePrice">定制价格:<span class="price">1000</span>元</span>
				</li>
			</ul>
		</div>
		<div class='avs'>
			<div id='mycarousel2' class='carousel slide' data-ride='carousel'>
				<!-- 幻灯片图片 -->
				<div class='carousel-inner travel_img'>
					<div class="item active">
						<img src="images/travel1.jpg" alt="">
					</div>

					<div class="item">
						<img src="images/travel2.jpg" alt="">
					</div>
					<div class="item">
						<img src="images/travel3.jpg" alt="">
					</div>
					<!-- 指示灯 -->
					<ol class='carousel-indicators'>
						<li data-target='#mycarousel2' data-slide-to='0' class='active'></li>
						<li data-target='#mycarousel2' data-slide-to='1'></li>
						<li data-target='#mycarousel2' data-slide-to='2'></li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<span class="index" style="display:none">0</span>
<jsp:include page="/footer.jsp"/>
<jsp:include page="/modal.jsp"/>
</body>
<script type="text/javascript">
    $(function(){
        //导航定位
        $(".nav li:eq(0) a:first").addClass("navCur");
    })
</script>
<script src="js/index.js"></script>
</html>