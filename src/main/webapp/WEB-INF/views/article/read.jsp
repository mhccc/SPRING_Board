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
							</div>
							<div class="box-header">
					            <div class="user-block">
					                <img class="img-circle img-bordered-sm" src="../resources/dist/img/user1-128x128.jpg" alt="user image">
					                <span class="username">
					                    <a href="#">${article.writer}</a>
					                </span>
					                <span class="description"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${article.articleRegDate}"/></span>
					            </div>
					        </div>
							<div class="box-body pad">
								<div>
									${article.content}
							    </div>
							</div>
							<div class="box-footer clearfix">
								<form role="form" method="post">
									<input type="hidden" name="page" value="${criteria.page}">
									<input type="hidden" name="perPageNum" value="${criteria.perPageNum}">
					                <input type="hidden" name="articleNo" value="${article.articleNo}">
					            </form>
							    <button id="listBtn" class="btn btn-primary"><i class="fa fa-list" style="margin-right: 5px;"></i>목록</button>
								<c:if test="${article.writer eq article.writer}">
									<div class="pull-right">
										<button id="modifyBtn" class="btn btn-warning"><i class="fa fa-undo" style="margin-right: 5px;"></i>수정</button>
										<button id="deleteBtn" class="btn btn-danger"><i class="fa fa-trash" style="margin-right: 5px;"></i>삭제</button>
									</div>
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

	var result = '${result}';

	if (result == 'modifySuccess') {
		alert("게시글 수정이 완료되었습니다.");
	}

	var formObj = $("form[role='form']");

	$(function () {
		$("#listBtn").on("click", function () {
			formObj.attr("action", "/article/list");
			formObj.attr("method", "get");
			formObj.submit();
    	});
		
		$("#modifyBtn").on("click", function () {
			formObj.attr("action", "/article/modify");
			formObj.attr("method", "get");
			formObj.submit();
    	});
		
		$("#deleteBtn").on("click", function () {
			formObj.attr("action", "/article/remove");
			formObj.submit();
    	});
	})
  
</script>

</body>
</html>