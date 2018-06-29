<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<%@ include file="../include/head.jsp" %>

<body class="hold-transition register-page">


	<div class="register-box">
	
		<div class="register-logo">
		 	<a href="/"><b>MVC_Board</b></a>
		</div>
	  	<!-- /.register-logo -->
		
	  	<div class="register-box-body">
	    	<form role="form" method="post">
	      		<div class="form-group has-feedback">
	      			<label class="control-label" for="userid">아이디</label>
	        		<input type="text" id="userid" name="userid" class="form-control" maxlength="15" required autofocus>
	        		<span class="glyphicon glyphicon-user form-control-feedback" id="useridFeedback"></span>
	        		<div>
	          			<h6 style="color:red;" id="useridCheckMessage"></h6>
	        		</div>
	      		</div>
	      		<div class="form-group has-feedback">
	      			<label class="control-label" for="email">이메일</label>
	        		<input type="email" id="email" name="email" class="form-control" maxlength="30" required>
	        		<span class="glyphicon glyphicon-envelope form-control-feedback" id="emailFeedback"></span>
	       			<div>
	          			<h6 style="color:red;" id="emailCheckMessage"></h6>
	        		</div>
	      		</div>
	      		<div class="form-group has-feedback">
	      			<label class="control-label" for="password">비밀번호</label>
	        		<input type="password" id="password" name="password" class="form-control" maxlength="15" required>
	        		<span class="glyphicon glyphicon-lock form-control-feedback" id="passwordFeedback"></span>
	        		<div>
	          			<h6 style="color:red;" id="passwordCheckMessage"></h6>
	        		</div>
	      		</div>
	      		<div class="form-group" style="margin-top: 20px;">
	        		<button type=button id="joinBtn" class="btn btn-primary btn-block btn-flat">회원가입</button>
	      		</div>
	      		<a href="/member/login" class="text-center">이미 회원이신가요?</a>
	    	</form>
	  	</div>
	  	<!-- /.form-box -->
	  
	</div>
	<!-- /.register-box -->


<%@ include file="../include/plugin_js.jsp" %>
<script>
  
  var useridCheck = false;
  var emailCheck = false;
  var passwordCheck = false;
  
  $('#userid').keyup(function() {
	  var len = $('#userid').val().length;
	  
	  if (len == 0) {
		  $('#useridFeedback').attr('class', 'glyphicon glyphicon-user form-control-feedback');
		  $('#useridCheckMessage').html('');
		  useridCheck = false;
	  } else if (len < 5) {
		  $('#useridFeedback').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
		  $('#useridCheckMessage').html('5자 이상 입력해주세요.');
		  useridCheck = false;
	  } else {
		  var userid = $('#userid').val();
		  $.ajax({
			  type: 'POST',
			  url: 'useridCheck',
			  data: {'userid': userid},
			  contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			  success: function(data) {
				  if (data == "duplicate") {
					  $('#useridFeedback').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
					  $('#useridCheckMessage').html('이미 사용중인 아이디입니다.');
					  useridCheck = false;
				  } else {
					  $('#useridFeedback').attr('class', 'glyphicon glyphicon-ok form-control-feedback');
					  $('#useridCheckMessage').html('');
					  useridCheck = true;
				  }
			  }
		  })
	  }
  });
  
  $('#email').keyup(function() {
	  var len = $('#email').val().length;
	  
	  if (len == 0) {
		  $('#emailFeedback').attr('class', 'glyphicon glyphicon-envelope form-control-feedback');
		  $('#emailCheckMessage').html('');
		  emailCheck = false;
	  } else if (! $('#email').val().includes('@')) {
		  $('#emailFeedback').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
		  $('#emailCheckMessage').html('이메일 형식이 아닙니다.');
		  emailCheck = false;
	  } else {
		  $('#emailFeedback').attr('class', 'glyphicon glyphicon-ok form-control-feedback');
		  $('#emailCheckMessage').html('');
		  emailCheck = true;
	  }
  });
  
  $('#password').keyup(function() {
	  var len = $('#password').val().length;
	  
	  if (len == 0) {
		  $('#passwordFeedback').attr('class', 'glyphicon glyphicon-lock form-control-feedback');
		  $('#passwordCheckMessage').html('');
		  passwordCheck = false;
	  } else if (len < 8) {
		  $('#passwordFeedback').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
		  $('#passwordCheckMessage').html('8자 이상 입력해주세요.');
		  passwordCheck = false;
	  } else {
		  $('#passwordFeedback').attr('class', 'glyphicon glyphicon-ok form-control-feedback');
		  $('#passwordCheckMessage').html('');
		  passwordCheck = true;
	  }
  });
  
  var formObj = $("form[role='form']");
  
  $('#joinBtn').on('click', function () {
	  if (useridCheck && emailCheck && passwordCheck) {
		  formObj.attr('action', '/member/join');
		  formObj.submit();
	  } else {
		  alert("양식을 올바르게 입력해주세요.");
	  }
  });
  
  
</script>

</body>
</html>
