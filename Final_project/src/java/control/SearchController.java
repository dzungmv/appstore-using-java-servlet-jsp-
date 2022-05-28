package control;

import DAO.DAO;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String indexPage = request.getParameter("page");
        if (indexPage == null){
            indexPage = "1";
        }
        
        int index = Integer.parseInt(indexPage);
        
        String search = request.getParameter("txtSearch");
        
        DAO dao = new DAO();
        List<Product> productListSearch = dao.searchByName(search, index);
        int totalProduct = dao.getTotalProductSearch(search);
        int page = (totalProduct % 8 != 0) ? (totalProduct/8) + 1 : (totalProduct/8);
        
        request.setAttribute("txtSearch", search);
        request.setAttribute("listP", productListSearch);
        request.setAttribute("numP", page);
        request.setAttribute("tag", index);
        request.getRequestDispatcher("search-result.jsp").forward(request, response);
        
//        PrintWriter out = response.getWriter();
              
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
