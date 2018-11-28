package vn.haui.web.command;

import vn.haui.web.connect.DBConnect;
import vn.haui.web.model.Users;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UsersDao {
    //mã hóa mật khẩu MD5
    public static String encryption(String str) {
        byte[] defaultBytes = str.getBytes();
        try {
            MessageDigest algorithm = MessageDigest.getInstance("MD5");
            algorithm.reset();
            algorithm.update(defaultBytes);
            byte messageDigest[] = algorithm.digest();
            StringBuffer hexString = new StringBuffer();
            for (int i = 0; i < messageDigest.length; i++) {
                String hex = Integer.toHexString(0xFF & messageDigest[i]);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            str = hexString + "";
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return str;

    }

    //kiểm tra xem usernam và email đã tồn tại hay chưa
    public boolean checkEmail(String email) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM user WHERE email='" + email + "'";
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return false;
    }

    //insert tai khoan
    public boolean insertUser(Users user) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO user(email,password,fullname,createddate,roleid) values(?,?,?,?,?)";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getEmail());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getFullName());
            ps.setDate(4, user.getCreatedDate());
            ps.setInt(5, user.getRoleId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(UsersDao.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return false;
    }
    //Login
    public Users login(String email, String password) {
        Connection con = DBConnect.getConnecttion();
        String sql = "select * from user where email='" + email + "' and password='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Users users=new Users();
                users.setEmail(rs.getString("email"));
                users.setFullName(rs.getString("fullname"));
                users.setRoleId(rs.getInt("roleid"));
                con.close();
                return users;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
