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

@WebServlet(name = "ProductCollectionControl", urlPatterns = {"/productcollection"})
public class ProductCollectionControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        DAO dao = new DAO();
        
        String category = request.getParameter("category");
        String collection = request.getParameter("collection");
        if (category == null || collection == null)
            response.sendRedirect("index");
        int categoryVal = Integer.parseInt(category);
        int collectionVal = Integer.parseInt(collection);
        if (categoryVal > 1 && categoryVal < 0)
            response.sendRedirect("index");
        if (collectionVal > 3 && collectionVal < 1)
            response.sendRedirect("index");
        
        String title = "";
        if (collectionVal == 2)
            title = "New Release";
        else if (collectionVal == 3)
            title = "Top Download";
        else if (categoryVal == 0)
                title = "All Games";
        else if (categoryVal == 1)
                title = "All Apps";
        
        ArrayList<Product> productByCategory = new ArrayList<Product>();
        
        if (collectionVal == 1){
            productByCategory = dao.getAllByCategory(categoryVal);
        }
        else if (collectionVal == 2){
            productByCategory = dao.getNewReleaseByCategory(categoryVal);
        }
        else if (collectionVal == 3){
            productByCategory = dao.getTopDownloadByCategory(categoryVal);
        }
        
        request.setAttribute("product", productByCategory);
        request.setAttribute("title", title);
        request.getRequestDispatcher("product-collection.jsp").forward(request, response);
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
