var App = function () {
    //iCheck
    var _masterCheckbox;
    var _checkbox;

    //用于存放ID的数组
    var _idArray ;

    /**
     * 私有方法 初始化iCheck
     */
    var handlerInitCheckbox = function () {
        // 激活 iCheck 相当于给原生的Checkbox添加上css样式
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass   : 'iradio_minimal-blue'
        });

        //获取头部全选框checkbox
        _masterCheckbox = $('input[type="checkbox"].minimal.icheck_master');
        //获取全部checkbox
        _checkbox = $('input[type="checkbox"].minimal');
    };

    /**
     * 全选功能
     */
    var handlerCheckboxAll = function () {
        _masterCheckbox.on("ifClicked", function (e) {
            // 当前状态已选中，点击后应取消选择
            if (e.target.checked) {
                _checkbox.iCheck("uncheck");
            }

            // 当前状态未选中，点击后应全选
            else {
                _checkbox.iCheck("check");
            }
        });
    };

    var handlerDeleteMulti = function (url) {
        _idArray = new Array();

        //将选中的id放入数组中
        _checkbox.each(function () {
            var _id = $(this).attr("id");
            if(_id != null && _id != "undefine" && $(this).is(":checked")){
                _idArray.push(_id);
            }
        });

        if(_idArray.length === 0){
            $("#modal-message").html("你还没有选择任何数据，请至少选择一项");
        }
        else{
            $("#modal-message").html("你确定删除数据项吗？");
        }

        $("#modal-default").modal("show");

        $("#btnModalOk").bind("click", function () {
            del();
        });

        //当前私有函数的私有函数
        function del() {
            $("#modal-default").modal("hide");
            //如果没有选择数据项则关闭模态框
            if(_idArray.length === 0){

            }else{
                setTimeout(function () {
                    $.ajax({
                        "url": url,
                        "type": "POST",
                        "data":{"ids": _idArray.toString()},
                        "dataType": "JSON",
                        "success": function (data) {
                            debugger
                            $("#btnModalOk").unbind("click");

                            if(data.status === 200){
                                // $("#modal-massage").html(data.message);
                                $("#modal-message").html("数据删除成功");
                                $("#modal-default").modal("show");
                                $("#btnModalOk").bind("click", function () {
                                    window.location.reload();
                                });
                            }else{

                                $("#btnModalOk").bind("click", function () {
                                    $("#modal-default").modal("hide");
                                });
                            }
                            // $("#modal-massage").html(data.message);
                            // $("#modal-default").modal("show");
                        }
                    });
                }, 500);
            }
        }
    };

    /**
     * 初始化dataTable数据
     */
    var handlerInitDataTables = function (url, columns) {
        var _dataTable = $("#dataTable").dataTable({
            "paging":true,
            "info":true,
            "lengthChange":false,
            "ordering": false,
            "processing": true,
            "searching": false,
            //是否在服务器端分页
            "serverSide":true,
            //优化速度
            "deferRender": true,
            "ajax": {
                "url": url
            },
            "columns": columns,
            //国际化
            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            },
            "drawCallback": function(){
                handlerInitCheckbox();
                handlerCheckboxAll();
            }
        });

        return _dataTable;
    };

    var handlerShowDetail = function (url) {
        $.ajax({
            "url": url,
            "type": "get",
            "dataType": "html",
            "success": function (data) {
                $("#modal-detail-body").html(data);
                $("#modal-detail").modal("show");
            }
        })
    };

    return{
        /**
         * 初始化表格的chenkbox框
         */
        init: function () {
            handlerInitCheckbox();
            handlerCheckboxAll();
        },

        /**
         * 选中的checkbox框
         * @returns {*}
         */
        getCheckbox: function () {
            return _checkbox;
        },

        /**
         * 多项删除操作
         * @param url
         */
        deleteMulti : function(url){
            handlerDeleteMulti(url);
        },

        /**
         * 初始化表格
         * @param url
         * @param columns
         */
        initDataTables: function (url, columns) {
            return handlerInitDataTables(url, columns);
        },

        /**
         * 显示详细信息
         * @param url
         */
        showDetail: function (url) {
            handlerShowDetail(url);
        }
    }
}();

$(document).ready(function () {
    App.init();
});