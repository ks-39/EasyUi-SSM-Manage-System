<%--
  Created by IntelliJ IDEA.
  User: Ks-39
  Date: 2020/2/23
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <!--引入EasyUi的CSS(此处使用default主题)-->
    <link rel="stylesheet" type="text/css" href="/Static/Easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="/Static/Easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/Static/Easyui/themes/color.css">

    <!--引入Easyui的js文件-->
    <script type="text/javascript" src="/Static/Easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/Static/Easyui/jquery.easyui.min.js"></script>
    <!--汉化-->
    <script type="text/javascript" src="/Static/Easyui/locale/easyui-lang-zh_CN.js"></script>
    <!--js文件-->
    <script type="text/javascript" src="/Static/Easyui/js/default.js"></script>
    <%--validate表单验证文件--%>
    <script type="text/javascript" src="/Static/Easyui/js/validate.js"></script>


    <script type="text/javascript">
        //1. 初始化
        $(function () {
            //初始化datagrid
            var table;
            $('#dg').datagrid({
                border: true,
                collapsible: false,//是否可折叠
                fit: true,//自动大小
                url: "getClazzList?t" + new Date().getTime(),
                idField: 'id',      //主列为id
                singleSelect: false,//支持多选
                rownumbers: true,//行号
                pagination: true,//分页控件
                sortName: 'id', //id列可排序
                sortOrder: 'DESC', //排序方式
                remoteSort: false,
                columns: [[
                    {field: 'chk', checkbox: true, width: 50},
                    {field: 'id', title: 'Id', width: 80, sortable: true},
                    {field: 'no', title: '学号', width: 100},
                    {field: 'name', title: '班名', width: 150},
                    {field: 'clazz_teacher', title: '班主任', width: 200},
                    {field: 'clazz_teacher_phone', title: '班主任手机号', width: 250},
                    {field: 'clazz_teacher_email', title: '班主任邮箱', width: 250},
                ]],
                toolbar:'#toolbar'
            });

            //pagination分页栏
            var p = $('#dg').datagrid('getPager');
            $(p).pagination({
                pageSize: 10,//设置每页显示的记录条数,默认为10
                pageList: [10, 15, 20],//设置每页记录的条数
                beforePageText: '第',
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
            });

            //1. 定义addDialog先关闭
            $("#addDialog").dialog("close");

            //2. 定义editDialog先关闭
            $("#editDialog").dialog("close");

            var status = "${Usertype}";

            //Admin权限下添加
            if(status == 1){

                $("#accordion").accordion('add',{
                    title:"学生信息",
                    content:'        <div style="padding:10px;">\n' +
                        '                <a href="StudentList" class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">学生列表</a>\n' +
                        '            </div>',
                    selected:false
                })

                $("#accordion").accordion('add',{
                    title:"教师信息",
                    content:'        <div style="padding:10px;">\n' +
                        '                <a href="TeacherList" class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">教师列表</a>\n' +
                        '            </div>',
                    selected:false
                })

                $("#accordion").accordion('add',{
                    title:"班级信息",
                    content:'        <div style="padding:10px;">\n' +
                        '                <a href="ClazzList" class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">班级列表</a>\n' +
                        '            </div>',
                    selected:false
                })

            }else if(status == 2){

                $("#accordion").accordion('add',{
                    title:"学生信息",
                    content:'        <div style="padding:10px;">\n' +
                        '                <a href="StudentList" class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">学生列表</a>\n' +
                        '            </div>',
                    selected:false
                })
            }

            //用户设置最后添加
            $("#accordion").accordion('add',{
                title:"用户设置",
                content:'        <div title="用户设置" style="padding:10px">\n' +
                    '               <a href="Info" class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">个人信息</a><br><br>\n' +
                    '                <a href="Index" class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">返回主页</a><br><br>\n' +
                    '                <a onclick="Logout()" class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">退出</a><br><br>\n' +
                    '            </div>',
                selected:false
            })

        })

        // 2. 事件函数

        //2.1 删除事件
        function deleteClazz() {
            var selectRows = $("#dg").datagrid("getSelections");//返回所有选中的行,当没有选中的记录时,将返回空数组
            var selectLength = selectRows.length;
            if(selectLength == 0){
                alert("至少选择一条数据进行操作");
            }else {
                var ids = [];
                $(selectRows).each(function (i, row) {
                    ids[i] = row.id;//将预删除行的id存储到数组中
                });
                var message = confirm("确定要删除该教师信息吗?");
                if(message == true){
                    $.ajax({
                        type:'post',
                        url:'deleteClazzData?t' + new Date().getTime(),
                        data:{ids:ids},
                        dataType:'json',
                        success:function (data) {
                            alert(data.msg);
                            $("#dg").datagrid("reload");//刷新表格
                            $("#dg").datagrid("uncheckAll");//取消勾选当前页所有的行
                        }
                    })
                }
            }
        }

        //2.2 添加事件
        //2.2.1  打开添加对话框
        function addClazz(){
            $("#addDialog").dialog("open");//打开添加窗口
        }

        //2.2.2 提交添加表单
        function submitAddForm() {
            $("#addForm").form('submit',{
                url:'addClazzData?t' + new Date().getTime(),
                datatype:'json',
                type:'post',
                success:function (data) {
                    //必须将JSON字符串转换为对象
                    var flag = eval("(" + data+ ")");
                    if(flag.success){
                        alert(flag.msg);
                        setTimeout(function () {
                            top.location.href="/ClazzList";
                        },1500)
                    }else {
                        alert(flag.msg);
                    }
                }
            })
        }

        //2.2.3 清除添加表单
        function clearAddForm(){
            $('#addForm').form('clear');
        }

        //2.3 修改事件
        //2.3.1 打开修改对话框
        function editClazz() {
            var selectRows = $("#dg").datagrid("getSelections");//返回所有选中的行,当没有选中的记录时,将返回空数组
            var selectLength = selectRows.length;
            if (selectLength == 0) {
                alert("请选择一条数据进行操作");
            } else {
                $("#editDialog").dialog('open')

                //回显数据
                var selectRow = $("#dg").datagrid("getSelected");

                //id、no、name、email、phone、address、about
                $("#edit_id").val(selectRow.id);
                $("#edit_no").textbox("setValue",selectRow.no);
                $("#edit_name").textbox("setValue",selectRow.name);
                $("#edit_email").textbox("setValue",selectRow.email);
                $("#edit_phone").textbox("setValue",selectRow.phone);
            }
        }

        //2.3.2 提交修改表单
        function submitEditForm() {
            $("#editForm").form('submit',{
                url:'editClazzData?t' + new Date().getTime(),
                datatype:'json',
                type:'post',
                success:function (data) {
                    //必须将JSON字符串转换为对象
                    var flag = eval("(" + data+ ")");
                    if(flag.success){
                        alert(flag.msg);
                        setTimeout(function () {
                            top.location.href="/ClazzList";
                        },1000)
                    }else {
                        alert(flag.msg);
                    }
                }
            })
        }

        //2.3.3 清除修改表单
        function clearEditForm() {
            $("#editForm").form("clear");
        }

        //2.4 搜索事件
        function searchClazz() {
            var clazzName = $("#clazzname").val();
            var clazzNumber = $("#clazznumber").val();

            //将clazzName、studentName、studentNumber的数据读取到datagrid的初始化，传回给后台的getList方法
            $("#dg").datagrid('load',{
                clazzName:clazzName,
                clazzNumber:clazzNumber,
            })
        }

    </script>
