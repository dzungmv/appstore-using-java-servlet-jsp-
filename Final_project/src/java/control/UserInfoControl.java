package control;

import DAO.DAO;
import Model.Account;
import Model.Product;
import Model.PurchaseHistory;
import Model.UserInfo;
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
import javax.servlet.http.HttpSession;

@WebServlet(name = "UserInfoControl", urlPatterns = {"/userinfo"})
public class UserInfoControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        Account account = (Account) request.getSession().getAttribute("account");
        if (account == null){
            response.sendRedirect("index");
        }
        PrintWriter out = response.getWriter();  
        DAO dao = new DAO();
        
        UserInfo info = dao.getUserInfo(account.getUsername());
        ArrayList<Product> productWishlist = dao.getProductCart_Wishlist(account.getId(), "wishlist");
        ArrayList<PurchaseHistory> purchaseList = dao.getAllPurchaseHistory(account.getId());
        ArrayList<Product> productPurchase = new ArrayList<Product>();
        ArrayList<Integer> isPurchase = new ArrayList<Integer>();
        
        for (PurchaseHistory i: purchaseList){
            productPurchase.add(dao.getProductDetail(i.getIdProduct()));
        }
        
        for (Product i:productWishlist){
            isPurchase.add(dao.isPurchase(account.getId(), i.getId()));
        }
        
        request.setAttribute("info", info);
        request.setAttribute("productList", productWishlist);
        request.setAttribute("purchaselist", purchaseList);
        request.setAttribute("productpurchase", productPurchase);
        request.setAttribute("isPurchase", isPurchase);
        request.getRequestDispatcher("user_info.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserInfoControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserInfoControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}