package control;

import DAO.DAO;
import Model.Product;
import java.io.File;
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
@WebServlet(name = "EditAppControl", urlPatterns = {"/editapp"})
public class EditAppControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DAO dao = new DAO();
            String idP = request.getParameter("id");
            int id = Integer.parseInt(idP);
            Product product = dao.getProductDetail(id);
            
            request.setAttribute("product", product);
            request.getRequestDispatcher("edit-app.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(EditAppControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            DAO dao = new DAO();
            DecimalFormat df = new DecimalFormat("#.##");
            df.setRoundingMode(RoundingMode.CEILING);
            
            String idP = request.getParameter("id");
            int id = Integer.parseInt(idP);
            Product product = dao.getProductDetail(id);
            
            String appName = request.getParameter("app-name");
            String category = request.getParameter("category");
            String fee = request.getParameter("fee");
            String des = request.getParameter("des");
            
            String cbicon = request.getParameter("cbicon");
            String cbinstall = request.getParameter("cbinstall");
            String cbscreenshot = request.getParameter("cbscreenshot");
            
            Part icon = request.getPart("icon");
            Part screenshot1 = request.getPart("screenshot1");
            Part screenshot2 = request.getPart("screenshot2");
            Part screenshot3 = request.getPart("screenshot3");
            Part install = request.getPart("install");
            
            int categories;
            if (category.equals("game"))
                categories = 0;
            else
                categories = 1;
            
            float size = product.getSize();
            
            if (install != null){
                size = Float.parseFloat(df.format(install.getSize() / (1024 * 1024)));
            }
            
            dao.editApp(appName, categories, des, product.getDev(), Integer.parseInt(fee), size, id);
            
            String path_install = request.getServletContext().getRealPath("/install-file");
            String path_screenshot = request.getServletContext().getRealPath("/img/Screenshot");
            String path_icon = request.getServletContext().getRealPath("/img/icon_products");
            
            if (cbicon != null){
                deleteFile(path_install, idP + ".png",icon);
                uploadFile(path_icon, Integer.toString(id)+".png", icon);
            }
            if (cbscreenshot != null){
                deleteFile(path_screenshot, idP + "_1.png", screenshot1);
                uploadFile(path_screenshot, Integer.toString(id)+"_1.png", screenshot1);

                deleteFile(path_screenshot, idP + "_2.png", screenshot2);
                uploadFile(path_screenshot, Integer.toString(id)+"_2.png", screenshot2);

                deleteFile(path_screenshot, idP + "_3.png", screenshot3);
                uploadFile(path_screenshot, Integer.toString(id)+"_3.png", screenshot3);
            }
            if (cbinstall != null){
                deleteFile(path_install, idP + ".zip", install);
                uploadFile(path_install, Integer.toString(id)+".zip", install);
            }
            
            response.sendRedirect("/manageapp");
//            PrintWriter out = response.getWriter();
//            
//            out.println(cbicon);
//            out.println(cbinstall);
//            out.println(cbscreenshot);
        } catch (Exception ex) {
            Logger.getLogger(EditAppControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void uploadFile(String path, String fileName, Part part) throws IOException{
        part.write(path + "/" +fileName);
    }
    
    private void deleteFile(String path, String fileName, Part part) throws IOException{
        File file = new File(path + "/" + fileName);
        file.delete();
    }
}
