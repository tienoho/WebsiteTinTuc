package vn.haui.web.command;

import vn.haui.web.connect.DBConnect;
import vn.haui.web.model.Category;

import java.sql.*;
import java.util.ArrayList;

public class CategoryDao {


    public ArrayList<Category> getListCategory() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM CATEGORY";
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery(sql);
        ArrayList<Category> list = new ArrayList<Category>();
        while (rs.next()) {
            Category category = new Category();
            category.setCategoryID(rs.getInt("category_id"));
            category.setCategoryName(rs.getString("category_name"));
            category.setCategoryDes(rs.getString("category_des"));
            category.setCategorySlug(rs.getString("category_slug"));
            list.add(category);
        }
        return list;
    }

    public boolean insert(Category c) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "INSERT INTO CATEGORY(category_name, category_des, category_slug) VALUE(?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getCategoryName());
            ps.setString(2, c.getCategoryDes());
            ps.setString(3, c.getCategorySlug());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }
    public boolean update(Category c) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE CATEGORY set category_name=?, category_des=?, category_slug=? where category_id=?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getCategoryName());
            ps.setString(2, c.getCategoryDes());
            ps.setString(3, c.getCategorySlug());
            ps.setInt(4, c.getCategoryID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }


    public boolean delete(int category_id) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "DELETE FROM CATEGORY WHERE category_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, category_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }
}
