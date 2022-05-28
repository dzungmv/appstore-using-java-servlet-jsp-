package control;

import DAO.DAO;
import Model.Account;
import Model.Card;
import Model.Product;
import Model.PurchaseHistory;
import Model.UserInfo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AdminController", urlPatterns = {"/admin"})
public class AdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        DAO dao = new DAO();
        
        ArrayList<Account> accounts = dao.getAllUser();
        ArrayList<UserInfo> userInfos = new ArrayList<UserInfo>();
        ArrayList<Product> products = dao.getAllProduct(1);
        ArrayList<Product> productNotApproved = dao.getAllProduct(0);
        ArrayList<Card> cardList = dao.getAllCard();
        ArrayList<PurchaseHistory> purchaseHistory = dao.getAllPurchaseHistory();
        ArrayList<Product> purchaseProduct = new ArrayList<Product>();
        ArrayList<UserInfo> purchaseUserinfo = new ArrayList<UserInfo>();
        
        for (Account i:accounts){
            userInfos.add(dao.getUserInfo(i.getUsername()));
        }
        
        for (PurchaseHistory i: purchaseHistory){
            purchaseProduct.add(dao.getProductDetail(i.getIdProduct()));
            purchaseUserinfo.add(dao.getUserInfo(i.getIdUser()));
        }

        request.setAttribute("usersL", accounts);
        request.setAttribute("userinfo", userInfos);
        request.setAttribute("totalUser", accounts.size());
        request.setAttribute("productL", products);
        request.setAttribute("prodApproved", productNotApproved);
        request.setAttribute("purchaseHistory", purchaseHistory);
        request.setAttribute("purchaseProduct", purchaseProduct);
        request.setAttribute("purchaseUserinfo", purchaseUserinfo);
        request.setAttribute("card", cardList);
        
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
