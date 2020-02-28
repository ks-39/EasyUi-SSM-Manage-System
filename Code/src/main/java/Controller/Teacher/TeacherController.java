package Controller.Teacher;

import Bean.Student;
import Bean.Teacher;
import Service.Clazz.ClazzService;
import Service.Student.StudentService;
import Service.Teacher.TeacherService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TeacherController {

    //0. 前置工作
    //0.1 创建Map存储json数据返回给客户端
    private Map<String,Object> result = new HashMap<>();

    //0.2 注入业务对象
    @Autowired
    private TeacherService teacherService;

    @Autowired
    private ClazzService clazzService;

    //1. 跳转页面
    @RequestMapping("TeacherList")
    public ModelAndView TeacherList(ModelAndView modelAndView) {
        //通过ModelAndView将班级信息返回到指定页面
        modelAndView.addObject("clazzList",clazzService.getClazzName());
        modelAndView.setViewName("/TeacherList");
        return modelAndView;
    }

    //2. 增删改查操作
    //2.1 查询全部教师信息/根据班级、姓名、学号查询(使用Mybatis的pagehelper插件)
    @RequestMapping("getTeacherList")
    @ResponseBody
    public Map<String,Object> getList(Integer page,Integer rows,String clazzName,String teacherName,String teacherNumber){

        Teacher teacher = new Teacher(clazzName,teacherName,teacherNumber);
        //1. 设置每页记录数(PageHelper.startPage(page,rows)):注意只能为rows
        PageHelper.startPage(page,rows);
        //2. 查询数据
        List<Teacher> list = teacherService.getList(teacher);
        //3. 封装数据(PageInfo<Bean>)
        PageInfo<Teacher> pageInfo = new PageInfo<>(list);
        //4. 总记录数
        long total = pageInfo.getTotal();
        //5. 页面数据
        List<Teacher> pageList = pageInfo.getList();
        //6. 返回数据
        result.put("total",total);
        result.put("rows",pageList);
        return result;
    }

    //2.2 添加教师信息
    @RequestMapping("addTeacherData")
    @ResponseBody
    public Map<String,Object> addData(Teacher teacher){
        if(teacherService.findByNo(teacher) != null){
            result.put("success",false);
            result.put("msg","该工号已存在,请重新输入");
        }

        if(teacherService.add(teacher) > 0){
            result.put("success",true);
            result.put("msg","添加成功");
        }
        return result;
    }

    //2.3 删除教师信息
    @RequestMapping("deleteTeacherData")
    @ResponseBody
    public Map<String, Object> deleteData(@RequestParam(value = "ids[]", required = true) Integer[] ids) {
        if (teacherService.deleteById(ids) > 0) {
            result.put("success", true);
            result.put("msg","已成功删除该信息");
        } else {
            result.put("success", false);
            result.put("msg","发生错误,请重试");
        }
        return result;
    }

    //2.4 修改教师信息
    @RequestMapping("editTeacherData")
    @ResponseBody
    public Map<String,Object> editData(Teacher teacher){
        if(teacherService.editById(teacher) > 0){
            result.put("success",true);
            result.put("msg","修改成功");
        }else {
            result.put("success",false);
            result.put("msg","修改失败,请重试");
        }
        return result;
    }
}
