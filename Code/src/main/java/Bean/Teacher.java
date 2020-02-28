package Bean;

public class Teacher {
    private String no;
    private String name;
    private String gender;
    private String password;
    private String email;
    private String phone;
    private String address;

    private Integer id;
    private String clazzname;

    //根据班级查找姓名
    public Teacher(String clazzname,String name,String no){
        this.clazzname = clazzname;
        this.name = name;
        this.no = no;
    }


    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getClazzname() {
        return clazzname;
    }

    public void setClazzname(String clazzname) {
        this.clazzname = clazzname;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "no='" + no + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", id=" + id +
                ", clazzname='" + clazzname + '\'' +
                '}';
    }
}
