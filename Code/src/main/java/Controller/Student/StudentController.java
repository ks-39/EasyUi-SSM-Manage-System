package Controller.Student;

import Bean.Student;
import Service.Clazz.ClazzService;
import Service.Student.StudentService;
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
public class StudentController {
    //0. 前置工作
    //0.1 map存储json
    private Map<String,Object> result = new HashMap<>();

    //0.2 注入业务对象
    @Autowired
    private StudentService studentService;

    @Autowired
    private ClazzService clazzService;

    //1. 跳转至StudentList
    @RequestMapping("StudentList")
    public ModelAndView StudentList(ModelAndView modelAndView) {
        //通过ModelAndView将班级信息返回到指定页面
        modelAndView.addObject("clazzList",clazzService.getClazzName());
        modelAndView.setViewName("/StudentList");
        return modelAndView;
    }

    //2. 增删改查
    //2.1 查询全部学生信息/根据班级、姓名、学号查询(使用Mybatis的pagehelper插件)
    @RequestMapping("getStudentList")
    @ResponseBody
    public Map<String,Object> getList(Integer page,Integer rows,String clazzName,String studentName,String studentNumber){

        Student student = new Student(clazzName,studentName,studentNumber);
        //1. 设置每页记录数
        PageHelper.startPage(page,rows);
        //2. 查询数据
        List<Student> list = studentService.getList(student);
        //3. 封装数据
        PageInfo<Student> pageInfo = new PageInfo<>(list);
        //4. 总记录数
        long total = pageInfo.getTotal();
        //5. 页面数据
        List<Student> pageList = pageInfo.getList();
        //6. 返回数据
        result.put("total",total);
        result.put("rows",pageList);
        return result;
    }

    //2.2 添加学生信息
    @RequestMapping("addStudentData")
    @ResponseBody
    public Map<String,Object> addData(Student student){
        if(studentService.findByNo(student) != null){
            result.put("success",false);
            result.put("msg","该学号已存在,请重新输入");
            return result;
        }

        if(studentService.add(student) > 0){
            result.put("success",true);
            result.put("msg","添加成功");
            return result;
        }
        return result;
    }

    //2.3 删除学生信息
    @RequestMapping("deleteStudentData")
    @ResponseBody
    public Map<String, Object> deleteData(@RequestParam(value = "ids[]", required = true) Integer[] ids) {
        if (studentService.deleteById(ids) > 0) {
            result.put("success", true);
            result.put("msg","已成功删除该信息");
        } else {
            result.put("success", false);
            result.put("msg","发生错误,请重试");
        }
        return result;
    }

    //2.4 修改学生信息
    @RequestMapping("editStudentData")
    @ResponseBody
    public Map<String,Object> editData(Student student){
        if(studentService.editById(student) > 0){
            result.put("success",true);
            result.put("msg","修改成功");
        }else {
            result.put("success",false);
            result.put("msg","修改失败,请重试");
        }
        return result;
    }
}
