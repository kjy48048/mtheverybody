<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
   pageContext.setAttribute("enter", "\n");
   pageContext.setAttribute("br", "<br/>");
%>
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


    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/popup.css"><!-- 팝업용 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/css/conProductInfoReply.css"><!-- 물품/편의점 정보&댓글 css -->
    <title>자취생을 위한 모두의 떨이</title>
    <link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/img/logo/image2.png">
	<style>
		.col-md-9 {
    -ms-flex: 0 0 100%;
    flex: 0 0 100%;
    max-width: 100%;
}
	</style>

</head>
<script>
$(document).ready(function() {
    
	getTime();

});

//시간 불러오기
function getTime() { 
    var now = new Date();
   
    for(var i=0; i<document.getElementsByClassName("counter0").length; i++) { //클래스[배열] 길이만큼 for문을 돌려서 각 클래스 처음부터 끝까지 시행
        var exdate = document.getElementsByClassName("counter0")[i].value;
    	var exyear = exdate.substr(0,4);
    	var exmonth = exdate.substr(5,2);
    	var exday = exdate.substr(8,2);
    	var extime = exdate.substr(11,2);
        var exminutes = exdate.substr(14,2);
        var exseconds = exdate.substr(17,2);
        
        var dday = new Date(exyear, exmonth, exday, extime, exminutes, exseconds); // 원하는 날짜, 시간 정확하게 초단위까지 기입.
        var days = (dday - now) / 1000 / 60 / 60 / 24;
        var daysRound = Math.floor(days);
        var hours = (dday - now) / 1000 / 60 / 60 - (24 * daysRound);
        var hoursRound = Math.floor(hours);
        var minutes = (dday - now) / 1000 / 60 - (24 * 60 * daysRound) - (60 * hoursRound);
        var minutesRound = Math.floor(minutes);
        var seconds = (dday - now) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound);
        var secondsRound = Math.round(seconds);
        
  	    document.getElementsByClassName("counter1")[i].innerHTML = hoursRound;
        document.getElementsByClassName("counter2")[i].innerHTML = minutesRound;
        document.getElementsByClassName("counter3")[i].innerHTML = secondsRound;
    }
    newtime = window.setTimeout("getTime();", 1000);
  }

function likeItem(item_idx) { //좋아요 ajax 로직...
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function(){
	
		if(xmlhttp.readyState == 4 && xmlhttp.status==200) { //200이면 완전 정상
			var likeItem = JSON.parse(xmlhttp.responseText);
			if(likeItem.success == "fail") {
				alert("로그인을 먼저하세요!");
			} else if(likeItem.likeItemInsert == "insert") {
				$(".img"+item_idx+"").attr("src","${pageContext.request.contextPath}/resources/img/like_inline.png");
				$(".likeCount"+item_idx+"").text(likeItem.likeItemCount);
			} else {
				$(".img"+item_idx+"").attr("src","${pageContext.request.contextPath}/resources/img/like_outline.png");
				$(".likeCount"+item_idx+"").text(likeItem.likeItemCount);
			}
		}
	};
	
	xmlhttp.open("POST", "${pageContext.request.contextPath}/likeItem", true);
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("item_idx="+item_idx);
   	
}

    //댓글 작성
    function submitConvenReContent()
    {
    	//댓글 내용 공백 체크
    	var inputConvenReContent = document.getElementById('input-convenReContent');
    	
    	if(inputConvenReContent.value == null || inputConvenReContent.value == '')
    	{
    		alert('댓글 내용을 작성해주세요.');
    		return;
    	}
    	else
    	{
    		var inputConvenReForm = document.getElementById('write-ConvenRe-form');
    		inputConvenReForm.action = '${pageContext.request.contextPath}/actionWriteConvenReContent?requestPagingNum=${pagingData.lastPagingNum}';
    		inputConvenReForm.submit();
    	}	
    }
    
    //댓글 수정 Ajax 처리
    function updateConvenReContet(conven_re_idx)
    {
    	//댓글 작성/수정 버튼 display 설정
    	document.getElementById('writeNewReplyBtn').style.display = "none";
    	document.getElementById('updateOldReplyBtn-box').style.display = "block";
    	
    	//input hidden 박스 추가
    	var inputConvenReForm = document.getElementById('write-ConvenRe-form');
    	var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "conven_re_idx");
		hiddenField.setAttribute("value", conven_re_idx);
		inputConvenReForm.appendChild(hiddenField);
    	
    	//댓글 ajax로 불러오기
		var xmlhttp = new XMLHttpRequest();
	
		xmlhttp.onreadystatechange = function(){
			
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
			{
				var result = xmlhttp.responseText;
				
				if(result == '' || result == null)
				{
					alert('수정할 댓글을 불러오는데 오류가 발생하였습니다.\n관리자에게 문의바랍니다.');
					location.reload(true);
				}
				else
				{
					var convenReContentArea = document.getElementById('input-convenReContent');
					convenReContentArea.value = result;
			    	return;
				}
			}
		};
		xmlhttp.open("POST","${pageContext.request.contextPath}/getConvenReContentByIdx",true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send("conven_re_idx="+conven_re_idx);
    }
    
	//수정한 댓글 submit
	function updateConvenReContent()
	{
		//댓글 내용 공백 체크
    	var inputConvenReContent = document.getElementById('input-convenReContent');
    	
    	if(inputConvenReContent.value == null || inputConvenReContent.value == '')
    	{
    		alert('댓글 내용을 작성해주세요.');
    		return;
    	}
    	else
    	{
    		var inputConvenReForm = document.getElementById('write-ConvenRe-form');
    		inputConvenReForm.action = '${pageContext.request.contextPath}/actionUpdateConvenReContent?requestPagingNum=${pagingData.nowPageNum}';
    		inputConvenReForm.submit();
    	}	
	}
    </script>
