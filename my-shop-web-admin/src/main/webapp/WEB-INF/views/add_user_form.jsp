<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--spring-mvc表单标签-->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <title>我的商城|控制面板</title>
    <jsp:include page="../includes/header.jsp"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <!--header-->
    <jsp:include page="../includes/nav.jsp" />
    <!-- Left side column. contains the logo and sidebar -->
    <jsp:include page="../includes/left_menu.jsp" />

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                ${tbUser.id == null ? "新增":"编辑"}用户
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">${tbUser.id == null ? "新增":"编辑"}用户</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row" >
                <div class="col-md-12">
                    <!--c错误提示框-->
                    <c:if test="${baseResult != null}">
                        <%--<div class="alert alert-danger alert-dismissible" ${message == null ? "style='display: none'": ""}>--%>
                        <div class="alert alert-${baseResult.status == 200? "success": "danger"} alert-dismissible" >
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${baseResult.message}
                        </div>
                    </c:if>

                    <!-- Horizontal Form -->
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">${tbUser.id == null ? "新增":"编辑"}用户</h3>
                        </div>
                        <!--spring-mvc 的表单标签-->
                        <form:form id="inputForm" cssClass="form-horizontal" action="/user/save" method="post" modelAttribute="tbUser">
                            <form:hidden path="id" />
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">邮箱</label>

                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control required email" path="email" placeholder="请输入邮箱地址"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">密码</label>

                                    <div class="col-sm-10">
                                        <form:password cssClass="form-control required" path="password" placeholder="请输入登入密码"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="username" class="col-sm-2 control-label">姓名</label>

                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control required" path="username" placeholder="请输入用户的姓名"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="phone" class="col-sm-2 control-label">手机</label>

                                    <div class="col-sm-10">
                                        <form:input cssClass="form-control required mobile" path="phone" placeholder="请输入手机号码"/>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-default" onclick="history.go(-1)">返回</button>
                                <button type="submit" class="btn btn-info pull-right">提交</button>
                            </div>
                        </form:form>

                        <!-- old form -->
                        <!-- form start -->
                        <%--<form class="form-horizontal" action="/user/save" method="post">--%>
                            <%--<div class="box-body">--%>
                                <%--<div class="form-group">--%>
                                    <%--<label for="inputEmail3" class="col-sm-2 control-label">邮箱</label>--%>

                                    <%--<div class="col-sm-10">--%>
                                        <%--<input type="email" class="form-control" id="inputEmail3" name="email" placeholder="请输入邮箱地址">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label for="inputPassword" class="col-sm-2 control-label">密码</label>--%>

                                    <%--<div class="col-sm-10">--%>
                                        <%--<input type="password" class="form-control" id="inputPassword" name="password" placeholder="请输入登入密码">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label for="inputName" class="col-sm-2 control-label">姓名</label>--%>

                                    <%--<div class="col-sm-10">--%>
                                        <%--<input type="text" class="form-control" id="inputName" name="username" placeholder="请输入用户的姓名">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<div class="form-group">--%>
                                    <%--<label for="inputPhone" class="col-sm-2 control-label">手机</label>--%>

                                    <%--<div class="col-sm-10">--%>
                                        <%--<input type="text" class="form-control" id="inputPhone" name="phone" placeholder="请输入手机号码">--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <%--<!-- /.box-body -->--%>
                            <%--<div class="box-footer">--%>
                                <%--<button type="button" class="btn btn-default" onclick="history.go(-1)">返回</button>--%>
                                <%--<button type="submit" class="btn btn-info pull-right">提交</button>--%>
                            <%--</div>--%>
                            <%--<!-- /.box-footer -->--%>
                        <%--</form>--%>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <!-- /.content-wrapper -->
    <jsp:include page="../includes/copyright.jsp"/>

</div>

<jsp:include page="../includes/footer.jsp"/>
</body>


</html>

