package Model;

import java.sql.Date;

public class UserInfo {
    private int id;
    private String username;
    private String fullname;
    private Date dob;
    private String address;
    private String phone;
    private String mail;
    private int money;

    public UserInfo() {
        this.id = 0;
        this.username = "";
        this.fullname = "";
        this.address = address;
        this.phone = phone;
        this.mail = mail;
    }

    public UserInfo(int id, String username, String fullname, Date dob, String address, String phone, String mail, int money) {
        this.id = id;
        this.username = username;
        this.fullname = fullname;
        this.dob = dob;
        this.address = address;
        this.phone = phone;
        this.mail = mail;
        this.money = money;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getFullname() {
        return fullname;
    }

    public Date getDob() {
        return dob;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public String getMail() {
        return mail;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "UserInfo{" + "id=" + id + ", username=" + username + ", fullname=" + fullname + ", dob=" + dob + ", address=" + address + ", phone=" + phone + ", mail=" + mail + ", money=" + money + '}';
    }

}