<body>
    <!-- 헤더 영역 -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <jsp:include page="commons/header.jsp" />
    </nav>

    <!-- wrapper 시작 -->
    <div class="wrapper body">
        <!-- row 시작 -->
        <div class="row">
            <!-- /.col-lg-3 시작 -->
            <div class="col-lg-3">
                <!-- 사이드바 -->
                <h1 class="my-4">Home</h1>
                <jsp:include page="commons/asideHome.jsp" />
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
                    <!-- 컨텐츠 정보 -->
                    <div class="row user-infos cyruxx">
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">편의점 정보</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class=" col-md-9">
                                            <strong>${convenData.brandVO.brand_name} ${convenData.convenVO.conven_name}</strong><br>
                                            <table class="table table-user-information">
                                                <tbody>
                                                    <tr>
                                                        <td>판매자 명:</td>
                                                        <td>${convenData.memberVO.member_name}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>판매자 연락처:</td>
                                                        <td>${convenData.memberVO.member_phone}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>판매자 이메일:</td>
                                                        <td>${convenData.memberVO.member_email}</td>
                                                    </tr>
                                                    <tr>
                                                        <td>편의점 상세 위치:</td>
                                                        <td>
                                                        	<a href="#statePlace" id="statePlace_page">서울시 ${convenData.stateVO.state_name} ${convenData.convenVO.conven_adress}</a>
															<!-- 신고 -->
															<a href="#x" class="overlay" id="statePlace"></a>
															<div class="popup">
																<jsp:include page="popup/convenPlaceMap.jsp" />
															</div>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td>편의점 등록일</td>
                                                        <td>${convenData.convenVO.conven_regdate}</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- 컨텐츠 정보 끝 -->
                    
                    <!-- 댓글 들어갈 보드 -->
                    <div class="panel panel-default widget">
						<div class="panel-heading">
							<h3 class="panel-title">Reply</h3>
						</div>
						<div class="panel-body">
							<!-- 댓글리스트 출력 -->
							<ul class="list-group">
								<c:forEach var='convenReData' items='${convenReDataList}'>
									<li class="list-group-item">
										<div class="row">
											<div class="col-xs-10 col-md-11">
												<div>
													<strong>${convenReData.memberVO.member_nick}</strong>
													<div class="mic-info">
														${convenReData.convenReVO.conven_re_writedate}</div>
													<c:if
														test='${sessionLoginedData != null && convenReData.convenReVO.member_idx == sessionLoginedData.member_idx}'>
														<a href="javascript:updateConvenReContet(${convenReData.convenReVO.conven_re_idx});" class="mic-info update">수정</a>
														<a href="${pageContext.request.contextPath}/actionDeleteConvenReContent?conven_re_idx=${convenReData.convenReVO.conven_re_idx}&conven_idx=${convenData.convenVO.conven_idx}" class="mic-info delete">삭제</a>
													</c:if>
												</div>
												<div class="comment-text">
													 ${fn:replace(convenReData.convenReVO.conven_re_content,enter,br) }
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>

							<!-- 페이징 부분 -->
							<div class="page-nation">
									<ul class="pagination pagination-large">
										<!-- 첫번째 페이지면 좌로 가는 버튼X -->
										<c:if test='${pagingData.nowPageNum != 0 }'>
											<li class="previous-end"
												onclick="location.href='${pageContext.request.contextPath}/readConvenience?conven_idx=${convenData.convenVO.conven_idx}&requestPagingNum=${pagingData.firstPagingNum-1}'"><span>&laquo;</span></li>
											<li class="previous"
												onclick="location.href='${pageContext.request.contextPath}/readConvenience?conven_idx=${convenData.convenVO.conven_idx}&requestPagingNum=${pagingData.nowPageNum-1}'"><span>&lsaquo;
											</span></li>
										</c:if>
										<c:forEach var='pageNum' begin='${pagingData.firstPagingNum}'
											end='${pagingData.lastPagingNum}'>
											<c:if test='${pageNum == pagingData.nowPageNum }'>
												<li class="active"><span>${pageNum+1}</span></li>
											</c:if>
											<c:if test='${pageNum != pagingData.nowPageNum }'>
												<li><a
													href="${pageContext.request.contextPath}/readConvenience?conven_idx=${convenData.convenVO.conven_idx}&requestPagingNum=${pageNum}">${pageNum+1}</a></li>
											</c:if>
										</c:forEach>
										<!-- 마지막 페이지면 우로 가는 버튼X -->
										<c:if
											test='${pagingData.nowPageNum != (pagingData.totalPageCount-1) }'>
											<li class="next"
												onclick="location.href='${pageContext.request.contextPath}/readConvenience?conven_idx=${convenData.convenVO.conven_idx}&requestPagingNum=${pagingData.nowPageNum+1}'"><span>&rsaquo;</span></li>
											<li class="next-end"
												onclick="location.href='${pageContext.request.contextPath}/readConvenience?conven_idx=${convenData.convenVO.conven_idx}&requestPagingNum=${pagingData.lastPagingNum+1}'"><span>&raquo;</span></li>
										</c:if>
									</ul>
							</div>
						</div>
						
						<!-- 댓글 작성 -->
                        <div class="col">
							<div class="panel-body">
								<c:if test='${ sessionLoginedData != null}'>
									<form role="form" id="write-ConvenRe-form" method="post">
										<input type="hidden" name='conven_idx' value='${convenData.convenVO.conven_idx}'>
										<input type="hidden" name="member_idx" value="${sessionLoginedData.member_idx}">
										<fieldset id='inpup-reply-box'>
											<div class="form-group">
												<textarea id="input-convenReContent" name="conven_re_content" class="form-control" rows="3" placeholder="Write in your wall" autofocus=""></textarea>
											</div>
											<button id="writeNewReplyBtn" type="button" class="[ btn btn-success ]" data-loading-text="Loading..." onclick="submitConvenReContent()">댓글작성</button>
											<div id="updateOldReplyBtn-box" style="display:none;">
												<button type="button" class="[ btn btn-success ]" data-loading-text="Loading..." onclick="updateConvenReContent()">댓글수정</button>
												<button type="button" class="[ btn btn-success ]" onclick="location.reload(true)">취소</button>
											</div>
										</fieldset>
									</form>
								</c:if>
								<c:if test='${sessionLoginedData == null}'>
									<hr>
									<h5> 댓글은 <a href="${pageContext.request.contextPath}/loginForm">로그인</a> 후 작성할 수 있습니다. </h5>
								</c:if>
							</div>
						</div>
                    </div>
                    <!-- 댓글 들어갈 보드 끝 -->
                    <!-- 떨이 물품 리스트 시작 -->
                    <c:if test="${empty prodDataList }">
						<h3>판매 중인 떨이 물품이 없습니다.</h3>
					</c:if>
					<ul id="lists" class="row items">

					<c:forEach var='prodData' items='${prodDataList }' varStatus='prodStatus'>
						<li class="${prodData.brandVO.brand_name } ${prodData.itemVO.item_name } ${prodData.stateVO.state_name } col-lg-4 col-md-6 mb-4 prodIndex${prodStatus.count}"
						 value="${prodData.prodVO.prod_saleprice }">
							<div class="card h-100">

								<!-- 클릭하면 물품 정보로 넘어가게... -->
								<a href="${pageContext.request.contextPath }/readSellProduct?prod_idx=${prodData.prodVO.prod_idx}">

									<!-- 이미지 파일 넣기 로직.. -->
									<%-- <img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/prod/${prodData.itemVO.item_imgfilename}" alt="모찌롤"> --%>

									<c:choose>
										<c:when test="${prodData.itemVO.item_imgfilename eq 'noImage'}">
											<img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/noImage.jpg">
										</c:when>
										<c:otherwise>
											<img class="card-img-top" src="/upload/${prodData.itemVO.item_imgfilename }">
										</c:otherwise>
									</c:choose>
									<!-- 브랜드 로고 넣기 로직... -->
									<c:if test='${prodData.brandVO.brand_name=="CU" }'>
										<img src="${pageContext.request.contextPath}/resources/img/logo/CU.svg" alt="CU로고" class="con-logo">
									</c:if>
									<c:if test='${prodData.brandVO.brand_name=="GS25" }'>
										<img src="${pageContext.request.contextPath}/resources/img/logo/gs25.svg" alt="GS25로고" class="con-logo">
									</c:if>
									<c:if test='${prodData.brandVO.brand_name=="세븐일레븐" }'>
										<img src="${pageContext.request.contextPath}/resources/img/logo/7-eleven.svg" alt="세븐일레븐로고" class="con-logo">
									</c:if>
									<c:if test='${prodData.brandVO.brand_name=="이마트24" }'>
										<img src="${pageContext.request.contextPath}/resources/img/logo/emart24.svg" alt="이마트24로고" class="con-logo">
									</c:if>
									<c:if test='${prodData.brandVO.brand_name=="미니스톱" }'>
										<img src="${pageContext.request.contextPath}/resources/img/logo/ministop.svg" alt="미니스톱로고" class="con-logo">
									</c:if>
									<c:if test='${prodData.brandVO.brand_name=="기타" }'>
										<img src="${pageContext.request.contextPath}/resources/img/logo/logo.svg" alt="기타로고" class="con-logo">
									</c:if> <!-- 브랜드 로고 넣기 로직 끝... -->


								</a>

								<div class="card-body">
									<div class="con-places">
										<span class="con-place">${prodData.stateVO.state_name }</span>

										<!-- a태그로 감싸서 클릭하면 편의점 정보를 볼 수 있게... -->
										<h6>
											<a href="${pageContext.request.contextPath }/readConvenience?conven_idx=${prodData.convenVO.conven_idx}">
												${prodData.convenVO.conven_name }</a>
										</h6>

									</div>
									<h4 class="card-title">

										<!-- 클릭하면 물품 정보로 넘어가게... -->
										<a href="${pageContext.request.contextPath }/readSellProduct?prod_idx=${prodData.prodVO.prod_idx}">${prodData.itemVO.item_name
											}</a>
									</h4>
									<h5>할인가: ${prodData.prodVO.prod_saleprice }  재고량: ${prodData.prod_stockCount }</h5>
									<h3 class="origin-price">정가:
										${prodData.itemVO.item_originprice }</h3>
									<p class="card-text">${prodData.prodVO.prod_content }</p>
									<div id=countTime>
										<input type="hidden" class="counter0" value="${prodData.prodVO.prod_exdate}"> <SPAN class=counter1></SPAN>시간
										<SPAN class=counter2></SPAN>분 <SPAN class=counter3></SPAN>초 <SPAN></SPAN>
									</div>
								</div>
								<div class="card-footer">

									<!-- 누르면 추천 수 증가... -->
									<!-- 이미지는 빨간색으로 변경되게 -->
									<div>

										<c:if test='${prodData.itemLikeCheck }'>
											<img class='img${prodData.itemVO.item_idx }' src="${pageContext.request.contextPath}/resources/img/like_inline.png"
											 alt="좋아요" style="cursor: pointer;" onclick="likeItem(${prodData.itemVO.item_idx })">
										</c:if>
										<c:if test='${!prodData.itemLikeCheck }'>
											<img class='img${prodData.itemVO.item_idx }' src="${pageContext.request.contextPath}/resources/img/like_outline.png"
											 alt="좋아요" style="cursor: pointer;" onclick="likeItem(${prodData.itemVO.item_idx })">
										</c:if>
										<small style="cursor: pointer;" onclick="likeItem(${prodData.itemVO.item_idx })">좋아요 : </small><small class="text-muted likeCount${prodData.itemVO.item_idx }">${prodData.itemLikeCount
											}</small>

									</div>
									<div style="float: right;">
										<img src="${pageContext.request.contextPath}/resources/img/reply.png" alt="댓글" style="width: 1.3em;
										height: 1.3em;
										margin-right: 2px;">
										<small>댓글 : ${prodData.itemReCount }</small>
									</div>
								</div>
							</div>
						</li>
					</c:forEach>

				</ul>
       <!-- 떨이 물품 리스트 끝 -->
                </div>
            </div>
            <!-- /.col-lg-9 끝 -->
        </div>
        <!-- /.row 끝 -->
    </div>
    <!-- /.wrapper 끝 -->
    <!-- Footer 시작 -->
    <footer class="py-5 bg-dark">
        <jsp:include page="commons/footer.jsp" />
    </footer>
    <!-- Footer 끝 -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>