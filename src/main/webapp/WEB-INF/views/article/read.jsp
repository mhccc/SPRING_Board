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
						                    <button type="button" id="writeReplyBtn" class="btn btn-primary btn-block"><i class="fa fa-check-square-o margin-r-5"></i>등록</button>
						                </div>
						            </div>
						        </form>
						    </div>
						</div>
						<!-- /.box -->
						
						<div class="box box-info reply-widget">
							<div class="box-header with-border">
							    <div class="replyCount" style="color: #666"></div>
							    <div class="box-tools collapseBtnDiv">
							    	<!-- 위젯 보이기/숨김 버튼 위치 -->
							    </div>
							</div>
							<div class="box-body repliesDiv">
								<!-- 댓글 위치 -->
							</div>
							<div class="text-center readMoreDiv" style="padding-bottom: 10px;">
					    		<button type="button" id="readMoreBtn" class="btn btn-link" style="text-decoration: none;">더보기</button>
								<div id="getRepliesLoader" class="loader text-center"></div>
					    	</div>
						</div>
						<!-- /.box -->
						
						<!-- 댓글 수정 modal -->
						<div class="modal fade" id="modModal">
						    <div class="modal-dialog">
						        <div class="modal-content">
						            <div class="modal-header">
						                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                    <span aria-hidden="true">&times;</span></button>
						                <h4 class="modal-title">댓글 수정</h4>
						            </div>
						            <div class="modal-body" data-rno>
						                <input type="hidden" class="modReplyNo"/>
						                <textarea class="form-control" id="modReplyText" rows="3" style="resize: none"></textarea>
						            </div>
						            <div id="replyLoader" class="loader text-center"></div>
						            <div class="modal-footer">
						                <button type="button" class="btn btn-primary" id="modalModBtn"><i class="fa fa-edit margin-r-5"></i>수정</button>
						            </div>
						        </div>
						    </div>
						</div>
						
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
                <a href="#" class="pull-right btn-box-tool" id="deleteReplyBtn"><i class="fa fa-trash"> 삭제</i></a>
                <a href="#" class="pull-right btn-box-tool" id="modifyReplyBtn" data-toggle="modal" data-target="#modModal"><i class="fa fa-edit"> 수정</i></a>
            </span>
            <span class="description">{{prettifyDate replyRegdate}}</span>
        </div>
        <div class="oldReplyText">{{{escapeExp replyText}}}</div>
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
		
		getReplies();
		
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
		
		$("#writeReplyBtn").on("click", function () {
			writeReply();
		});
		
		$("#readMoreBtn").on("click", function () {
			getReplies();
		});
		
		$(".repliesDiv").on("click", ".replyDiv #modifyReplyBtn", function () {
			var reply = $(this).parents(".replyDiv");
		    $(".modReplyNo").val(reply.attr("data-replyNo"));
		    $("#modReplyText").val(reply.find(".oldReplyText").text());
		});
		
		$("#modalModBtn").on("click", function () {
		    var replyNo = $(".curReplyNo").val();
		    var replyText = $("#modReplyText").val();
		    
		    $.ajax({
		        type : "put",
		        url : "/reply/" + replyNo,
		        headers : {
		            "Content-Type" : "application/json",
		            "X-HTTP-Method-Override" : "PUT"
		        },
		        dataType : "text",
		        data: JSON.stringify({
		            replyText : replyText
		        }),
		        success: function (result) {
		            if (result === "modifySuccess") {
		                $("#modModal").modal("hide");
		                $('.replyDiv').remove();
			            pageNo = 0;
			            getReplies();
		            }
		        }
		    })
		});

		//상위 클래스명을 이용하여 이벤트 바인딩
		$(".repliesDiv").on("click", ".replyDiv #deleteReplyBtn", function () {
			var reply = $(this).parents(".replyDiv");
			var replyNo = reply.attr("data-replyNo");
		    
		    $.ajax({
		        type: "delete",
		        url: "/reply/" + replyNo,
		        headers: {
		            "Content-Type" : "application/json",
		            "X-HTTP-Method-Override" : "DELETE"
		        },
		        dataType: "text",
		        success: function (result) {
		            if (result === "removeSuccess") {
		                $('.replyDiv').remove();
			            pageNo = 0;
			            getReplies();
		            }
		        }
		    });
		});
		
		//상위 클래스명을 이용하여 이벤트 바인딩
		$(".collapseBtnDiv").on("click", "button", function() {
			if ($(".collapseBtnDiv").find("i").hasClass("fa-minus")) {
				$(".readMoreDiv").hide();
			} else {
				$(".readMoreDiv").show();
			}
		});
		
		//동기 지연을 위한 함수 (settimeout은 비동기로 작동하여 시각적 대기 효과가 없음)
		function sleep(milliseconds) {
			var start = new Date().getTime();
			for (var i = 0; i < 1e7; i++) {
				if ((new Date().getTime() - start) > milliseconds){
		      		break;
		    	}
		  	}
		}
		
		function writeReply() {
			var replyText = $("#newReplyText").val();
		    var replyWriter = $("#newReplyWriter").val();

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
		            replyText : replyText,
		            replyWriter : replyWriter
		        }),
		        success : function (result) {
		        	if (result === "writeSuccess") {
		        		$('#newReplyText').val("");
			            $('#newReplyWriter').val("");
			            $('.replyDiv').remove();
			            pageNo = 0;
			            getReplies();
			            
		        	}
		        }
		    });
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
		        	$('#getRepliesLoader').show();
		        },
		        complete : function() {
		        	sleep(1100);
		        	$('#readMoreBtn').show();
		        	$('#getRepliesLoader').hide();
		        },
		        success : function (result) {
		        	printReplyCount(result.pageMaker.totalCount);
		            printReplies(result.replies, $(".repliesDiv"), $("#replyTemplate"));
		            printReadMore(result.pageMaker);
		        }
		    });
		}
		
		function printReplyCount(totalCount) {
			var replyCountDiv = $(".replyCount");
			var collapseBox = $(".reply-widget");
			
			replyCountDiv.html("<i class='fa fa-comments-o margin-r-5'></i>댓글 " + totalCount + "개");
			
			if (totalCount === 0) {
				collapseBox.find(".btn-box-tool").remove();
				$(".repliesDiv").hide();
				$(".readMoreDiv").hide();
			} else {
				collapseBox.find(".box-tools").html(
					"<button type='button' class='btn btn-box-tool' data-widget='collapse'>"
		        	+ "<i class='fa fa-minus'></i>"
		        	+ "</button>"
				);
				$(".repliesDiv").show();
				$(".readMoreDiv").show();
			}
		}
		
		function printReplies(replyArr, targetArea, templateObj) {
			var replyTemplate = Handlebars.compile(templateObj.html());
			var html = replyTemplate(replyArr);
			targetArea.append(html);
		}
		
		function printReadMore(pageMaker) {
			if (pageMaker.totalCount <= (pageNo * pageMaker.criteria.perPageNum) ) {
				$(".readMoreDiv").hide();
			}
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