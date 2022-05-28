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

@WebServlet(name = "ApprovedProductControl", urlPatterns = {"/approvedproduct"})
public class ApprovedProductControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        DAO dao = new DAO();
        
        String idP = request.getParameter("idP");
        String username = request.getParameter("username");
        int id = Integer.parseInt(idP);
        
        dao.approvedApp(id, username);
        
        ArrayList<Product> productList = new ArrayList<Product>();        
        productList = dao.getAllProduct(0);
        
        reDisplay(out, productList);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ApprovedProductControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ApprovedProductControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void reDisplay(PrintWriter out, ArrayList<Product> productList) {
        for (Product i:productList){
            out.print("<tr>\n" +
                    "<th scope=\"row\">"+i.getId()+"</th>\n" +
                    "<th>"+i.getName()+"</th>\n" +
                    "<td>\n" +
                    "<a href=\"productdetail?id="+i.getId()+"\" style=\"text-decoration: underline;\" target=\"blank\">Details</a>\n" +
                    "\n" +
                    "<td>\n" +
                    "<a onclick=\"approvedProductHandling("+i.getId()+", '"+i.getDev()+"', 1)\" data-toggle=\"modal\" style=\"color: rgb(66, 186, 150); text-decoration: underline;\" data-target=\"#modal-accept-app\">\n" +
                    "Accept\n" +
                    "</a>\n" +
                    "</td>\n" +
                    "<td> <a onclick=\"approvedProductHandling("+i.getId()+", '"+i.getDev()+"', 0)\" data-toggle=\"modal\" style=\"color: red; text-decoration: underline;\" data-target=\"#modal-accept-app\">\n" +
                    "Decline\n" +
                    "</a></td>\n" +
                    "</tr>");
        }
    }
}
