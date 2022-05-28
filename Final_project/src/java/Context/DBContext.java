package Context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://"+serverName+":"+portNumber+"\\"+instance+";databaseName"+dbName+";useUnicode=true;characterEncoding=UTF-8";
        if(instance == null || instance.trim().isEmpty())
            url = "jdbc:sqlserver://"+serverName+":"+portNumber+";databaseName="+dbName+";useUnicode=true;characterEncoding=UTF-8";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }
    
    private final String serverName = "localhost";
    private final String dbName = "Final";
    private final String portNumber ="1433";
    private final String instance="";
    private final String userID = "sa";
    private final String password = "123456";
}
