package control;

import DAO.DAO;
import Model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize=1024*1024*20, maxRequestSize=1024*1024*50)
@WebServlet(name = "AddProductControl", urlPatterns = {"/addproduct"})
public class AddProductControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
        PrintWriter out = response.getWriter();
        Account account = (Account) request.getSession().getAttribute("account");
        
        String appName = request.getParameter("app-name");
        String category = request.getParameter("category");
        Part icon = request.getPart("icon");
        Part screenshot1 = request.getPart("screenshot1");
        Part screenshot2 = request.getPart("screenshot2");
        Part screenshot3 = request.getPart("screenshot3");
        Part install = request.getPart("install");
        String fee = request.getParameter("fee");
        String des = request.getParameter("des");
        
        float size = (float) install.getSize() / (1024 * 1024);
        String dev = dao.getUserInfo(account.getUsername()).getFullname();
        
        int categories;
        if (category.equals("game"))
            categories = 0;
        else
            categories = 1;
        
        DecimalFormat df = new DecimalFormat("#.##");
        df.setRoundingMode(RoundingMode.CEILING);
        
        
        dao.addProduct(appName, categories, des, dev, Integer.parseInt(fee), Float.parseFloat(df.format(size)));
        int id = dao.getMaxId("product");
        
        uploadFile(request.getServletContext().getRealPath("/img/icon_products"), Integer.toString(id)+".png", icon);
        
        uploadFile(request.getServletContext().getRealPath("/img/Screenshot"), Integer.toString(id)+"_1.png", screenshot1);
        uploadFile(request.getServletContext().getRealPath("/img/Screenshot"), Integer.toString(id)+"_2.png", screenshot2);
        uploadFile(request.getServletContext().getRealPath("/img/Screenshot"), Integer.toString(id)+"_3.png", screenshot3);
        
        uploadFile(request.getServletContext().getRealPath("/install-file"), Integer.toString(id)+".zip", install);
        response.sendRedirect("index");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AddProductControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AddProductControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
    public void uploadFile(String path, String fileName, Part part) throws IOException{
        part.write(path + "/" +fileName);
    }
}
