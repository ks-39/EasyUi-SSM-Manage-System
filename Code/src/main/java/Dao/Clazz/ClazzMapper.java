package Dao.Clazz;

import Bean.Clazz;

import java.util.List;

public interface ClazzMapper {

    //1. getClazzname
    List<Clazz> getClazzName();

    //2. getList
    List<Clazz> getList(Clazz clazz);

    //3. findByNo
    Clazz findByNo(Clazz clazz);

    //4. add
    int add(Clazz clazz);

    //5. deleteById
    int deleteById(Integer[] ids);

    //6. editById
    int editById(Clazz clazz);
}
