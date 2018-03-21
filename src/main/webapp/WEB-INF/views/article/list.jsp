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
		        	<li><a href="#"><i class="fa fa-dashboard"></i>게시판</a></li>
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
										<th style="width: 8%">번호</th>
										<th style="width: 60%">제목</th>
										<th style="width: 11%">작성자</th>
										<th style="width: 14%">날짜</th>
										<th style="width: 17%">조회수</th>
									</tr>
									<c:if test="${articlePage.hasNoArticles()}">
										<td colspan="5">게시글이 없습니다.</td>
									</c:if>
									
									<c:forEach var="article" items="${articlePage.content}">
										<tr>
											<td>${article.article_no}</td>
											<td><a href="read.do?articleNo=${article.article_no}&pageNo=${articlePage.currentPage}">${article.article_title}</a></td>
											<td>${article.article_writer}</td>
											<td><fmt:formatDate value="${article.article_regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
											<td><span class="badge bg-red">${article.article_readcount}</span></td>
										</tr>
									</c:forEach>
								</table>
								<!-- paging -->
								<c:if test="${articlePage.hasArticles()}">
									<div class="text-center">
										<ul class="pagination">
											<c:if test="${articlePage.startPage > 10}">
												<li><a href="list.do?pageNo=${articlePage.startPage - 10}">&laquo;</a></li>
											</c:if>
											<c:forEach var="pNo" begin="${articlePage.startPage}" end="${articlePage.endPage}">
												<li <c:out value="${articlePage.currentPage == pNo? 'class=active' : ''}"/>>
													<a href="list.do?pageNo=${pNo}">${pNo}</a>
												</li>
											</c:forEach>
											<c:if test="${articlePage.endPage < articlePage.totalPages}">
												<li><a href="list.do?pageNo=${articlePage.startPage + 10}">&raquo;</a></li>
											</c:if>
										</ul>
									</div>
								</c:if>
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<button id="writeBtn" class="btn btn-primary pull-right">글 작성</button>
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

</body>
</html>