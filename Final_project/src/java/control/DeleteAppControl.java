package control;

import DAO.DAO;
import Model.Account;
import Model.Product;
import java.io.File;
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

@WebServlet(name = "DeleteAppControl", urlPatterns = {"/deleteapp"})
public class DeleteAppControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        DAO dao = new DAO();
        
        String idP = request.getParameter("idP");
        String username = request.getParameter("username");
        String flag = request.getParameter("flag");
        int flagVal = Integer.parseInt(flag);
        
        dao.deleteProduct(username, Integer.parseInt(idP));
        
        String path_install = request.getServletContext().getRealPath("/install-file");
        String path_screenshot = request.getServletContext().getRealPath("/img/Screenshot");
        String path_icon = request.getServletContext().getRealPath("/img/icon_products");
        
        String fileName_install = idP + ".zip";
        String fileName_screenshot1 = idP + "_1.png";
        String fileName_screenshot2 = idP + "_2.png";
        String fileName_screenshot3 = idP + "_3.png";
        String fileName_icon = idP + ".png";
        
        File file_install = new File(path_install + "/" + fileName_install);
        File file_screenshot1 = new File(path_screenshot + "/" + fileName_screenshot1);
        File file_screenshot2 = new File(path_screenshot + "/" + fileName_screenshot2);
        File file_screenshot3 = new File(path_screenshot + "/" + fileName_screenshot3);
        File file_icon = new File(path_icon + "/" + fileName_icon);
        
        file_install.delete();
        file_screenshot1.delete();
        file_screenshot2.delete();
        file_screenshot3.delete();
        file_icon.delete();

        ArrayList<Product> productList = new ArrayList<Product>();
        if (flagVal == 0) {
            productList = dao.getAllProduct(1);
        }
        else if (flagVal == 1){
            productList = dao.getProductByDev(username);
        }
        else if (flagVal == 2){
            productList = dao.getAllProduct(0);
        }
        
        if (flagVal == 2)
            reDisplay(out, productList);
        else if (flagVal == 1)
            reDisplayDev(out, productList, username);
        else if (flagVal == 0){
            reDisplayAdmin(out, productList);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(DeleteAppControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(DeleteAppControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    public void reDisplayDev(PrintWriter out, ArrayList<Product> productList, String username){
        for (Product i:productList){
            out.print("<tr>\n" +
                    "<th scope=\"row\" \n" +
                    (i.getIsApproved() == 0 ? "class=\"text-danger\"\n" : "class=\"text-success\"\n") +
                    ">Approve</i></th> \n" +
                    "<td>"+i.getName()+"</td>\n" +
                    "<td>\n" +
                    (i.getCategories() == 0 ? "Game\n" : "App\n") +
                    "</td>\n" +
                    "<td>\n" +
                    (i.getFee() == 0 ? "Free\n" : i.getFee()) +
                    "</td>\n" +
                    "<td>"+(i.getDescription() == null ? "" : i.getDescription())+"</td>\n" +
                    "<td>\n" +
                    "<a id=\"edit-product\" data-toggle=\"modal\" style=\"color: rgb(66, 186, 150);\"\n" +
                    "data-target=\"#edit-product\">\n" +
                    "<i class=\"fas fa-edit\"></i>Edit\n" +
                    "</a>\n" +
                    "</td>\n" +
                    "<td> <a onclick=\"deleteProductHandling("+i.getId()+", '"+username+"')\" href=\"\" data-toggle=\"modal\" style=\"color: red;\" data-target=\"#delete-modal\">\n" +
                    "<i class=\"fas fa-trash\"></i>Delete\n" +
                    "</a></td>\n" +
                    "</tr>");
        }
    }
    
    public void reDisplayAdmin(PrintWriter out, ArrayList<Product> productList){
        for (Product i:productList){
            out.print("<tr>\n" +
            "<th scope=\"row\">"+i.getId()+"</th>\n" +
            "<td>"+i.getName()+"</td>\n" +
            "<td>\n" +
            (i.getCategories() == 0 ? "<p>Game</p>\n" : "<p>Apps</p>\n") +
            "</td>\n" +
            "<td>"+i.getDev()+"</td>\n" +
            "<td>\n" +
            (i.getFee() == 0 ? "Free\n" : i.getFee()) +
            "</td>\n" +
            "<td>"+i.getDescription()+"</td>\n" +
            "<td>"+i.getRate()+"</td>\n" +
            "<td>"+i.getDownloadCount()+"</td>\n" +
            "<td>"+i.getSize()+" MB</td>\n" +
            "<td> <a onclick=\"deleteProductHandling("+i.getId()+", '"+i.getDev()+"')\" data-toggle=\"modal\" style=\"color: red; text-decoration: underline;\" data-target=\"#modal-delete-app\">\n" +
            "Delete\n" +
            "</a></td>\n" +
            "</tr>");
        }
    }

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
