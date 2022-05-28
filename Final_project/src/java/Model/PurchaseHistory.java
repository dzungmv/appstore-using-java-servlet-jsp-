package Model;

import java.sql.Date;

public class PurchaseHistory {
    private int idProduct;
    private int idUser;
    private int Price;
    private Date purchaseDate;

    public PurchaseHistory(int idProduct, int idUser, int Price, Date purchaseDate) {
        this.idProduct = idProduct;
        this.idUser = idUser;
        this.Price = Price;
        this.purchaseDate = purchaseDate;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public int getIdUser() {
        return idUser;
    }

    public int getPrice() {
        return Price;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    @Override
    public String toString() {
        return "PurchaseHistory{" + "idProduct=" + idProduct + ", idUser=" + idUser + ", Price=" + Price + ", purchaseDate=" + purchaseDate + '}';
    }
}
