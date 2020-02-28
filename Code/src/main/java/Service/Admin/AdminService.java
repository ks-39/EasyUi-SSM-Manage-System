package Service.Admin;

import Bean.Admin;
import Bean.LoginForm;

public interface AdminService {

    //1. login
    Admin login(LoginForm loginForm);

    //2. updatePassword
    int updatePassword(Admin admin);

    //3. updateAdminInfo
    int updateAdminInfo(Admin admin);

}
