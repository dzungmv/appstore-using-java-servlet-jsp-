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

@WebServlet(name = "ChangePassword", urlPatterns = {"/changepassword"})
public class ChangePasswordControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        
        Account account = (Account) request.getSession().getAttribute("account");
        PrintWriter out = response.getWriter();
        
        String username = "", password = "";
        
        if (account == null){
            username = request.getParameter("username");
            password = request.getParameter("password");
            if (username == ""){
                response.sendRedirect("index");
            }
        }
        else {
            username = account.getUsername();
            password = request.getParameter("password");
        }
        
        if (password != null)
        {
            DAO dao = new DAO();
            dao.changePassword(username, password);
        }
        
        if (account == null){
             response.sendRedirect("login.jsp");
        }
        else {
             response.sendRedirect("index");
        }
       
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ChangePasswordControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ChangePasswordControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}
