package vn.haui.web.command;

import vn.haui.web.connect.DBConnect;
import vn.haui.web.model.Category;
import vn.haui.web.model.TermsRelationships;

import java.sql.*;
import java.util.ArrayList;

public class TermsRelationshipsDao {
    public ArrayList<TermsRelationships> getListTermsRelationships() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM terms_relationships";
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery(sql);
        ArrayList<TermsRelationships> list = new ArrayList<TermsRelationships>();
        while (rs.next()) {
            TermsRelationships termsRelationships = new TermsRelationships();
            termsRelationships.setPostID(rs.getInt("post_id"));
            termsRelationships.setCategoryID(rs.getInt("category_id"));
            termsRelationships.setOrder(rs.getInt("order"));
            list.add(termsRelationships);
        }
        return list;
    }
    public boolean insert(TermsRelationships c) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "INSERT INTO terms_relationships(post_id, category_id, `order`) VALUE(?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, c.getPostID());
            ps.setInt(2, c.getCategoryID());
            ps.setInt(3, c.getOrder());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean update(TermsRelationships c,int categoryId) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE terms_relationships set category_id=?, `order`=? where  post_id=? and category_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, c.getCategoryID());
            ps.setInt(2, c.getOrder());
            ps.setInt(3, c.getPostID());
            ps.setInt(4, categoryId);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }


    public boolean delete(int post_id,int category_id) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "DELETE FROM terms_relationships WHERE category_id = ? and post_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, category_id);
            ps.setLong(1, post_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }
}
