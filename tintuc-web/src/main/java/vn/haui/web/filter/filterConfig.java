package vn.haui.web.filter;

import vn.haui.web.command.SettingDao;
import vn.haui.web.common.WebConstant;
import vn.haui.web.model.Setting;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.Filter;

public class filterConfig implements Filter {
    @Override
    public void init(FilterConfig fConfig) throws ServletException {
        System.out.println("init!");
    }

    @Override
    public void destroy() {
        System.out.println("LogFilter destroy!");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        SettingDao settingDao=new SettingDao();
        ArrayList<Setting> settings=null;
        try {
            settings=settingDao.getSetting();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(settings!=null)
        {
            for (Setting s:settings){
                switch (s.getOptionName()){
                    case "siteurl":
                        WebConstant.setLocalHost(s.getOptionValue());
                        break;
                    case "blogdescription":
                        WebConstant.setBlogdescription(s.getOptionValue());
                        break;
                    case "blogname":
                        WebConstant.setBlogname(s.getOptionValue());
                        break;
                    case "post_category":
                        WebConstant.setPostNumber(Integer.parseInt(s.getOptionValue()));
                        break;
                    case "post_home":
                        WebConstant.setPostNumberHome(Integer.parseInt(s.getOptionValue()));
                        break;
                    case "post_home_sub":
                        WebConstant.setPostNumberHomeSub(Integer.parseInt(s.getOptionValue()));
                        break;
                    case "category_home_sub_one":
                        WebConstant.setCategorySubOne(Integer.parseInt(s.getOptionValue()));
                        break;
                }
            }
        }
        // Cho phép request được đi tiếp. (Vượt qua Filter này).
        chain.doFilter(request, response);
    }
}
