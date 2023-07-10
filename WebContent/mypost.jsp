<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file ="header.jsp" %>

<div class=my_wrapper>

	<div class="page-title">
		<div class="container">
			<h2 class=notice_board>문의사항</h2>
		</div>
	</div>


	<div class=board_changes>
		<a href="questionfilter.page?question_filter=MEM_ID&question_search=${sid}&id=${sid}">
			<button class=board_change>문의사항</button></a>
		<a href="requestfilter.page?request_filter=MEM_ID&request_search=${sid}&id=${sid}">
			<button class=board_change>상품요청</button></a>
		<a href="reviewfilter.page?review_filter=MEM_ID&review_search=${sid}&id=${sid}">
			<button class=board_change>상품리뷰</button></a>
		<a href="getmyinfo.client">
			<button class=board_change>마이페이지</button></a>
	</div>


	<!-- board seach area -->
	<div id="board-search">
		<div class="container">
			<div class="search-window">
				<form action="questionfilter.page">
					<div class="search-wrap">
						<label for="search" class="blind">문의사항 내용 검색</label>
						<input id="search" type="search" name="question_search"
							placeholder="검색어를 입력해주세요." value="" style="width: 80%;">
						<button type="submit" class="b_btn btn-dark" style="margin: 0;">검색</button>
						<input type="hidden" name="question_filter" value="TITLE_COMMENT">
						<input type="hidden" name="id" value="${sid}">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- board list area -->
			<table class="board_list">
				<thead>
					<tr>
						<th class="qs_col11">번호</th>
						<th class="qs_col22">제목</th>
						<th class="qs_col44">등록일</th>
						<th class="qs_col55">답변여부</th>
					</tr>

				</thead>
				<tbody>
					<c:forEach var="i" items="${qslist}">
						<tr>
							<td class="qs_col11">${i.q_num}</td>
							<td class="qs_col22"><a href="QuestionSearchOne.question?q_num=${i.q_num}">${i.q_title}</a></td>
							<td class="qs_col44">${i.q_date}</td>
							<td class="qs_col55 ${empty i.answer ? 'waiting' : 'completed'}">${empty i.answer ? '답변 대기중' : '답변 완료'}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

	
	<script type="text/javascript">
		    function PageMove(page) {
		        const url = new URL(window.location.href);
		        url.searchParams.set("page", page);
		        window.location.href = url.toString();
		    }
	</script>


	<div class="board_pages">
		<ul class="pagination">
			<li><a href="javascript:PageMove(${paging.firstPageNo})">맨앞으로</a></li>
			<li><a href="javascript:PageMove(${paging.prevPageNo})">앞으로</a></li>
			<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
				<c:choose>
					<c:when test="${i eq paging.pageNo}">
						<li class="active"><a href="javascript:PageMove(${i})">${i}</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:PageMove(${i})">${i}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li><a href="javascript:PageMove(${paging.nextPageNo})">뒤로</a></li>
			<li><a href="javascript:PageMove(${paging.finalPageNo})">맨뒤로</a></li>
		</ul>
	</div>

</div>

</body>
</html>