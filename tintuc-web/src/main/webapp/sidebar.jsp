<%@ page import="vn.haui.web.model.Post" %>
<%@ page import="vn.haui.web.command.PostDao" %>
<%@ page import="vn.haui.web.common.WebConstant" %>
<%@ page import="vn.haui.web.model.Users" %>
<%@ page import="vn.haui.web.command.UsersDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<%
    PostDao postDao=new PostDao();
    UsersDao usersDao=new UsersDao();
%>

<aside class="col-4 sidebar" data-sticky="1">
    <div class="theiaStickySidebar">
        <ul>
            <li id="bunyad-latest-posts-widget-3" class="widget latest-posts">
                <h3 class="widgettitle">Xem nhiều nhất</h3>
                <ul class="posts-list">
                    <%for(Post pView:postDao.getListInPostView(WebConstant.postView)){
                        String extendsImgNew = pView.getPostImg();
                        if (extendsImgNew.contains(".")) {
                            extendsImgNew = extendsImgNew.substring(extendsImgNew.lastIndexOf("."), extendsImgNew.length());
                        }
                    %>
                    <li><a href="<%=WebConstant.getLocalHost()+"/post/"+pView.getPostSlug()%>">
                            <img width="104" height="69" src="<%=WebConstant.getLocalHost()%>/<%=pView.getPostImg().replace(extendsImgNew,"-104x69"+extendsImgNew)%>"
                                 class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
                                 alt="<%=pView.getPostImg()%>"
                                 title="<%=pView.getPostTitle()%>"
                                 srcset="<%=WebConstant.getLocalHost()%>/<%=pView.getPostImg().replace(extendsImgNew,"-104x69"+extendsImgNew)%> 104w, <%=WebConstant.getLocalHost()%>/<%=pView.getPostImg().replace(extendsImgNew,"-300x200"+extendsImgNew)%> 300w, <%=WebConstant.getLocalHost()%>/<%=pView.getPostImg().replace(extendsImgNew,"-1000x667"+extendsImgNew)%> 1000w, <%=WebConstant.getLocalHost()%>/<%=pView.getPostImg().replace(extendsImgNew,"-702x459"+extendsImgNew)%> 702w, <%=WebConstant.getLocalHost()%>/<%=pView.getPostImg().replace(extendsImgNew,"-214x140"+extendsImgNew)%> 214w"
                                 sizes="(max-width: 104px) 100vw, 104px"/>
                        </a>
                        <div class="content">
                            <a href="<%=WebConstant.getLocalHost()+"/post/"+pView.getPostSlug()%>"
                               title="<%=pView.getPostTitle()%>"><%=pView.getPostTitle()%></a>
                            <div class="cf listing-meta meta below">
                                <time datetime="<%=pView.getPostDate()%>" class="meta-item"><%=pView.getPostDate()%></time>
                            </div>
                        </div>
                    </li>
                <%}%>
                </ul>
            </li>
            <li id="bunyad-social-2" class="widget widget-social">
                <ul class="social-follow" itemscope itemtype="http://schema.org/Organization">
                    <link itemprop="url" href="${root}">
                    <li class="service">
                        <a href="https://facebook.com/" class="service-link facebook cf"
                           target="_blank" itemprop="sameAs">
                            <i class="icon fa fa-facebook-square"></i>
                            <span class="label">Like on Facebook</span>
                            <span class="count">970</span>
                        </a>
                    </li>
                    <li class="service">
                        <a href="https://twitter.com/" class="service-link twitter cf" target="_blank"
                           itemprop="sameAs">
                            <i class="icon fa fa-twitter"></i>
                            <span class="label">Follow on Twitter</span>
                            <span class="count">65.7K</span>
                        </a>
                    </li>
                    <li class="service">
                        <a href="https://plus.google.com/" class="service-link gplus cf"
                           target="_blank" itemprop="sameAs">
                            <i class="icon fa fa-google-plus"></i>
                            <span class="label">Follow on Google+</span>
                        </a>
                    </li>
                    <li class="service">
                        <a href="https://instagram.com/" class="service-link instagram cf"
                           target="_blank" itemprop="sameAs">
                            <i class="icon fa fa-instagram"></i>
                            <span class="label">Follow on Instagram</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li id="bunyad-blocks-widget-2" class="widget page-blocks">
                <h3 class="widgettitle">Latest Fun</h3>
                <section class="block-wrap highlights" data-id="5">
                    <div class="highlights">
                        <article>
                            <a href=""
                               title="Summer Style: Chunky Knit For Leather Suits" class="image-link">
                                <img width="336" height="200"
                                     src="${root}/images/shutterstock_350007890-336x200.jpg"
                                     class="image wp-post-image" alt="shutterstock_350007890"
                                     title="Summer Style: Chunky Knit For Leather Suits"
                                     srcset="${root}/images/shutterstock_350007890-336x200.jpg 336w, ${root}/images/shutterstock_350007890-336x200@2x.jpg 672w"
                                     sizes="(max-width: 336px) 100vw, 336px"/>
                            </a>
                            <h2 class="post-title">
                                <a href=""
                                   title="Summer Style: Chunky Knit For Leather Suits">Summer Style: Chunky
                                    Knit For Leather Suits</a>
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
                        <ul class="block posts-list thumb">
                            <li>
                                <a href="">
                                    <img width="104" height="69" src="${root}/images/pexels-photo-236287-104x69.jpg"
                                         class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
                                         alt="pexels-photo-236287"
                                         title="Love In Style For The Proposal of Timeless Relation"
                                         srcset="${root}/images/pexels-photo-236287-104x69.jpg 104w, ${root}/images/pexels-photo-236287-300x200.jpg 300w, ${root}/images/pexels-photo-236287-1000x667.jpg 1000w, ${root}/images/pexels-photo-236287-702x459.jpg 702w, ${root}/images/pexels-photo-236287-214x140.jpg 214w"
                                         sizes="(max-width: 104px) 100vw, 104px"/>
                                </a>
                                <div class="content">
                                    <a href="">Love
                                        In Style For The Proposal of Timeless Relation</a>
                                    <div class="cf listing-meta below">
                                        <time datetime="2017-01-08T02:28:37+00:00" class="meta-item">January
                                            8, 2017
                                        </time>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="">
                                    <img width="104" height="69"
                                         src="${root}/images/shutterstock_303461690-1-104x69.jpg"
                                         class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
                                         alt="shutterstock_303461690"
                                         title="Annie Ziegler to Wear the Designer Favorite Clothes at Oscars"
                                         srcset="${root}/images/shutterstock_303461690-1-104x69.jpg 104w, ${root}/images/shutterstock_303461690-1-300x200.jpg 300w, ${root}/images/shutterstock_303461690-1-1000x667.jpg 1000w, ${root}/images/shutterstock_303461690-1-702x459.jpg 702w, ${root}/images/shutterstock_303461690-1-214x140.jpg 214w"
                                         sizes="(max-width: 104px) 100vw, 104px"/>
                                </a>
                                <div class="content">
                                    <a href="">Annie
                                        Ziegler to Wear the Designer Favorite Clothes at Oscars</a>
                                    <div class="cf listing-meta below">
                                        <time datetime="2017-01-08T02:25:37+00:00" class="meta-item">January
                                            8, 2017
                                        </time>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <a href="">
                                    <img width="104" height="69"
                                         src="${root}/images/shutterstock_370070387-1-104x69.jpg"
                                         class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
                                         alt="shutterstock_370070387"
                                         title="American Street Style is Taking Over in 2017"
                                         srcset="${root}/images/shutterstock_370070387-1-104x69.jpg 104w, ${root}/images/shutterstock_370070387-1-702x459.jpg 702w, ${root}/images/shutterstock_370070387-1-214x140.jpg 214w"
                                         sizes="(max-width: 104px) 100vw, 104px"/>
                                </a>
                                <div class="content">
                                    <a href="">American
                                        Street Style is Taking Over in 2017</a>
                                    <div class="cf listing-meta below">
                                        <time datetime="2017-01-08T02:19:55+00:00" class="meta-item">January
                                            8, 2017
                                        </time>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </li>
            <li id="bunyad_ads_widget-3" class="widget code-widget">
                <div class="a-widget">
                    <img src="images/sm-banner-350.jpg" width="300">
                </div>
            </li>
            <li id="null-instagram-feed-3" class="widget null-instagram-feed">
                <h3 class="widgettitle">From Instagram</h3>Instagram has returned invalid data.
            </li>
            <li id="bunyad-blocks-widget-3" class="widget page-blocks">
                <h3 class="widgettitle">Đừng bỏ lỡ</h3>
                <section class="block-wrap blog" data-id="6">
                    <div class="block-content">
                        <div class="row b-row listing meta-below grid-2">
                            <%for(Post pMiss:postDao.getListProductByPagesInTerm(WebConstant.getPostMissId(),1,WebConstant.getPostMissNumber())){
                                String extendsImgNew = pMiss.getPostImg();
                                if (extendsImgNew.contains(".")) {
                                    extendsImgNew = extendsImgNew.substring(extendsImgNew.lastIndexOf("."), extendsImgNew.length());
                                }
                            %>
                            <div class="column half b-col">
                                <article class="highlights post-<%=pMiss.getPostID()%> post type-post status-publish format-standard has-post-thumbnail category-lifestyle tag-culture tag-fashion tag-fitness tag-leisure tag-lifestyle">
                                    <a href="<%=WebConstant.getLocalHost()+"/post/"+pMiss.getPostSlug()%>"
                                       title="<%=pMiss.getPostTitle()%>" class="image-link">
                                        <img width="336" height="200"
                                             src="<%=WebConstant.getLocalHost()%>/<%=pMiss.getPostImg().replace(extendsImgNew,"-336x200"+extendsImgNew)%>"
                                             class="image wp-post-image" alt="<%=pMiss.getPostTitle()%>"
                                             title="<%=pMiss.getPostTitle()%>"
                                             srcset="<%=WebConstant.getLocalHost()%>/<%=pMiss.getPostImg().replace(extendsImgNew,"-336x200"+extendsImgNew)%> 336w"
                                             sizes="(max-width: 336px) 100vw, 336px"/>
                                    </a>
                                    <h2 class="post-title">
                                        <a href="<%=WebConstant.getLocalHost()+"/post/"+pMiss.getPostSlug()%>"><%=pMiss.getPostTitle()%></a>
                                    </h2>
                                    <div class="cf listing-meta meta below">
                                                        <span class="meta-item author">
                                                            By <a href="author/trendy/index.html"
                                                                  title="Posts by Kate Hanson"
                                                                  rel="author"><%=usersDao.getName(pMiss.getAuthorID())%></a>
                                                        </span>
                                        <time datetime="<%=pMiss.getPostDate()%>" class="meta-item"><%=pMiss.getPostDate()%></time>
                                    </div>
                                </article>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </section>
            </li>
        </ul>
    </div>
</aside>
