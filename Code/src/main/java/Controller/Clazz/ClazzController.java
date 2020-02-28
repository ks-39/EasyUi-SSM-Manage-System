package Controller.Clazz;

import Bean.Clazz;
import Bean.Teacher;
import Service.Clazz.ClazzService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ClazzController {

    //0. 前置工作
    //0.1 创建存储json数据的map对象
    private Map<String,Object> result = new HashMap<>();

    //0.2 注入业务对象
    @Autowired
    private ClazzService clazzService;

    //1. 跳转页面
    //1.1 跳转至ClazzList
    @RequestMapping("ClazzList")
    public String clazzList(){
        return "/ClazzList";
    }

    //2. 增删改查操作
    //2.1 查询全部班级信息/根据班级、班号查询(使用Mybatis的pagehelper插件)
    @RequestMapping("getClazzList")
    @ResponseBody
    public Map<String,Object> getList(Integer page,Integer rows,String clazzName,String clazzNumber){
        //0. 创建对象
        Clazz clazz = new Clazz(clazzName,clazzNumber);
        //1. 设置每页记录数(PageHelper.startPage(page,rows)):注意只能为rows
        PageHelper.startPage(page,rows);
        //2. 查询数据
        List<Clazz> list = clazzService.getList(clazz);
        //3. 封装数据(PageInfo<Bean>)
        PageInfo<Clazz> pageInfo = new PageInfo<>(list);
        //4. 总记录数
        long total = pageInfo.getTotal();
        //5. 页面数据
        List<Clazz> pageList = pageInfo.getList();
        //6. 返回数据
        result.put("total",total);
        result.put("rows",pageList);
        return result;
    }

    //2.2 添加班级信息
    @RequestMapping("addClazzData")
    @ResponseBody
    public Map<String,Object> addData(Clazz clazz){

        if(clazzService.findByNo(clazz) != null){
            result.put("success",false);
            result.put("msg","该班号已存在,请重新输入");
        }

        if(clazzService.add(clazz) > 0){
            result.put("success",true);
            result.put("msg","添加成功");
        }
        return result;
    }

    //2.3 删除班级信息
    @RequestMapping("deleteClazzData")
    @ResponseBody
    public Map<String, Object> deleteData(@RequestParam(value = "ids[]", required = true) Integer[] ids) {

        if (clazzService.deleteById(ids) > 0) {
            result.put("success", true);
            result.put("msg","已成功删除该信息");
        } else {
            result.put("success", false);
            result.put("msg","发生错误,请重试");
        }
        return result;
    }

    //2.4 修改班级信息
    @RequestMapping("editClazzData")
    @ResponseBody
    public Map<String,Object> editData(Clazz clazz){
        if(clazzService.editById(clazz) > 0){
            result.put("success",true);
            result.put("msg","修改成功");
        }else {
            result.put("success",false);
            result.put("msg","修改失败,请重试");
        }
        return result;
    }

}
