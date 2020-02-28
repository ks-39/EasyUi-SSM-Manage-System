package Service.Student;

import Bean.LoginForm;
import Bean.Student;
import Dao.Student.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {

    //注入Mapper接口对象
    @Autowired
    private StudentMapper studentMapper;

    @Override
    public Student findByNo(Student student) {
        return studentMapper.findByNo(student);
    }

    @Override
    public Student login(LoginForm loginForm) {
        return studentMapper.login(loginForm);
    }

    @Override
    public int updatePassword(Student student) {
        return studentMapper.updatePassword(student);
    }

    @Override
    public List<Student> getList(Student student) {
        return studentMapper.getList(student);
    }

    @Override
    public int add(Student student) {
        return studentMapper.add(student);
    }

    @Override
    public int deleteById(Integer[] ids) {
        return studentMapper.deleteById(ids);
    }

    @Override
    public int editById(Student student) {
        return studentMapper.editById(student);
    }
}
