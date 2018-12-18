<%@ page import="vn.haui.web.command.CategoryDao" %>
<%@ page import="vn.haui.web.command.PostDao" %>
<%@ page import="vn.haui.web.common.WebConstant" %>
<%@ page import="vn.haui.web.model.Category" %>
<%@ page import="vn.haui.web.model.Post" %>
<%@ page import="vn.haui.web.utils.tool" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%
    PostDao postDao = new PostDao();
    CategoryDao categoryDao = new CategoryDao();
    ArrayList<Category> categoriesParent = categoryDao.getListCategoryParent();
    ArrayList<Post> postsNew = postDao.getListAllPostNew(8);
%>
<script>
    $data = '<div class="aa"></div>';
    console.log(JSON.stringify($data));
    var bunyad_preload2 =
        {"1": {"4": "","10": "","9": "","12": ""},
        "2": {"10": "","9": "","7": ""}
    };
</script>
<div class="main-featured">
    <div class="wrap cf">
        <div class="featured-grid featured-grid-b" data-animation="fade" data-animation-speed="600"
             data-slide-delay="5000">
            <ul class="grid">
                <%
                    int dem = 0;
                    for (Post p : postDao.getListAllPostNew(4)) {
                        String extendsImg = p.getPostImg();
                        if (extendsImg.contains(".")) {
                            extendsImg = extendsImg.substring(extendsImg.lastIndexOf("."), extendsImg.length());
                        }
                        dem++;
                        if (dem == 1) {
                %>
                <li class="first">
                    <div class="item large-item">
                        <a href="${root}/post/<%=p.getPostSlug()%>" class="image-link">
                            <img width="600" height="460" src="<%=WebConstant.localHost%>/<%=p.getPostImg()%>"
                                 class="attachment-grid-slider-b-large size-grid-slider-b-large wp-post-image"
                                 alt="<%=p.getPostTitle()%>" title="<%=p.getPostTitle()%>"
                                 srcset="<%=WebConstant.localHost%>/<%=p.getPostImg().replace(extendsImg,"-600x460"+extendsImg)%> 600w"
                                 sizes="(max-width: 600px) 100vw, 600px"/>
                        </a>
                        <div class="caption caption-large">
                                    <span class="cat-title cat-4">
                                        <a href="category/fashion/index.html" title="Fashion">Fashion</a>
                                    </span>
                            <h3><a href="${root}/post/<%=p.getPostSlug()%>" class="item-heading"><%=p.getPostTitle()%></a></h3>
                            <time class="the-date" datetime="<%=p.getPostDate()%>"><%=p.getPostDate()%></time>
                        </div>
                    </div>
                </li>
                <li class="second">
                    <%} else if (dem == 2) {%>
                    <div class="item medium-item">
                        <a href="${root}/post/<%=p.getPostSlug()%>"
                           class="image-link">
                            <img width="474" height="240" src="${root}/<%=p.getPostImg()%>"
                                 class="attachment-grid-slider-b-med size-grid-slider-b-med wp-post-image"
                                 alt="<%=p.getPostTitle()%>" title="<%=p.getPostTitle()%>"
                                 srcset="${root}/<%=p.getPostImg().replace(extendsImg,"-474x240"+extendsImg)%> 474w"
                                 sizes="(max-width: 474px) 100vw, 474px"/>
                        </a>
                        <div class="caption caption-small">
                                    <span class="cat-title cat-4">
                                        <a href="category/fashion/index.html" title="Fashion">Fashion</a>
                                    </span>
                            <h3>
                                <a href="${root}/post/<%=p.getPostSlug()%>" class="item-heading heading-small"><%=p.getPostTitle()%></a>
                            </h3>
                            <time class="the-date" datetime="<%=p.getPostDate()%>"><%=p.getPostDate()%></time>
                        </div>
                    </div>
                    <%} else {%>
                    <div class="col-6 item small-item">
                        <a href="${root}/post/<%=p.getPostSlug()%>"
                           class="image-link">
                            <img width="235" height="216" src="${root}/<%=p.getPostImg()%>"
                                 class="attachment-grid-slider-b-small size-grid-slider-b-small wp-post-image"
                                 alt="<%=p.getPostTitle()%>" title="<%=p.getPostTitle()%>"
                                 srcset="${root}/<%=p.getPostImg().replace(extendsImg,"-235x216"+extendsImg)%> 235w"
                                 sizes="(max-width: 235px) 100vw, 235px"/>
                        </a>
                        <div class="caption caption-small">
                            <span class="cat-title cat-7"><a href="category/celebrities/index.html" title="Celebrities">Celebrities</a></span>
                            <h3>
                                <a href="${root}/post/<%=p.getPostSlug()%>" class="item-heading heading-small"><%=p.getPostTitle()%></a>
                            </h3>
                            <time class="the-date" datetime="<%=p.getPostDate()%>"><%=p.getPostDate()%></time>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="main wrap cf">
    <div class="row">
        <div class="col-8 main-content">
            <div id="post-11" class="page-content post-11 page type-page status-publish">
                <section class="block-wrap highlights highlights-b" data-id="1">
                    <div class="block-head">
                        <h3 class="heading">Bài viết mới nhất</h3>
                        <ul class="subcats filters">
                            <li><a href="#" data-id="0" class="active">All</a></li>
                            <%for (Category c : categoriesParent) {%>
                            <li><a href="<%=WebConstant.localHost%>/Category/<%=c.getCategorySlug()%>"
                                   data-id="<%=c.getCategoryID()%>"><%=c.getCategoryName()%>
                            </a></li>
                            <%}%>
                        </ul>
                    </div>
                    <div class="block-content">
                        <div class="container cf">
                            <div class="large b-row cf">
                                <%int demPost = 0;for (Post p : postsNew) {
                                        demPost++;
                                        String extendsImgNew = p.getPostImg();
                                        if (extendsImgNew.contains(".")) {
                                            extendsImgNew = extendsImgNew.substring(extendsImgNew.lastIndexOf("."), extendsImgNew.length());
                                        }
                                %>
                                <div class="column half b-col">
                                    <article>
                                        <a href="<%=WebConstant.localHost%>/post/<%=p.getPostSlug()%>"
                                           title="<%=p.getPostTitle()%>"
                                           class="image-link">
                                            <img width="336" height="200"
                                                 src="<%=WebConstant.localHost%>/<%=p.getPostImg()%>"
                                                 class="image wp-post-image"
                                                 alt="<%=p.getPostImg().substring(p.getPostImg().lastIndexOf("/"))%>"
                                                 title="<%=p.getPostTitle()%>"
                                                 srcset="<%=WebConstant.localHost%>/<%=p.getPostImg().replace(extendsImgNew,"-336x200"+extendsImgNew)%> 336w"
                                                 sizes="(max-width: 336px) 100vw, 336px"/>
                                        </a>
                                        <h2 class="post-title">
                                            <a href="<%=WebConstant.localHost%>/post/<%=p.getPostSlug()%>"
                                               title="<%=p.getPostTitle()%>"><%=p.getPostTitle()%>
                                            </a>
                                        </h2>
                                        <div class="cf listing-meta meta below">
                                            <span class="meta-item author">Bởi <a
                                                    href="author/trendy/index.html" title="Posts by Kate Hanson"
                                                    rel="author">Kate Hanson</a>
                                            </span>
                                            <time datetime="<%=p.getPostDate()%>" class="meta-item"><%=p.getPostDate()%>
                                            </time>
                                        </div>
                                        <div class="excerpt">
                                            <p><%=tool.html2text(p.getPostContent()).substring(0, 50)%><%=WebConstant.tobeContime%></p>
                                        </div>
                                    </article>
                                </div>
                                <%if (demPost == 2) {break;}}%>
                            </div>
                            <ul class="b-row posts-list thumb">
                                <%
                                    int demPost2 = 0;
                                    for (Post p : postsNew) {
                                        demPost2++;
                                        if (demPost2 > 2) {
                                            String extendsImgNew = p.getPostImg();
                                            if (extendsImgNew.contains(".")) {
                                                extendsImgNew = extendsImgNew.substring(extendsImgNew.lastIndexOf("."), extendsImgNew.length());
                                            }
                                %>
                                <li class="column half b-col">
                                    <article class="post cf">
                                        <a href="<%=WebConstant.localHost%>/post/<%=p.getPostSlug()%>"
                                           class="image-link">
                                            <img width="104" height="69"
                                                 src="<%=WebConstant.localHost%>/<%=p.getPostImg()%>"
                                                 class="<%=p.getPostImg().substring(p.getPostImg().lastIndexOf("/"))%>"
                                                 alt="StockSnap_HBI15KEJR3"
                                                 title="<%=p.getPostTitle()%>"
                                                 srcset="<%=WebConstant.localHost%>/<%=p.getPostImg().replace(extendsImgNew,"-104x69"+extendsImgNew)%> 104w, <%=WebConstant.localHost%>/<%=p.getPostImg().replace(extendsImgNew,"-300x200"+extendsImgNew)%> 300w, <%=WebConstant.localHost%>/<%=p.getPostImg().replace(extendsImgNew,"-1000x667"+extendsImgNew)%> 1000w, <%=WebConstant.localHost%>/<%=p.getPostImg().replace(extendsImgNew,"-702x459"+extendsImgNew)%> 702w, <%=WebConstant.localHost%>/<%=p.getPostImg().replace(extendsImgNew,"-214x140"+extendsImgNew)%> 214w"
                                                 sizes="(max-width: 104px) 100vw, 104px"/>
                                        </a>
                                        <div class="content"><a
                                                href="<%=WebConstant.localHost%>/post/<%=p.getPostSlug()%>"
                                                title="<%=p.getPostTitle()%>"><%=p.getPostTitle()%>
                                        </a>
                                            <div class="cf listing-meta below">
                                                <time datetime="<%=p.getPostDate()%>"
                                                      class="meta-item"><%=p.getPostDate()%>
                                                </time>
                                            </div>
                                        </div>
                                    </article>
                                </li>
                                <%
                                        }
                                    }
                                %>
                            </ul>
                        </div>
                    </div>
                </section>
                <section class="block-wrap blog" data-id="2">
                    <div class="block-head cat-text-12">
                        <h3 class="heading"><a href="category/leisure/index.html">Latest Leisure</a></h3>
                        <ul class="subcats filters">
                            <li><a href="#" data-id="0" class="active">All</a></li>
                            <li><a href="" data-id="10">Fitness</a></li>
                            <li><a href="" data-id="9">Travel</a></li>
                            <li><a href="" data-id="7">Celebrities</a></li>
                        </ul>
                    </div>
                    <div class="block-content">
                        <div class="row b-row listing meta-below grid-2">
                            <div class="column half b-col">
                                <article
                                        class="highlights post-108 post type-post status-publish format-standard has-post-thumbnail category-entertainment category-leisure category-opinion tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                                    <a href="2017/01/08/hot-or-not-for-2017-8-stars-that-will-rise-to-top-2/index.html"
                                       title="Hot Or Not For 2017: 8 Stars That Will Rise Top" class="image-link">
                                        <img width="336" height="200"
                                             src="images/dcpnzesy3yk-jennifer-pallian-336x200.jpg"
                                             class="image wp-post-image" alt="dcpnzesy3yk-jennifer-pallian"
                                             title="Hot Or Not For 2017: 8 Stars That Will Rise Top"
                                             srcset="images/dcpnzesy3yk-jennifer-pallian-336x200.jpg 336w, images/dcpnzesy3yk-jennifer-pallian-336x200@2x.jpg 672w"
                                             sizes="(max-width: 336px) 100vw, 336px"/> </a>
                                    <h2 class="post-title">
                                        <a href="2017/01/08/hot-or-not-for-2017-8-stars-that-will-rise-to-top-2/index.html">Hot
                                            Or Not For 2017: 8 Stars That Will Rise Top</a>
                                    </h2>
                                    <div class="cf listing-meta meta below">
                                                <span class="meta-item author">
                                                    By <a href="author/trendy/index.html" title="Posts by Kate Hanson"
                                                          rel="author">Kate Hanson</a>
                                                </span>
                                        <time datetime="2017-01-08T02:32:37+00:00" class="meta-item">January 8,
                                            2017
                                        </time>
                                    </div>
                                    <div class="excerpt">
                                        <p>It is important to be chic. I love the 2000s because everyone started to
                                            love&hellip;</p>
                                    </div>
                                </article>
                            </div>
                            <div class="column half b-col">
                                <article class="highlights post-110 post type-post status-publish format-standard has-post-thumbnail category-entertainment category-leisure category-opinion tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                                    <a href="2017/01/08/on-the-go-pilot-sachtel-does-the-job-fearlessly-2-2/index.html"
                                       title="On the Go: Pilot Sachtel Does the Job Fearlessly" class="image-link">
                                        <img width="336" height="200" src="images/StockSnap_9MKVXCFYA5-336x200.jpg"
                                             class="image wp-post-image" alt="StockSnap_9MKVXCFYA5"
                                             title="On the Go: Pilot Sachtel Does the Job Fearlessly"
                                             srcset="images/StockSnap_9MKVXCFYA5-336x200.jpg 336w, images/StockSnap_9MKVXCFYA5-336x200@2x.jpg 672w"
                                             sizes="(max-width: 336px) 100vw, 336px"/>
                                    </a>
                                    <h2 class="post-title">
                                        <a href="2017/01/08/on-the-go-pilot-sachtel-does-the-job-fearlessly-2-2/index.html">On
                                            the Go: Pilot Sachtel Does the Job Fearlessly</a>
                                    </h2>
                                    <div class="cf listing-meta meta below">
                                                <span class="meta-item author">
                                                    By <a href="author/trendy/index.html" title="Posts by Kate Hanson"
                                                          rel="author">Kate Hanson</a>
                                                </span>
                                        <time datetime="2017-01-08T02:32:37+00:00" class="meta-item">January 8,
                                            2017
                                        </time>
                                    </div>
                                    <div class="excerpt">
                                        <p>It is important to be chic. I love the 2000s because everyone started to
                                            love&hellip;</p>
                                    </div>
                                </article>
                            </div>
                            <div class="column half b-col">
                                <article
                                        class="highlights post-112 post type-post status-publish format-standard has-post-thumbnail category-business category-entertainment category-leisure category-opinion tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                                    <a href="2017/01/08/15-awesome-films-you-should-watch-on-a-first-date-2/index.html"
                                       title="15 Awesome Films You Should Watch On Every First Date"
                                       class="image-link">
                                        <img width="336" height="200"
                                             src="images/shutterstock_494151709-336x200.jpg"
                                             class="image wp-post-image" alt="shutterstock_494151709"
                                             title="15 Awesome Films You Should Watch On Every First Date"
                                             srcset="images/shutterstock_494151709-336x200.jpg 336w, images/shutterstock_494151709-336x200@2x.jpg 672w"
                                             sizes="(max-width: 336px) 100vw, 336px"/>
                                    </a>
                                    <h2 class="post-title">
                                        <a href="2017/01/08/15-awesome-films-you-should-watch-on-a-first-date-2/index.html">15
                                            Awesome Films You Should Watch On Every First Date</a>
                                    </h2>
                                    <div class="cf listing-meta meta below">
                                                <span class="meta-item author">
                                                    By <a href="author/trendy/index.html" title="Posts by Kate Hanson"
                                                          rel="author">Kate Hanson</a>
                                                </span>
                                        <time datetime="2017-01-08T02:32:37+00:00" class="meta-item">January 8,
                                            2017
                                        </time>
                                    </div>
                                    <div class="excerpt">
                                        <p>It is important to be chic. I love the 2000s because everyone started to
                                            love&hellip;</p>
                                    </div>
                                </article>
                            </div>
                            <div class="column half b-col">
                                <article
                                        class="highlights post-222 post type-post status-publish format-standard has-post-thumbnail category-entertainment category-leisure tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                                    <a href="2017/01/08/deleted-scene-footage-of-the-top-movie-dawn-of-justice-2/index.html"
                                       title="Deleted Scene: Footage of the Top Movie Dawn of Justice"
                                       class="image-link">
                                        <img width="336" height="200"
                                             src="images/shutterstock_362198879-336x200.jpg"
                                             class="image wp-post-image" alt="shutterstock_362198879"
                                             title="Deleted Scene: Footage of the Top Movie Dawn of Justice"
                                             srcset="images/shutterstock_362198879-336x200.jpg 336w, images/shutterstock_362198879-336x200@2x.jpg 672w"
                                             sizes="(max-width: 336px) 100vw, 336px"/>
                                    </a>
                                    <h2 class="post-title">
                                        <a href="2017/01/08/deleted-scene-footage-of-the-top-movie-dawn-of-justice-2/index.html">Deleted
                                            Scene: Footage of the Top Movie Dawn of Justice</a>
                                    </h2>
                                    <div class="cf listing-meta meta below">
                                                <span class="meta-item author">
                                                    By <a href="author/trendy/index.html" title="Posts by Kate Hanson"
                                                          rel="author">Kate Hanson</a>
                                                </span>
                                        <time datetime="2017-01-08T02:31:37+00:00" class="meta-item">January 8,
                                            2017
                                        </time>
                                    </div>
                                    <div class="excerpt">
                                        <p>It is important to be chic. I love the 2000s because everyone started to
                                            love&hellip;</p>
                                    </div>
                                </article>
                            </div>
                            <div class="column half b-col">
                                <article
                                        class="highlights post-56 post type-post status-publish format-standard has-post-thumbnail category-entertainment category-leisure tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                                    <a href="2017/01/08/superstar-instructors-swear-by-the-activewear-brand-2/index.html"
                                       title="Superstar Instructors Swear by the Activewear Brand"
                                       class="image-link">
                                        <img width="336" height="200"
                                             src="images/shutterstock_524272588-336x200.jpg"
                                             class="image wp-post-image" alt="shutterstock_524272588"
                                             title="Superstar Instructors Swear by the Activewear Brand"
                                             srcset="images/shutterstock_524272588-336x200.jpg 336w, images/shutterstock_524272588-336x200@2x.jpg 672w"
                                             sizes="(max-width: 336px) 100vw, 336px"/>
                                    </a>
                                    <h2 class="post-title">
                                        <a href="2017/01/08/superstar-instructors-swear-by-the-activewear-brand-2/index.html">Superstar
                                            Instructors Swear by the Activewear Brand</a>
                                    </h2>
                                    <div class="cf listing-meta meta below">
                                                <span class="meta-item author">
                                                    By <a href="author/trendy/index.html" title="Posts by Kate Hanson"
                                                          rel="author">Kate Hanson</a>
                                                </span>
                                        <time datetime="2017-01-08T02:30:37+00:00" class="meta-item">January 8,
                                            2017
                                        </time>
                                    </div>
                                    <div class="excerpt">
                                        <p>It is important to be chic. I love the 2000s because everyone started to
                                            love&hellip;</p>
                                    </div>
                                </article>
                            </div>
                            <div class="column half b-col">
                                <article
                                        class="highlights post-30 post type-post status-publish format-standard has-post-thumbnail category-entertainment category-leisure tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                                    <a href="2017/01/08/yes-it-is-our-new-fall-style-shrunk-and-tied-up/index.html"
                                       title="Yes It Is Our New Fall Style: Shrunk and Tied Up" class="image-link">
                                        <img width="336" height="200"
                                             src="images/shutterstock_485005621-336x200.jpg"
                                             class="image wp-post-image" alt="shutterstock_485005621"
                                             title="Yes It Is Our New Fall Style: Shrunk and Tied Up"
                                             srcset="images/shutterstock_485005621-336x200.jpg 336w, images/shutterstock_485005621-336x200@2x.jpg 672w"
                                             sizes="(max-width: 336px) 100vw, 336px"/>
                                    </a>
                                    <h2 class="post-title">
                                        <a href="2017/01/08/yes-it-is-our-new-fall-style-shrunk-and-tied-up/index.html">Yes
                                            It Is Our New Fall Style: Shrunk and Tied Up</a>
                                    </h2>
                                    <div class="cf listing-meta meta below">
                                                <span class="meta-item author">
                                                    By <a href="author/trendy/index.html" title="Posts by Kate Hanson"
                                                          rel="author">Kate Hanson</a>
                                                </span>
                                        <time datetime="2017-01-08T02:29:37+00:00" class="meta-item">January 8,
                                            2017
                                        </time>
                                    </div>
                                    <div class="excerpt">
                                        <p>
                                            It is important to be chic. I love the 2000s because everyone started to
                                            love&hellip;
                                        </p>
                                    </div>
                                </article>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="block-wrap blog" data-id="3">
                    <div class="block-head cat-text-11">
                        <h3 class="heading">
                            <a href="category/beauty/index.html">From Beauty</a>
                        </h3>
                    </div>
                    <div class="block-content">
                        <div class="row listing grid-overlay tall-overlay">
                            <div class="column one-third">
                                <article
                                        class="post-78 post type-post status-publish format-standard has-post-thumbnail category-beauty tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                                    <a href="2017/01/08/l-a-s-6-coolest-haircuts-how-to-style-them-in-shortest-time/index.html"
                                       class="image-link">
                                        <img width="233" height="300"
                                             src="images/18528837284_effa27b50a_o-233x300.jpg"
                                             class="image wp-post-image" alt="18528837284_effa27b50a_o"
                                             title="L.A.&#8217;s 6 Coolest Haircuts — &#038; How To Style Them In Shortest Time"
                                             srcset="images/18528837284_effa27b50a_o-233x300.jpg 233w, images/18528837284_effa27b50a_o.jpg 691w, images/18528837284_effa27b50a_o-233x300@2x.jpg 466w"
                                             sizes="(max-width: 233px) 100vw, 233px"/>
                                    </a>
                                    <div class="overlay">
                                        <h2 class="post-title">
                                            <a href="2017/01/08/l-a-s-6-coolest-haircuts-how-to-style-them-in-shortest-time/index.html"
                                               title="L.A.&#8217;s 6 Coolest Haircuts — &#038; How To Style Them In Shortest Time">L.A.&#8217;s
                                                6 Coolest Haircuts — &#038; How To Style Them In Shortest Time</a>
                                        </h2>
                                        <div class="cf listing-meta meta below">
                                            <time datetime="2017-01-08T02:18:37+00:00" class="meta-item">January 8,
                                                2017
                                            </time>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="column one-third">
                                <article
                                        class="post-82 post type-post status-publish format-standard has-post-thumbnail category-beauty tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                                    <a href="2017/01/08/wear-this-colorful-eye-look-to-your-next-party-be-awesome/index.html"
                                       class="image-link">
                                        <img width="233" height="300"
                                             src="images/FreeGreatPicture.com-26872-fashion-model-233x300.jpg"
                                             class="image wp-post-image"
                                             alt="FreeGreatPicture.com-26872-fashion-model"
                                             title="Wear This Colorful Eye Look To Your Next Party &#038; Be Awesome"
                                             srcset="images/FreeGreatPicture.com-26872-fashion-model-233x300.jpg 233w, images/FreeGreatPicture.com-26872-fashion-model-233x300@2x.jpg 466w"
                                             sizes="(max-width: 233px) 100vw, 233px"/>
                                    </a>
                                    <div class="overlay">
                                        <h2 class="post-title">
                                            <a href="2017/01/08/wear-this-colorful-eye-look-to-your-next-party-be-awesome/index.html"
                                               title="Wear This Colorful Eye Look To Your Next Party &#038; Be Awesome">Wear
                                                This Colorful Eye Look To Your Next Party &#038; Be Awesome</a>
                                        </h2>
                                        <div class="cf listing-meta meta below">
                                            <time datetime="2017-01-08T02:17:37+00:00" class="meta-item">January 8,
                                                2017
                                            </time>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            <div class="column one-third">
                                <article
                                        class="post-84 post type-post status-publish format-standard has-post-thumbnail category-beauty tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                                    <a href="2017/01/08/exclusive-jane-allure-shows-us-the-new-foam-dry-shampoo/index.html"
                                       class="image-link">
                                        <img width="233" height="300"
                                             src="images/1shutterstock_66981412-233x300.jpg"
                                             class="image wp-post-image" alt="1shutterstock_66981412"
                                             title="Exclusive: Jane Allure Shows Us The New Foam Dry Shampoo"
                                             srcset="images/1shutterstock_66981412-233x300.jpg 233w, images/1shutterstock_66981412-777x1000.jpg 777w, images/1shutterstock_66981412-233x300@2x.jpg 466w, images/1shutterstock_66981412-777x1000@2x.jpg 1554w"
                                             sizes="(max-width: 233px) 100vw, 233px"/>
                                    </a>
                                    <div class="overlay">
                                        <h2 class="post-title">
                                            <a href="2017/01/08/exclusive-jane-allure-shows-us-the-new-foam-dry-shampoo/index.html"
                                               title="Exclusive: Jane Allure Shows Us The New Foam Dry Shampoo">Exclusive:
                                                Jane Allure Shows Us The New Foam Dry Shampoo</a>
                                        </h2>
                                        <div class="cf listing-meta meta below">
                                            <time datetime="2017-01-08T02:16:37+00:00" class="meta-item">January 8,
                                                2017
                                            </time>
                                        </div>
                                    </div>
                                </article>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="block-wrap blog" data-id="4">
                    <div class="block-head cat-text-4">
                        <h3 class="heading"><a href="category/fashion/index.html">Latest Fashion</a></h3>
                    </div>
                    <div class="block-content">
                        <div class="posts-list listing-alt">
                            <article
                                    class="post-149 post type-post status-publish format-standard has-post-thumbnail category-fashion tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                                <div class="post-wrap"><a
                                        href="2017/01/08/fashion-chic-x-latest-mejuri-jewelry-collection-of-2017-2/index.html"
                                        class="image-link"><img width="312" height="198"
                                                                src="images/shutterstock_536935141-312x198.jpg"
                                                                class="attachment-list-block size-list-block wp-post-image"
                                                                alt="shutterstock_536935141"
                                                                title="Fashion Chic X Mejuri Jewelry Collection of 2017"
                                                                srcset="images/shutterstock_536935141-312x198.jpg 312w, images/shutterstock_536935141-163x102.jpg 163w, images/shutterstock_536935141-312x198@2x.jpg 624w, images/shutterstock_536935141-163x102@2x.jpg 326w"
                                                                sizes="(max-width: 312px) 100vw, 312px"/> </a>
                                    <div class="content"><a
                                            href="2017/01/08/fashion-chic-x-latest-mejuri-jewelry-collection-of-2017-2/index.html"
                                            class="post-title"> Fashion Chic X Mejuri Jewelry Collection of 2017</a>
                                        <div class="cf listing-meta meta below"><span class="meta-item author">By <a
                                                href="author/trendy/index.html" title="Posts by Kate Hanson"
                                                rel="author">Kate Hanson</a></span>
                                            <time datetime="2017-01-08T02:34:37+00:00" class="meta-item">January 8,
                                                2017
                                            </time>
                                        </div>
                                        <div class="excerpt"><p>It is important to be chic. I love the 2000s because
                                            everyone started to love haute couture. I always say: To be well dressed
                                            you must&hellip;</p></div>
                                    </div>
                                </div>
                            </article>
                            <article
                                    class="post-153 post type-post status-publish format-standard has-post-thumbnail category-fashion tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                                <div class="post-wrap"><a
                                        href="2017/01/08/trending-bodysuits-and-faded-friendship-jeans-2/index.html"
                                        class="image-link"><img width="312" height="198"
                                                                src="images/shutterstock_518581786-312x198.jpg"
                                                                class="attachment-list-block size-list-block wp-post-image"
                                                                alt="shutterstock_518581786"
                                                                title="Trending: Bodysuits and Faded Friendship Jeans"
                                                                srcset="images/shutterstock_518581786-312x198.jpg 312w, images/shutterstock_518581786-163x102.jpg 163w, images/shutterstock_518581786-312x198@2x.jpg 624w, images/shutterstock_518581786-163x102@2x.jpg 326w"
                                                                sizes="(max-width: 312px) 100vw, 312px"/> </a>
                                    <div class="content"><a
                                            href="2017/01/08/trending-bodysuits-and-faded-friendship-jeans-2/index.html"
                                            class="post-title"> Trending: Bodysuits and Faded Friendship Jeans</a>
                                        <div class="cf listing-meta meta below"><span class="meta-item author">By <a
                                                href="author/trendy/index.html" title="Posts by Kate Hanson"
                                                rel="author">Kate Hanson</a></span>
                                            <time datetime="2017-01-08T02:33:37+00:00" class="meta-item">January 8,
                                                2017
                                            </time>
                                        </div>
                                        <div class="excerpt"><p>It is important to be chic. I love the 2000s because
                                            everyone started to love haute couture. I always say: To be well dressed
                                            you must&hellip;</p></div>
                                    </div>
                                </div>
                            </article>
                            <article
                                    class="post-198 post type-post status-publish format-standard has-post-thumbnail category-fashion tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                                <div class="post-wrap"><a
                                        href="2017/01/08/summer-style-chunky-knit-for-leather-suits-2/index.html"
                                        class="image-link"><img width="312" height="198"
                                                                src="images/shutterstock_350007890-312x198.jpg"
                                                                class="attachment-list-block size-list-block wp-post-image"
                                                                alt="shutterstock_350007890"
                                                                title="Summer Style: Chunky Knit For Leather Suits"
                                                                srcset="images/shutterstock_350007890-312x198.jpg 312w, images/shutterstock_350007890-163x102.jpg 163w, images/shutterstock_350007890-312x198@2x.jpg 624w, images/shutterstock_350007890-163x102@2x.jpg 326w"
                                                                sizes="(max-width: 312px) 100vw, 312px"/> </a>
                                    <div class="content"><a
                                            href="2017/01/08/summer-style-chunky-knit-for-leather-suits-2/index.html"
                                            class="post-title"> Summer Style: Chunky Knit For Leather Suits</a>
                                        <div class="cf listing-meta meta below"><span class="meta-item author">By <a
                                                href="author/trendy/index.html" title="Posts by Kate Hanson"
                                                rel="author">Kate Hanson</a></span>
                                            <time datetime="2017-01-08T02:30:37+00:00" class="meta-item">January 8,
                                                2017
                                            </time>
                                        </div>
                                        <div class="excerpt"><p>It is important to be chic. I love the 2000s because
                                            everyone started to love haute couture. I always say: To be well dressed
                                            you must&hellip;</p></div>
                                    </div>
                                </div>
                            </article>
                            <article
                                    class="post-26 post type-post status-publish format-standard has-post-thumbnail category-fashion tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                                <div class="post-wrap">
                                    <a href="2017/01/08/love-in-style-for-the-proposal-of-timeless-relation/index.html"
                                       class="image-link"><img width="312" height="198"
                                                               src="images/pexels-photo-236287-312x198.jpg"
                                                               class="attachment-list-block size-list-block wp-post-image"
                                                               alt="pexels-photo-236287"
                                                               title="Love In Style For The Proposal of Timeless Relation"
                                                               srcset="images/pexels-photo-236287-312x198.jpg 312w, images/pexels-photo-236287-163x102.jpg 163w, images/pexels-photo-236287-312x198@2x.jpg 624w, images/pexels-photo-236287-163x102@2x.jpg 326w"
                                                               sizes="(max-width: 312px) 100vw, 312px"/> </a>
                                    <div class="content">
                                        <a href="2017/01/08/love-in-style-for-the-proposal-of-timeless-relation/index.html"
                                           class="post-title"> Love In Style For The Proposal of Timeless
                                            Relation</a>
                                        <div class="cf listing-meta meta below"><span class="meta-item author">By <a
                                                href="author/trendy/index.html" title="Posts by Kate Hanson"
                                                rel="author">Kate Hanson</a></span>
                                            <time datetime="2017-01-08T02:28:37+00:00" class="meta-item">January 8,
                                                2017
                                            </time>
                                        </div>
                                        <div class="excerpt">
                                            <p>It is important to be chic. I love the 2000s because everyone started
                                                to love haute couture. I always say: To be well dressed you
                                                must&hellip;</p>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <jsp:include page="sidebar.jsp"/>
    </div>
</div>

<script>// Preloaded sub-block content
var bunyad_preload = {"1":{"1":"<section class=\"block-wrap highlights highlights-b\" data-id=\"1\"> <div class=\"block-head\"><h3 class=\"heading\"><a href=\"http:\/\/localhost:8080\/Category\/asp_net\">Bài viết mới<\/a>    <\/h3><\/div><div class=\"block-content\"><div class=\"container cf\"><div class=\"large b-row cf\"><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/hairstyle-tips-tricks-from-designer-edition-2-2\" title=\"Hairstyle Tips & Tricks from Designer Edition\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_554776870.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/shutterstock_554776870.jpg\" title=\"Hairstyle Tips & Tricks from Designer Edition\" srcset=\"upload\/images\/shutterstock_554776870-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/hairstyle-tips-tricks-from-designer-edition-2-2\" title=\"Hairstyle Tips & Tricks from Designer Edition\">Hairstyle Tips & Tricks from Designer Edition<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" title=\"How to Refresh Your Purse Game in a Snap\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/pexels-photo-236287.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/pexels-photo-236287.jpg\" title=\"How to Refresh Your Purse Game in a Snap\" srcset=\"upload\/images\/pexels-photo-236287-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" title=\"How to Refresh Your Purse Game in a Snap\">How to Refresh Your Purse Game in a Snap<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><\/div><ul class=\"b-row posts-list thumb\"><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/pexels-photo-236287.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/pexels-photo-236287.jpg\" title=\"How to Refresh Your Purse Game in a Snap\" srcset=\"upload\/images\/pexels-photo-236287-104x69.jpg 104w, upload\/images\/pexels-photo-236287-300x200.jpg 300w, upload\/images\/pexels-photo-236287-1000x667.jpg 1000w, upload\/images\/pexels-photo-236287-702x459.jpg 702w, upload\/images\/pexels-photo-236287-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" title=\"How to Refresh Your Purse Game in a Snap\">How to Refresh Your Purse Game in a Snap<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/style-tips-from-top-designer-of-united-states\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/photo-1472850049317-a4983c094f5c.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/photo-1472850049317-a4983c094f5c.jpg\" title=\"Style Tips From Top Designer of United States\" srcset=\"upload\/images\/photo-1472850049317-a4983c094f5c-104x69.jpg 104w, upload\/images\/photo-1472850049317-a4983c094f5c-300x200.jpg 300w, upload\/images\/photo-1472850049317-a4983c094f5c-1000x667.jpg 1000w, upload\/images\/photo-1472850049317-a4983c094f5c-702x459.jpg 702w, upload\/images\/photo-1472850049317-a4983c094f5c-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/style-tips-from-top-designer-of-united-states\" title=\"Style Tips From Top Designer of United States\">Style Tips From Top Designer of United States<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_48352300.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/shutterstock_48352300.jpg\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" srcset=\"upload\/images\/shutterstock_48352300-104x69.jpg 104w, upload\/images\/shutterstock_48352300-300x200.jpg 300w, upload\/images\/shutterstock_48352300-1000x667.jpg 1000w, upload\/images\/shutterstock_48352300-702x459.jpg 702w, upload\/images\/shutterstock_48352300-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\">15 Creative Methods to Sharpen Your Interior Decor<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/not-into-showing-skin-youre-in-good-company\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/pexels-photo-169652.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/pexels-photo-169652.jpg\" title=\"Not Into Showing Skin? You're in Good Company\" srcset=\"upload\/images\/pexels-photo-169652-104x69.jpg 104w, upload\/images\/pexels-photo-169652-300x200.jpg 300w, upload\/images\/pexels-photo-169652-1000x667.jpg 1000w, upload\/images\/pexels-photo-169652-702x459.jpg 702w, upload\/images\/pexels-photo-169652-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/not-into-showing-skin-youre-in-good-company\" title=\"Not Into Showing Skin? You're in Good Company\">Not Into Showing Skin? You're in Good Company<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/an-update-for-the-top-puma-style-garments\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/StockSnap_HBI15KEJR3.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/StockSnap_HBI15KEJR3.jpg\" title=\"An Update for the Top Puma Style Garments\" srcset=\"upload\/images\/StockSnap_HBI15KEJR3-104x69.jpg 104w, upload\/images\/StockSnap_HBI15KEJR3-300x200.jpg 300w, upload\/images\/StockSnap_HBI15KEJR3-1000x667.jpg 1000w, upload\/images\/StockSnap_HBI15KEJR3-702x459.jpg 702w, upload\/images\/StockSnap_HBI15KEJR3-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/an-update-for-the-top-puma-style-garments\" title=\"An Update for the Top Puma Style Garments\">An Update for the Top Puma Style Garments<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/easy-boho-style-without-looking-like-a-coachella-victim\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_275843885.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/shutterstock_275843885.jpg\" title=\"Easy Boho Style: Without Looking Like a Coachella Victim\" srcset=\"upload\/images\/shutterstock_275843885-104x69.jpg 104w, upload\/images\/shutterstock_275843885-300x200.jpg 300w, upload\/images\/shutterstock_275843885-1000x667.jpg 1000w, upload\/images\/shutterstock_275843885-702x459.jpg 702w, upload\/images\/shutterstock_275843885-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/easy-boho-style-without-looking-like-a-coachella-victim\" title=\"Easy Boho Style: Without Looking Like a Coachella Victim\">Easy Boho Style: Without Looking Like a Coachella Victim<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/images\/shutterstock_494151709.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"images\/shutterstock_494151709.jpg\" title=\"Rachel Runs a Business by Her Own Set of Rules\" srcset=\"images\/shutterstock_494151709-104x69.jpg 104w, images\/shutterstock_494151709-300x200.jpg 300w, images\/shutterstock_494151709-1000x667.jpg 1000w, images\/shutterstock_494151709-702x459.jpg 702w, images\/shutterstock_494151709-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" title=\"Rachel Runs a Business by Her Own Set of Rules\">Rachel Runs a Business by Her Own Set of Rules<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><\/ul><\/div><\/div> <!-- .block-content --><\/section>","2":"<section class=\"block-wrap highlights highlights-b\" data-id=\"2\"> <div class=\"block-head\"><h3 class=\"heading\"><a href=\"http:\/\/localhost:8080\/Category\/android\">Bài viết mới<\/a>    <\/h3><\/div><div class=\"block-content\"><div class=\"container cf\"><div class=\"large b-row cf\"><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/hairstyle-tips-tricks-from-designer-edition-2-2\" title=\"Hairstyle Tips & Tricks from Designer Edition\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_554776870.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/shutterstock_554776870.jpg\" title=\"Hairstyle Tips & Tricks from Designer Edition\" srcset=\"upload\/images\/shutterstock_554776870-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/hairstyle-tips-tricks-from-designer-edition-2-2\" title=\"Hairstyle Tips & Tricks from Designer Edition\">Hairstyle Tips & Tricks from Designer Edition<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" title=\"How to Refresh Your Purse Game in a Snap\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/pexels-photo-236287.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/pexels-photo-236287.jpg\" title=\"How to Refresh Your Purse Game in a Snap\" srcset=\"upload\/images\/pexels-photo-236287-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" title=\"How to Refresh Your Purse Game in a Snap\">How to Refresh Your Purse Game in a Snap<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><\/div><ul class=\"b-row posts-list thumb\"><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/pexels-photo-236287.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/pexels-photo-236287.jpg\" title=\"How to Refresh Your Purse Game in a Snap\" srcset=\"upload\/images\/pexels-photo-236287-104x69.jpg 104w, upload\/images\/pexels-photo-236287-300x200.jpg 300w, upload\/images\/pexels-photo-236287-1000x667.jpg 1000w, upload\/images\/pexels-photo-236287-702x459.jpg 702w, upload\/images\/pexels-photo-236287-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" title=\"How to Refresh Your Purse Game in a Snap\">How to Refresh Your Purse Game in a Snap<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/style-tips-from-top-designer-of-united-states\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/photo-1472850049317-a4983c094f5c.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/photo-1472850049317-a4983c094f5c.jpg\" title=\"Style Tips From Top Designer of United States\" srcset=\"upload\/images\/photo-1472850049317-a4983c094f5c-104x69.jpg 104w, upload\/images\/photo-1472850049317-a4983c094f5c-300x200.jpg 300w, upload\/images\/photo-1472850049317-a4983c094f5c-1000x667.jpg 1000w, upload\/images\/photo-1472850049317-a4983c094f5c-702x459.jpg 702w, upload\/images\/photo-1472850049317-a4983c094f5c-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/style-tips-from-top-designer-of-united-states\" title=\"Style Tips From Top Designer of United States\">Style Tips From Top Designer of United States<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_48352300.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/shutterstock_48352300.jpg\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" srcset=\"upload\/images\/shutterstock_48352300-104x69.jpg 104w, upload\/images\/shutterstock_48352300-300x200.jpg 300w, upload\/images\/shutterstock_48352300-1000x667.jpg 1000w, upload\/images\/shutterstock_48352300-702x459.jpg 702w, upload\/images\/shutterstock_48352300-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\">15 Creative Methods to Sharpen Your Interior Decor<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/not-into-showing-skin-youre-in-good-company\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/pexels-photo-169652.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/pexels-photo-169652.jpg\" title=\"Not Into Showing Skin? You're in Good Company\" srcset=\"upload\/images\/pexels-photo-169652-104x69.jpg 104w, upload\/images\/pexels-photo-169652-300x200.jpg 300w, upload\/images\/pexels-photo-169652-1000x667.jpg 1000w, upload\/images\/pexels-photo-169652-702x459.jpg 702w, upload\/images\/pexels-photo-169652-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/not-into-showing-skin-youre-in-good-company\" title=\"Not Into Showing Skin? You're in Good Company\">Not Into Showing Skin? You're in Good Company<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/an-update-for-the-top-puma-style-garments\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/StockSnap_HBI15KEJR3.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/StockSnap_HBI15KEJR3.jpg\" title=\"An Update for the Top Puma Style Garments\" srcset=\"upload\/images\/StockSnap_HBI15KEJR3-104x69.jpg 104w, upload\/images\/StockSnap_HBI15KEJR3-300x200.jpg 300w, upload\/images\/StockSnap_HBI15KEJR3-1000x667.jpg 1000w, upload\/images\/StockSnap_HBI15KEJR3-702x459.jpg 702w, upload\/images\/StockSnap_HBI15KEJR3-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/an-update-for-the-top-puma-style-garments\" title=\"An Update for the Top Puma Style Garments\">An Update for the Top Puma Style Garments<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/images\/shutterstock_494151709.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"images\/shutterstock_494151709.jpg\" title=\"Rachel Runs a Business by Her Own Set of Rules\" srcset=\"images\/shutterstock_494151709-104x69.jpg 104w, images\/shutterstock_494151709-300x200.jpg 300w, images\/shutterstock_494151709-1000x667.jpg 1000w, images\/shutterstock_494151709-702x459.jpg 702w, images\/shutterstock_494151709-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" title=\"Rachel Runs a Business by Her Own Set of Rules\">Rachel Runs a Business by Her Own Set of Rules<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><\/ul><\/div><\/div> <!-- .block-content --><\/section>","3":"<section class=\"block-wrap highlights highlights-b\" data-id=\"3\"> <div class=\"block-head\"><h3 class=\"heading\"><a href=\"http:\/\/localhost:8080\/Category\/fashion\">Bài viết mới<\/a>    <\/h3><\/div><div class=\"block-content\"><div class=\"container cf\"><div class=\"large b-row cf\"><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/amazing-muffin-desserts-are-coming-back-this-year\" title=\"Amazing Muffin Desserts Are Coming Back This Year\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_364829048.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/shutterstock_364829048.jpg\" title=\"Amazing Muffin Desserts Are Coming Back This Year\" srcset=\"upload\/images\/shutterstock_364829048-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/amazing-muffin-desserts-are-coming-back-this-year\" title=\"Amazing Muffin Desserts Are Coming Back This Year\">Amazing Muffin Desserts Are Coming Back This Year<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_48352300.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/shutterstock_48352300.jpg\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" srcset=\"upload\/images\/shutterstock_48352300-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\">15 Creative Methods to Sharpen Your Interior Decor<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><\/div><ul class=\"b-row posts-list thumb\"><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_48352300.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/shutterstock_48352300.jpg\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" srcset=\"upload\/images\/shutterstock_48352300-104x69.jpg 104w, upload\/images\/shutterstock_48352300-300x200.jpg 300w, upload\/images\/shutterstock_48352300-1000x667.jpg 1000w, upload\/images\/shutterstock_48352300-702x459.jpg 702w, upload\/images\/shutterstock_48352300-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\">15 Creative Methods to Sharpen Your Interior Decor<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/not-into-showing-skin-youre-in-good-company\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/pexels-photo-169652.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/pexels-photo-169652.jpg\" title=\"Not Into Showing Skin? You're in Good Company\" srcset=\"upload\/images\/pexels-photo-169652-104x69.jpg 104w, upload\/images\/pexels-photo-169652-300x200.jpg 300w, upload\/images\/pexels-photo-169652-1000x667.jpg 1000w, upload\/images\/pexels-photo-169652-702x459.jpg 702w, upload\/images\/pexels-photo-169652-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/not-into-showing-skin-youre-in-good-company\" title=\"Not Into Showing Skin? You're in Good Company\">Not Into Showing Skin? You're in Good Company<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/images\/shutterstock_494151709.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"images\/shutterstock_494151709.jpg\" title=\"Rachel Runs a Business by Her Own Set of Rules\" srcset=\"images\/shutterstock_494151709-104x69.jpg 104w, images\/shutterstock_494151709-300x200.jpg 300w, images\/shutterstock_494151709-1000x667.jpg 1000w, images\/shutterstock_494151709-702x459.jpg 702w, images\/shutterstock_494151709-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" title=\"Rachel Runs a Business by Her Own Set of Rules\">Rachel Runs a Business by Her Own Set of Rules<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><\/ul><\/div><\/div> <!-- .block-content --><\/section>","4":"<section class=\"block-wrap highlights highlights-b\" data-id=\"4\"> <div class=\"block-head\"><h3 class=\"heading\"><a href=\"http:\/\/localhost:8080\/Category\/travel\">Bài viết mới<\/a>    <\/h3><\/div><div class=\"block-content\"><div class=\"container cf\"><div class=\"large b-row cf\"><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/amazing-muffin-desserts-are-coming-back-this-year\" title=\"Amazing Muffin Desserts Are Coming Back This Year\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_364829048.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/shutterstock_364829048.jpg\" title=\"Amazing Muffin Desserts Are Coming Back This Year\" srcset=\"upload\/images\/shutterstock_364829048-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/amazing-muffin-desserts-are-coming-back-this-year\" title=\"Amazing Muffin Desserts Are Coming Back This Year\">Amazing Muffin Desserts Are Coming Back This Year<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_48352300.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/shutterstock_48352300.jpg\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" srcset=\"upload\/images\/shutterstock_48352300-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\">15 Creative Methods to Sharpen Your Interior Decor<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><\/div><ul class=\"b-row posts-list thumb\"><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_48352300.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/shutterstock_48352300.jpg\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" srcset=\"upload\/images\/shutterstock_48352300-104x69.jpg 104w, upload\/images\/shutterstock_48352300-300x200.jpg 300w, upload\/images\/shutterstock_48352300-1000x667.jpg 1000w, upload\/images\/shutterstock_48352300-702x459.jpg 702w, upload\/images\/shutterstock_48352300-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\">15 Creative Methods to Sharpen Your Interior Decor<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/images\/shutterstock_494151709.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"images\/shutterstock_494151709.jpg\" title=\"Rachel Runs a Business by Her Own Set of Rules\" srcset=\"images\/shutterstock_494151709-104x69.jpg 104w, images\/shutterstock_494151709-300x200.jpg 300w, images\/shutterstock_494151709-1000x667.jpg 1000w, images\/shutterstock_494151709-702x459.jpg 702w, images\/shutterstock_494151709-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" title=\"Rachel Runs a Business by Her Own Set of Rules\">Rachel Runs a Business by Her Own Set of Rules<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><\/ul><\/div><\/div> <!-- .block-content --><\/section>"},"2":{"1":"<section class=\"block-wrap highlights highlights-b\" data-id=\"1\"> <div class=\"block-head\"><h3 class=\"heading\"><a href=\"http:\/\/localhost:8080\/Category\/asp_net\">Bài viết mới<\/a>    <\/h3><\/div><div class=\"block-content\"><div class=\"container cf\"><div class=\"large b-row cf\"><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/hairstyle-tips-tricks-from-designer-edition-2-2\" title=\"Hairstyle Tips & Tricks from Designer Edition\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_554776870.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/shutterstock_554776870.jpg\" title=\"Hairstyle Tips & Tricks from Designer Edition\" srcset=\"upload\/images\/shutterstock_554776870-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/hairstyle-tips-tricks-from-designer-edition-2-2\" title=\"Hairstyle Tips & Tricks from Designer Edition\">Hairstyle Tips & Tricks from Designer Edition<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" title=\"How to Refresh Your Purse Game in a Snap\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/pexels-photo-236287.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/pexels-photo-236287.jpg\" title=\"How to Refresh Your Purse Game in a Snap\" srcset=\"upload\/images\/pexels-photo-236287-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" title=\"How to Refresh Your Purse Game in a Snap\">How to Refresh Your Purse Game in a Snap<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><\/div><ul class=\"b-row posts-list thumb\"><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/pexels-photo-236287.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/pexels-photo-236287.jpg\" title=\"How to Refresh Your Purse Game in a Snap\" srcset=\"upload\/images\/pexels-photo-236287-104x69.jpg 104w, upload\/images\/pexels-photo-236287-300x200.jpg 300w, upload\/images\/pexels-photo-236287-1000x667.jpg 1000w, upload\/images\/pexels-photo-236287-702x459.jpg 702w, upload\/images\/pexels-photo-236287-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" title=\"How to Refresh Your Purse Game in a Snap\">How to Refresh Your Purse Game in a Snap<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/style-tips-from-top-designer-of-united-states\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/photo-1472850049317-a4983c094f5c.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/photo-1472850049317-a4983c094f5c.jpg\" title=\"Style Tips From Top Designer of United States\" srcset=\"upload\/images\/photo-1472850049317-a4983c094f5c-104x69.jpg 104w, upload\/images\/photo-1472850049317-a4983c094f5c-300x200.jpg 300w, upload\/images\/photo-1472850049317-a4983c094f5c-1000x667.jpg 1000w, upload\/images\/photo-1472850049317-a4983c094f5c-702x459.jpg 702w, upload\/images\/photo-1472850049317-a4983c094f5c-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/style-tips-from-top-designer-of-united-states\" title=\"Style Tips From Top Designer of United States\">Style Tips From Top Designer of United States<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_48352300.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/shutterstock_48352300.jpg\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" srcset=\"upload\/images\/shutterstock_48352300-104x69.jpg 104w, upload\/images\/shutterstock_48352300-300x200.jpg 300w, upload\/images\/shutterstock_48352300-1000x667.jpg 1000w, upload\/images\/shutterstock_48352300-702x459.jpg 702w, upload\/images\/shutterstock_48352300-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\">15 Creative Methods to Sharpen Your Interior Decor<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/not-into-showing-skin-youre-in-good-company\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/pexels-photo-169652.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/pexels-photo-169652.jpg\" title=\"Not Into Showing Skin? You're in Good Company\" srcset=\"upload\/images\/pexels-photo-169652-104x69.jpg 104w, upload\/images\/pexels-photo-169652-300x200.jpg 300w, upload\/images\/pexels-photo-169652-1000x667.jpg 1000w, upload\/images\/pexels-photo-169652-702x459.jpg 702w, upload\/images\/pexels-photo-169652-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/not-into-showing-skin-youre-in-good-company\" title=\"Not Into Showing Skin? You're in Good Company\">Not Into Showing Skin? You're in Good Company<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/an-update-for-the-top-puma-style-garments\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/StockSnap_HBI15KEJR3.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/StockSnap_HBI15KEJR3.jpg\" title=\"An Update for the Top Puma Style Garments\" srcset=\"upload\/images\/StockSnap_HBI15KEJR3-104x69.jpg 104w, upload\/images\/StockSnap_HBI15KEJR3-300x200.jpg 300w, upload\/images\/StockSnap_HBI15KEJR3-1000x667.jpg 1000w, upload\/images\/StockSnap_HBI15KEJR3-702x459.jpg 702w, upload\/images\/StockSnap_HBI15KEJR3-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/an-update-for-the-top-puma-style-garments\" title=\"An Update for the Top Puma Style Garments\">An Update for the Top Puma Style Garments<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/easy-boho-style-without-looking-like-a-coachella-victim\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_275843885.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/shutterstock_275843885.jpg\" title=\"Easy Boho Style: Without Looking Like a Coachella Victim\" srcset=\"upload\/images\/shutterstock_275843885-104x69.jpg 104w, upload\/images\/shutterstock_275843885-300x200.jpg 300w, upload\/images\/shutterstock_275843885-1000x667.jpg 1000w, upload\/images\/shutterstock_275843885-702x459.jpg 702w, upload\/images\/shutterstock_275843885-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/easy-boho-style-without-looking-like-a-coachella-victim\" title=\"Easy Boho Style: Without Looking Like a Coachella Victim\">Easy Boho Style: Without Looking Like a Coachella Victim<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/images\/shutterstock_494151709.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"images\/shutterstock_494151709.jpg\" title=\"Rachel Runs a Business by Her Own Set of Rules\" srcset=\"images\/shutterstock_494151709-104x69.jpg 104w, images\/shutterstock_494151709-300x200.jpg 300w, images\/shutterstock_494151709-1000x667.jpg 1000w, images\/shutterstock_494151709-702x459.jpg 702w, images\/shutterstock_494151709-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" title=\"Rachel Runs a Business by Her Own Set of Rules\">Rachel Runs a Business by Her Own Set of Rules<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><\/ul><\/div><\/div> <!-- .block-content --><\/section>","2":"<section class=\"block-wrap highlights highlights-b\" data-id=\"2\"> <div class=\"block-head\"><h3 class=\"heading\"><a href=\"http:\/\/localhost:8080\/Category\/android\">Bài viết mới<\/a>    <\/h3><\/div><div class=\"block-content\"><div class=\"container cf\"><div class=\"large b-row cf\"><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/hairstyle-tips-tricks-from-designer-edition-2-2\" title=\"Hairstyle Tips & Tricks from Designer Edition\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_554776870.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/shutterstock_554776870.jpg\" title=\"Hairstyle Tips & Tricks from Designer Edition\" srcset=\"upload\/images\/shutterstock_554776870-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/hairstyle-tips-tricks-from-designer-edition-2-2\" title=\"Hairstyle Tips & Tricks from Designer Edition\">Hairstyle Tips & Tricks from Designer Edition<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" title=\"How to Refresh Your Purse Game in a Snap\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/pexels-photo-236287.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/pexels-photo-236287.jpg\" title=\"How to Refresh Your Purse Game in a Snap\" srcset=\"upload\/images\/pexels-photo-236287-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" title=\"How to Refresh Your Purse Game in a Snap\">How to Refresh Your Purse Game in a Snap<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><\/div><ul class=\"b-row posts-list thumb\"><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/pexels-photo-236287.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/pexels-photo-236287.jpg\" title=\"How to Refresh Your Purse Game in a Snap\" srcset=\"upload\/images\/pexels-photo-236287-104x69.jpg 104w, upload\/images\/pexels-photo-236287-300x200.jpg 300w, upload\/images\/pexels-photo-236287-1000x667.jpg 1000w, upload\/images\/pexels-photo-236287-702x459.jpg 702w, upload\/images\/pexels-photo-236287-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/how-to-refresh-your-purse-game-in-a-snap\" title=\"How to Refresh Your Purse Game in a Snap\">How to Refresh Your Purse Game in a Snap<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/style-tips-from-top-designer-of-united-states\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/photo-1472850049317-a4983c094f5c.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/photo-1472850049317-a4983c094f5c.jpg\" title=\"Style Tips From Top Designer of United States\" srcset=\"upload\/images\/photo-1472850049317-a4983c094f5c-104x69.jpg 104w, upload\/images\/photo-1472850049317-a4983c094f5c-300x200.jpg 300w, upload\/images\/photo-1472850049317-a4983c094f5c-1000x667.jpg 1000w, upload\/images\/photo-1472850049317-a4983c094f5c-702x459.jpg 702w, upload\/images\/photo-1472850049317-a4983c094f5c-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/style-tips-from-top-designer-of-united-states\" title=\"Style Tips From Top Designer of United States\">Style Tips From Top Designer of United States<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_48352300.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/shutterstock_48352300.jpg\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" srcset=\"upload\/images\/shutterstock_48352300-104x69.jpg 104w, upload\/images\/shutterstock_48352300-300x200.jpg 300w, upload\/images\/shutterstock_48352300-1000x667.jpg 1000w, upload\/images\/shutterstock_48352300-702x459.jpg 702w, upload\/images\/shutterstock_48352300-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\">15 Creative Methods to Sharpen Your Interior Decor<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/not-into-showing-skin-youre-in-good-company\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/pexels-photo-169652.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/pexels-photo-169652.jpg\" title=\"Not Into Showing Skin? You're in Good Company\" srcset=\"upload\/images\/pexels-photo-169652-104x69.jpg 104w, upload\/images\/pexels-photo-169652-300x200.jpg 300w, upload\/images\/pexels-photo-169652-1000x667.jpg 1000w, upload\/images\/pexels-photo-169652-702x459.jpg 702w, upload\/images\/pexels-photo-169652-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/not-into-showing-skin-youre-in-good-company\" title=\"Not Into Showing Skin? You're in Good Company\">Not Into Showing Skin? You're in Good Company<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/an-update-for-the-top-puma-style-garments\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/StockSnap_HBI15KEJR3.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/StockSnap_HBI15KEJR3.jpg\" title=\"An Update for the Top Puma Style Garments\" srcset=\"upload\/images\/StockSnap_HBI15KEJR3-104x69.jpg 104w, upload\/images\/StockSnap_HBI15KEJR3-300x200.jpg 300w, upload\/images\/StockSnap_HBI15KEJR3-1000x667.jpg 1000w, upload\/images\/StockSnap_HBI15KEJR3-702x459.jpg 702w, upload\/images\/StockSnap_HBI15KEJR3-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/an-update-for-the-top-puma-style-garments\" title=\"An Update for the Top Puma Style Garments\">An Update for the Top Puma Style Garments<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/images\/shutterstock_494151709.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"images\/shutterstock_494151709.jpg\" title=\"Rachel Runs a Business by Her Own Set of Rules\" srcset=\"images\/shutterstock_494151709-104x69.jpg 104w, images\/shutterstock_494151709-300x200.jpg 300w, images\/shutterstock_494151709-1000x667.jpg 1000w, images\/shutterstock_494151709-702x459.jpg 702w, images\/shutterstock_494151709-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" title=\"Rachel Runs a Business by Her Own Set of Rules\">Rachel Runs a Business by Her Own Set of Rules<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><\/ul><\/div><\/div> <!-- .block-content --><\/section>","3":"<section class=\"block-wrap highlights highlights-b\" data-id=\"3\"> <div class=\"block-head\"><h3 class=\"heading\"><a href=\"http:\/\/localhost:8080\/Category\/fashion\">Bài viết mới<\/a>    <\/h3><\/div><div class=\"block-content\"><div class=\"container cf\"><div class=\"large b-row cf\"><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/amazing-muffin-desserts-are-coming-back-this-year\" title=\"Amazing Muffin Desserts Are Coming Back This Year\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_364829048.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/shutterstock_364829048.jpg\" title=\"Amazing Muffin Desserts Are Coming Back This Year\" srcset=\"upload\/images\/shutterstock_364829048-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/amazing-muffin-desserts-are-coming-back-this-year\" title=\"Amazing Muffin Desserts Are Coming Back This Year\">Amazing Muffin Desserts Are Coming Back This Year<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_48352300.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/shutterstock_48352300.jpg\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" srcset=\"upload\/images\/shutterstock_48352300-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\">15 Creative Methods to Sharpen Your Interior Decor<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><\/div><ul class=\"b-row posts-list thumb\"><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_48352300.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/shutterstock_48352300.jpg\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" srcset=\"upload\/images\/shutterstock_48352300-104x69.jpg 104w, upload\/images\/shutterstock_48352300-300x200.jpg 300w, upload\/images\/shutterstock_48352300-1000x667.jpg 1000w, upload\/images\/shutterstock_48352300-702x459.jpg 702w, upload\/images\/shutterstock_48352300-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\">15 Creative Methods to Sharpen Your Interior Decor<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/not-into-showing-skin-youre-in-good-company\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/pexels-photo-169652.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/pexels-photo-169652.jpg\" title=\"Not Into Showing Skin? You're in Good Company\" srcset=\"upload\/images\/pexels-photo-169652-104x69.jpg 104w, upload\/images\/pexels-photo-169652-300x200.jpg 300w, upload\/images\/pexels-photo-169652-1000x667.jpg 1000w, upload\/images\/pexels-photo-169652-702x459.jpg 702w, upload\/images\/pexels-photo-169652-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/not-into-showing-skin-youre-in-good-company\" title=\"Not Into Showing Skin? You're in Good Company\">Not Into Showing Skin? You're in Good Company<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/images\/shutterstock_494151709.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"images\/shutterstock_494151709.jpg\" title=\"Rachel Runs a Business by Her Own Set of Rules\" srcset=\"images\/shutterstock_494151709-104x69.jpg 104w, images\/shutterstock_494151709-300x200.jpg 300w, images\/shutterstock_494151709-1000x667.jpg 1000w, images\/shutterstock_494151709-702x459.jpg 702w, images\/shutterstock_494151709-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" title=\"Rachel Runs a Business by Her Own Set of Rules\">Rachel Runs a Business by Her Own Set of Rules<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><\/ul><\/div><\/div> <!-- .block-content --><\/section>","4":"<section class=\"block-wrap highlights highlights-b\" data-id=\"4\"> <div class=\"block-head\"><h3 class=\"heading\"><a href=\"http:\/\/localhost:8080\/Category\/travel\">Bài viết mới<\/a>    <\/h3><\/div><div class=\"block-content\"><div class=\"container cf\"><div class=\"large b-row cf\"><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/amazing-muffin-desserts-are-coming-back-this-year\" title=\"Amazing Muffin Desserts Are Coming Back This Year\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_364829048.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/shutterstock_364829048.jpg\" title=\"Amazing Muffin Desserts Are Coming Back This Year\" srcset=\"upload\/images\/shutterstock_364829048-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/amazing-muffin-desserts-are-coming-back-this-year\" title=\"Amazing Muffin Desserts Are Coming Back This Year\">Amazing Muffin Desserts Are Coming Back This Year<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><div class=\"column half b-col\"><article><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" class=\"image-link\"><img width=\"336\" height=\"200\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_48352300.jpg\" class=\"image wp-post-image\" alt=\"upload\/images\/shutterstock_48352300.jpg\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" srcset=\"upload\/images\/shutterstock_48352300-336x200.jpg 336w\" sizes=\"(max-width: 336px) 100vw, 336px\"\/><\/a><h2 class=\"post-title\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\">15 Creative Methods to Sharpen Your Interior Decor<\/a><\/h2><div class=\"cf listing-meta meta below\"><span class=\"meta-item author\">Bởi <a href=\"http:\/\/localhost:8080\/user\" title=\"Posts by Kate Hanson\" rel=\"author\">Kate Hanson<\/a><\/span><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><div class=\"excerpt\"><p>It is important to be chic. I love the 2000s becau...<\/p><\/div><\/article><\/div><\/div><ul class=\"b-row posts-list thumb\"><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/upload\/images\/shutterstock_48352300.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"upload\/images\/shutterstock_48352300.jpg\" title=\"15 Creative Methods to Sharpen Your Interior Decor\" srcset=\"upload\/images\/shutterstock_48352300-104x69.jpg 104w, upload\/images\/shutterstock_48352300-300x200.jpg 300w, upload\/images\/shutterstock_48352300-1000x667.jpg 1000w, upload\/images\/shutterstock_48352300-702x459.jpg 702w, upload\/images\/shutterstock_48352300-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/15-creative-methods-to-sharpen-your-interior-decor\" title=\"15 Creative Methods to Sharpen Your Interior Decor\">15 Creative Methods to Sharpen Your Interior Decor<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><li class=\"column half b-col\"><article class=\"post cf\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" class=\"image-link\"> <img width=\"104\" height=\"69\" src=\"http:\/\/localhost:8080\/images\/shutterstock_494151709.jpg\" class=\"attachment-post-thumbnail size-post-thumbnail wp-post-image\" alt=\"images\/shutterstock_494151709.jpg\" title=\"Rachel Runs a Business by Her Own Set of Rules\" srcset=\"images\/shutterstock_494151709-104x69.jpg 104w, images\/shutterstock_494151709-300x200.jpg 300w, images\/shutterstock_494151709-1000x667.jpg 1000w, images\/shutterstock_494151709-702x459.jpg 702w, images\/shutterstock_494151709-214x140.jpg 214w\" sizes=\"(max-width: 104px) 100vw, 104px\"\/><\/a> <div class=\"content\"><a href=\"http:\/\/localhost:8080\/post\/rachel-runs-a-business-by-her-own-set-of-rules-1\" title=\"Rachel Runs a Business by Her Own Set of Rules\">Rachel Runs a Business by Her Own Set of Rules<\/a><div class=\"cf listing-meta below\"><time datetime=\"2018-11-26\" class=\"meta-item\">2018-11-26<\/time><\/div><\/div><\/article><\/li><\/ul><\/div><\/div> <!-- .block-content --><\/section>"}};</script>