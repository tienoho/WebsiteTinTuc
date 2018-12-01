package vn.haui.web.command;

import vn.haui.web.connect.DBConnect;
import vn.haui.web.model.Post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PostDao {
    //lấy ra danh sách các post
    //lấy ra thông tin chi tiết post
    public ArrayList<Post> getListPostByCategory(String column, int ID) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM post where " + column + "=" + ID;
        PreparedStatement st = connection.prepareStatement(sql);
        // st.setInt(1,categoryID);
        ResultSet rs = st.executeQuery(sql);
        ArrayList<Post> list = new ArrayList<Post>();
        while (rs.next()) {
            Post post = new Post();
            post.setPostID(rs.getInt("post_id"));
            post.setAuthorID(rs.getInt("author_id"));
            post.setPostDate(rs.getDate("post_date"));
            post.setPostEditDate(rs.getDate("post_edit_date"));
            post.setPostContent(rs.getString("post_content"));
            post.setPostTitle(rs.getString("post_title"));
            post.setPostStatus(rs.getString("post_status"));
            post.setPostSlug(rs.getString("post_slug"));
            post.setPostImg(rs.getString("post_img"));
            post.setCategoryID(rs.getInt("category_id"));
            list.add(post);
        }
        return list;
    }
    //Get All
    public ArrayList<Post> getListAllPost() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM post";
        PreparedStatement st = connection.prepareStatement(sql);
        // st.setInt(1,categoryID);
        ResultSet rs = st.executeQuery(sql);
        ArrayList<Post> list = new ArrayList<Post>();
        while (rs.next()) {
            Post post = new Post();
            post.setPostID(rs.getInt("post_id"));
            post.setAuthorID(rs.getInt("author_id"));
            post.setPostDate(rs.getDate("post_date"));
            post.setPostEditDate(rs.getDate("post_edit_date"));
            post.setPostContent(rs.getString("post_content"));
            post.setPostTitle(rs.getString("post_title"));
            post.setPostStatus(rs.getString("post_status"));
            post.setPostSlug(rs.getString("post_slug"));
            post.setPostImg(rs.getString("post_img"));
            post.setCategoryID(rs.getInt("category_id"));
            list.add(post);
        }
        return list;
    }
    //phan trang cho arraylist
    public ArrayList<Post> getListProductByPages(int categoryID, int firstResult, int maxResult) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM post WHERE category_id = '" + categoryID + "' limit ?,?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<Post> list = new ArrayList<Post>();
        while (rs.next()) {
            Post post = new Post();
            post.setPostID(rs.getInt("post_id"));
            post.setAuthorID(rs.getInt("author_id"));
            post.setPostDate(rs.getDate("post_date"));
            post.setPostEditDate(rs.getDate("post_edit_date"));
            post.setPostContent(rs.getString("post_content"));
            post.setPostTitle(rs.getString("post_title"));
            post.setPostStatus(rs.getString("post_status"));
            post.setPostSlug(rs.getString("post_slug"));
            post.setPostImg(rs.getString("post_img"));
            post.setCategoryID(rs.getInt("category_id"));
            list.add(post);
        }
        return list;
    }

    public int getCountPostByCategoy(int categoryID) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(post_id) FROM post WHERE category_id = '" + categoryID + "'";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }
    public int getCategoyID(String slug) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT category_id FROM category WHERE category_slug = '" + slug + "'";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }
    public boolean insert(Post c) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "INSERT INTO Post(author_id, post_date, post_edit_date, post_content, post_title, post_status, post_slug, post_img, category_id) VALUE(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getPostTitle());
            ps.setInt(2, c.getAuthorID());
            ps.setString(3, c.getPostSlug());
            ps.setInt(4, c.getCategoryID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }
    public boolean update(Post c) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE Post set category_name=?, category_des=?, category_slug=? where category_id=?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, c.getPostTitle());
            ps.setInt(2, c.getAuthorID());
            ps.setString(3, c.getPostSlug());
            ps.setInt(4, c.getCategoryID());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }


    public boolean delete(int post_id) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "DELETE FROM Post WHERE post_id = ?";
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setLong(1, post_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }
}
