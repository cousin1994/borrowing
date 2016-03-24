/**
 * 
 */

    $(document).ready(function() {
     var table = $('#table').DataTable({
        		"aLengthMenu":[10,20,40,50], // 显示多少也
                responsive: true, //响应式
                processing: true, // 过程要有个东西显示
                serverSide : true,
                statesave : true, //允许浏览器进行缓存
            	searching : false, //禁止搜索
                ajax : "/book/book!datatableList.action",
                columns: [
                            {"data": "bname"},
                            {"data": "isborrowed"},
                            {"data": "ssh"},
                            {"data": "type"},
                            {"data": "publisher"},
                            {"data": "publishdate"}],
                columnDefs: [
                            {
                              "targets": -1, //表示具体需要操作的目标列，下标从0开始
                               "data": "id", //表示我们需要的某一列数据对应的属性名
                               "render": function(data, type, full) {
                                       return "<a href='/update?id=" + data + "'>Update</a>";
                                }
                              }],
                language: {
                    "sProcessing": "处理中...",
                    "sLengthMenu": "显示 _MENU_ 项结果",
                    "sZeroRecords": "没有匹配结果",
                    "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                    "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                    "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                    "sInfoPostFix": "",
                    "sSearch": "表格内搜索:",
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
                }
        });
     
     
     $('#table tbody').on( 'click', 'tr', function () {
         $(this).toggleClass('selected');
     } );
     
    });