package Service.Admin;

import Bean.Admin;
import Bean.LoginForm;
import Dao.Admin.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    //注入Mapper接口对象
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin login(LoginForm loginForm) {
       return adminMapper.login(loginForm);
    }

    @Override
    public int updatePassword(Admin admin) {
        return adminMapper.updatePassword(admin);
    }

    @Override
    public int updateAdminInfo(Admin admin) {
        return adminMapper.updateAdminInfo(admin);
    }

}
