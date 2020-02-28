package Dao.Teacher;

import Bean.LoginForm;
import Bean.Student;
import Bean.Teacher;

import java.util.List;

public interface TeacherMapper {

    //1. login
    Teacher login(LoginForm loginForm);

    //2. updatePassword
    int updatePassword(Teacher teacher);

    //3. getList
    List<Teacher> getList(Teacher teacher);

    //4. findByNo
    Teacher findByNo(Teacher teacher);

    //5. add
    int add(Teacher teacher);

    //6. deleteById
    int deleteById(Integer ids[]);

    //7. editById
    int editById(Teacher teacher);
}
