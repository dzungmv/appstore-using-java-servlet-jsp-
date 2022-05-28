package Model;

public class Rate {
    private int id;
    private int rating;
    private String comment;

    public Rate(int id, int rating, String comment) {
        this.id = id;
        this.rating = rating;
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public int getRating() {
        return rating;
    }

    public String getComment() {
        return comment;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Rate{" + "id=" + id + ", rating=" + rating + ", comment=" + comment + '}';
    }
    
}
