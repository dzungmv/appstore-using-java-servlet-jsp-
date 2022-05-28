package Model;

public class Account {
    private int id;
    private String username;
    private String password;
    private int isDev;
    private int isAdmin;
    private int isBlock;

    public Account(){}
    
    public Account(int id, String username, String password, int isDev, int isAdmin, int isBlock) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.isDev = isDev;
        this.isAdmin = isAdmin;
        this.isBlock = isBlock;
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public int getIsDev() {
        return isDev;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setIsDev(int isDev) {
        this.isDev = isDev;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public int getIsBlock() {
        return isBlock;
    }

    public void setIsBlock(int isBlock) {
        this.isBlock = isBlock;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", username=" + username + ", password=" + password + ", isDev=" + isDev + ", isAdmin=" + isAdmin + ", isBlock=" + isBlock + '}';
    }

    
}
