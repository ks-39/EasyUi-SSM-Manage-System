<%--
  Created by IntelliJ IDEA.
  User: Ks-39
  Date: 2020/2/22
  Time: 0:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>教务系统</title>

    <!--引入EasyUi的CSS(此处使用default主题)-->
    <link rel="stylesheet" type="text/css" href="/Static/Easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="/Static/Easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/Static/Easyui/themes/color.css">

    <!--引入Easyui的js文件-->
    <script type="text/javascript" src="/Static/Easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/Static/Easyui/jquery.easyui.min.js"></script>
    <!--汉化-->
    <script type="text/javascript" src="/Static/Easyui/locale/easyui-lang-zh_CN.js"></script>

    <%--检验表单js--%>
    <script type="text/javascript" src="/Static/Easyui/js/validate.js"></script>

    <%--跳转页面js--%>
    <script type="text/javascript" src="/Static/Easyui/js/default.js"></script>

    <script type="text/javascript">

        <%--不可整合js--%>
        //1. 加载菜单栏
        $(function () {
            var status = "${Usertype}";

            //Admin权限下添加
            if(status == 1){

                $("#accordion").accordion('add',{
                    title:"学生信息",
                    content:'        <div style="padding:10px;">\n' +
                        '                <a href=" " class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">学生列表</a>\n' +
                        '            </div>',
                    selected:false
                })

                $("#accordion").accordion('add',{
                    title:"教师信息",
                    content:'        <div style="padding:10px;">\n' +
                        '                <a href=" " class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">教师列表</a>\n' +
                        '            </div>',
                    selected:false
                })

                $("#accordion").accordion('add',{
                    title:"班级信息",
                    content:'        <div style="padding:10px;">\n' +
                        '                <a href=" " class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">班级列表</a>\n' +
                        '            </div>',
                    selected:false
                })

            }else if(status == 2){

                $("#accordion").accordion('add',{
                    title:"学生信息",
                    content:'        <div style="padding:10px;">\n' +
                        '                <a href=" " class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">学生列表</a>\n' +
                        '            </div>',
                    selected:false
                })
            }

            //用户设置最后添加
            $("#accordion").accordion('add',{
                title:"用户设置",
                content:'        <div title="用户设置" style="padding:10px">\n' +
                    '               <a href="Info" class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">个人信息</a><br><br>\n' +
                    '                <a href="EditPassword" class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">修改密码</a><br><br>\n' +
                    '                <a href="Index" class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">返回主页</a><br><br>\n' +
                    '                <a onclick="Logout()" class="easyui-linkbutton" data-options="plain:true" style="width: 100px;height: 40px;color: #d9534f">退出</a><br><br>\n' +
                    '            </div>',
                selected:false
            })

        })


    </script>

</head>
<body>

<h2 style="float: left;width: 500px">xx学校教务管理系统</h2>

<a href="" class="easyui-menubutton" data-options="menu:'#mm2'" style="float: right;margin-top: 25px">
    <span style="font-size: 25px;color: #6b9cde">hello,${Userinfo.name}</span>
</a>
<div id="mm2" style="width:125px;color: #6b9cde">
    <div href="EditPassword">修改密码</div>
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
        <div id="accordion" class="easyui-accordion" data-options="fit:true,border:false">

        </div>
    </div>

    <div data-options="region:'center',title:'主页'">
        <!--tabs选项卡-->
        <div id="tt" class="easyui-tabs" data-options="fit:true,border:false,plain:false">

        </div>

    </div>
</div>
</body>
</html>
