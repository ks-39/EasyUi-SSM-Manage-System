package Dao.Admin;

import Bean.Admin;
import Bean.LoginForm;

public interface AdminMapper {

    //1. login
    Admin login(LoginForm loginForm);

    //2. updatePassword
    int updatePassword(Admin admin);

    //3. updateInfo
    int updateAdminInfo(Admin admin);
}
