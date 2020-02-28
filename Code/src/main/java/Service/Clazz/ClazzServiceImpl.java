package Service.Clazz;

import Bean.Clazz;
import Dao.Clazz.ClazzMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClazzServiceImpl implements ClazzService {

    @Autowired
    private ClazzMapper clazzMapper;

    @Override
    public List<Clazz> getClazzName() {
        return clazzMapper.getClazzName();
    }

    @Override
    public List<Clazz> getList(Clazz clazz) {
        return clazzMapper.getList(clazz);
    }

    @Override
    public Clazz findByNo(Clazz clazz) {
        return clazzMapper.findByNo(clazz);
    }

    @Override
    public int add(Clazz clazz) {
        return clazzMapper.add(clazz);
    }

    @Override
    public int deleteById(Integer[] ids) {
        return clazzMapper.deleteById(ids);
    }

    @Override
    public int editById(Clazz clazz) {
        return clazzMapper.editById(clazz);
    }
}
