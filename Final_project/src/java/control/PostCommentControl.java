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

@WebServlet(name = "PostCommentControl", urlPatterns = {"/postcomment"})
public class PostCommentControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String rate = request.getParameter("rating");
        String comment = request.getParameter("comment");
        String id = request.getParameter("id");
        
        int idProduct = Integer.parseInt(id);
        
        int rateProduct = 0;
        if (rate == null){
            rateProduct = 0;
        }
        else {
            rateProduct = Integer.parseInt(rate);
        }

        DAO dao = new DAO();
        dao.addComment(comment, idProduct, rateProduct);
        response.sendRedirect("productdetail?id="+id);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(PostCommentControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(PostCommentControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
