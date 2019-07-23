<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="/static/assets/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${user.email}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- search form -->
        <%--<form action="#" method="get" class="sidebar-form">--%>
        <%--<div class="input-group">--%>
        <%--<input type="text" name="q" class="form-control" placeholder="Search...">--%>
        <%--<span class="input-group-btn">--%>
        <%--<button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>--%>
        <%--</button>--%>
        <%--</span>--%>
        <%--</div>--%>
        <%--</form>--%>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">功能菜单</li>
            <li class="active treeview">
                <a href="#">
                    <i class="fa fa-user"></i> <span>用户管理</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li class="user/list"><a href="/user/list"><i class="fa fa-list-ol"></i>用户列表</a></li>
                    <li><a href="/user/form"><i class="fa fa-user-plus"></i>新增用户</a></li>
                </ul>
            </li>
        </ul>
    </section>
</aside>