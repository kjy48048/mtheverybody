<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>

  <title>자취생을 위한 모두의 떨이</title>
  <link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo/image2.png">
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/subbootstrap.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/shop-homepage.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/selectbox.css">
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Cute+Font&amp;subset=korean" rel="stylesheet">
  <style>
    .wrapper.box >img:first-child{
      width: 90%;
      height: 400px;
      margin: 30px 0;
  }
  .wrapper.box >img:nth-of-type(2){
    float: left;
    width: 55%;
    margin-top: 40px;
  }

  .wrapper.box >img:nth-of-type(3){
    float: right;
    width: 55%;
    margin-top: 50px;
  }

  .wrapper.box{
      width: 100%;
  }

  .aboutword{
    font-family: 'Cute Font', cursive;
    font-size: 2em;
  }

  .aboutword.one{
    text-align: center;
    margin-bottom: 50px;
    font-size: 2.5em;
    font-family: 'Black Han Sans', sans-serif;
  }

  .aboutword.two{
    text-align: left;
    margin-bottom: 50px;
    
  }

  .aboutword.three{
    margin-bottom: 50px;
  }

  @media(max-width:768px){

    .wrapper.box >img:nth-of-type(2), .wrapper.box >img:nth-of-type(3){
      width: 100%;
    }
    .wrapper.box>img:first-child{
      width: 100%;
      height: 300px;
    }
    .aboutword.two{
      text-align: center;
    }
  }

  </style>
</head>

<body>
  <!-- 헤더 영역 -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <jsp:include page="../commons/header.jsp" />
  </nav>

  <!-- wrapper 시작 -->
  <div class="wrapper body">
    <!-- row 시작 -->
    <div class="row">
      <!-- /.col-lg-3 시작 -->
      <div class="col-lg-3">
        <!-- 사이드바 -->
        <h1 class="my-4">About</h1>
        <jsp:include page="../commons/asideHome.jsp" />
        <!-- 사이드바 끝 -->
        <!-- 광고상자 -->
        <div class="advertiseAside">
          <p>광고</p>
        </div>
        <!-- 광고상자 끝 -->
      </div>
      <!-- /.col-lg-3 끝 -->
      <!-- col-lg-9 시작 -->
      <div class="col-lg-9">
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <!-- 내용 넣는 공간 -->
          <div class="wrapper box">
            <img src="${pageContext.request.contextPath}/resources/img/about/about1.png" alt="">
            <p class="aboutword one">
              자취생을 위한 모두의 떨이에 오신 것을 환영합니다.
            </p>
            <img src="${pageContext.request.contextPath}/resources/img/about/about5.png" alt="">
            <p class="aboutword">
              저희는 소비자분들이 원하시는 지역/브랜드/물품종류/가격에 해당하는 편의점과 물품을 검색하여 소비자분들의 편의점 접근성을 향상시키고자 했습니다.
            </p>
            <p class="aboutword three">
              아울러 편의점주님들이 유통기간이 임박한 물품에 대한 판매를 촉진할 수 있도록 하여 폐기식품 처리 비용 감소 및 영업이익을 증대시키고자 했습니다. 
            </p>
            <img src="${pageContext.request.contextPath}/resources/img/about/about6.png" alt="">
            <p class="aboutword two">
              저희 사이트의 주요 기능은 다음과 같습니다. <br>
              1. 편의점 물품 관련 정보 공유를 위한 커뮤니티 공간 제공 <br>
              2. 내 위치 주변에 있는 편의점 검색 기능 <br>
              3. 내가 원하는 떨이상품 검색 기능 <br>
              4. 편의점주님들이 판매촉진을 원하는 상품 등록 가능 <br>
              5. 열심히 일할 준비가 된 관리자들
            </p>
          </div>
        </div>

      </div>
      <!-- /.col-lg-9 끝 -->

    </div>
    <!-- /.row 끝 -->
  </div>
  <!-- /.wrapper 끝 -->

  <!-- Footer 시작 -->
  <footer class="py-5 bg-dark">
    <jsp:include page="../commons/footer.jsp" />
  </footer>
  <!-- Footer 끝 -->
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/jquery.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>