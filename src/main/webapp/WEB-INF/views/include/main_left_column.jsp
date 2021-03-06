<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<aside class="main-sidebar">

  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">

	<c:if test="${not empty login}">
	  <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/resources/dist/img/user1-128x128.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${login.userid}</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
	</c:if>

    <!-- search form (Optional) -->
    <form action="#" method="get" class="sidebar-form">
      <div class="input-group">
        <input type="text" name="q" class="form-control" placeholder="Search...">
        <span class="input-group-btn">
            <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
            </button>
          </span>
      </div>
    </form>
    <!-- /.search form -->

    <!-- Sidebar Menu -->
    <ul class="sidebar-menu" data-widget="tree">
      <li class="header">메뉴</li>
      <!-- Optionally, you can add icons to the links -->
      <li><a href="/article/list"><i class="fa fa-list-alt"></i> <span>게시판</span></a></li>
      
      <%
      //<li class="treeview">
      //  <a href="#"><i class="fa fa-link"></i> <span>Multilevel</span>
      //    <span class="pull-right-container">
      //        <i class="fa fa-angle-left pull-right"></i>
      //      </span>
      //  </a>
      //  <ul class="treeview-menu">
      //    <li><a href="#">Link in level 2</a></li>
      //    <li><a href="#">Link in level 2</a></li>
      //  </ul>
      //</li>
      %>
    </ul>
    <!-- /.sidebar-menu -->
  </section>
  <!-- /.sidebar -->
  
</aside>