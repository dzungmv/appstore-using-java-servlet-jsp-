package DAO;

import Context.DBContext;
import Model.Account;
import Model.Card;
import Model.Product;
import Model.PurchaseHistory;
import Model.Rate;
import Model.UserInfo;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Random;

public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public DAO() throws Exception {
        conn = new DBContext().getConnection();
    }

    public int getMaxId(String table){
        String query = "select top(1) id from "+ table +" order by id desc";

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }

        return 0;
    }
    
    public Account login(String username, String password) {
        String query = "select * from Account where username = ? and [password] = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public Account checkAccountExist(String username) {
        String query = "select * from Account where username = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void signup(String name, String username, String password, String mail) {
        String query1 = "insert into Account(username, [password], isdev, isadmin, isBlocked) values (?, ?, 0, 0, 0)";
        String query2 = "insert into Userinfo(id, username, fullname, mail, [money]) values (?, ?, ?, ?, 0)";

        try {
            ps = conn.prepareStatement(query1);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();

            int maxId = getMaxId("Account");
            
            ps = conn.prepareStatement(query2);
            ps.setInt(1, maxId);
            ps.setString(2, username);
            ps.setString(3, name);
            ps.setString(4, mail);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public UserInfo getUserInfo(String username) {
        String query = "select * from userinfo where username = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new UserInfo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
            }
        } catch (Exception e) {

        }
        return null;
    }
    
    public UserInfo getUserInfo(int id) {
        String query = "select * from userinfo where id = ?";
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new UserInfo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void addVerifyCode(String username, String code) {
        String query = "insert into VerifyCode(username, code) values (?, ?)";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, code);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public String getVerifyCode(String username) {
        String query = "select * from verifycode where username = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(2);
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void deleteVerifyCode(String username) {
        String query = "DELETE FROM verifycode WHERE username = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public void changePassword(String username, String password) {
        String query = "update account set [password] = ? where username = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public ArrayList<Product> getProduct(int index, int isApproved) {
        String query = "select * from product where isApproved = ? order by id offset ? rows fetch next 8 rows only";
        ArrayList<Product> productList = new ArrayList<Product>();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, isApproved);
            ps.setInt(2, (index - 1) * 8);
            rs = ps.executeQuery();
            while (rs.next()) {
                productList.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getFloat(8), rs.getInt(9), rs.getInt(10), rs.getDate(11)));
            }
            return productList;
        } catch (Exception e) {
        }
        return null;
    }

    public int getTotalProduct() {
        String query = "select count(*) from product where isApproved = 1";

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public Product getProductDetail(int id) {
        String query = "select * from product where id=?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getFloat(8), rs.getInt(9), rs.getInt(10), rs.getDate(11));
            }
        } catch (Exception e) {
        }

        return null;
    }

    public ArrayList<Rate> getRate(int id) {
        String query = "select * from rate where id = ?";
        ArrayList<Rate> rateList = new ArrayList<Rate>();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                rateList.add(new Rate(rs.getInt(1), rs.getInt(2), rs.getString(3)));
            }
            return rateList;
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Product> searchByName(String search, int index) {
        String query = "select * from product where [name] like ? and isApproved = 1 order by id offset ? rows fetch next 8 rows only";

        ArrayList<Product> productList = new ArrayList<Product>();

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            ps.setInt(2, (index - 1) * 8);
            rs = ps.executeQuery();
            while (rs.next()) {
                productList.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getFloat(8), rs.getInt(9), rs.getInt(10), rs.getDate(11)));
            }
            return productList;
        } catch (Exception e) {
        }
        return null;
    }
    
    public int getTotalProductSearch(String search) {
        String query = "select count(*) from product where [name] like ? and isApproved = 1";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public void addComment(String comment, int id, int rating){
        String query = "insert into rate(id, rating, comment) values (?, ?, ?)";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, rating);
            ps.setString(3, comment);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public int isInCart_Wishlist(int id_user, int id_product, String table){
        String query = "select count(*) from " + table + " where id_user = ? and id_product = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id_user);
            ps.setInt(2, id_product);
            
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    public void addCart_WishList(int id_user, int id_product, String table){
        String query = "insert into "+table+"(id_user, id_product) values (?, ?)";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id_user);
            ps.setInt(2, id_product);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleteCart_WishList(int id_user, int id_product, String table){
        String query = "DELETE FROM "+ table +" WHERE id_user = ? and id_product = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id_user);
            ps.setInt(2, id_product);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public ArrayList<Product> getProductCart_Wishlist(int id, String table){
        String query = "select * from product where id in (select id_product from "+ table +" where id_user=?)";
        
        ArrayList<Product> productList = new ArrayList<Product>();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                productList.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getFloat(8), rs.getInt(9), rs.getInt(10), rs.getDate(11)));
            }
            return productList;
        } catch (Exception e) {
        }
        return null;
    }
      
    public void addProduct(String name, int categories, String des, String dev, int fee, float size){
        String query = "insert into product([name], categories, [description], dev, fee, downloadcount, size, isApproved, release) values (?,?,?,?,?,?,?,?,?)";

        try {
            Date date = new Date();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, categories);
            ps.setString(3, des);
            ps.setString(4, dev);
            ps.setInt(5, fee);
            ps.setInt(6, 0);
            ps.setFloat(7, size);
            ps.setInt(8, 0);
            ps.setDate(9, new java.sql.Date(date.getTime()));
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public ArrayList<Product> getProductByDev(String username) {
        String query = "select * from product where dev = ? order by id";
        ArrayList<Product> productList = new ArrayList<Product>();

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                productList.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getFloat(8), rs.getInt(9), rs.getInt(10), rs.getDate(11)));
            }
            return productList;
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteProduct(String username, int idP) {
        String query1 = "DELETE FROM product WHERE dev = ? and id = ?";
        String query2 = "DELETE FROM rate WHERE id = ?";
        
        try {
            ps = conn.prepareStatement(query2);
            ps.setInt(1, idP);
            ps.executeUpdate();
            
            ps = conn.prepareStatement(query1);
            ps.setString(1, username);
            ps.setInt(2, idP);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public ArrayList<Product> getProductSimilar(int type, int idP) {
        String query = "select * from product where categories = ? order by downloadcount desc";
        ArrayList<Product> productList = new ArrayList<Product>();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, type);
            rs = ps.executeQuery();
            int count = 0;
            while (rs.next() && count < 4) {
                if (rs.getInt(1) == idP)
                    continue;
                productList.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getFloat(8), rs.getInt(9), rs.getInt(10), rs.getDate(11)));
                count++;
            }
            return productList;
        } catch (Exception e) {
        }
        return null;
    }
    
    public ArrayList<Account> getAllUser(){
        String query = "select * from account where isadmin != 1";
        ArrayList<Account> userList = new ArrayList<Account>();

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                userList.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6)));
            }
            return userList;
        } catch (Exception e) {
        }
        return null;
    }
    
    public void deleteUser(String username) {
        String query = "DELETE FROM account WHERE username = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public void deleteUserInfo(String username) {
        String query = "DELETE FROM userinfo WHERE username = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public void blockUser(int isBlock, String username){
        String query = "update account set isblocked = ? where username = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, (isBlock == 0 ? 1 : 0));
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public void upgradeDev(String username){
        String query = "update account set isdev = 1 where username = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public ArrayList<Product> getAllProduct(int isApproved){
        String query = "select * from product where isApproved = ?";
        ArrayList<Product> productList = new ArrayList<Product>();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, isApproved);
            rs = ps.executeQuery();
            while (rs.next()) {
                productList.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getFloat(8), rs.getInt(9), rs.getInt(10), rs.getDate(11)));
            }
            return productList;
        } catch (Exception e) {
        }
        return null;
    }
    
    public void approvedApp(int id, String dev){
        String query = "update product set isApproved = 1 where id = ? and dev = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2, dev);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public void editApp(String name, int categories, String des, String dev, int fee, float size, int id){
        String query = "update product set [name] = ?, categories = ?, [description] = ?, fee = ?, size = ? where id = ? and dev = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, categories);
            ps.setString(3, des);
            ps.setInt(4, fee);
            ps.setFloat(5, size);
            ps.setInt(6, id);
            ps.setString(7, dev);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public ArrayList<Product> getAllByCategory(int category){
        String query = "select * from product where categories = ?";
        ArrayList<Product> productList = new ArrayList<Product>();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, category);
            rs = ps.executeQuery();
            while (rs.next()) {
                productList.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getFloat(8), rs.getInt(9), rs.getInt(10), rs.getDate(11)));
            }
            return productList;
        } catch (Exception e) {
        }
        return null;
    }
    
    public ArrayList<Product> getNewReleaseByCategory(int category){
        String query = "select * from product where DATEDIFF(day, release, getdate()) <= 14 and categories = ?";
        ArrayList<Product> productList = new ArrayList<Product>();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, category);
            rs = ps.executeQuery();
            while (rs.next()) {
                productList.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getFloat(8), rs.getInt(9), rs.getInt(10), rs.getDate(11)));
            }
            return productList;
        } catch (Exception e) {
        }
        return null;
    }
    
    public ArrayList<Product> getTopDownloadByCategory(int category){
        String query = "select top(8) * from product where categories = ? order by downloadcount desc";
        ArrayList<Product> productList = new ArrayList<Product>();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, category);
            rs = ps.executeQuery();
            while (rs.next()) {
                productList.add(new Product(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getFloat(8), rs.getInt(9), rs.getInt(10), rs.getDate(11)));
            }
            return productList;
        } catch (Exception e) {
        }
        return null;
    } 
    
    public void addCard(int denominations, int quantity){
        String query = "insert into [card](denominations, recharge_code) values (?, ?)";
        Random rand = new Random();
        int max = 99999999, min = 10000000;
        
        
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, denominations);
            int recharge_code;
            for (int i = 0;i<quantity;i++){
                recharge_code = rand.nextInt(max - min) + min;
                ps.setString(2, Integer.toString(recharge_code));
                ps.executeUpdate();
            }
        } catch (Exception e) {
        }
    }
    
    public int checkCard(String rechargeCode){
        String query = "select * from card where recharge_code = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, rechargeCode);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public void deleteCard(String rechargeCode) {
        String query = "DELETE FROM card WHERE recharge_code = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, rechargeCode);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public void topUp(int money, String username){
        String query = "update Userinfo set [money] = [money] + ? where username = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, money);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public ArrayList<Card> getAllCard(){
        String query = "select * from card";
        ArrayList<Card> cardList = new ArrayList<Card>();

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                cardList.add(new Card(rs.getString(2), rs.getInt(1)));
            }
            return cardList;
        } catch (Exception e) {
        }
        return null;
    }
    
    public void addPurchase(int idU, ArrayList<Product> productListCart){
        String query = "insert into purchase_history(id_product, id_user, purchase_date, price) values (?, ?, ?, ?)";
        Date date = new Date();
        
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(2, idU);
            ps.setDate(3, new java.sql.Date(date.getTime()));
            for (Product i:productListCart){
                ps.setInt(1, i.getId());
                ps.setInt(4, i.getFee());
                ps.executeUpdate();
            }
        } catch (Exception e) {
        }
    }
    
    public void deductionMoney(String username, int price){
        String query = "update Userinfo set [money] = [money] - ? where username = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, price);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public int isPurchase(int idU, int idP){
        String query = "select count(*) from purchase_history where id_user = ? and id_product = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, idU);
            ps.setInt(2, idP);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }
    
    public void removeFromCart(int idU, ArrayList<Product> cart){
        String query = "DELETE FROM cart WHERE id_user = ? and id_product = ?";
        
        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, idU);
            for (Product i:cart){
                ps.setInt(2, i.getId());
                ps.executeUpdate();
            }
        } catch (Exception e) {

        }
    }
    
    public ArrayList<PurchaseHistory> getAllPurchaseHistory(int idU){
        String query = "select * from purchase_history where id_user = ?";
        ArrayList<PurchaseHistory> purchaseList = new ArrayList<PurchaseHistory>();

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, idU);
            rs = ps.executeQuery();
            while (rs.next()) {
                purchaseList.add(new PurchaseHistory(rs.getInt(1), rs.getInt(2), rs.getInt(4), rs.getDate(3)));
            }
            return purchaseList;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return null;
    }
    
    public ArrayList<PurchaseHistory> getAllPurchaseHistory(){
        String query = "select * from purchase_history";
        ArrayList<PurchaseHistory> purchaseList = new ArrayList<PurchaseHistory>();

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                purchaseList.add(new PurchaseHistory(rs.getInt(1), rs.getInt(2), rs.getInt(4), rs.getDate(3)));
            }
            return purchaseList;
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return null;
    }
    
    public void updateUserInfo(int id, String fullname, String dob, String address, String phone, String mail){
        String query = "update Userinfo set [fullname] = ?, [dob] = ?, [address] = ?, [phone] = ?, [mail] = ? where id = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setDate(2, java.sql.Date.valueOf(dob));
            ps.setString(3, address);
            ps.setString(4, phone);
            ps.setString(5, mail);
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
    public void increaseDownloadCount(int idP){
        String query = "update product set [downloadcount] = [downloadcount] + 1 where id = ?";

        try {
            ps = conn.prepareStatement(query);
            ps.setInt(1, idP);

            ps.executeUpdate();
        } catch (Exception e) {

        }
    }
    
//    public static void main(String args[]) throws Exception {
//        DAO dao = new DAO();
//        
//    }
}

