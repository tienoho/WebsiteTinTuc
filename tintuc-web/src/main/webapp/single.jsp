<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.haui.web.command.CommentDao" %>
<%@ page import="vn.haui.web.command.HitCounterDao" %>
<%@ page import="vn.haui.web.command.PostDao" %>
<%@ page import="vn.haui.web.common.WebConstant" %>
<%@ page import="vn.haui.web.model.Comment" %>
<%@ page import="vn.haui.web.model.HitCounter" %>
<%@ page import="vn.haui.web.model.Post" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.haui.web.model.TermsRelationships" %>
<%@ page import="vn.haui.web.command.TermsRelationshipsDao" %>
<%
    PostDao postDao = new PostDao();
    TermsRelationshipsDao termsRelationshipsDao =  new TermsRelationshipsDao();
    String urlPath = "";
    String post_id = "";
    if (request.getAttribute("postId1") != null) {

        post_id = (String) request.getAttribute("postId1");
    }
    if (request.getAttribute("urlPathPost") != null) {

        urlPath = (String) request.getAttribute("urlPathPost");
    }
    System.out.println(urlPath);
    HitCounterDao hitCounterDao = new HitCounterDao();
    HitCounter hitCounter = null;
    int hitsCount = 0;
    try {
        //hitCounter = hitCounterDao.getHitCounter(Integer.parseInt(post_id));
        hitsCount = hitCounterDao.getCountHitCounter(Integer.parseInt(post_id));//error
    } catch (SQLException e) {
        e.printStackTrace();
    }

    if (hitsCount == 0) {
        hitsCount = 1;
        hitCounter = new HitCounter(Integer.parseInt(post_id), hitsCount);
        hitCounterDao.insert(hitCounter);
    } else {
        //hitsCount = hitCounterDao.getCountHitCounter(Integer.parseInt(post_id));
        hitsCount += 1;
        hitCounter = new HitCounter(Integer.parseInt(post_id), hitsCount);
        hitCounterDao.update(hitCounter);
    }
%>

