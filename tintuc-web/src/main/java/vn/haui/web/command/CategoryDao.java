package vn.haui.web.command;

import vn.haui.web.connect.DBConnect;
import vn.haui.web.model.Category;

import java.sql.*;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;

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

    public Category getCategory(int category_id) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM CATEGORY WHERE category_id="+category_id;
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery(sql);
        Category category = null;
        while (rs.next()) {
            category = new Category();
            category.setCategoryID(rs.getInt("category_id"));
            category.setCategoryName(rs.getString("category_name"));
            category.setCategoryDes(rs.getString("category_des"));
            category.setCategorySlug(rs.getString("category_slug"));
        }
        return category;
    }

    //kiểm tra xem category_slug  đã tồn tại hay chưa
    public boolean checkCategorySlug(String category_slug) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM CATEGORY WHERE category_slug='" + category_slug + "'";
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                connection.close();
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return false;
    }

    public boolean insert(Category c) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "INSERT INTO CATEGORY(category_name, category_des, category_slug) VALUE(?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
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
            PreparedStatement ps = connection.prepareStatement(sql);
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
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, category_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }
    public String createCategorySlug(String categoryName)
    {
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
        String dateTimeNow=sdf.format(cal.getTime());
        try {
            String temp = Normalizer.normalize(categoryName, Normalizer.Form.NFD);
            Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");

            String slug= pattern.matcher(temp).replaceAll("").toLowerCase().replaceAll(" ", "-").replaceAll("đ", "d");
            if(checkCategorySlug(slug))
                slug=slug+"-"+dateTimeNow;
            return slug;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "";
    }

}
