<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		    	<h1>게시판 <small>글 작성</small></h1>
		      	<ol class="breadcrumb">
		        	<li><a href="/article/list"><i class="fa fa-dashboard"></i>게시판</a></li>
		        	<li class="active">글 작성</li>
		      	</ol>
		    </section>
	    	
			<!-- Main content -->
			<section class="content container-fluid">
			
				<div class="row">
					<div class="col-md-12">
						<div class="box box-info">
					    	<div class="box-body pad">
					        	<form role="form" method="post">
					         		<div class="form-group">
										<input type="text" name="title" class="form-control" placeholder="제목">
					      			</div>
					      			<textarea id="editor" name="content" rows="20" cols="80" placeholder="내용을 입력해주세요."></textarea>
					      			<hr>
					     			<div class="text-center" style="margin-bottom: 10px;">
					     				<input type="hidden" name="writer" value="TEST">
					     				<button type="submit" id="registerBtn" class="btn btn-primary"><i class="fa fa-check-square-o" style="margin-right: 5px;"></i>등록</button>
					  					<button type="button" id="cancelBtn" class="btn btn-warning"><i class="fa fa-undo" style="margin-right: 5px;"></i>취소</button>
					     			</div>
					      		</form>
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
<!-- CK Editor -->
<script src="../resources/bower_components/ckeditor/ckeditor.js"></script>
<script>

	var formObj = $("form[role='form']");

	$(function () {
		CKEDITOR.replace('editor', {
			extraPlugins: 'confighelper',
	 		height: 480
	 	});
		
		$('#registerBtn').on('click', function () {
			formObj.attr('action', '/article/write');
    		formObj.submit();
    	});
		
		$('#cancelBtn').on('click', function () {
			history.go(-1);
    	});
	})
  
</script>

</body>
</html>