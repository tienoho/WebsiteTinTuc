package vn.haui.web.model;
import java.sql.Date;

public class Comment {
    private int comment_id;
    private int comment_post_id;
    private String comment_author;
    private String comment_author_email;
    private Date comment_date;
    private String comment_content;
    private int comment_parent;

    public Comment() {
    }

    public Comment(int comment_id, int comment_post_id, String comment_author, String comment_author_email, Date comment_date, String comment_content, int comment_parent) {
        this.comment_id = comment_id;
        this.comment_post_id = comment_post_id;
        this.comment_author = comment_author;
        this.comment_author_email = comment_author_email;
        this.comment_date = comment_date;
        this.comment_content = comment_content;
        this.comment_parent = comment_parent;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getComment_post_id() {
        return comment_post_id;
    }

    public void setComment_post_id(int comment_post_id) {
        this.comment_post_id = comment_post_id;
    }

    public String getComment_author() {
        return comment_author;
    }

    public void setComment_author(String comment_author) {
        this.comment_author = comment_author;
    }

    public String getComment_author_email() {
        return comment_author_email;
    }

    public void setComment_author_email(String comment_author_email) {
        this.comment_author_email = comment_author_email;
    }

    public Date getComment_date() {
        return comment_date;
    }

    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public int getComment_parent() {
        return comment_parent;
    }

    public void setComment_parent(int comment_parent) {
        this.comment_parent = comment_parent;
    }
}
