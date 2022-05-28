package control;

import DAO.DAO;
import Model.Account;
import Model.UserInfo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SendMailControl", urlPatterns = {"/sendmail"})
public class SendMailControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        final String username = "data.miroslavkhang@gmail.com";
        final String password = "KhangMiroslav4869";
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(prop, new javax.mail.Authenticator () {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        
        String username1 = request.getParameter("username");
        DAO dao = new DAO();
        UserInfo info = dao.getUserInfo(username1);

        if (info == null){
            request.setAttribute("message", "Can not find account");
            request.getRequestDispatcher("mailconfirm.jsp").forward(request, response);
        }
        
        PrintWriter out = response.getWriter();
//        out.print(username1);
        Random random = new Random ();
        int number = random.nextInt(999999);
        String verifyCode = String.format ("%06d", number);
        String mailContent = "Your verification is: " + verifyCode;
        dao.addVerifyCode(username1, verifyCode);
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                Message.RecipientType.TO,
                InternetAddress.parse(info.getMail())
            );
            message.setSubject("Verification Code");
            message.setText(mailContent);
            Transport.send(message);
            request.setAttribute("confirm", 1);
            request.setAttribute("userinfo", username1);
            request.getRequestDispatcher("mailconfirm.jsp").forward(request, response);
         } catch (Exception e) {}
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SendMailControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(SendMailControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
