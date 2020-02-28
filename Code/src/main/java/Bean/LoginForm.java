package Bean;

public class LoginForm {
    private String Userno;
    private String Password;
    private Integer Usertype;

    public String getUserno() {
        return Userno;
    }

    public void setUserno(String userno) {
        Userno = userno;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public Integer getUsertype() {
        return Usertype;
    }

    public void setUsertype(Integer usertype) {
        Usertype = usertype;
    }

    @Override
    public String toString() {
        return "LoginForm{" +
                "Userno='" + Userno + '\'' +
                ", Password='" + Password + '\'' +
                ", Usertype=" + Usertype +
                '}';
    }
}
