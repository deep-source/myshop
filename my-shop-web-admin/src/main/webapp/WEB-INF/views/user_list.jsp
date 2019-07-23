<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>
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
                用户管理
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

                    <!-- Horizontal Form -->
                    <div class="box box-info box-info-search" style="display: none;">
                        <div class="box-header with-border">
                            <h3 class="box-title">高级搜索</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <%--<from:form cssClass="form-horizontal" action="/user/advancedSearch" method="post" modelAttribute="tbUser">--%>
                            <div class="box-body">
                                <div class="row form-horizontal">
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <label for="username" class="col-sm-4 control-label">姓名</label>

                                            <div class="col-sm-8">
                                                <input id="username" class="form-control" placeholder="姓名"/>
                                                <%--<form:input cssClass="form-control" path="username" placeholder="姓名"/>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <label for="email" class="col-sm-4 control-label">邮箱</label>

                                            <div class="col-sm-8">
                                                <input Class="form-control" id="email" placeholder="邮箱"/>
                                                <%--<form:input cssClass="form-control" path="email" placeholder="邮箱"/>--%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <label for="phone" class="col-sm-4 control-label">手机</label>

                                            <div class="col-sm-8">
                                                <input Class="form-control" id="phone" placeholder="手机"/>
                                                <%--<form:input cssClass="form-control" path="phone" placeholder="手机"/>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="button" class="btn btn-info pull-right" onclick="search() ">搜索</button>
                            </div>
                        <%--</from:form>--%>
                    </div>

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">用户列表</h3>

                            <div class="box-body">
                                <a href="/user/form" type="button" class="btn btn-sm btn-info"><i class="fa fa-user-plus"></i>&nbsp新增</a>&nbsp
                                <button href="#" type="button" class="btn btn-sm btn-info" onclick="App.deleteMulti('/user/delete')"><i class="fa fa-trash"></i>&nbsp删除</button>&nbsp
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
                                <!--old version-->
                                <%--<form action="/user/search" method="post">--%>
                                    <%--<div class="input-group input-group-sm" style="width: 150px;">--%>
                                        <%--<input type="text" name="keyWords" class="form-control pull-right" placeholder="搜索">--%>

                                        <%--<div class="input-group-btn">--%>
                                            <%--<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</form>--%>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive ">
                            <table id="dataTable" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="minimal icheck_master" /></th>
                                        <th>ID</th>
                                        <th>用户名</th>
                                        <th>手机名</th>
                                        <th>邮箱</th>
                                        <th>更行时间</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%--<c:forEach items="${tbUsers}" var="tbUser">--%>
                                    <%--<tr>--%>
                                        <%--<th><input id="${tbUser.id}" type="checkbox" class="minimal" />--%>
                                        <%--</th>--%>
                                        <%--<td>${tbUser.id}</td>--%>
                                        <%--<td>${tbUser.username}</td>--%>
                                        <%--<td>${tbUser.phone}</td>--%>
                                        <%--<td>--%>
                                            <%--&lt;%&ndash;<span class="label label-success">&ndash;%&gt;--%>
                                                    <%--${tbUser.email}--%>
                                            <%--&lt;%&ndash;</span>&ndash;%&gt;--%>
                                        <%--</td>--%>
                                        <%--<td>${tbUser.updated}</td>--%>
                                        <%--<td>--%>
                                            <%--<a href="" type="button" class="btn btn-sm btn-default"><i class="fa fa-search"></i>&nbsp查看</a>&nbsp--%>
                                            <%--<a href="" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i>&nbsp编辑</a>&nbsp--%>
                                            <%--<a href="" type="button" class="btn btn-sm btn-danger"><i class="fa  fa-trash"></i>&nbsp删除</a>--%>
                                        <%--</td>--%>
                                    <%--</tr>--%>
                                <%--</c:forEach>--%>

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

<script>
    var dataTable;
    $(function () {
        var columns = [
            {
                "data": function(row, type, val, meta){
                    return "<input id= " + row.id + " type=\"checkbox\" class=\"minimal\" />"
                }
            },
            {"data": "id"},
            {"data": "username"},
            {"data": "phone"},
            {"data": "email"},
            {"data": "updated"},
            {
                "data": function (row, type, val, meta) {
                    var url = "/user/detail?id=" + row.id;
                    return ' <button type="button" class="btn btn-sm btn-default" onclick="App.showDetail(\''+ url + '\')"><i class="fa fa-search"></i>&nbsp查看</button>' +
                        ' <a href="/user/form?id=' + row.id + '" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i>&nbsp编辑</a>' +
                        ' <a type="button" class="btn btn-sm btn-danger"><i class="fa  fa-trash"></i>&nbsp删除</a>' ;
                }
            }
        ];

        dataTable = App.initDataTables("/user/page", columns);

    });

    function search() {
        var username =  $("#username").val();
        var phone =  $("#phone").val();
        var email =  $("#email").val();

        var param = {
            "username" : username,
            "phone" : phone,
            "email" : email
        };

        dataTable.settings()[0].ajax.data = param;
        dataTable.ajax.reload();
    }
</script>

</body>


</html>
