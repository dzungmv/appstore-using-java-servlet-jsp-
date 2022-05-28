package control;

import DAO.DAO;
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

@WebServlet(name = "ProductCategoryControl", urlPatterns = {"/category"})
public class ProductCategoryControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        DAO dao = new DAO();
        
        String category = request.getParameter("category");
        if (category == null)
            response.sendRedirect("index");
        int categoryVal = Integer.parseInt(category);
        if (categoryVal > 1 && categoryVal < 0)
            response.sendRedirect("index");
        
        String page = "";
        if (categoryVal == 0){
            page = "gamepage.jsp";
        }
        else if (categoryVal == 1){
            page = "apppage.jsp";
        }
        
        ArrayList<Product> productByCategory = dao.getAllByCategory(categoryVal);
        ArrayList<Product> productNewReleasae = dao.getNewReleaseByCategory(categoryVal);
        ArrayList<Product> productTopDownload = dao.getTopDownloadByCategory(categoryVal);
        
        request.setAttribute("product", productByCategory);
        request.setAttribute("newrelease", productNewReleasae);
        request.setAttribute("topdownload", productTopDownload);
        request.getRequestDispatcher(page).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProductCategoryControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ProductCategoryControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
