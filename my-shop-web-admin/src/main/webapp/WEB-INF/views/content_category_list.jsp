<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的商城|内容管理</title>
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
                内容管理
                <small></small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">用户列表</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <!--错误提示框-->
                    <c:if test="${baseResult != null}">
                        <%--<div class="alert alert-danger alert-dismissible" ${message == null ? "style='display: none'": ""}>--%>
                        <div class="alert alert-${baseResult.status == 200? "success": "danger"} alert-dismissible" >
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${baseResult.message}
                        </div>
                    </c:if>

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">分类列表</h3>

                            <div class="box-body">
                                <a href="#" type="button" class="btn btn-sm btn-info"><i class="fa fa-user-plus"></i>&nbsp新增</a>&nbsp
                                <button href="#" type="button" class="btn btn-sm btn-info" ><i class="fa fa-trash"></i>&nbsp删除</button>&nbsp
                                <a href="#" type="button" class="btn btn-sm btn-info"><i class="fa fa-level-down"></i>&nbsp导入</a>&nbsp
                                <a href="#" type="button" class="btn btn-sm btn-info"><i class="fa fa-level-up"></i>&nbsp导出</a>&nbsp
                                <button href="#" type="button" class="btn btn-sm btn-info" onClick="$('.box-info-search').css('display') == 'none'? $('.box-info-search').show('fast') : $('.box-info-search').hide('fast')"><i class="fa fa-search"></i>&nbsp高级搜索</button>
                            </div>

                            <div class="box-tools">
                                <from:form action="/user/search" method="post" modelAttribute="tbUser">
                                    <div class="input-group input-group-sm" style="width: 150px;">
                                        <input type="text" name="keyWords" class="form-control pull-right" placeholder="搜索">

                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </from:form>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive ">
                            <table id="dataTable" class="table table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>名字</th>
                                    <th>排序</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${tbContentCategories}" var = "tbContentCategory">
                                       <tr>
                                           <td>${tbContentCategory.id}</td>
                                           <td>${tbContentCategory.name}</td>
                                           <td>${tbContentCategory.sortOrder}</td>
                                       </tr>
                                    </c:forEach>
                                </tbody>


                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </section>
    </div>

    <!-- /.content-wrapper -->
    <jsp:include page="../includes/copyright.jsp"/>

</div>

<jsp:include page="../includes/footer.jsp"/>
<!--自定义·模态框-->
<sys:modal />

</body>


</html>
