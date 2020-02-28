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

        //1. 加载菜单栏
        $(function () {
            var status = "${Usertype}";

            if(status != 1){
                $("#tt").tabs("close",'修改信息');
            }

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

            //用户设置
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

        //2. 修改信息
        //2.1 提交修改信息表单
        function submitForm2(){
            $('#ff2').form('submit',{
                url:'updateAdminInfo?t' + new Date().getTime(),         //添加时间后缀，防止sql注入攻击
                dataType:"JSON",
                type:"post",

                success:function (data) {
                    //必须将JSON字符串转换为对象
                    var flag = eval("(" + data+ ")");
                    if(flag.success){
                        alert(flag.msg);
                        window.location.href="Info";
                    }else{
                        alert(flag.msg);
                    }
                }
            });
        }

        //2.2 清除修改信息
        function clearForm2(){
            $('#ff2').form('clear');
        }

        //3. 修改密码
        //3.1  提交修改密码表单
        function submitForm3(){
            $('#ff3').form('submit',{
                url:'CheckEditPassword?t' + new Date().getTime(),           //防止sql注入
                dataType:"JSON",
                type:"post",

                success:function (data) {
                    //必须将JSON字符串转换为对象
                    var flag = eval("(" + data+ ")");
                    if(flag.success){
                        alert(flag.msg);
                        setTimeout(function () {
                            top.location.href="http://localhost/Login";
                        }, 1500)
                    }else{
                        alert(flag.msg);
                    }
                }
            });
        }

        //3.2  清除修改密码表单
        function clearForm3(){
            $('#ff3').form('clear');
        }

    </script>

</head>
<body>

<h2 style="float: left;width: 500px">xx学校教务管理系统 || 用户设置</h2>

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

            <div title="个人信息" style="padding:10px">
                <%--1. 个人信息--%>
                <form id="ff1" style="padding: 20px 50px 20px 50px;margin-left: 200px">
                    <table cellpadding="10" style="font-size: 20px;color: #6b9cde">
                        <tr>
                            <td>Name:</td>
                            <td>
                                <span id="name" name="name" style="width:100%;height:35px;padding:10px;">${Userinfo.name}</span>
                            </td>
                        </tr>

                        <tr>
                            <td>No:</td>
                            <td>
                                <span id="no" name="no" style="width:100%;height:35px;padding:10px;">${Userinfo.no}</span>
                            </td>
                        </tr>

                        <tr>
                            <td>Clazzname:</td>
                            <td>
                                <span id="clazzname" name="clazzname" style="width:100%;height:35px;padding:10px;">${Userinfo.clazzname}</span>
                            </td>
                        </tr>

                        <tr>
                            <td>Gender:</td>
                            <td>
                                <span id="gender" name="gender" style="width:100%;height:35px;padding:10px;">${Userinfo.gender}</span>
                            </td>
                        </tr>

                        <tr>
                            <td>Email:</td>
                            <td>
                                <span id="email" name="email" style="width:100%;height:35px;padding:10px;">${Userinfo.email}</span>
                            </td>
                        </tr>

                        <tr>
                            <td>Phone:</td>
                            <td>
                                <span id="phone" name="phone" style="width:100%;height:35px;padding:10px;">${Userinfo.phone}</span>
                            </td>
                        </tr>

                        <tr>
                            <td>Address:</td>
                            <td>
                                <span id="address" name="address" style="width:100%;height:35px;padding:10px;">${Userinfo.address}</span>
                            </td>
                        </tr>

                    </table>
                </form>
            </div>

            <div title="修改信息" style="padding:10px">
                <%--2. 修改信息--%>
                <div style="padding:20px 50px 20px 50px">
                    <form id="ff2" style="padding: 20px 50px 20px 50px">
                    <table cellpadding="10" style="font-size: 20px;color: #6b9cde;padding: 20px 50px 20px 150px">
                        <tr>
                            <td>Name:</td>
                            <td>
                                <input class="easyui-textbox" type="text" name="name" prompt="请输入用户名" data-options="required:true,validType:'length[2,8]'"/>
                            </td>
                        </tr>

                        <tr>
                            <td>No:</td>
                            <td>
                                <input class="easyui-textbox" type="text" name="no" prompt="请输入number" data-options="required:true"  validType="admin_no"/>
                            </td>
                        </tr>

                        <tr>
                            <td>Gender:</td>
                            <td>
                                <select class="easyui-combobox" name="gender" style="width: 80px">
                                    <option value="male" selected="selected">男</option>
                                    <option value="female" >女</option>
                                    <option value="third gender" >第三性</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td>Email:</td>
                            <td>
                                <input class="easyui-textbox" type="text" name="email" prompt="请输入邮箱地址" data-options="required:true,validType:'email'">
                            </td>
                        </tr>

                        <tr>
                            <td>Phone:</td>
                            <td>
                                <input class="easyui-textbox" type="text" name="phone" prompt="请输入手机号" data-options="required:true" validType="mobile">
                            </td>
                        </tr>

                        <tr>
                            <td>Address:</td>
                            <td>
                                <input class="easyui-textbox" type="text" name="address" prompt="请输入地址" data-options="required:true">
                            </td>
                        </tr>

                    </table>
                </form>
                </div>

                <div style="margin-left: 350px;padding:5px">
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm2()">Submit</a>
                    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm2()">Clear</a>
                </div>
            </div>

            <div title="修改密码" style="padding:10px">
                <%--3. 修改密码--%>
                <div style="padding:50px 60px 50px 60px">
                    <form id="ff3" method="post" style="padding: 30px 50px 30px 50px;">
                        <table cellpadding="15" style="font-size: 20px;color: #6b9cde">
                            <tr>
                                <td>原密码:</td>
                                <td>
                                    <input id="old_password" name="oldPassword" class="easyui-passwordbox" prompt="请输入原密码" data-options="required:true" style="width:100%;height:35px;padding:10px">
                                </td>
                            </tr>

                            <tr>
                                <td>新密码:</td>
                                <td>
                                    <input id="new_password" name="newPassword" class="easyui-passwordbox" prompt="请输入新密码" data-options="required:true" validType="password" style="width:100%;height:35px;padding:10px">
                                </td>
                            </tr>

                            <tr>
                                <td>请再次输入新密码:</td>
                                <td>
                                    <input id="repeat_new_password" name="repeatnewPassword" class="easyui-passwordbox" prompt="再次输入新密码" data-options="required:true" validType="equals['#new_password']" style="width:100%;height:35px;padding:10px">
                                </td>
                            </tr>

                        </table>
                    </form>

                    <div style="margin-left: 175px;padding:5px">
                        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm3()">Submit</a>
                        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm3()">Clear</a>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