<%--header--%>
<jsp:include page="header.jsp"></jsp:include>
<%--content--%>
<div class="main wrap cf">
    <div class="row">
        <div class="col-8 main-content">
            <% for (Post p : postDao.getListPostByCategory(WebConstant.textPostID, Integer.parseInt(post_id))) {
            %>
            <article id="post-<%=p.getPostID()%>"
                     class="post-<%=p.getPostID()%> post type-post status-publish format-standard has-post-thumbnail category-fashion tag-culture tag-fashion tag-featured tag-fitness tag-leisure tag-lifestyle">
                <header class="post-header-b cf">
                    <div class="category cf">
                            <span class="cat-title cat-4">
                                <a href="#" title="Fashion">Fashion</a>
                            </span>
                    </div>
                    <div class="heading cf">
                        <h1 class="post-title"><%=p.getPostTitle()%>
                        </h1>
                    </div>
                    <div class="post-meta-b cf">
                            <span class="author-img">
                                <img width="35" height="35" alt="Kate Hanson"
                                     class="avatar avatar-35 wp-user-avatar wp-user-avatar-35 alignnone photo"
                                     srcset="${root}/images/3874418485_26e0893ff4_z-150x150.jpg"/>
                            </span>
                        <span class="posted-by">By <a href="#"
                                                      title="Posts by Kate Hanson" rel="author">Kate Hanson</a> </span>
                        <span class="posted-on">
                                <time class="post-date" datetime="2017-01-08T02:25:37+00:00">January 8, 2017</time>
                            </span> <a href="index.html#comments" class="comments">
                        <i class="fa fa-comments-o"></i>3 Comments
                        <i class="fa fa-street-view"></i><%=hitsCount%> Lượt xem
                    </a>
                    </div>
                    <div class="post-share-b cf">
                        <a href="#" class="cf service facebook" target="_blank">
                            <i class="fa fa-facebook"></i>
                            <span class="label">Share</span>
                        </a>
                        <a href="h#" class="cf service twitter" target="_blank">
                            <i class="fa fa-twitter"></i>
                            <span class="label">Tweet</span>
                        </a>
                        <a href="#" class="cf service gplus" target="_blank">
                            <i class="fa fa-google-plus"></i>
                            <span class="label">Google+</span>
                        </a>
                        <a href="#" class="cf service pinterest" target="_blank">
                            <i class="fa fa-pinterest"></i>
                            <span class="label">Pinterest</span>
                        </a>
                        <a href="#" class="cf service linkedin" target="_blank">
                            <i class="fa fa-linkedin"></i>
                            <span class="label">LinkedIn</span>
                        </a>
                        <a href="#" class="cf service tumblr" target="_blank">
                            <i class="fa fa-tumblr"></i>
                            <span class="label">Tumblr</span>
                        </a>
                        <a href="#" class="cf service email" target="_blank">
                            <i class="fa fa-envelope-o"></i>
                            <span class="label">Email</span>
                        </a>
                        <a href="#" class="show-more">+</a>
                    </div>
                    <div class="featured">
                        <a href="${root}/<%=p.getPostImg()%>"
                           title="<%=p.getPostTitle()%>">
                            <img width="702" height="459" src="<%=p.getPostImg().replace(".jpg","-702x459.jpg")%>"
                                 class="attachment-main-featured size-main-featured wp-post-image"
                                 alt="shutterstock_303461690"
                                 title="<%=p.getPostTitle()%>"
                                 srcset="${root}/<%=p.getPostImg().replace(".jpg","-702x459.jpg")%> 702w,${root}/<%=p.getPostImg().replace(".jpg","-104x69.jpg")%> 104w, ${root}/<%=p.getPostImg().replace(".jpg","-214x140.jpg")%> 214w"
                                 sizes="(max-width: 702px) 100vw, 702px"/>
                        </a>
                    </div>
                </header>
                <%-- main content --%>
                <div class="post-content post-dynamic">
                    <%--post-content --%>
                    <%=p.getPostContent()%>
                    <div class="tagcloud">
                        <a href="#" rel="tag">culture</a>
                        <a href="#" rel="tag">fashion</a>
                        <a href="#" rel="tag">featured</a>
                        <a href="#" rel="tag">fitness</a>
                        <a href="#" rel="tag">leisure</a>
                        <a href="#" rel="tag">lifestyle</a>
                    </div>
                </div>

                <div class="post-share">
                    <span class="text">Share.</span>
                    <span class="share-links">
                            <a href="#" class="fa fa-twitter" title="Tweet It" target="_blank">
                                <span class="visuallyhidden">Twitter</span>
                            </a>
                            <a href="#" class="fa fa-facebook" title="Share on Facebook" target="_blank">
                                <span class="visuallyhidden">Facebook</span>
                            </a>
                            <a href="#" class="fa fa-google-plus" title="Share on Google+" target="_blank">
                                <span class="visuallyhidden">Google+</span>
                            </a> <a href="#" class="fa fa-pinterest"
                                    title="Share on Pinterest" target="_blank">
                                <span class="visuallyhidden">Pinterest</span>
                            </a> <a href="#" class="fa fa-linkedin" title="Share on LinkedIn" target="_blank">
                                <span class="visuallyhidden">LinkedIn</span>
                            </a>
                            <a href="#" class="fa fa-tumblr"
                               title="Share on Tumblr" target="_blank">
                                <span class="visuallyhidden">Tumblr</span>
                            </a>
                            <a href=#" class="fa fa-envelope-o"
                               title="Share via Email">
                                <span class="visuallyhidden">Email</span>
                            </a>
                        </span>
                </div>
            </article>
            <%}%>
            <section class="navigate-posts">
                <div class="previous">
                        <span class="main-color title">
                            <i class="fa fa-chevron-left">
                            </i> Previous Article
                        </span>
                    <span class="link">
                            <a href="" rel="prev">American Street Style is Taking Over in 2017</a>
                        </span>
                </div>
                <div class="next">
                        <span class="main-color title">
                            Next Article <i class="fa fa-chevron-right"></i>
                        </span><span class="link">
                            <a href="" rel="next">Love In Style For The Proposal of Timeless Relation</a>
                        </span>
                </div>
            </section>
            <div class="author-box">
                <h3 class="section-head">About Author</h3>
                <section class="author-info">
                    <img width="100" height="100" alt="Kate Hanson"
                         class="avatar avatar-100 wp-user-avatar wp-user-avatar-100 alignnone photo"
                         srcset="${root}/images/3874418485_26e0893ff4_z-150x150.jpg"/>
                    <div class="description">
                        <a href="" title="Posts by Kate Hanson" rel="author">Kate Hanson</a>
                        <ul class="social-icons">
                            <li><a href="${root}" class="icon fa fa-home" title="Website"> <span
                                    class="visuallyhidden">Website</span></a></li>
                            <li><a href="#" class="icon fa fa-facebook" title="Facebook"> <span class="visuallyhidden">Facebook</span></a>
                            </li>
                            <li><a href="#" class="icon fa fa-twitter" title="Twitter"> <span class="visuallyhidden">Twitter</span></a>
                            </li>
                            <li><a href="#" class="icon fa fa-google-plus" title="Google+"> <span
                                    class="visuallyhidden">Google+</span></a></li>
                            <li><a href="#" class="icon fa fa-linkedin" title="LinkedIn"> <span class="visuallyhidden">LinkedIn</span></a>
                            </li>
                        </ul>
                        <p class="bio">I am like a freight train. Working on the details, twisting them and playing with
                            them over the years, but always staying on the same track. People who exhibit unhealthy
                            perfectionism are fearful of failure, fearful of criticism.</p></div>
                </section>
            </div>
            <section class="related-posts"><h3 class="section-head"><span class="color">Related</span> Posts</h3>
                <ul class="highlights-box three-col related-posts">
                    <%List<TermsRelationships> termsRelationships=termsRelationshipsDao.getListTermsRelationshipsByPostID(Integer.parseInt(post_id));
                        for(Post pInterdepend : postDao.getListInPostInterdepend(termsRelationships.get(0).getCategoryID(), 1, 3,Integer.parseInt(post_id))){
                            String extendsImgNew = pInterdepend.getPostImg();
                            if (extendsImgNew.contains(".")) {
                                extendsImgNew = extendsImgNew.substring(extendsImgNew.lastIndexOf("."), extendsImgNew.length());
                            }
                    %>
                    <li class="highlights column one-third">
                        <article>
                            <a href="" title="<%=pInterdepend.getPostTitle()%>" class="image-link">
                                <img width="214" height="140" src="<%=WebConstant.getLocalHost()%>/<%=pInterdepend.getPostImg().replace(extendsImgNew,"-214x140"+extendsImgNew)%>"
                                     class="image wp-post-image" alt="shutterstock_536935141"
                                     title="<%=pInterdepend.getPostTitle()%>"
                                     srcset="<%=WebConstant.getLocalHost()%>/<%=pInterdepend.getPostImg().replace(extendsImgNew,"-214x140"+extendsImgNew)%> 214w, <%=WebConstant.getLocalHost()%>/<%=pInterdepend.getPostImg().replace(extendsImgNew,"-300x196"+extendsImgNew)%> 300w, <%=WebConstant.getLocalHost()%>/<%=pInterdepend.getPostImg().replace(extendsImgNew,"-1000x653"+extendsImgNew)%> 1000w, <%=WebConstant.getLocalHost()%>/<%=pInterdepend.getPostImg().replace(extendsImgNew,"-104x69"+extendsImgNew)%> 104w, <%=WebConstant.getLocalHost()%>/<%=pInterdepend.getPostImg().replace(extendsImgNew,"-702x459"+extendsImgNew)%> 702w"
                                     sizes="(max-width: 214px) 100vw, 214px"/> </a>
                            <h2><a href="" title="<%=pInterdepend.getPostTitle()%>"><%=pInterdepend.getPostTitle()%></a></h2>
                            <div class="cf listing-meta meta below">
                                <time datetime="<%=pInterdepend.getPostDate()%>" class="meta-item"><%=pInterdepend.getPostDate()%></time>
                            </div>
                        </article>
                    </li>
                    <%}%>
                </ul>
            </section>
            <div class="comments">
                <div id="comments">
                    <% CommentDao commentDao = new CommentDao();
                        ArrayList<Comment> comments = commentDao.getListCommentByPost(Integer.parseInt(post_id));
                    %>
                    <h3 class="section-head"><%=comments.size()%> bình luận</h3>
                    <ol class="comments-list">
                        <%for (Comment cComment : comments) {%>
                        <li class="comment even thread-even depth-1" id="li-comment-<%=cComment.getComment_id()%>">
                            <article id="comment-<%=cComment.getComment_id()%>" class="comment">
                                <div class="comment-avatar">
                                    <img src='<%=WebConstant.getLocalHost()%>/images/admin-avatar.jpg'
                                         width="50" height="50" alt=""
                                         class="avatar avatar-50wp-user-avatar wp-user-avatar-50 alignnone photo avatar-default"/>
                                </div>
                                <div class="comment-meta">
                                        <span class="comment-author">
                                            <a href='${root}/' rel='external nofollow'
                                               class='url'><%=cComment.getComment_author()%></a>
                                        </span> on <a href="#comment-<%=cComment.getComment_id()%>" class="comment-time"
                                                      title="<%=cComment.getComment_date()%>">
                                    <time pubdate
                                          datetime="<%=cComment.getComment_date()%>"><%=cComment.getComment_date()%>
                                    </time>
                                </a>
                                </div>
                                <div class="comment-content">
                                    <p><%=cComment.getComment_content()%>
                                    </p>
                                    <div class="reply">
                                        <a rel='nofollow' class='comment-reply-link'
                                           href=''
                                           onclick='return addComment.moveForm( "comment-<%=cComment.getComment_id()%>", "<%=cComment.getComment_id()%>", "respond", "<%=post_id%>" )'
                                           aria-label='Reply to <%=cComment.getComment_author()%>'>Trả lời <i
                                                class="fa fa-angle-right">
                                        </i>
                                        </a>
                                    </div>
                                </div>
                            </article>
                            <ul class="children">
                                <%for (Comment commentChildren : commentDao.getListCommentByParent(cComment.getComment_id())) {%>
                                <li class="comment odd alt depth-2"
                                    id="li-comment-<%=commentChildren.getComment_id()%>">
                                    <article id="comment-<%=commentChildren.getComment_id()%>" class="comment">
                                        <div class="comment-avatar">
                                            <img src='${root}/images/jane-doe.jpg'
                                                 width="50" height="50" alt=""
                                                 class="avatar avatar-50wp-user-avatar wp-user-avatar-50 alignnone photo avatar-default"/>
                                        </div>
                                        <div class="comment-meta">
                                                <span class="comment-author">
                                                    <a href='${root}' rel='external nofollow'
                                                       class='url'><%=commentChildren.getComment_author()%></a>
                                                </span> on <a
                                                href="#comment-<%=commentChildren.getComment_id()%>"
                                                class="comment-time"
                                                title="<%=commentChildren.getComment_date()%>">
                                            <time pubdate
                                                  datetime="<%=commentChildren.getComment_date()%>"><%=commentChildren.getComment_date()%>
                                            </time>
                                        </a>
                                        </div>
                                        <div class="comment-content">
                                            <p><%=commentChildren.getComment_content()%>
                                            </p>
                                            <div class="reply">
                                                <a rel='nofollow' class='comment-reply-link'
                                                   href=''
                                                   onclick='return addComment.moveForm( "comment-<%=commentChildren.getComment_id()%>", "<%=commentChildren.getComment_id()%>", "respond", "<%=post_id%>" )'
                                                   aria-label='Trả lời tới <%=commentChildren.getComment_author()%>'>
                                                    Trả lời <i class="fa fa-angle-right"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </article>
                                </li>
                                <%}%>
                            </ul>
                        </li>
                        <%}%>
                    </ol>
                    <div id="respond" class="comment-respond">
                        <h3 id="reply-title" class="comment-reply-title">
                            <span class="section-head">Bình luận</span>
                            <small>
                                <a rel="nofollow" id="cancel-comment-reply-link" href="#respond"
                                   style="display:none;">Hủy</a>
                            </small>
                        </h3>
                        <form action="<%=WebConstant.getLocalHost()%>/ManagerCommentServlet" method="post"
                              id="commentform" class="comment-form" novalidate>
                            <p>
                                <textarea name="comment-content" id="comment-content" cols="45" rows="8"
                                          aria-required="true"
                                          placeholder="Nội dung"></textarea>
                            </p>
                            <p>
                                <input name="comment-author" id="comment-author" type="text" size="30"
                                       aria-required="true"
                                       placeholder="Tên bạn" value=""/>
                            </p>
                            <p>
                                <input name="comment-email" id="comment-email" type="text" size="30"
                                       aria-required="true"
                                       placeholder="Email" value=""/>
                            </p>
                            <p class="form-submit">
                                <input type='hidden' name='comment-post-id' value='<%=post_id%>' id='comment-post-id'/>
                                <input type='hidden' name='comment-parent' id='comment-parent' value='0'/>
                                <input type='hidden' name='command' id='command' value='insert'/>
                                <input type='hidden' name='urlPath' value='<%=urlPath%>'/>
                                <input name="submit" type="submit" id="comment-submit" class="submit"
                                       value="Post Comment"/>
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%--sidebar--%>
        <jsp:include page="sidebar-post.jsp"/>
    </div>
</div>

<%--footer--%>
<jsp:include page="footer.jsp"></jsp:include>