</head>
<body>

<div>
    <h2 style="float: left;width: 500px">xx学校教务管理系统 || 班级信息</h2>
</div>

<a href="" class="easyui-menubutton" data-options="menu:'#mm2'" style="float: right;margin-top: 25px">
    <span style="font-size: 25px;color: #6b9cde">hello,${Userinfo.name}</span>
</a>

<div id="mm2" style="width:125px;color: #6b9cde">
    <div href="Info">个人信息</div>
    <div href="Index">返回主页</div>
    <div onclick="Logout()">退出</div>
</div>

<div class="easyui-layout" style="width:100%;height:600px;">
    <!--上下右区域-->
    <div data-options="region:'north'" style="height:50px"></div>
    <div data-options="region:'south'" style="height:50px;"></div>
    <div data-options="region:'east'" style="width: 0px;"></div>

    <!--左-->
    <div data-options="region:'west',split:false" title="菜单栏" style="width:200px;font-size: 20px">
        <!--accordion:手风琴-->
        <div id="accordion" class="easyui-accordion" data-options="fit:true,border:false"></div>
    </div>

    <div data-options="region:'center',title:'主页'">
        <!--tabs选项卡-->
        <div id="tt" class="easyui-tabs" data-options="fit:true,border:false,plain:false">

            <div title="Main">
                <table id="dg" title="班级列表" style="width:100%;height:100%"></table>

                <%--1. 工具栏--%>
                <div id="toolbar" style="padding:5px;height:auto">
                    <div style="margin-bottom:5px">
                        <a href="javascript:void(0)" onclick="addClazz()" class="easyui-linkbutton" iconCls="icon-add" plain="true"></a>
                        <a href="javascript:void(0)" onclick="deleteClazz()" class="easyui-linkbutton" iconCls="icon-remove" plain="true"></a>
                        <a href="javascript:void(0)" onclick="editClazz()" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>

                        <span style="float: right">
                            班级名称：<input id="clazzname" class="easyui-textbox" name="clazzname" style="width: 150px"/>
                            班号：<input id="clazznumber" class="easyui-textbox" name="clazznumber" style="width: 150px"/>
                                <a onclick="searchClazz()" href="javascript:void(0)" class="easyui-linkbutton"
                                   data-options="iconCls:'icon-search',plain:true">搜索</a>
                        </span>
                    </div>
                </div>

                <!--2. 添加信息对话框 -->
                <div id="addDialog" class="easyui-dialog" title="添加班级信息" data-options="iconCls:'icon-add'" style="width:600px;height:600px;padding:10px">
                    <form id="addForm" style="padding: 0 50px 20px 50px">
                        <table cellpadding="10" style="font-size: 20px;color: #6b9cde;padding: 0 0 0 50px">
                            <tr>
                                <td>班号:</td>
                                <td>
                                    <input class="easyui-textbox" type="text" name="no" prompt="请输入班号" data-options="required:true"  validType="clazz_no"/>
                                </td>
                            </tr>

                            <tr>
                                <td>班级:</td>
                                <td>
                                    <input class="easyui-textbox" type="text" name="name" prompt="请输入班名" data-options="required:true"/>
                                </td>
                            </tr>

                            <tr>
                                <td>班主任姓名:</td>
                                <td>
                                    <input class="easyui-textbox" type="text" name="clazz_teacher" prompt="请输入姓名" data-options="required:true,validType:'length[2,12]'"/>
                                </td>
                            </tr>

                            <tr>
                                <td>班主任手机:</td>
                                <td>
                                    <input class="easyui-textbox" type="text" name="clazz_teacher_phone" prompt="请输入手机号" data-options="required:true"  validType="mobile"/>
                                </td>
                            </tr>

                            <tr>
                                <td>班主任邮箱:</td>
                                <td>
                                    <input class="easyui-textbox" type="text" name="clazz_teacher_email" prompt="请输入邮箱地址" data-options="required:true,validType:'email'">
                                </td>
                            </tr>

                        </table>
                    </form>

                    <div style="margin-left: 220px;padding:5px">
                        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitAddForm()">Submit</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearAddForm()">Clear</a>
                    </div>

                </div>

                <%--3.  修改信息对话框--%>
                <div id="editDialog" class="easyui-dialog" title="修改教师信息" data-options="iconCls:'icon-edit'" style="width:600px;height:600px;padding:10px">
                    <form id="editForm" style="padding: 0 50px 20px 50px">
                        <table cellpadding="10" style="font-size: 20px;color: #6b9cde;padding: 0 0 0 50px">
                            <%--将id栏隐藏--%>
                            <tr>
                                <td>
                                    <input id="edit_id" name="id" hidden/>
                                </td>
                            </tr>

                                <tr>
                                    <td>班号:</td>
                                    <td>
                                        <input class="easyui-textbox" type="text" name="no" prompt="请输入班号" data-options="required:true"  validType="clazz_no"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td>班级:</td>
                                    <td>
                                        <input class="easyui-textbox" type="text" name="name" prompt="请输入班名" data-options="required:true"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td>班主任姓名:</td>
                                    <td>
                                        <input class="easyui-textbox" type="text" name="clazz_teacher" prompt="请输入姓名" data-options="required:true,validType:'length[2,12]'"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td>班主任手机:</td>
                                    <td>
                                        <input class="easyui-textbox" type="text" name="clazz_teacher_phone" prompt="请输入手机号" data-options="required:true"  validType="mobile"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td>班主任邮箱:</td>
                                    <td>
                                        <input class="easyui-textbox" type="text" name="clazz_teacher_email" prompt="请输入邮箱地址" data-options="required:true,validType:'email'">
                                    </td>
                                </tr>

                        </table>
                    </form>

                    <div style="margin-left: 220px;padding:5px">
                        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitEditForm()">Submit</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearEditForm()">Clear</a>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
