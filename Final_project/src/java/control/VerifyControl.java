package control;

import DAO.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "VerifyControl", urlPatterns = {"/verify"})
public class VerifyControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();  
        DAO dao = new DAO();
        String username = request.getParameter("username");
        
        if (username == null){
            response.sendRedirect("index");
        }
        
        String verifyCode = dao.getVerifyCode(username);
        
        String code = request.getParameter("code");
        if (!code.equals(verifyCode)){
            request.setAttribute("message", "Verification code is incorrect");
            request.setAttribute("confirm", 1);
            request.setAttribute("userinfo", username);
            request.getRequestDispatcher("mailconfirm.jsp").forward(request, response);
        } else {
            dao.deleteVerifyCode(username);
            request.setAttribute("userinfo", username);
            request.getRequestDispatcher("changepassword.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(VerifyControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(VerifyControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
