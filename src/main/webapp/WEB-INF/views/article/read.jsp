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
									<input type="hidden" name="searchType" value="${criteria.searchType}">
									<input type="hidden" name="keyword" value="${criteria.keyword}">
					                <input type="hidden" name="articleNo" value="${article.articleNo}">
					            </form>
							    <button id="listBtn" class="btn btn-primary"><i class="fa fa-list margin-r-5"></i>목록</button>
								<c:if test="${article.writer eq article.writer}">
									<div class="pull-right">
										<button id="modifyBtn" class="btn btn-warning"><i class="fa fa-edit margin-r-5"></i>수정</button>
										<button id="deleteBtn" class="btn btn-danger"><i class="fa fa-trash margin-r-5"></i>삭제</button>
									</div>
								</c:if>
							</div>
						</div>
						<!-- /.box -->
						
						<div class="box box-info">
							<div class="box-header with-border">
							    <div style="color: #666"><i class="fa fa-pencil margin-r-5"></i>댓글 작성</div>
							</div>
							<div class="box-body">
								<form class="form-horizontal">
							    	<div class="form-group margin">
							        	<div class="col-sm-10">
							       			<textarea class="form-control" id="newReplyText" rows="3" placeholder="내용을 입력해 주세요." style="resize: none"></textarea>
						                </div>
						                <div class="col-sm-2">
						                    <input class="form-control" id="newReplyWriter" type="text" placeholder="댓글 작성자...">
						                </div>
						                <hr/>
						                <div class="col-sm-2">
						                    <button type="button" id="replyAddBtn" class="btn btn-primary btn-block"><i class="fa fa-check-square-o margin-r-5"></i>등록</button>
						                </div>
						            </div>
						        </form>
						    </div>
						</div>
						<!-- /.box -->
						
						<div class="box box-info reply-widget">
							<div class="box-header with-border">
							    <div class="replyCount" style="color: #666"></div>
							    <div class="box-tools">
							    	<!-- 위젯 보이기/숨김 버튼 위치 -->
							    </div>
							</div>
							<div class="box-body repliesDiv">
							
								<!-- 댓글 위치 -->
							
							</div>
							<div class="text-center loaderDiv" style="padding-bottom: 10px;">
					    		<button type="button" id="readMoreBtn" class="btn btn-link" style="text-decoration: none;">더보기</button>
								<div class="loader text-center" id="loader"></div>
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
<script id="replyTemplate" type="text/x-handlebars-template">
    {{#each.}}
    <div class="post replyDiv" data-replyNo={{replyNo}}>
        <div class="user-block">
            <img class="img-circle img-bordered-sm" src="../resources/dist/img/user1-128x128.jpg" alt="user image">
            <span class="username">
                <a href="#">{{replyWriter}}</a>
                <a href="#" class="pull-right btn-box-tool replyDelBtn" data-toggle="modal" data-target="#delModal">
                    <i class="fa fa-trash"> 삭제</i>
                </a>
                <a href="#" class="pull-right btn-box-tool replyModBtn" data-toggle="modal" data-target="#modModal">
                    <i class="fa fa-edit"> 수정</i>
                </a>
            </span>
            <span class="description">{{prettifyDate replyRegdate}}</span>
        </div>
        <div class="oldReplyText">{{{replyText}}}</div>
    </div>
    {{/each}}
</script>
<script>
	$(document).ready(function () {
		
		var result = '${result}';
		if (result == 'modifySuccess') {
			alert('게시글 수정이 완료되었습니다.');
		}
		var formObj = $("form[role='form']");
		var articleNo = "${article.articleNo}";
		var pageNo = 0;
		
		$('#listBtn').on('click', function () {
			formObj.attr('action', '/article/list');
			formObj.attr('method', 'get');
			formObj.submit();
    	});
		
		$('#modifyBtn').on('click', function () {
			formObj.attr('action', '/article/modify');
			formObj.attr('method', 'get');
			formObj.submit();
    	});
		
		$('#deleteBtn').on('click', function () {
			formObj.attr('action', '/article/remove');
			formObj.submit();
    	});
		
		$("#readMoreBtn").on("click", function () {
			getReplies();
		});
		
		getReplies();
		
		//동기 지연을 위한 함수 (settimeout은 비동기로 작동하여 시각적 대기 효과가 없음)
		function sleep(milliseconds) {
			var start = new Date().getTime();
			for (var i = 0; i < 1e7; i++) {
				if ((new Date().getTime() - start) > milliseconds){
		      		break;
		    	}
		  	}
		}
		
		function getReplies() {
			pageNo++;
			
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
		        	printReplyCount(result.pageMaker.totalCount);
		            printReplies(result.replies, $(".repliesDiv"), $("#replyTemplate"));
		        }
		    });
		}
		
		function printReplyCount(totalCount) {
			var replyCountDiv = $(".replyCount");
			var collapseBox = $(".reply-widget");
			
			replyCountDiv.html("<i class='fa fa-comments-o margin-r-5'></i>댓글 " + totalCount + "개");
			
			if (totalCount === 0) {
				collapseBox.find(".btn-box-tool").remove();
				return;
			}
			
			collapseBox.find(".box-tools").html(
				"<button type='button' class='btn btn-box-tool' data-widget='collapse'>"
	            + "<i class='fa fa-minus'></i>"
	            + "</button>"
			);
		}
		
		function printReplies(replyArr, targetArea, templateObj) {
			var replyTemplate = Handlebars.compile(templateObj.html());
			var html = replyTemplate(replyArr);
			targetArea.append(html);
		}
		
		Handlebars.registerHelper("escapeExp", function (replyText) {
			var text = Handlebars.Utils.escapeExpression(replyText);
			text = text.replace(/(\r\n|\r|\n)/gm, "<br/>");
			text = text.replace(/( )/gm, "&nbsp;");
			
			return new Handlebars.SafeString(text);
		});
		
		Handlebars.registerHelper("prettifyDate", function (replyRegDate) {
			var dateObj = new Date(replyRegDate);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth() + 1;
			var date = dateObj.getDate();
			var hours = dateObj.getHours();
			var minutes = dateObj.getMinutes();
			
			month < 10 ? month = "0" + month : month;
			date < 10 ? date = "0" + date : date;
			hours < 10 ? hours = "0" + hours : hours;
			minutes < 10 ? minutes = "0" + minutes : minutes;
			
			return year + "-" + month + "-" + date + " " + hours + ":" + minutes;
		});
	});
</script>

</body>
</html>