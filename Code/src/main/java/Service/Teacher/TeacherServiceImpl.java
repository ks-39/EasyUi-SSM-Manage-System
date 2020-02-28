package Service.Teacher;

import Bean.LoginForm;
import Bean.Student;
import Bean.Teacher;
import Dao.Teacher.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService{

    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public Teacher login(LoginForm loginForm) {
        return teacherMapper.login(loginForm);
    }

    @Override
    public int updatePassword(Teacher teacher) {
        return teacherMapper.updatePassword(teacher);
    }

    @Override
    public List<Teacher> getList(Teacher teacher) {
        return teacherMapper.getList(teacher);
    }

    @Override
    public Teacher findByNo(Teacher teacher) {
        return teacherMapper.findByNo(teacher);
    }

    @Override
    public int add(Teacher teacher) {
        return teacherMapper.add(teacher);
    }

    @Override
    public int deleteById(Integer[] ids) {
        return teacherMapper.deleteById(ids);
    }

    @Override
    public int editById(Teacher teacher) {
        return teacherMapper.editById(teacher);
    }
}
