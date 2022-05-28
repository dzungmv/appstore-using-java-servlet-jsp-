package control;

import DAO.DAO;
import Model.Account;
import Model.Product;
import Model.PurchaseHistory;
import Model.Rate;
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

@WebServlet(name = "ProductDetailControl", urlPatterns = {"/productdetail"})
public class ProductDetailControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        Account account = (Account) request.getSession().getAttribute("account");
        
        DAO dao = new DAO();
        String id1 = request.getParameter("id");
        int id = Integer.parseInt(id1);
        
        Product product = dao.getProductDetail(id);
         if (product == null){
            response.sendRedirect("index");
        }
        ArrayList<Rate> rateList = dao.getRate(id);
        ArrayList<Product> similars = dao.getProductSimilar(product.getCategories(), id);
        
        int isInWishlist = 0;
        int isInCart = 0;
        int isPurchase = 0;
        if (account != null){
            isInWishlist = dao.isInCart_Wishlist(account.getId(), id, "wishlist");
            isInCart = dao.isInCart_Wishlist(account.getId(), id, "cart");
            isPurchase = dao.isPurchase(account.getId(), id);
        }
       
        PrintWriter out = response.getWriter();
        request.setAttribute("productDetail", product);
        request.setAttribute("rateList", rateList);
        request.setAttribute("isWishlist", isInWishlist);
        request.setAttribute("isCart", isInCart);
        request.setAttribute("similars", similars);
        request.setAttribute("ispurchase", isPurchase);
        request.getRequestDispatcher("product_detail.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProductDetailControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProductDetailControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
