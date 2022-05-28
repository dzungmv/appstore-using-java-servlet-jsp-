package control;

import DAO.DAO;
import Model.Account;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RemoveWishList", urlPatterns = {"/removewishlist"})
public class RemoveWishList extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Account account = (Account) request.getSession().getAttribute("account");

        DAO dao = new DAO();

        String idProduct = request.getParameter("idProduct");
        String flag = request.getParameter("flag");

        int idP = Integer.parseInt(idProduct);
        int flagValue = Integer.parseInt(flag);

        dao.deleteCart_WishList(account.getId(), idP, "wishlist");

        if (flagValue == 1){
            showInProductDetail(idP, out, account);
        }
        
        if (flagValue == 2) {
            ArrayList<Product> productWishlist = dao.getProductCart_Wishlist(account.getId(), "wishlist");
            showInUserInfo(productWishlist, out, account);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RemoveWishList.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RemoveWishList.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    public void showInProductDetail(int idP, PrintWriter out, Account account){
        out.print("<a onclick=\"WishlistHandling("+idP+", 0, "+account.getId()+")\" style=\"color:rgb(103, 157, 55);\">\n" +
                    "<i class=\"far fa-bookmark\"></i> &nbsp Add to wishlist</a>");
    }

    private void showInUserInfo(ArrayList<Product> productWishlist, PrintWriter out, Account account) {
        for (Product i:productWishlist){
            out.print("<tr>\n" +
                        "<td width=\"45%\">\n" +
                        "<a href=\"productdetail?id="+i.getId()+"\">\n"+
                        "<div class=\"display-flex align-center\">\n" +
                        "<div class=\"img-product\">\n" +
                        "<img src=\"./img/icon_products/"+i.getId()+".png\"\n" +
                        "alt=\"\" class=\"mCS_img_loaded\">\n" +
                        "</div>\n" +
                        "<div class=\"name-product\">\n" +i.getName()+
                        "\n</div>\n" +
                        "</div>\n" +
                        "</a>\n"+
                        "</td>\n" +
                        "<td width=\"15%\" class=\"price\">\n");
            if (i.getFee() == 0){
                out.print("Free");
            }
            else{
                out.print(i.getFee());
            }

            out.print("</td>\n"+             
                    "<td width=\"15%\">\n");
            if (i.getFee() == 0){
                out.print("<a href=\"download?idP="+i.getId()+"&idU="+account.getId()+"\">\n" +
                        "<button class=\"round-black-btn small-btn\"\n" +
                        "style=\"text-transform: none; background-color: rgb(103, 157, 55) !important;\">\n" +
                        "Download\n" +
                        "</button>\n" +
                        "</a>\n");
            }
            else{
                out.print("<a>\n" +
                        "<button class=\"round-black-btn small-btn\"\n" +
                        "style=\"text-transform: none\">\n" +
                        "Add to cart</button>\n" +
                        "</a>\n");
            }

            out.print("</td>\n" +
                    "<td width=\"10%\" class=\"text-center\" onclick=\"removeWishList("+i.getId()+","+account.getId()+")\">\n" +
                    "<a class=\"trash-icon\"style=\"color: #ff0000;\">\n" +
                    "<i class=\"far fa-trash-alt\"></i></a>\n" +
                    "</td>\n" +
                    "</tr>");
        }
    }

}
