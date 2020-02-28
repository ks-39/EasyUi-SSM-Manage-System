package Controller.System;


import Bean.Admin;
import Bean.LoginForm;
import Bean.Student;
import Bean.Teacher;
import Service.Admin.AdminService;
import Service.Student.StudentService;
import Service.Teacher.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class SystemController {

    //0. 前置工作
    //0.1 注入Service业务
    @Autowired
    private AdminService adminService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    //0.2 map存储json对象数据
    private Map<String, Object> result = new HashMap<>();

    //1. 页面跳转
    //1.1 Login
    @RequestMapping("Login")
    public String Login() {
        return "/Login";
    }

    //1.2 Logout
    @RequestMapping("Logout")
    public String Logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/Login";
    }

    //1.3 Index
    @RequestMapping("Index")
    public String Index(){
        return "/Index";
    }

    //1.4 Info
    @RequestMapping("Info")
    public String Info(){
        return "/Info";
    }

    //2. 用户设置操作
    //2.1 检验登录表单
    @RequestMapping("CheckLogin")
    @ResponseBody
    public Map<String,Object> CheckLogin(LoginForm loginForm, HttpServletRequest request){
        switch (loginForm.getUsertype()){
            case 1:
                try{
                    Admin admin = adminService.login(loginForm);

                    if(admin != null){
                        request.getSession().setAttribute("Userinfo",admin);
                        request.getSession().setAttribute("Usertype",loginForm.getUsertype());
                        result.put("success",true);
                        return result;
                    }
                }catch (Exception e){
                    e.printStackTrace();
                    result.put("success",false);
                    result.put("msg","发生错误,请重试");
                    return result;
                }
                break;

            case 2:
                try{
                    Teacher teacher = teacherService.login(loginForm);
                    if(teacher != null){
                        request.getSession().setAttribute("Userinfo",teacher);
                        request.getSession().setAttribute("Usertype",loginForm.getUsertype());
                        result.put("success",true);
                        return result;
                    }
                }catch (Exception e){
                    e.printStackTrace();
                    result.put("success",false);
                    result.put("msg","发生错误,请重试");
                    return result;
                }
                break;

            case 3:
                try{
                    Student student = studentService.login(loginForm);
                    if(student != null){
                        request.getSession().setAttribute("Userinfo",student);
                        request.getSession().setAttribute("Usertype",loginForm.getUsertype());
                        result.put("success",true);
                        return result;
                    }
                }catch (Exception e){
                    e.printStackTrace();
                    result.put("success",false);
                    result.put("msg","发生错误,请重试");
                    return result;
                }
                break;
        }

        result.put("success",false);
        result.put("msg","用户名或密码或身份错误,请核对登录信息");
        return result;
    }

    //2.2 修改用户密码
    @RequestMapping("CheckEditPassword")
    @ResponseBody
    public Map<String,Object> EditPassword(String oldPassword,String newPassword,HttpServletRequest request){
        Integer Usertype = (Integer) request.getSession().getAttribute("Usertype");

        //管理员身份
        if(Usertype == 1){
            Admin admin = (Admin) request.getSession().getAttribute("Userinfo");
            if(!admin.getPassword().equals(oldPassword)){
                result.put("success",false);
                result.put("msg","原密码错误");
                return result;
            }
            try{
                admin.setPassword(newPassword);
                if(adminService.updatePassword(admin) > 0){
                    result.put("success",true);
                    result.put("msg","修改成功,请重新登录");
                    return result;
                }
            }catch (Exception e){
                e.printStackTrace();
                result.put("success",false);
                result.put("msg","发生错误,请重试");
                return result;
            }
        }

        //教师身份
        if(Usertype == 2){
            Teacher teacher = (Teacher) request.getSession().getAttribute("Userinfo");
            if(!teacher.getPassword().equals(oldPassword)){
                result.put("success",false);
                result.put("msg","原密码错误");
                return result;
            }
            try{
                teacher.setPassword(newPassword);
                if(teacherService.updatePassword(teacher) > 0){
                    result.put("success",true);
                    result.put("msg","修改成功,请重新登录");
                    return result;
                }
            }catch (Exception e){
                e.printStackTrace();
                result.put("success",false);
                result.put("msg","发生错误,请重试");
                return result;
            }
        }

        //学生身份
        if(Usertype == 3){
            Student student = (Student) request.getSession().getAttribute("Userinfo");
            if(!student.getPassword().equals(oldPassword)){
                result.put("success",false);
                result.put("msg","原密码错误");
                return result;
            }
            try{
                student.setPassword(newPassword);
                if(studentService.updatePassword(student) > 0){
                    result.put("success",true);
                    result.put("msg","修改成功,请重新登录");
                    return result;
                }
            }catch (Exception e){
                e.printStackTrace();
                result.put("success",false);
                result.put("msg","发生错误,请重试");
                return result;
            }
        }

        return result;

    }

    //2.3 修改admin信息
    @RequestMapping("updateAdminInfo")
    @ResponseBody
    public Map<String,Object> updateAdminInfo(Admin admin, HttpServletRequest request){
        if(adminService.updateAdminInfo(admin) > 0){
            request.getSession().setAttribute("Userinfo",admin);
            result.put("success",true);
            result.put("msg","修改成功");
            return result;
        }else {
            result.put("success",false);
            result.put("msg","服务器出现错误,请重试");
            return result;
        }
    }
}
