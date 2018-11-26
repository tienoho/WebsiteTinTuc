<%@ page import="vn.haui.web.command.PostDao" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 26/11/2018
  Time: 1:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    PostDao postDao=new PostDao();
    
    String category_id = "";
    if(request.getParameter("category")!=null){
        category_id = request.getParameter("category");
    }
%>
<jsp:include page="header.jsp"/>
<div class="breadcrumbs-wrap">
    <div class="wrap">
        <div class="breadcrumbs"><span class="location">You are at:</span>
            <span itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a
                    itemprop="url" href="../../index.html">
                <span itemprop="title">Home</span>
            </a>
            </span>
            <span class="delim"> </span>
            <span class="current">Category: "Business"</span>
        </div>
    </div>
</div>
<div class="main wrap cf">
    <div class="row">
        <div class="col-8 main-content">
            <h2 class="main-heading">Chuyên đề: <strong>Business</strong></h2>
            <div class="posts-list listing-alt">

                <article class="post-114 post type-post status-publish format-standard has-post-thumbnail category-business category-lifestyle tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                    <div class="post-wrap">
                        <a href="" class="image-link">
                            <img width="312" height="198"
                                 src="images/shutterstock_485005621-312x198.jpg"
                                 class="attachment-list-block size-list-block wp-post-image"
                                 alt="shutterstock_485005621"
                                 title="Rachel Runs a Business by Her Own Set of Rules"
                                 srcset="images/shutterstock_485005621-312x198.jpg 312w, images/shutterstock_485005621-163x102.jpg 163w"
                                 sizes="(max-width: 312px) 100vw, 312px"/> </a>
                        <div class="content">
                            <a href="../../2017/01/10/rachel-runs-a-business-by-her-own-set-of-rules/index.html"
                                class="post-title"> Rachel Runs a Business by Her Own Set of Rules</a>
                            <div class="cf listing-meta meta below"><span class="meta-item author">By <a
                                    href="../../author/trendy/index.html" title="Posts by Kate Hanson" rel="author">Kate Hanson</a></span>
                                <time datetime="2017-01-10T02:32:37+00:00" class="meta-item">January 10, 2017</time>
                            </div>
                            <div class="excerpt">
                            <%--content--%>
                            </div>
                        </div>
                    </div>
                </article>
                <article class="post-112 post type-post status-publish format-standard has-post-thumbnail category-business category-entertainment category-leisure category-opinion tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                    <div class="post-wrap"><a
                            href="../../2017/01/08/15-awesome-films-you-should-watch-on-a-first-date-2/index.html"
                            class="image-link"><img width="312" height="198"
                                                    src="images/shutterstock_494151709-312x198.jpg"
                                                    class="attachment-list-block size-list-block wp-post-image"
                                                    alt="shutterstock_494151709"
                                                    title="15 Awesome Films You Should Watch On Every First Date"
                                                    srcset="images/shutterstock_494151709-312x198.jpg 312w, images/shutterstock_494151709-163x102.jpg 163w"
                                                    sizes="(max-width: 312px) 100vw, 312px"/> </a>
                        <div class="content"><a
                                href="../../2017/01/08/15-awesome-films-you-should-watch-on-a-first-date-2/index.html"
                                class="post-title"> 15 Awesome Films You Should Watch On Every First Date</a>
                            <div class="cf listing-meta meta below"><span class="meta-item author">By <a
                                    href="../../author/trendy/index.html" title="Posts by Kate Hanson" rel="author">Kate Hanson</a></span>
                                <time datetime="2017-01-08T02:32:37+00:00" class="meta-item">January 8, 2017</time>
                            </div>
                            <div class="excerpt"><p>It is important to be chic. I love the 2000s because everyone
                                started to love haute couture. I always say: To be well dressed you must&hellip;</p>
                            </div>
                        </div>
                    </div>
                </article>
                <article
                        class="post-134 post type-post status-publish format-standard has-post-thumbnail category-business category-fashion category-opinion">
                    <div class="post-wrap"><a
                            href="../../2017/01/06/hairstyle-tips-tricks-from-designer-edition-2/index.html"
                            class="image-link"><img width="312" height="198"
                                                    src="images/shutterstock_349627691-312x198.jpg"
                                                    class="attachment-list-block size-list-block wp-post-image"
                                                    alt="shutterstock_349627691"
                                                    title="Relaxing in the Bed Has a New Meaning Now"
                                                    srcset="images/shutterstock_349627691-312x198.jpg 312w, images/shutterstock_349627691-163x102.jpg 163w"
                                                    sizes="(max-width: 312px) 100vw, 312px"/> </a>
                        <div class="content"><a
                                href="../../2017/01/06/hairstyle-tips-tricks-from-designer-edition-2/index.html"
                                class="post-title"> Relaxing in the Bed Has a New Meaning Now</a>
                            <div class="cf listing-meta meta below"><span class="meta-item author">By <a
                                    href="../../author/trendy/index.html" title="Posts by Kate Hanson" rel="author">Kate Hanson</a></span>
                                <time datetime="2017-01-06T02:15:37+00:00" class="meta-item">January 6, 2017</time>
                            </div>
                            <div class="excerpt"><p>It is important to be chic. I love the 2000s because everyone
                                started to love haute couture. I always say: To be well dressed you must&hellip;</p>
                            </div>
                        </div>
                    </div>
                </article>
                <article
                        class="post-250 post type-post status-publish format-standard has-post-thumbnail category-beauty category-business category-celebrities category-fitness category-leisure category-lifestyle category-opinion category-picks category-travel">
                    <div class="post-wrap"><a
                            href="../../2017/01/06/hairstyle-tips-tricks-from-designer-edition-2-2/index.html"
                            class="image-link"><img width="312" height="198"
                                                    src="images/shutterstock_554776870-312x198.jpg"
                                                    class="attachment-list-block size-list-block wp-post-image"
                                                    alt="shutterstock_554776870"
                                                    title="Hairstyle Tips &#038; Tricks from Designer Edition"
                                                    srcset="images/shutterstock_554776870-312x198.jpg 312w, images/shutterstock_554776870-163x102.jpg 163w"
                                                    sizes="(max-width: 312px) 100vw, 312px"/> </a>
                        <div class="content"><a
                                href="../../2017/01/06/hairstyle-tips-tricks-from-designer-edition-2-2/index.html"
                                class="post-title"> Hairstyle Tips &#038; Tricks from Designer Edition</a>
                            <div class="cf listing-meta meta below"><span class="meta-item author">By <a
                                    href="../../author/trendy/index.html" title="Posts by Kate Hanson" rel="author">Kate Hanson</a></span>
                                <time datetime="2017-01-06T02:15:37+00:00" class="meta-item">January 6, 2017</time>
                            </div>
                            <div class="excerpt"><p>It is important to be chic. I love the 2000s because everyone
                                started to love haute couture. I always say: To be well dressed you must&hellip;</p>
                            </div>
                        </div>
                    </div>
                </article>
                <article
                        class="post-15 post type-post status-publish format-standard has-post-thumbnail category-beauty category-business category-celebrities category-fitness category-leisure category-lifestyle category-opinion category-picks category-travel">
                    <div class="post-wrap"><a
                            href="../../2017/01/06/tom-explains-why-trendy-clothing-is-in-style/index.html"
                            class="image-link"><img width="312" height="198"
                                                    src="images/woman-1209592_1920-312x198.jpg"
                                                    class="attachment-list-block size-list-block wp-post-image"
                                                    alt="woman-1209592_1920"
                                                    title="Tom explains why Trendy Clothing is in style"
                                                    srcset="images/woman-1209592_1920-312x198.jpg 312w, images/woman-1209592_1920-163x102.jpg 163w"
                                                    sizes="(max-width: 312px) 100vw, 312px"/> </a>
                        <div class="content"><a
                                href="../../2017/01/06/tom-explains-why-trendy-clothing-is-in-style/index.html"
                                class="post-title"> Tom explains why Trendy Clothing is in style</a>
                            <div class="cf listing-meta meta below"><span class="meta-item author">By <a
                                    href="../../author/trendy/index.html" title="Posts by Kate Hanson" rel="author">Kate Hanson</a></span>
                                <time datetime="2017-01-06T02:13:37+00:00" class="meta-item">January 6, 2017</time>
                            </div>
                            <div class="excerpt"><p>It is important to be chic. I love the 2000s because everyone
                                started to love haute couture. I always say: To be well dressed you must&hellip;</p>
                            </div>
                        </div>
                    </div>
                </article>
                <article
                        class="post-140 post type-post status-publish format-standard has-post-thumbnail category-beauty category-business category-celebrities category-fitness category-leisure category-lifestyle category-opinion category-picks category-travel">
                    <div class="post-wrap"><a
                            href="../../2017/01/06/15-instagram-trends-you-should-follow-today-2/index.html"
                            class="image-link"><img width="312" height="198"
                                                    src="images/shutterstock_358043111-312x198.jpg"
                                                    class="attachment-list-block size-list-block wp-post-image"
                                                    alt="shutterstock_358043111"
                                                    title="15 Instagram Trends You Should Follow Today"
                                                    srcset="images/shutterstock_358043111-312x198.jpg 312w, images/shutterstock_358043111-163x102.jpg 163w"
                                                    sizes="(max-width: 312px) 100vw, 312px"/> </a>
                        <div class="content"><a
                                href="../../2017/01/06/15-instagram-trends-you-should-follow-today-2/index.html"
                                class="post-title"> 15 Instagram Trends You Should Follow Today</a>
                            <div class="cf listing-meta meta below"><span class="meta-item author">By <a
                                    href="../../author/trendy/index.html" title="Posts by Kate Hanson" rel="author">Kate Hanson</a></span>
                                <time datetime="2017-01-06T02:11:37+00:00" class="meta-item">January 6, 2017</time>
                            </div>
                            <div class="excerpt"><p>It is important to be chic. I love the 2000s because everyone
                                started to love haute couture. I always say: To be well dressed you must&hellip;</p>
                            </div>
                        </div>
                    </div>
                </article>
                <article
                        class="post-231 post type-post status-publish format-standard has-post-thumbnail category-beauty category-business category-celebrities category-fitness category-leisure category-lifestyle category-opinion category-picks category-travel">
                    <div class="post-wrap"><a
                            href="../../2017/01/06/things-to-let-go-now-for-a-healthy-new-year-5/index.html"
                            class="image-link"><img width="312" height="198"
                                                    src="images/shutterstock_530536855-312x198.jpg"
                                                    class="attachment-list-block size-list-block wp-post-image"
                                                    alt="shutterstock_530536855"
                                                    title="Things to Let Go Now for a Healthy New Year"
                                                    srcset="images/shutterstock_530536855-312x198.jpg 312w, images/shutterstock_530536855-163x102.jpg 163w"
                                                    sizes="(max-width: 312px) 100vw, 312px"/> </a>
                        <div class="content"><a
                                href="../../2017/01/06/things-to-let-go-now-for-a-healthy-new-year-5/index.html"
                                class="post-title"> Things to Let Go Now for a Healthy New Year</a>
                            <div class="cf listing-meta meta below"><span class="meta-item author">By <a
                                    href="../../author/trendy/index.html" title="Posts by Kate Hanson" rel="author">Kate Hanson</a></span>
                                <time datetime="2017-01-06T02:11:37+00:00" class="meta-item">January 6, 2017</time>
                            </div>
                            <div class="excerpt"><p>It is important to be chic. I love the 2000s because everyone
                                started to love haute couture. I always say: To be well dressed you must&hellip;</p>
                            </div>
                        </div>
                    </div>
                </article>
                <article
                        class="post-229 post type-post status-publish format-standard has-post-thumbnail category-beauty category-business category-celebrities category-fitness category-leisure category-lifestyle category-opinion category-travel">
                    <div class="post-wrap"><a
                            href="../../2017/01/06/make-it-your-style-with-the-sporty-red-trend/index.html"
                            class="image-link"><img width="312" height="198"
                                                    src="images/6430542715_6f437a651c_o-312x198.jpg"
                                                    class="attachment-list-block size-list-block wp-post-image"
                                                    alt="6430542715_6f437a651c_o"
                                                    title="Make It Your Style With the Sporty Red Trend"
                                                    srcset="images/6430542715_6f437a651c_o-312x198.jpg 312w, images/6430542715_6f437a651c_o-163x102.jpg 163w"
                                                    sizes="(max-width: 312px) 100vw, 312px"/> </a>
                        <div class="content">
                            <a
                                    href="../../2017/01/06/make-it-your-style-with-the-sporty-red-trend/index.html"
                                    class="post-title"> Make It Your Style With the Sporty Red Trend</a>
                            <div class="cf listing-meta meta below"><span class="meta-item author">By <a
                                    href="../../author/trendy/index.html" title="Posts by Kate Hanson" rel="author">Kate Hanson</a></span>
                                <time datetime="2017-01-06T02:10:37+00:00" class="meta-item">January 6, 2017</time>
                            </div>
                            <div class="excerpt">
                                <p>It is important to be chic. I love the 2000s because everyone
                                    started to love haute couture. I always say: To be well dressed you must&hellip;</p>
                            </div>
                        </div>
                    </div>
                </article>
                <article
                        class="post-137 post type-post status-publish format-video has-post-thumbnail category-beauty category-business category-celebrities category-fitness category-leisure category-lifestyle category-opinion category-travel post_format-post-format-video">
                    <div class="post-wrap"><a
                            href="../../2017/01/06/gadget-are-causing-an-effect-known-as-fomo/index.html"
                            class="image-link">
                        <img width="312" height="198"
                             src="images/editorial-image-for-a-girl-drinking-from-a-cup-312x198.jpg"
                             class="attachment-list-block size-list-block wp-post-image"
                             alt="editorial-image-for-a-girl-drinking-from-a-cup"
                             title="Gadget are Causing an Effect Known as FOMO"
                             srcset="images/editorial-image-for-a-girl-drinking-from-a-cup-312x198.jpg 312w, images/editorial-image-for-a-girl-drinking-from-a-cup-163x102.jpg 163w"
                             sizes="(max-width: 312px) 100vw, 312px"/> </a>
                        <div class="content"><a
                                href="../../2017/01/06/gadget-are-causing-an-effect-known-as-fomo/index.html"
                                class="post-title"> Gadget are Causing an Effect Known as FOMO</a>
                            <div class="cf listing-meta meta below"><span class="meta-item author">By <a
                                    href="../../author/trendy/index.html" title="Posts by Kate Hanson" rel="author">Kate Hanson</a></span>
                                <time datetime="2017-01-06T02:09:37+00:00" class="meta-item">January 6, 2017</time>
                            </div>
                            <div class="excerpt"><p>It is important to be chic. I love the 2000s because everyone
                                started to love haute couture. I always say: To be well dressed you must&hellip;</p>
                            </div>
                        </div>
                    </div>
                </article>
                <article
                        class="post-225 post type-post status-publish format-gallery has-post-thumbnail category-beauty category-business category-celebrities category-fitness category-leisure category-lifestyle category-opinion category-picks category-travel post_format-post-format-gallery">
                    <div class="post-wrap">
                        <a href="../../2017/01/06/things-to-let-go-now-for-a-healthy-new-year-2/index.html"
                           class="image-link"><img width="312" height="198"
                                                   src="images/shutterstock_311271686-312x198.jpg"
                                                   class="attachment-list-block size-list-block wp-post-image"
                                                   alt="shutterstock_311271686"
                                                   title="Your Favorite Pizzeria May Not Use Organic"
                                                   srcset="images/shutterstock_311271686-312x198.jpg 312w, images/shutterstock_311271686-163x102.jpg 163w"
                                                   sizes="(max-width: 312px) 100vw, 312px"/> </a>
                        <div class="content"><a
                                href="../../2017/01/06/things-to-let-go-now-for-a-healthy-new-year-2/index.html"
                                class="post-title"> Your Favorite Pizzeria May Not Use Organic</a>
                            <div class="cf listing-meta meta below"><span class="meta-item author">By <a
                                    href="../../author/trendy/index.html" title="Posts by Kate Hanson" rel="author">Kate Hanson</a></span>
                                <time datetime="2017-01-06T02:09:37+00:00" class="meta-item">January 6, 2017</time>
                            </div>
                            <div class="excerpt"><p>It is important to be chic. I love the 2000s because everyone
                                started to love haute couture. I always say: To be well dressed you must&hellip;</p>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
            <div class="main-pagination"><span class='page-numbers current'>1</span>
                <a class='page-numbers' href='page/2/index.html'>2</a>
                <a class="next page-numbers" href="page/2/index.html">
                    <span class="visuallyhidden">Next</span>
                    <i class="fa fa-angle-right"></i>
                </a>
            </div>
        </div>
        <jsp:include page="sidebar-post.jsp"/>
    </div>
</div>
<jsp:include page="footer.jsp"/>