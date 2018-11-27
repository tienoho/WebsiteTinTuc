package vn.haui.web.model;

import java.sql.Date;

public class Post {
    private int postID;
    private int authorID;
    private Date postDate;
    private Date postEditDate;
    private String postContent;
    private String postTitle;
    private String postStatus;
    private String postSlug;
    private String postImg;
    private int categoryID;

    public Post() {
    }

    public Post(int postID, int authorID, Date postDate, Date postEditDate, String postContent, String postTitle, String postStatus, String postSlug, String postImg, int categoryID) {
        this.postID = postID;
        this.authorID = authorID;
        this.postDate = postDate;
        this.postEditDate = postEditDate;
        this.postContent = postContent;
        this.postTitle = postTitle;
        this.postStatus = postStatus;
        this.postSlug = postSlug;
        this.postImg = postImg;
        this.categoryID = categoryID;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public int getAuthorID() {
        return authorID;
    }

    public void setAuthorID(int authorID) {
        this.authorID = authorID;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public Date getPostEditDate() {
        return postEditDate;
    }

    public void setPostEditDate(Date postEditDate) {
        this.postEditDate = postEditDate;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostStatus() {
        return postStatus;
    }

    public void setPostStatus(String postStatus) {
        this.postStatus = postStatus;
    }

    public String getPostSlug() {
        return postSlug;
    }

    public void setPostSlug(String postSlug) {
        this.postSlug = postSlug;
    }

    public String getPostImg() {
        return postImg;
    }

    public void setPostImg(String postImg) {
        this.postImg = postImg;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }
}
