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
    <!-- Main content -->
    <section class="content container-fluid">



		<div class="login-box">
		  <div class="login-logo">
		    <a href="${pageContext.request.contextPath}/index.jsp"><b>MVC_Board</b></a>
		  </div>
		  <!-- /.login-logo -->
		  <div class="login-box-body">
		
		    <form action="login.do" method="post">
		      <div class="form-group has-feedback">
		      	<label class="control-label" for="userid">아이디</label>
		        <input type="text" id="userid" name="userid" value="${param.mem_userid}" class="form-control" maxlength="15" required autofocus>
		        <span class="form-control-feedback" id="useridFeedback"></span>
		        <div>
		          	<h6 style="color:red;" id="useridCheckMessage"> <c:if test="${errors.invalidUserid}">등록되지 않은 아이디입니다.</c:if> </h6>
		        </div>
		      </div>
		      <div class="form-group has-feedback">
		      	<label class="control-label" for="password">비밀번호</label>
		        <input type="password" id="password" name="password" class="form-control" maxlength="15" required>
		        <span class="form-control-feedback" id="passwordFeedback"></span>
		        <div>
		          	<h6 style="color:red;" id="passwordCheckMessage"> <c:if test="${errors.invalidPassword}">잘못된 비밀번호 입니다.</c:if> </h6>
		        </div>
		      </div>
		      <div class="row">
		        <div class="col-xs-8">
		          <div class="checkbox icheck">
		            <label>
		              <input type="checkbox"> 로그인 상태 유지
		            </label>
		          </div>
		        </div>
		        <!-- /.col -->
		        <div class="col-xs-4">
		          <button type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
		        </div>
		        <!-- /.col -->
		      </div>
		    </form>
		
		    <div class="social-auth-links text-center">
		      <p>- 또는 -</p>
		      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i>Facebook으로 로그인</a>
		    </div>
		    <!-- /.social-auth-links -->
		
		    <a href="join.do" class="text-center">회원가입</a>
		
		  </div>
		  <!-- /.login-box-body -->
		</div>
		<!-- /.login-box -->



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
