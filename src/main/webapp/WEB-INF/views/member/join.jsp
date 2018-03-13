<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<%@ include file="../include/head.jsp" %>

<body class="hold-transition register-page">



	<div class="register-box">
	
	  <div class="register-logo">
	    <a href="/"><b>MVC_Board</b></a>
	  </div>
	  
	  <div class="register-box-body">
	    <form action="join" method="post" onsubmit="return checkForm();">
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
	        <button type="submit" class="btn btn-primary btn-block btn-flat">회원가입</button>
	      </div>
	      <a href="/member/login" class="text-center">이미 회원이신가요?</a>
	    </form>
	  </div>
	  <!-- /.form-box -->
	  
	</div>
	<!-- /.register-box -->



<%@ include file="../include/plugin_js.jsp" %>
<script>
  
  $('#userid').keyup(function() {
	  var len = $('#userid').val().length;
	  
	  if (len == 0) {
		  $('#useridFeedback').attr('class', 'glyphicon glyphicon-user form-control-feedback');
		  $('#useridCheckMessage').html('');
	  } else if (len < 5) {
		  $('#useridFeedback').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
		  $('#useridCheckMessage').html('5자 이상 입력해주세요.');
	  } else {
		  var userid = $('#userid').val();
		  $.ajax({
			  type: 'POST',
			  url: 'JoinCheck.do',
			  data: {userid: userid},
			  success: function(result) {
				  if (result == "duplicate") {
					  $('#useridFeedback').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
					  $('#useridCheckMessage').html('이미 사용중인 아이디입니다.');
				  } else {
					  $('#useridFeedback').attr('class', 'glyphicon glyphicon-ok form-control-feedback');
					  $('#useridCheckMessage').html('');
				  }
			  }
		  })
	  }
  });
  
  $('#email').keyup(function() {
	  var len = $('#email').val().length;
	  
	  if (len == 0) {
		  $('#emailFeedback').attr('class', 'glyphicon glyphicon-envelope form-control-feedback');
	  } else {
		  $('#emailFeedback').attr('class', 'glyphicon glyphicon-ok form-control-feedback');
	  }
  });
  
  $('#password').keyup(function() {
	  var len = $('#password').val().length;
	  
	  if (len == 0) {
		  $('#passwordFeedback').attr('class', 'glyphicon glyphicon-lock form-control-feedback');
		  $('#passwordCheckMessage').html('');
	  } else if (len < 8) {
		  $('#passwordFeedback').attr('class', 'glyphicon glyphicon-remove form-control-feedback');
		  $('#passwordCheckMessage').html('8자 이상 입력해주세요.');
	  } else {
		  $('#passwordFeedback').attr('class', 'glyphicon glyphicon-ok form-control-feedback');
		  $('#passwordCheckMessage').html('');
	  }
  });
  
  function checkForm() {
	  /**
	   각 입력에 대해 조건 검사해서 submit 버튼 비활성화 시키기
	  **/
  }
  
</script>

</body>
</html>
