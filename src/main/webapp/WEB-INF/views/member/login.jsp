<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<%@ include file="../include/head.jsp" %>

<body class="hold-transition register-page">


	<div class="login-box">
	
		<div class="login-logo">
			<a href="/"><b>MVC_Board</b></a>
		</div>
		<!-- /.login-logo -->
		
		<div class="login-box-body">
			<form action="login" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="userid">아이디</label>
					<input type="text" id="userid" name="userid" value="${param.mem_userid}" class="form-control" maxlength="15" required autofocus>
					<span class="glyphicon glyphicon-user form-control-feedback" id="useridFeedback"></span>
				  	<div>
				  		<h6 style="color:red;" id="useridCheckMessage"> <c:if test="${errors.invalidUserid}">등록되지 않은 아이디입니다.</c:if> </h6>
				  	</div>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="password">비밀번호</label>
				  	<input type="password" id="password" name="password" class="form-control" maxlength="15" required>
				  	<span class="glyphicon glyphicon-lock form-control-feedback" id="passwordFeedback"></span>
				  	<div>
				    	<h6 style="color:red;" id="passwordCheckMessage"> <c:if test="${errors.invalidPassword}">잘못된 비밀번호 입니다.</c:if> </h6>
				  	</div>
				</div>
			  	<div class="form-group" style="margin-top: 20px;">
			   		<button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
			 	</div>
			  	<div class="row">
			    	<div class="col-xs-7">
			      		<a href="/member/join" class="text-center">회원가입</a>
			    	</div>
			    	<!-- /.col -->
			    	<div class="col-xs-5">
			      		<div class="checkbox icheck pull-right" style="margin: 0px;">
			        		<label>
			          		<input type="checkbox">로그인 상태 유지
			        		</label>
			      		</div>
			    	</div>
			    	<!-- /.col -->
			  	</div>
			</form>
		</div>
		<!-- /.login-box-body -->
	  
	</div>
	<!-- /.login-box -->


<%@ include file="../include/plugin_js.jsp" %>
<script>

  $(function() {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
  
</script>

</body>
</html>
