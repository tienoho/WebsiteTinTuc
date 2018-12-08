package vn.haui.web.utils;

import org.jsoup.Jsoup;

public class tool {
    //cắt các tag trong html
    public static String html2text(String html) {
        return Jsoup.parse(html).text();
    }


}
