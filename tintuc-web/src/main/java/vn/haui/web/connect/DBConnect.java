package vn.haui.web.connect;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    public static Connection getConnecttion() {
        Connection cons = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cons = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/tintuc", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        StackTraceElement[] st = Thread.currentThread().getStackTrace();
        System.out.println(  "create connection called from " + st[2] );
        return cons;
    }

    public static void main(String[] args) {
        System.out.println(getConnecttion());
    }
}
