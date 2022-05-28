package Model;

import java.sql.Date;

public class Product {
    private int id;
    private String name;
    private int categories;
    private String description;
    private String dev;
    private int fee;
    private int downloadCount;
    private float size;
    private int rate;
    private int isApproved;
    private Date release;
    
    public Product(int id, String name, int categories, String description, String dev, int fee, int downloadCount, float size, int rate, int isApproved, Date release) {
        this.id = id;
        this.name = name;
        this.categories = categories;
        this.description = description;
        this.dev = dev;
        this.fee = fee;
        this.downloadCount = downloadCount;
        this.size = size;
        this.rate = rate;
        this.isApproved = isApproved;
        this.release = release;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getCategories() {
        return categories;
    }

    public String getDescription() {
        return description;
    }

    public String getDev() {
        return dev;
    }

    public int getFee() {
        return fee;
    }

    public int getDownloadCount() {
        return downloadCount;
    }

    public float getSize() {
        return size;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCategories(int categories) {
        this.categories = categories;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDev(String dev) {
        this.dev = dev;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public void setDownloadCount(int downloadCount) {
        this.downloadCount = downloadCount;
    }

    public void setSize(float size) {
        this.size = size;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getRate() {
        return rate;
    }

    public int getIsApproved() {
        return isApproved;
    }

    public void setIsApproved(int isApproved) {
        this.isApproved = isApproved;
    }

    public Date getRelease() {
        return release;
    }

    public void setRelease(Date release) {
        this.release = release;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", categories=" + categories + ", description=" + description + ", dev=" + dev + ", fee=" + fee + ", downloadCount=" + downloadCount + ", size=" + size + ", rate=" + rate + ", isApproved=" + isApproved + ", release=" + release + '}';
    }
}
