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
  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/subbootstrap.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/shop-homepage.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/selectbox.css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

    <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	.panel-heading.boot {
		padding: 0px 15px;
	}
	
	@media ( min-width : 768px) {
		.col-md-3 {
			flex: 0 0 100%;
			max-width: 100%;
		}
    }

    .text-center.pull-left{
        padding-bottom: 0;
        font-size: 20px;
        float: none !important;
        margin-top: 10px;
        margin-bottom: 5px;
    }

    .btn.btn-primary{
        float: right;
        margin-top: 14px;
    }

    .pagination{
        margin: 15px 0;
    }

    #searchBox{
        display: inline-flex;
        float: right;
    }

    select.form-control:not([size]):not([multiple]) {
        width: 80px;
        margin-right: 10px;
    }
    
    .form-control.text{
        width: 200px;
        margin-right: 10px;
    }

    .panel-warning.boot{
        margin-top: -15px;
        
    }

    @media(max-width:768px){
        .table.table-hover.main>thead>tr>th:first-child, .table.table-hover.main>tbody>tr>td:first-child,
        .table.table-hover.main>thead>tr>th:last-child, .table.table-hover.main>tbody>tr>td:last-child,
        .table.table-hover.main>thead>tr>th:nth-child(5), .table.table-hover.main>tbody>tr>td:nth-child(5){
            display: none;
        }
    }

    .boarddeco.one{
        width: 100%;margin-top: 25px;
    }
</style>
  <title>자취생을 위한 모두의 떨이</title>
  <link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo/image2.png">
</head>

