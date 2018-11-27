package vn.haui.web.command;

import vn.haui.web.connect.DBConnect;
import vn.haui.web.model.Post;

import java.sql.*;
import java.util.ArrayList;

public class PostDao {
    //lấy ra danh sách các post
    //lấy ra thông tin chi tiết post
    public ArrayList<Post> getListPostByCategory(String column,int ID) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM post where "+column+"="+ID;
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


}
