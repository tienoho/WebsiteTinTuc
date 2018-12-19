<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.haui.web.command.PostDao" %>
<%@ page import="vn.haui.web.common.WebConstant" %>
<%@ page import="vn.haui.web.model.Post" %>
<%@ page import="vn.haui.web.command.HitCounterDao" %>
<%@ page import="vn.haui.web.model.HitCounter" %>
<%@ page import="java.sql.SQLException" %>
<%
    PostDao postDao = new PostDao();

    String post_id = "";
    if (request.getAttribute("postId1") != null) {

        post_id = (String) request.getAttribute("postId1");
    }
    HitCounterDao hitCounterDao=new HitCounterDao();
    HitCounter hitCounter=null;
    try {
        hitCounter=hitCounterDao.getHitCounter(Integer.parseInt(post_id));
    } catch (SQLException e) {
        e.printStackTrace();
    }

    int hitsCount = hitCounter.getHitCounter();//error

    if( hitsCount == 0 ){
        hitsCount = 1;
        hitCounter=new HitCounter(Integer.parseInt(post_id),hitsCount);
        hitCounterDao.insert(hitCounter);
    }else{
        hitsCount = hitCounterDao.getCountHitCounter(Integer.parseInt(post_id));
        hitsCount += 1;
        hitCounter=new HitCounter(Integer.parseInt(post_id),hitsCount);
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
                    <li class="highlights column one-third">
                        <article><a href=""
                                    title="Fashion Chic X Mejuri Jewelry Collection of 2017" class="image-link"> <img
                                width="214" height="140" src="${root}/images/shutterstock_536935141-214x140.jpg"
                                class="image wp-post-image" alt="shutterstock_536935141"
                                title="Fashion Chic X Mejuri Jewelry Collection of 2017"
                                srcset="${root}/images/shutterstock_536935141-214x140.jpg 214w, ${root}/images/shutterstock_536935141-300x196.jpg 300w, ${root}/images/shutterstock_536935141-1000x653.jpg 1000w, ${root}/images/shutterstock_536935141-104x69.jpg 104w, ${root}/images/shutterstock_536935141-702x459.jpg 702w"
                                sizes="(max-width: 214px) 100vw, 214px"/> </a>
                            <h2><a href=""
                                   title="Fashion Chic X Mejuri Jewelry Collection of 2017">Fashion Chic X Mejuri
                                Jewelry Collection of 2017</a></h2>
                            <div class="cf listing-meta meta below">
                                <time datetime="2017-01-08T02:34:37+00:00" class="meta-item">January 8, 2017</time>
                            </div>
                        </article>
                    </li>
                    <li class="highlights column one-third">
                        <article><a href=""
                                    title="Trending: Bodysuits and Faded Friendship Jeans" class="image-link"> <img
                                width="214" height="140" src="${root}/images/shutterstock_518581786-214x140.jpg"
                                class="image wp-post-image" alt="shutterstock_518581786"
                                title="Trending: Bodysuits and Faded Friendship Jeans"
                                srcset="${root}/images/shutterstock_518581786-214x140.jpg 214w, ${root}/images/shutterstock_518581786-104x69.jpg 104w, ${root}/images/shutterstock_518581786-702x459.jpg 702w"
                                sizes="(max-width: 214px) 100vw, 214px"/> </a>
                            <h2><a href=""
                                   title="Trending: Bodysuits and Faded Friendship Jeans">Trending: Bodysuits and Faded
                                Friendship Jeans</a></h2>
                            <div class="cf listing-meta meta below">
                                <time datetime="2017-01-08T02:33:37+00:00" class="meta-item">January 8, 2017</time>
                            </div>
                        </article>
                    </li>
                    <li class="highlights column one-third">
                        <article><a href=""
                                    title="Summer Style: Chunky Knit For Leather Suits" class="image-link"> <img
                                width="214" height="140" src="${root}/images/shutterstock_350007890-214x140.jpg"
                                class="image wp-post-image" alt="shutterstock_350007890"
                                title="Summer Style: Chunky Knit For Leather Suits"
                                srcset="${root}/images/shutterstock_350007890-214x140.jpg 214w, ${root}/images/shutterstock_350007890-104x69.jpg 104w, ${root}/images/shutterstock_350007890-702x459.jpg 702w"
                                sizes="(max-width: 214px) 100vw, 214px"/> </a>
                            <h2><a href=""
                                   title="Summer Style: Chunky Knit For Leather Suits">Summer Style: Chunky Knit For
                                Leather Suits</a></h2>
                            <div class="cf listing-meta meta below">
                                <time datetime="2017-01-08T02:30:37+00:00" class="meta-item">January 8, 2017</time>
                            </div>
                        </article>
                    </li>
                </ul>
            </section>
            <div class="comments">
                <div id="comments">
                    <h3 class="section-head"> 3 Comments</h3>
                    <ol class="comments-list">
                        <li class="comment even thread-even depth-1" id="li-comment-59">
                            <article id="comment-59" class="comment">
                                <div class="comment-avatar">
                                    <img src='<%=WebConstant.getLocalHost()%>/images/admin-avatar.jpg'
                                         width="50" height="50" alt=""
                                         class="avatar avatar-50wp-user-avatar wp-user-avatar-50 alignnone photo avatar-default"/>
                                </div>
                                <div class="comment-meta">
                                        <span class="comment-author">
                                            <a href='${root}/' rel='external nofollow' class='url'>Sam Doe</a>
                                        </span> on <a href="index.html#comment-59" class="comment-time"
                                                      title="January 19, 2017 at 8:30 pm">
                                    <time pubdate datetime="2017-01-19T20:30:47+00:00">January 19, 2017 8:30 pm</time>
                                </a>
                                </div>
                                <div class="comment-content">
                                    <p>That far ground rat pure from newt far panther crane lorikeet overlay alas cobra
                                        across much gosh less goldfinch ruthlessly alas examined and that more and the
                                        ouch jeez.</p>
                                    <div class="reply">
                                        <a rel='nofollow' class='comment-reply-link'
                                                          href='index7653.html?replytocom=59#respond'
                                                          onclick='return addComment.moveForm( "comment-59", "59", "respond", "146" )'
                                                          aria-label='Reply to Sam Doe'>Reply <i
                                            class="fa fa-angle-right">
                                    </i>
                                    </a>
                                    </div>
                                </div>
                            </article>
                            <ul class="children">
                                <li class="comment odd alt depth-2" id="li-comment-60">
                                    <article id="comment-60" class="comment">
                                        <div class="comment-avatar">
                                            <img src='${root}/images/jane-doe.jpg'
                                                 width="50" height="50" alt=""
                                                 class="avatar avatar-50wp-user-avatar wp-user-avatar-50 alignnone photo avatar-default"/>
                                        </div>
                                        <div class="comment-meta">
                                                <span class="comment-author">
                                                    <a href='${root}' rel='external nofollow'
                                                       class='url'>Jane Doe</a>
                                                </span> on <a href="index.html#comment-60" class="comment-time"
                                                              title="January 20, 2017 at 8:30 pm">
                                            <time pubdate datetime="2017-01-20T20:30:48+00:00">January 20, 2017 8:30
                                                pm
                                            </time>
                                        </a>
                                        </div>
                                        <div class="comment-content">
                                            <p>Coquettish darn pernicious foresaw therefore much amongst lingeringly
                                                shed much due antagonistically alongside so then more and about
                                                turgid.</p>
                                            <div class="reply">
                                                <a rel='nofollow' class='comment-reply-link'
                                                   href='index2096.html?replytocom=60#respond'
                                                   onclick='return addComment.moveForm( "comment-60", "60", "respond", "146" )'
                                                   aria-label='Reply to Jane Doe'>
                                                    Reply <i class="fa fa-angle-right"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </article>
                                </li>
                            </ul>
                        </li>

                        <li class="comment even thread-odd thread-alt depth-1" id="li-comment-61">
                            <article id="comment-61" class="comment">
                                <div class="comment-avatar">
                                    <img src='<%=WebConstant.getLocalHost()%>/images/admin-avatar.jpg'
                                         width="50" height="50" alt=""
                                         class="avatar avatar-50wp-user-avatar wp-user-avatar-50 alignnone photo avatar-default"/>
                                </div>
                                <div class="comment-meta">
                                        <span class="comment-author">
                                            <a href='${root}' rel='external nofollow' class='url'>Sam Doe</a>
                                        </span> on <a href="index.html#comment-61" class="comment-time"
                                                      title="January 20, 2017 at 8:39 pm">
                                    <time pubdate datetime="2017-01-20T20:39:08+00:00">January 20, 2017 8:39 pm</time>
                                </a>
                                </div>
                                <div class="comment-content">
                                    <p>Crud much unstinting violently pessimistically far camel inanimately a remade
                                        dove disagreed hellish one concisely before with this erotic frivolous.</p>
                                    <div class="reply">
                                        <a rel='nofollow' class='comment-reply-link'
                                           href='index504c.html?replytocom=61#respond'
                                           onclick='return addComment.moveForm( "comment-61", "61", "respond", "146" )'
                                           aria-label='Reply to Sam Doe'>
                                            Reply <i class="fa fa-angle-right">
                                        </i>
                                        </a>
                                    </div>
                                </div>
                            </article>
                        </li>
                    </ol>
                    <div id="respond" class="comment-respond">
                        <h3 id="reply-title" class="comment-reply-title">
                            <span class="section-head">Leave A Reply</span>
                            <small>
                                <a rel="nofollow" id="cancel-comment-reply-link" href="index.html#respond"
                                   style="display:none;">Cancel Reply</a>
                            </small>
                        </h3>
                        <form action="comments-post.jsp" method="post"
                              id="commentform" class="comment-form" novalidate>
                            <p>
                                <textarea name="comment" id="comment" cols="45" rows="8" aria-required="true"
                                          placeholder="Your Comment"></textarea>
                            </p>
                            <p>
                                <input name="author" id="author" type="text" size="30" aria-required="true"
                                       placeholder="Your Name" value=""/>
                            </p>
                            <p>
                                <input name="email" id="email" type="text" size="30" aria-required="true"
                                       placeholder="Your Email" value=""/>
                            </p>
                            <p>
                                <input name="url" id="url" type="text" size="30" placeholder="Your Website" value=""/>
                            </p>
                            <p class="form-submit">
                                <input name="submit" type="submit" id="comment-submit" class="submit"
                                       value="Post Comment"/>
                                <input type='hidden' name='comment_post_ID' value='146' id='comment_post_ID'/>
                                <input type='hidden' name='comment_parent' id='comment_parent' value='0'/>
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