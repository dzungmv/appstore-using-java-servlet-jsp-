package control;

import DAO.DAO;
import Model.UserInfo;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EditUserControl", urlPatterns = {"/edituser"})
public class EditUserControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DAO dao = new DAO();
            PrintWriter out = response.getWriter();
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            
            String id = request.getParameter("id");
            int idVal = Integer.parseInt(id);
            UserInfo userInfo = dao.getUserInfo(idVal);
            request.setAttribute("userinfo", userInfo);
            request.getRequestDispatcher("edit-user.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EditUserControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DAO dao = new DAO();
            PrintWriter out = response.getWriter();
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            
            String id = request.getParameter("id");
            int idVal = Integer.parseInt(id);
            String fullname = request.getParameter("fullname");
            String dob = request.getParameter("dob");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String mail = request.getParameter("mail");
            
            dao.updateUserInfo(idVal, fullname, dob, address, phone, mail);
            response.sendRedirect("userinfo");
        } catch (Exception ex) {
            Logger.getLogger(EditUserControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
