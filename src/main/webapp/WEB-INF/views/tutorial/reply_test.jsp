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
		    	<h1>게시판 <small>댓글 테스트</small></h1>
		      	<ol class="breadcrumb">
		        	<li><a href="/article/list"><i class="fa fa-dashboard"></i>게시판</a></li>
		        	<li class="active">댓글 테스트</li>
		      	</ol>
		    </section>
			
			<!-- Main content -->
			<section class="content container-fluid">
				
				<div class="col-lg-12">
					<div class="box box-primary">
						<div class="box-header with-border">
						    <h3 class="box-title">댓글 작성</h3>
						</div>
						<div class="box-body">
						    <div class="form-group">
						        <label for="newReplyText">댓글 내용</label>
						        <input class="form-control" id="newReplyText" name="replyText" placeholder="댓글 내용을 입력해주세요">
						    </div>
						    <div class="form-group">
						        <label for="newReplyWriter">댓글 작성자</label>
						        <input class="form-control" id="newReplyWriter" name="replyWriter" placeholder="댓글 작성자를 입력해주세요">
						    </div>
						    <div>
						    	<button type="submit" id="replyAddBtn" class="btn btn-primary"><i class="fa fa-check-square-o" style="margin-right: 5px;"></i>등록</button>
						    </div>
						</div>
						<div class="box-footer">
						    <ul id="replies">
						    	<!-- 댓글 위치 -->
						    </ul>
						    <div class="text-center">
						    	<button type="button" id="readMoreBtn" class="btn btn-link" style="text-decoration: none;">더보기</button>
								<div class="loader text-center" id="loader"></div>
						    </div>
						</div>
					</div>
				</div>
			
				<div class="modal fade" id="modifyModal" role="dialog">
					<div class="modal-dialog">
					    <div class="modal-content">
					        <div class="modal-header">
					            <button type="button" class="close" data-dismiss="modal">&times;</button>
					            <h4 class="modal-title">댓글 수정창</h4>
					        </div>
					        <div class="modal-body">
					            <div class="form-group">
					                <label for="replyNo">댓글 번호</label>
					                <input class="form-control" id="replyNo" name="replyNo" readonly>
					            </div>
					            <div class="form-group">
					                <label for="replyText">댓글 내용</label>
					                <input class="form-control" id="replyText" name="replyText" placeholder="댓글 내용을 입력해주세요">
					            </div>
					            <div class="form-group">
					                <label for="replyWriter">댓글 작성자</label>
					                <input class="form-control" id="replyWriter" name="replyWriter" readonly>
					            </div>
					        </div>
					        <div class="modal-footer">
					            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
					            <button type="button" class="btn btn-success modalModBtn">수정</button>
					            <button type="button" class="btn btn-danger modalDelBtn">삭제</button>
					        </div>
					    </div>
					</div>
				</div>
				
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
	var articleNo = 100;
	var pageNo = 1;
	getReplies(articleNo, pageNo);
	
	function sleep(milliseconds) {
		var start = new Date().getTime();
		for (var i = 0; i < 1e7; i++) {
			if ((new Date().getTime() - start) > milliseconds){
	      		break;
	    	}
	  	}
	}
	
	function getReplies(articleNo, pageNo) {
		
		$.ajax({
	        type : "get",
	        url : "/reply/" + articleNo + "/" + pageNo,
	        headers : {
	            "Content-type" : "application/json",
	            "X-HTTP-Method-Override" : "GET"
	        },
	        dataType : "json",
	        beforeSend : function() {
	        	$('#readMoreBtn').hide();
	        	$('#loader').show();
	        },
	        complete : function() {
	        	sleep(1000);
	        	$('#readMoreBtn').show();
	        	$('#loader').hide();
	        },
	        success : function (result) {
	        	
	        	var str = "";
	        	
	        	$(result.replies).each(function (index) {
					str += "<li data-replyNo='" + this.replyNo + "' class='replyLi'>"
						+	"<p class='replyText'>" + this.replyText + "</p>"
						+	"<p class='replyWriter'>" + this.replyWriter + "</p>"
						+	"<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
						+  "</li>"
						+  "<hr/>";
				});
	        	
	        	$("#replies").append(str);
	        }
	    });
	}
	
	$("#readMoreBtn").on("click", function () {
		getReplies(articleNo, pageNo);
	});
	
	$("#replyAddBtn").on("click", function () {
	    var replyText = $("#newReplyText");
	    var replyWriter = $("#newReplyWriter");

	    var replyTextVal = replyText.val();
	    var replyWriterVal = replyWriter.val();

	    $.ajax({
	        type : "post",
	        url : "/reply",
	        headers : {
	            "Content-type" : "application/json",
	            "X-HTTP-Method-Override" : "POST"
	        },
	        dataType : "text",
	        data : JSON.stringify({
	            articleNo : articleNo,
	            replyText : replyTextVal,
	            replyWriter : replyWriterVal
	        }),
	        success : function (result) {
	            getReplies();
	            replyText.val("");
	            replyWriter.val("");
	        }
	    });
	});
	
	$("#replies").on("click", ".replyLi button", function() {
		
		var reply = $(this).parent();
		
		var replyNo = reply.attr("data-replyNo");
		var replyText = reply.find(".replyText").text();
		var replyWriter = reply.find(".replyWriter").text();
		
		$("#replyNo").val(replyNo);
	    $("#replyText").val(replyText);
	    $("#replyWriter").val(replyWriter);
		
	});
	
	$(".modalDelBtn").on("click", function () {
	
		var replyNo = $(this).parent().parent().find("#replyNo").val();
			
	    $.ajax({
	        type : "delete",
	        url : "/reply/" + replyNo,
	        headers : {
	            "Content-type" : "application/json",
	            "X-HTTP-Method-Override" : "DELETE"
	        },
	        dataType : "text",
	        success : function (result) {
	            if (result == "removeSuccess") {
	                alert("댓글 삭제 완료!");
	            }
	            $("#modifyModal").modal("hide");
	            getReplies();
	        }
	    });
	});
	
	$(".modalModBtn").on("click", function () {
			
		var replyNo = $(this).parent().parent().find("#replyNo").val();
		var replyText = $(this).parent().parent().find("#replyText").val();
			
	    $.ajax({
	        type : "put",
	        url : "/reply",
	        headers : {
	            "Content-type" : "application/json",
	            "X-HTTP-Method-Override" : "PUT"
	        },
	        dataType : "text",
	        data : JSON.stringify({
	        	replyNo : replyNo,
	        	replyText : replyText
	        }),
	        success : function (result) {
	            if (result == "modifySuccess") {
	                alert("댓글 수정 완료!");
	            }
	            $("#modifyModal").modal("hide");
	            getReplies();
	        }
	    });
	});
	
</script>

</body>
</html>