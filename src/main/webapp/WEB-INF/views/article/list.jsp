<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<%@ include file="../include/head.jsp" %>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">
	
	
		<!-- Main Header -->
		<%@ include file="../include/main_header.jsp" %>
		
		<!-- Main Left side column. contains the logo and sidebar -->
		<%@ include file="../include/main_left_column.jsp" %>
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
		
			<!-- Content Header (Page header) -->
		    <section class="content-header">
		    	<h1>게시판 <small>글 목록</small></h1>
		      	<ol class="breadcrumb">
		        	<li><a href="/article/list"><i class="fa fa-dashboard"></i>게시판</a></li>
		        	<li class="active">글 목록</li>
		      	</ol>
		    </section>
			
			<!-- Main content -->
			<section class="content container-fluid">
				
				<div class="row">
					<!-- column -->
					<div class="col-md-12">
						<div class="box box-info">
							<div class="box-body pad">
								<table class="table table-bordered text-center">
									<tr>
										<th style="width: 50px">번호</th>
										<th>제목</th>
										<th style="width: 100px">작성자</th>
										<th style="width: 150px">작성일</th>
										<th style="width: 60px">조회</th>
									</tr>
									<c:if test="${empty list}">
										<td colspan="5">게시글이 없습니다.</td>
									</c:if>
									
									<c:forEach var="article" items="${list}">
										<tr>
											<td>${article.articleNo}</td>
											<td><a href='/article/read?articleNo=${article.articleNo}' style="margin-right: 3px">${article.title}</a> [${article.commentCnt}]</td>
											<td>${article.writer}</td>
											<td><fmt:formatDate value="${article.articleRegDate}" pattern="yyyy-MM-dd HH:mm"/></td>
											<td><span class="badge bg-red">${article.hit}</span></td>
										</tr>
									</c:forEach>
								</table>
								<!-- paging -->
								<c:if test="${true}">
									<div class="text-center">
										<ul class="pagination" style="margin-bottom: 10px">
											<c:if test="${pageMaker.prev}">
												<li><a href="list?page=${pageMaker.startPage - 1}">&laquo;</a></li>
											</c:if>
											<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
												<li <c:out value="${pageMaker.criteria.page == idx? 'class=active' : ''}"/>>
													<a href="list?page=${idx}">${idx}</a>
												</li>
											</c:forEach>
											<c:if test="${pageMaker.next}">
												<li><a href="list?page=${pageMaker.endPage + 1}">&raquo;</a></li>
											</c:if>
										</ul>
									</div>
								</c:if>
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<button id="writeBtn" class="btn btn-primary pull-right"><i class="fa fa-edit" style="margin-right: 5px;"></i>글 작성</button>
							</div>
							<!-- /.box-footer -->
						</div>
					</div>
					<!--/.col -->
				</div>
				<!-- /.row -->
					
			</section>
			<!-- /.content -->
			
		</div>
		<!-- /.content-wrapper -->
		
		<!-- Main Footer -->
		<%@ include file="../include/main_footer.jsp" %>
	
	
	</div>
	<!-- ./wrapper -->

<%@ include file="../include/plugin_js.jsp" %>
<script>
	
	var result = '${result}';
	
	if (result == 'writeSuccess') {
		alert("게시글 등록이 완료되었습니다.");
	} else if (result == 'removeSuccess') {
		alert("게시글 삭제가 완료되었습니다.");
	}

	$(function () {
		$("#writeBtn").on("click", function () {
    		self.location = "/article/write"
    	});
	})
  
</script>

</body>
</html>