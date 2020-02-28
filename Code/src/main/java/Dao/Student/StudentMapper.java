package Dao.Student;

import Bean.LoginForm;
import Bean.Student;

import java.util.List;

public interface StudentMapper {

    //1. findByNo
    Student findByNo(Student student);

    //2. login
    Student login(LoginForm loginForm);

    //3. updatePassword
    int updatePassword(Student student);

    //4. getList
    List<Student> getList(Student student);

    //5. add
    int add(Student student);

    //6. deleteById
    int deleteById(Integer ids[]);

    //7.editById
    int editById(Student student);
}
