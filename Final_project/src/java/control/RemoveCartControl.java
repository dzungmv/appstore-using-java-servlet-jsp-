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

@WebServlet(name = "RemoveCartControl", urlPatterns = {"/removecart"})
public class RemoveCartControl extends HttpServlet {

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

        dao.deleteCart_WishList(account.getId(), idP, "cart");

        if (flagValue == 1){
            showInProductDetail(idP, out, account);
        }
        
        if (flagValue == 2) {
            ArrayList<Product> productWishlist = dao.getProductCart_Wishlist(account.getId(), "cart");
            showInUserInfo(productWishlist, out, account);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RemoveCartControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RemoveCartControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void showInProductDetail(int idP, PrintWriter out, Account account) {
        out.print("<a onclick=\"CartHandling("+idP+", 0, "+account.getId()+")\">\n" +
                "<button class=\"btn btn-md my-0 p\" style=\"text-transform: none\"> <i class=\"fas fa-cart-plus\"></i>Add to\n" +
                "cart</button>\n" +
                "</a>");
    }

    private void showInUserInfo(ArrayList<Product> productCart, PrintWriter out, Account account) {
        for (Product i:productCart){
            out.print("<div class=\"card mb-3\">\n"+
                    "<div class=\"card-body\">\n" +
                    "<div class=\"d-flex justify-content-between\">\n" +
                    "<a href=\"productdetail?id="+i.getId()+"\">\n" +
                    "<div class=\"d-flex flex-row align-items-center\">\n" +
                    "<div>\n" +
                    "<img\n" +
                    "src=\"./img/icon_products/"+i.getId()+".png\"\n" +
                    "class=\"img-fluid rounded-3\" alt=\"Shopping item\" style=\"width: 65px;\">\n" +
                    "</div>\n" +
                    "<div class=\"ml-3\">\n" +
                    "<h5>"+i.getName()+"</h5>\n" +
                    "<p class=\"small mb-0\">\n");
            if (i.getCategories() == 0){
                out.print("Game");
            }
            else if (i.getCategories() == 1){
                out.print("Apps");
            }
            out.print("</p>\n" +
                    "</div>\n" +
                    "</div>\n" +
                    "</a>\n" +
                    "<div class=\"d-flex flex-row align-items-center\">\n" +
                    "<!-- <div style=\"width: 50px;\">\n" +
                    "<h5 class=\"fw-normal mb-0\">1</h5>\n" +
                    "</div> -->\n" +
                    "<div style=\"width: 80px;\">\n" +
                    "<h5 class=\"mb-0\">$"+i.getFee()+"</h5>\n" +
                    "</div>\n" +
                    "<div onclick=\"removeCart("+i.getId()+")\" style=\"color: #cecece;\">\n" +
                    "<i class=\"fas fa-trash-alt\"></i>\n" +
                    "</div>\n" +
                    "</div>\n" +
                    "</div>\n" +
                    "</div></div>");
        }
    }

}
