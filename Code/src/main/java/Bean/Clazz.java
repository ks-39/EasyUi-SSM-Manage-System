package Bean;

public class Clazz {

    //id、no、name、clazz_teacher、clazz_teacher_phone、clazz_teacher_email

    private Integer id;
    private String no;
    private String name;
    private String clazz_teacher;
    private String clazz_teacher_phone;
    private String clazz_teacher_email;

    //根据班名、班号查询
    public Clazz(String name,String no){
        this.name = name;
        this.no = no;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClazz_teacher() {
        return clazz_teacher;
    }

    public void setClazz_teacher(String clazz_teacher) {
        this.clazz_teacher = clazz_teacher;
    }

    public String getClazz_teacher_phone() {
        return clazz_teacher_phone;
    }

    public void setClazz_teacher_phone(String clazz_teacher_phone) {
        this.clazz_teacher_phone = clazz_teacher_phone;
    }

    public String getClazz_teacher_email() {
        return clazz_teacher_email;
    }

    public void setClazz_teacher_email(String clazz_teacher_email) {
        this.clazz_teacher_email = clazz_teacher_email;
    }

    @Override
    public String toString() {
        return "Clazz{" +
                "id=" + id +
                ", no='" + no + '\'' +
                ", name='" + name + '\'' +
                ", clazz_teacher='" + clazz_teacher + '\'' +
                ", clazz_teacher_phone='" + clazz_teacher_phone + '\'' +
                ", clazz_teacher_email='" + clazz_teacher_email + '\'' +
                '}';
    }
}
