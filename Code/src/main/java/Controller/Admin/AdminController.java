package Controller.Admin;

import Bean.Admin;
import Service.Admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class AdminController {

    //0. 创建对象
    Admin admin = new Admin();

    //0. 注入Service业务对象
    @Autowired
    private AdminService adminService;

    //0. HashMap存储json数据
    private Map<String,Object> result = new HashMap<>();


}
