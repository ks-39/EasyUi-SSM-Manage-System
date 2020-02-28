<%--
  Created by IntelliJ IDEA.
  User: Ks-39
  Date: 2020/2/21
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>

    <!--引入EasyUi的CSS(此处使用default主题)-->
    <link rel="stylesheet" type="text/css" href="/Static/Easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="/Static/Easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/Static/Easyui/themes/color.css">

    <!--引入Easyui的js文件-->
    <script type="text/javascript" src="/Static/Easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/Static/Easyui/jquery.easyui.min.js"></script>
    <!--汉化-->
    <script type="text/javascript" src="/Static/Easyui/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript">
        // 登录表单函数
        //1. 表单提交
        function submitForm(){
            $('#ff').form('submit',{
                url:'CheckLogin',
                dataType:"JSON",
                type:"post",

                success:function (data) {
                    //必须将JSON字符串转换为对象
                    var flag = eval("(" + data+ ")");
                    if(flag.success){
                        window.location.href="Index";
                    }else{
                        alert(flag.msg);
                    }
                }
            });
        }

        //2. 表单清除
        function clearForm(){
            $('#ff').form('clear');
        }
    </script>

</head>
<body>

<div style="width: 500px;height: 500px;margin: 100px auto" >

    <div class="easyui-panel" title="Login" style="width:500px;height:500px">
        <div style="padding:50px 60px 50px 60px">
            <form id="ff" method="post" style="padding: 30px 50px 30px 50px">
                <table cellpadding="15" style="font-size: 20px;color: #6b9cde">
                    <tr>
                        <td>No:</td>
                        <td>
                            <input id="userno" name="Userno" class="easyui-textbox" prompt="Usernumber" style="width:100%;height:35px;padding:10px;">
                        </td>
                    </tr>

                    <tr>
                        <td>Password:</td>
                        <td>
                            <input id="password" name="Password" class="easyui-passwordbox" prompt="Password" style="width:100%;height:35px;padding:10px">
                        </td>
                    </tr>

                    <tr>
                        <td>Status:</td>
                        <td style="font-size: 15px;color: darkgray">
                            <input class="easyui-radiobutton" name="Usertype" value="1" label="Admin:" data-options="checked:true">
                            <input class="easyui-radiobutton" name="Usertype" value="2" label="Teacher:">
                            <input class="easyui-radiobutton" name="Usertype" value="3" label="Student:">
                        </td>
                    </tr>
                </table>
            </form>

            <div style="text-align:center;padding:5px">
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
            </div>

        </div>
    </div>
</div>

</body>
</html>
