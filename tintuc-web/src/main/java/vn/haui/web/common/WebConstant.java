package vn.haui.web.common;

public class WebConstant {
    public static final String textCategoryID = "category_id";
    public static final String textPostID = "post_id";
    public static String tobeContime = "...";
    public static int postNumber = 10;
    public static int postNumberHome = 8;
    public static int postNumberHomeSub = 6;
    public static String localHost = "http://localhost:8080";
    public static int categorySubOne = 4;
    public static String blogdescription = "";
    public static String blogname = "";
    public static String comment = "false";

    public static String getComment() {
        return comment;
    }

    public static void setComment(String comment) {
        WebConstant.comment = comment;
    }

    public static int getPostNumberHomeSub() {
        return postNumberHomeSub;
    }

    public static void setPostNumberHomeSub(int postNumberHomeSub) {
        WebConstant.postNumberHomeSub = postNumberHomeSub;
    }

    public static String getBlogname() {
        return blogname;
    }

    public static void setBlogname(String blogname) {
        WebConstant.blogname = blogname;
    }

    public static int getPostNumberHome() {
        return postNumberHome;
    }

    public static void setPostNumberHome(int postNumberHome) {
        WebConstant.postNumberHome = postNumberHome;
    }

    public static String getBlogdescription() {
        return blogdescription;
    }

    public static void setBlogdescription(String blogdescription) {
        WebConstant.blogdescription = blogdescription;
    }

    public static String getTextCategoryID() {
        return textCategoryID;
    }

    public static String getTextPostID() {
        return textPostID;
    }

    public static String getTobeContime() {
        return tobeContime;
    }

    public static void setTobeContime(String tobeContime) {
        WebConstant.tobeContime = tobeContime;
    }

    public static int getPostNumber() {
        return postNumber;
    }

    public static void setPostNumber(int postNumber) {
        WebConstant.postNumber = postNumber;
    }

    public static String getLocalHost() {
        return localHost;
    }

    public static void setLocalHost(String localHost) {
        WebConstant.localHost = localHost;
    }

    public static int getCategorySubOne() {
        return categorySubOne;
    }

    public static void setCategorySubOne(int categorySubOne) {
        WebConstant.categorySubOne = categorySubOne;
    }
}
