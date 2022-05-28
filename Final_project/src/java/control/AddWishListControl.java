package control;

import DAO.DAO;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddWishListControl", urlPatterns = {"/addwishlist"})
public class AddWishListControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        Account account = (Account) request.getSession().getAttribute("account");
        if (account == null){
            response.sendRedirect("login.jsp");
        }
        
        PrintWriter out = response.getWriter();
        
        DAO dao = new DAO();
        
        String idProduct = request.getParameter("idProduct");
        
        int idP = Integer.parseInt(idProduct);
        
        dao.addCart_WishList(account.getId(), idP, "wishlist");
        out.print("<a id=\"wishlist\" onclick=\"WishlistHandling("+idP+", 1,"+account.getId()+")\" style=\"color:rgb(103, 157, 55);\">\n" +
                    "<i class=\"fa fa-bookmark\"></i> &nbsp Remove to wishlist</a>");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AddWishListControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AddWishListControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
