package vn.haui.web.command;

import vn.haui.web.connect.DBConnect;
import vn.haui.web.model.Post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;

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
    public Post getPost(int postID) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM post WHERE post_id = '" + postID + "'";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        Post post=null;
        while (rs.next()) {
            post = new Post();
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
        }
        return post;
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
    public int getPostIDBySlug(String slug) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT post_id FROM post WHERE post_slug = '" + slug + "'";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        int id = 0;
        while (rs.next()) {
            id = rs.getInt(1);
        }
        return id;
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
    //kiểm tra xem post_slug  đã tồn tại hay chưa
    public boolean checkPostSlug(String post_slug) {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM post WHERE post_slug='" + post_slug + "'";
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
    public boolean insert(Post c) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "INSERT INTO Post(author_id, post_date, post_edit_date, post_content, post_title, post_status, post_slug, post_img, category_id,post_summary) " +
                    "VALUE(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, c.getAuthorID());
            ps.setDate(2,c.getPostDate());
            ps.setDate(3,c.getPostEditDate());
            ps.setString(4, c.getPostContent());
            ps.setString(5, c.getPostTitle());
            ps.setString(6, c.getPostStatus());
            ps.setString(7, c.getPostSlug());
            ps.setString(8, c.getPostImg());
            ps.setInt(9, c.getCategoryID());
            ps.setString(10, c.getPostSummary());
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }
    public boolean update(Post c) throws SQLException {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "UPDATE Post set post_edit_date=?, post_content=?, post_title=?," +
                    " post_slug=?,post_img=?,post_status=? ,category_id=?,post_summary=? where post_id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDate(1,c.getPostEditDate());
            ps.setString(2, c.getPostContent());
            ps.setString(3, c.getPostTitle());
            ps.setString(4, c.getPostSlug());
            ps.setString(5, c.getPostImg());
            ps.setString(6, c.getPostStatus());
            ps.setInt(7, c.getCategoryID());
            ps.setString(8, c.getPostSummary());
            ps.setInt(9, c.getPostID());
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
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, post_id);
            int temp = ps.executeUpdate();
            return temp == 1;
        } catch (Exception e) {
            return false;
        }
    }
    public String createPostSlug(String postTitle)
    {
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
        String dateTimeNow=sdf.format(cal.getTime());
        try {
            String temp = Normalizer.normalize(postTitle, Normalizer.Form.NFD);
            Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
            String slug= pattern.matcher(temp).replaceAll("").toLowerCase().replaceAll(" ", "-").replaceAll("đ", "d");
            if(checkPostSlug(slug))
                slug=slug+"-"+dateTimeNow;
            return slug;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "";
    }
    public java.sql.Date GetDateNow()
    {
        java.util.Date myDate = (Calendar.getInstance().getTime());
        java.sql.Date sqlDateNow = new java.sql.Date(myDate.getTime());
        return sqlDateNow;
    }
}
