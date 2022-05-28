package control;

import DAO.DAO;
import Model.Account;
import Model.UserInfo;
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

@WebServlet(name = "DeleteUserControl", urlPatterns = {"/deleteuser"})
public class DeleteUserControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        DAO dao = new DAO();
        
        String username = request.getParameter("username");
        
        dao.deleteUserInfo(username);
        dao.deleteUser(username);
        
        ArrayList<Account> accounts = dao.getAllUser();
        ArrayList<UserInfo> userInfos = new ArrayList<UserInfo>();
        
        for (Account i:accounts){
            userInfos.add(dao.getUserInfo(i.getUsername()));
        }
        
        reDisplayUser(out, accounts, userInfos);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(DeleteUserControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(DeleteUserControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void reDisplayUser(PrintWriter out, ArrayList<Account> accounts, ArrayList<UserInfo> userInfos) {
        for (int i=0;i<accounts.size();i++){
            out.print("<tr>\n" +
            "<th scope=\"row\">\n");
            if (accounts.get(i).getIsDev() != 1){
                out.print("<a onclick=\"UpgradeDevHandling('"+accounts.get(i).getUsername()+"')\" href=\"\" data-toggle=\"modal\" data-target=\"#modal-upgrade-user\">\n"+
                        "<p style=\"color: green\">User &nbsp<i class=\"fas fa-user-edit\"></i></p>\n" + "</a>\n");
            }
            else if(accounts.get(i).getIsDev() == 1){
                out.print("<p style=\"color: rgb(91, 19, 91)\">Dev &nbsp<i class=\"fas fa-user-edit\"></i></p>\n");
            }                    
            out.print("</th>\n" +
                    "<th>"+((accounts.get(i).getUsername() == null) ? "" : accounts.get(i).getUsername()) +"</th>\n" +
                    "<td>"+ ((userInfos.get(i).getFullname()== null) ? "" : userInfos.get(i).getFullname()) +"</td>\n" +
                    "<td>"+ ((userInfos.get(i).getAddress()== null) ? "" : userInfos.get(i).getAddress()) +"</td>\n" +
                    "<td>"+ ((userInfos.get(i).getPhone()== null) ? "" : userInfos.get(i).getPhone()) +"</td>\n" +
                    "<td>"+ ((userInfos.get(i).getMail()== null) ? "" : userInfos.get(i).getMail()) +"</td>\n" +
                    "<td>\n" +
                    "<a href=\"\" data-toggle=\"modal\" style=\"color: gray;\"\n<a onclick=\"blockUserHandling("+accounts.get(i).getIsBlock()+", '"+accounts.get(i).getUsername()+"')\" href=\"\" data-toggle=\"modal\" style=\"color: gray;\"" +
                    "data-target=\"#modal-block-user\">\n" +
                    "<i class=\"fas fa-ban\"></i>"+(accounts.get(i).getIsBlock() == 0 ? " Block" : "unBlock")+"\n" +
                    "</a>\n" +
                    "</td>\n" +
                    "<td> <a onclick=\"deleteUserHandling('"+accounts.get(i).getUsername()+"')\" data-toggle=\"modal\" style=\"color: red;\"\n" +
                    "data-target=\"#modal-delete-user\">\n" +
                    "<i class=\"fas fa-trash\"></i>Delete\n" +
                    "</a></td>" +
                    "</tr>");
        }
    }

}