<body>
    <!-- 헤더 영역 -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <jsp:include page="../commons/header.jsp" />
  </nav>

  <!-- wrapper 시작 -->
  <div class="wrapper">
      <!-- row 시작 -->
      <div class="row">
          <!-- /.col-lg-3 시작 -->
          <div class="col-lg-3">
              <!-- 사이드바 -->
              <h1 class="my-4">Board</h1>
              <jsp:include page="../commons/asideHome.jsp" />
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
              
                  <img src="${pageContext.request.contextPath}/resources/img/boarddeco.png" alt="" class="boarddeco one">
                  <!-- 메인보드로직 시작... -->
                  <div class="panel panel-warning boot">
                      <div class="panel-heading boot">
                          <div class="row">
                              <div class="col-xs-12 col-sm-12 col-md-3">
                                  <h2 class="text-center pull-left" style="padding-left: 30px;"> 자유 게시판 </h2>
                              </div>
                          </div>
                      </div>
                      <div class="panel-body table-responsive">
                          <table class="table table-hover">
                              <thead>
                                  <tr>
                                      <th class="text-center"> 번호 </th>
                                      <th class="text-center"> 카테고리 </th>
                                      <th class="text-center"> 제목 </th>
                                      <th class="text-center"> 작성자 </th>
                                      <th class="text-center"> 등록일 </th>
                                      <th class="text-center"> 조회 </th>
                                      <!-- 추천수 추가 -->
                                      <th class="text-center"> 추천수 </th>
                                  </tr>
                              </thead>

                              <tbody>
                                  <!-- 메인 보드 가져오기... -->
							<c:forEach var='freeData' items='${freeDataList }'>
							<c:choose>
									<c:when test='${freeData.freeVO.free_category=="비밀" }'>
										<c:choose>
											<c:when test='${sessionLoginedData.member_code=="ADMIN"||sessionLoginedData.member_idx==freeData.memberVO.member_idx}'>
												<tr><!-- 비밀글 보여주기 -->
												<td class="text-center">${freeData.freeVO.free_idx}</td>
												<td class="text-center">${freeData.freeVO.free_category}</td>
												<td class="text-center">
												<a href='${pageContext.request.contextPath  }
												/freeboard/readFreeContent?free_idx=${freeData.freeVO.free_idx }&pageNum=${searchData.pageNum}'>
												 ${freeData.freeVO.free_title} [${ freeData.free_re_count}]
												</a>
												</td>
												<td class="text-center">${freeData.memberVO.member_nick}</td>
												<td class="text-center">${freeData.freeVO.free_writedate}</td>
												<td class="text-center">${freeData.freeVO.free_count}</td>
												<!-- 추천수 추가 -->
												<td class="text-center">${freeData.free_likeCount}</td>
												</tr>																
											</c:when>
											<c:otherwise ><!-- 비밀글입니다 -->
												<tr>
												<td class="text-center">##</td>
												<td class="text-center">${freeData.freeVO.free_category}</td>
												<td class="text-center">[secret] ${freeData.freeVO.free_title}</td>
												<td class="text-center">##</td>
												<td class="text-center">##-##</td>
												<td class="text-center">##</td>
												<!-- 추천수 추가 -->
												<td class="text-center">##</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:when>
								<c:otherwise>
									<tr>
									<td class="text-center">${freeData.freeVO.free_idx}</td>
									<td class="text-center">${freeData.freeVO.free_category}</td>
									<td class="text-center">
									<a href='${pageContext.request.contextPath  }
									/freeboard/readFreeContent?free_idx=${freeData.freeVO.free_idx }&pageNum=${searchData.pageNum}'>
									 ${freeData.freeVO.free_title} [${ freeData.free_re_count}]
									</a>
									</td>
									<td class="text-center">${freeData.memberVO.member_nick}</td>
									<td class="text-center">${freeData.freeVO.free_writedate}</td>
									<td class="text-center">${freeData.freeVO.free_count}</td>
									<!-- 추천수 추가 -->
									<td class="text-center">${freeData.free_likeCount}</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</c:forEach>
                              </tbody>
                          </table>
                          
                          <!-- 페이징 부분 -->
                          <div class="page-nation">
                              <ul class="pagination pagination-large">
                                  <li class="previous-end">
                                  <a href='${pageContext.request.contextPath }/freeboard/freeBoard?pageNum=1&searchSelect=${searchSelect }&searchWord=${searchWord}'>
                                  <span>&laquo;</span>
                                  </a>
                                  </li>
                                  <li class="previous">
                                  
                                  <c:if test='${pageNum==1 }'>
                                  <span>&lsaquo; </span>
                                  </c:if>
                                  
                                  <c:if test='${pageNum!=1 }'>
                                  <a href='${pageContext.request.contextPath }/freeboard/freeBoard?pageNum=${pageNum-1}&searchSelect=${searchSelect }&searchWord=${searchWord}'>
                                  <span>&lsaquo; </span>
                                  </a>
                                  </c:if>
                                  
                                  </li>
                                  <!-- 페이징로직... -->
                                  <c:forEach var='i' begin='1' end='${paging }' step='1' varStatus='status'>
                                  <c:choose>
                                        <c:when test="${i == pageNum}">
                                            <li class="active">
                                                <a href='${pageContext.request.contextPath }/freeboard/freeBoard?pageNum=${i }&searchSelect=${searchSelect }&searchWord=${searchWord}'>
                                                    <span style="cursor:pointer">${i }</span></a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <a href='${pageContext.request.contextPath }/freeboard/freeBoard?pageNum=${i }&searchSelect=${searchSelect }&searchWord=${searchWord}'>
                                                    <span>${i }</span></a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                  </c:forEach>
                                  
                                  <li class="next">
                                  <c:if test='${pageNum==paging }'>
                                  <span>&rsaquo;</span>
                                  </c:if>
                                  
                                  <c:if test='${pageNum!=paging }'>
                                  <a href='${pageContext.request.contextPath }/freeboard/freeBoard?pageNum=${pageNum+1}&searchSelect=${searchSelect }&searchWord=${searchWord}'>
                                  <span>&rsaquo;</span>
                                  </a>
                                  </c:if>
                                  
                                  </li>
                                  <li class="next-end">
                                  <a href='${pageContext.request.contextPath }/freeboard/freeBoard?pageNum=${paging }&searchSelect=${searchSelect }&searchWord=${searchWord}'>
                                  <span>&raquo;</span>
                                  </a>
                                  </li>

                                </ul>
                                <!-- 글쓰기 버튼 -->
                                <c:if test='${!empty sessionLoginedData }'>
                                    <a href='${pageContext.request.contextPath  }/freeboard/writeFreeContentForm?pageNum=${searchData.pageNum}' class="btn btn-primary">글쓰기</a>
                                </c:if>
                          </div>
                          
                          <!-- 검색 부분 -->
                          <form action='${pageContext.request.contextPath }/freeboard/freeBoard' method='post'>
                          <div id='searchBox'>
							<select name='searchSelect' class="form-control select">
							<c:if test='${searchSelect!="free_content" }'>
								<option value='free_title' selected='selected'>제목</option>
								<option value='free_content'>내용</option>
							</c:if>
							<c:if test='${searchSelect=="free_content" }'>
								<option value='free_title'>제목</option>
								<option value='free_content' selected='selected'>내용</option>
							</c:if>
								<!-- <option value='member_nick' selected='selected'>작성자</option> -->
							</select>
							<input type='text' name='searchWord' value='${searchWord }' class="form-control text">
							<input type='submit' value='검색' class="btn btn-light">
                          </div>
                          </form>
                      </div>

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
