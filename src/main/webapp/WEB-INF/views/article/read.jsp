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
		    	<h1>게시판 <small>글 읽기</small></h1>
		      	<ol class="breadcrumb">
		        	<li><a href="/article/list"><i class="fa fa-dashboard"></i>게시판</a></li>
		        	<li class="active">글 읽기</li>
		      	</ol>
		    </section>
			
			<!-- Main content -->
			<section class="content container-fluid">
			
				<div class="row">
					<div class="col-md-12">
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">${article.title}</h3>
								<small class="pull-right"><a href="#">${article.writer}</a></small>
							</div>
							<div class="box-body pad">
								<div class="text-right">
									<small>
										<span style="margin-right:10px;">
											Hit : ${article.hit}
										</span>
										<fmt:formatDate value="${article.articleRegDate}" pattern="yyyy-MM-dd HH:mm"/>
									</small>
								</div>
								<div>
									${article.content}
							    </div>
							</div>
							<div class="box-footer clearfix">
							    <button id="listBtn" class="btn btn-primary"><i class="fa fa-list" style="margin-right: 5px;"></i>목록</button>
								<c:if test="${article.writer eq article.writer}">
									<button id="deleteBtn" class="btn btn-danger pull-right"><i class="fa fa-trash" style="margin-right: 5px;"></i>삭제</button>
									<button id="modifyBtn" class="btn btn-warning pull-right" style="margin-right:5px;"><i class="fa fa-undo" style="margin-right: 5px;"></i>수정</button>
								</c:if>
							</div>
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col-->
				</div>
				<!-- ./row -->
				
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

	$(function () {
		$("#listBtn").on("click", function () {
			self.location = "/article/list"
    	});
		
		$("#deleteBtn").on("click", function () {
			self.location = "/article/delete"
    	});
		
		$("#modifyBtn").on("click", function () {
			self.location = "/article/modify"
    	});
	})
  
</script>

</body>
</html>