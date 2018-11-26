package vn.haui.web.model;

public class Category {
    private long categoryID;
    private String categoryName;
    private String categorySlug;

    public Category() {
    }

    public Category(long categoryID, String categoryName, String categorySlug) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.categorySlug = categorySlug;
    }

    public long getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(long categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategorySlug() {
        return categorySlug;
    }

    public void setCategorySlug(String categorySlug) {
        this.categorySlug = categorySlug;
    }
}
