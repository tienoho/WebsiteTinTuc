package vn.haui.web.command;

import vn.haui.web.connect.DBConnect;
import vn.haui.web.model.Post;

import java.sql.*;
import java.util.ArrayList;

public class PostDao {
    public ArrayList<Post> getListPostbyCategory(int categoryID) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM post where authorID=?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1,categoryID);
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
            list.add(post);
        }
        return list;
    }
}
