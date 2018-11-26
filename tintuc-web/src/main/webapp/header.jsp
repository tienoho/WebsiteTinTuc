<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.haui.web.command.categoryDao" %>
<%@ page import="vn.haui.web.model.Category" %>
<!DOCTYPE html>
<html lang="en-US">
<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
<head>
    <meta charset="UTF-8"/>
    <link type="text/css" media="all" href="css/style.css" rel="stylesheet"/>
    <!--<link rel='stylesheet' id='rs-plugin-settings-css' href='http://localhost/wp-content/plugins/revslider/public/assets/css/settings.css?ver=5.3.1.5' type='text/css' media='all' />
    <style id='rs-plugin-settings-inline-css' type='text/css'>
        #rs-demo-id {
        }
    </style>
    <link rel='stylesheet' id='smartmag-fonts-css' href='http://fonts.googleapis.com/css?family=Libre+Franklin%3A400%2C400i%2C500%2C600%7CLato%3A400%2C700%2C900%7CHind%3A400%2C500%2C600%7CMerriweather%3A300italic&#038;subset' type='text/css' media='all' />
    <link rel='stylesheet' id='smartmag-core-css' href='http://localhost/wp-content/themes/smart-mag/style.css?ver=3.0.2' type='text/css' media='all' />
    <link rel='stylesheet' id='smartmag-responsive-css' href='http://localhost/wp-content/themes/smart-mag/css/responsive.css?ver=3.0.2' type='text/css' media='all' />
    <link rel='stylesheet' id='pretty-photo-css' href='http://localhost/wp-content/themes/smart-mag/css/prettyPhoto.css?ver=3.0.2' type='text/css' media='all' />
    <link rel='stylesheet' id='smartmag-font-awesome-css' href='http://localhost/wp-content/themes/smart-mag/css/fontawesome/css/font-awesome.min.css?ver=3.0.2' type='text/css' media='all' />
    <link rel='stylesheet' id='smartmag-skin-css' href='http://localhost/wp-content/themes/smart-mag/css/skin-trendy.css?ver=4.9.8' type='text/css' media='all' />-->
    <title>SmartMag Trendy &mdash; Premium Theme Demo</title>
    <script type="text/javascript">
        window._wpemojiSettings = {
            "baseUrl": "https:\/\/s.w.org\/images\/core\/emoji\/2.2.1\/72x72\/",
            "ext": ".png",
            "svgUrl": "https:\/\/s.w.org\/images\/core\/emoji\/2.2.1\/svg\/",
            "svgExt": ".svg",
            "source": {"concatemoji": "http:\/\/theme-sphere.com\/smart-mag\/demos\/trendy\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.7.11"}
        };
        !function (a, b, c) {
            function d(a) {
                var b, c, d, e, f = String.fromCharCode;
                if (!k || !k.fillText) return !1;
                switch (k.clearRect(0, 0, j.width, j.height), k.textBaseline = "top", k.font = "600 32px Arial", a) {
                    case "flag":
                        return k.fillText(f(55356, 56826, 55356, 56819), 0, 0), !(j.toDataURL().length < 3e3) && (k.clearRect(0, 0, j.width, j.height), k.fillText(f(55356, 57331, 65039, 8205, 55356, 57096), 0, 0), b = j.toDataURL(), k.clearRect(0, 0, j.width, j.height), k.fillText(f(55356, 57331, 55356, 57096), 0, 0), c = j.toDataURL(), b !== c);
                    case "emoji4":
                        return k.fillText(f(55357, 56425, 55356, 57341, 8205, 55357, 56507), 0, 0), d = j.toDataURL(), k.clearRect(0, 0, j.width, j.height), k.fillText(f(55357, 56425, 55356, 57341, 55357, 56507), 0, 0), e = j.toDataURL(), d !== e
                }
                return !1
            }

            function e(a) {
                var c = b.createElement("script");
                c.src = a, c.defer = c.type = "text/javascript", b.getElementsByTagName("head")[0].appendChild(c)
            }

            var f, g, h, i, j = b.createElement("canvas"), k = j.getContext && j.getContext("2d");
            for (i = Array("flag", "emoji4"), c.supports = {
                everything: !0,
                everythingExceptFlag: !0
            }, h = 0; h < i.length; h++) c.supports[i[h]] = d(i[h]), c.supports.everything = c.supports.everything && c.supports[i[h]], "flag" !== i[h] && (c.supports.everythingExceptFlag = c.supports.everythingExceptFlag && c.supports[i[h]]);
            c.supports.everythingExceptFlag = c.supports.everythingExceptFlag && !c.supports.flag, c.DOMReady = !1, c.readyCallback = function () {
                c.DOMReady = !0
            }, c.supports.everything || (g = function () {
                c.readyCallback()
            }, b.addEventListener ? (b.addEventListener("DOMContentLoaded", g, !1), a.addEventListener("load", g, !1)) : (a.attachEvent("onload", g), b.attachEvent("onreadystatechange", function () {
                "complete" === b.readyState && c.readyCallback()
            })), f = c.source || {}, f.concatemoji ? e(f.concatemoji) : f.wpemoji && f.twemoji && (e(f.twemoji), e(f.wpemoji)))
        }(window, document, window._wpemojiSettings);</script>
    <script type='text/javascript' src='js/jquery.js'></script>
    <script>document.querySelector('head').innerHTML += '<style class="bunyad-img-effects-css">.main img, .main-footer img { opacity: 0; }</style>';</script>
</head>
<body class="home page-template page-template-page-blocks page-template-page-blocks-php page page-id-11 page-builder right-sidebar full skin-tech has-featured img-effects has-nav-light-b has-nav-full has-head-tech has-mobile-head">
    <% categoryDao categoryDao=new categoryDao();%>
<div class="main-wrap">
    <div class="top-bar dark">
        <div class="wrap">
            <section class="top-bar-content cf">
                <span class="date"> Friday, November 23 </span>
                <div class="menu-top-nav-container">
                    <ul id="menu-top-nav" class="menu">
                        <li id="menu-item-4"
                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-4">
                            <a href="#">Start Here</a>
                        </li>
                        <li id="menu-item-5"
                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-5">
                            <a href="#">Forums</a>
                        </li>
                        <li id="menu-item-7"
                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-7">
                            <a href="#">Contact</a>
                        </li>
                    </ul>
                </div>
                <div class="textwidget">
                    <ul class="social-icons cf">
                        <li>
                            <a href="http://facebook.com/themesphere" class="icon fa fa-facebook" title="Facebook">
                                <span class="visuallyhidden">Facebook</span>
                            </a>
                        </li>
                        <li>
                            <a href="http://twitter.com/Theme_Sphere" class="icon fa fa-twitter" title="Twitter">
                                <span class="visuallyhidden">Twitter</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="icon fa fa-google-plus" title="Google+">
                                <span class="visuallyhidden">Google+</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="icon fa fa-linkedin" title="LinkedIn">
                                <span class="visuallyhidden">LinkedIn</span>
                            </a>
                        </li>
                        <li><a href="#" class="icon fa fa-vk" title="VK"><span class="visuallyhidden">VK</span></a></li>
                    </ul>
                </div>
            </section>
        </div>
    </div>
    <div id="main-head" class="main-head">
        <div class="wrap">
            <div class="mobile-head">
                <div class="menu-icon"><a href="#"><i class="fa fa-bars"></i></a></div>
                <div class="title">
                    <a href="index.html" title="SmartMag Trendy" rel="home" class="is-logo-mobile">
                        <img src="images/sm-logo-mobile.png" class="logo-mobile" width="0" height="0"/>
                        <img src="images/sm-logo-1.png" class="logo-image" alt="SmartMag Trendy"
                             srcset="images/sm-logo-1.png ,images/sm-logo2x-1.png 2x"/>
                    </a>
                </div>
                <div class="search-overlay">
                    <a href="#" title="Search" class="search-icon"><i class="fa fa-search"></i></a>
                </div>
            </div>
            <header class="tech">
                <div class="title">
                    <a href="index.html" title="SmartMag Trendy" rel="home" class="is-logo-mobile">
                        <img src="images/sm-logo-mobile.png" class="logo-mobile" width="0" height="0"/>
                        <img src="images/sm-logo-1.png" class="logo-image" alt="SmartMag Trendy"
                             srcset="images/sm-logo-1.png ,images/sm-logo2x-1.png 2x"/>
                    </a>
                </div>
                <div class="right">
                    <div class="a-widget">
                        <a href="#">
                            <img src="images/sm-728x90.jpg" width="728" height="90" alt="Banner"/>
                        </a>
                    </div>
                </div>
            </header>
        </div>
        <div class="main-nav">
            <div class="navigation-wrap cf" data-sticky-nav="1" data-sticky-type="smart">
                <nav class="navigation cf nav-full has-search nav-light nav-light-b">
                    <div class="wrap">
                        <div class="mobile" data-type="off-canvas" data-search="1">
                            <a href="#" class="selected">
                                <span class="text">Navigate</span>
                                <span class="current"></span>
                                <i class="hamburger fa fa-bars"></i>
                            </a>
                        </div>
                        <div class="menu-main-menu-container">
                            <ul id="menu-main-menu" class="menu">
                                <li id="menu-item-8"
                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-8">
                                    <a href="#">
                                        <i class="fa fa-bars only-icon"></i>
                                    </a>
                                    <ul class="sub-menu">
                                        <%
                                            for(Category category:categoryDao.getListCategory())
                                            {
                                        %>
                                        <li id="menu-item-578"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-<%=category.getCategoryID()%>">
                                            <a href="<%=category.getCategorySlug()%>"><%=category.getCategoryName()%></a>
                                        </li>
                                        <%}%>
                                    </ul>
                                </li>
                                <li id="menu-item-10"
                                    class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-10">
                                    <a href="index.html">Home</a>
                                </li>
                                <li id="menu-item-586"
                                    class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-586">
                                    <a href="#">Features</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-587"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-587">
                                            <a href="#">Post Styles</a>
                                            <ul class="sub-menu">
                                                <li id="menu-item-588"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-588">
                                                    <a href="2016/12/28/25-things-every-proud-owner-of-pc-should-do-2-2/index.html">
                                                        Classic
                                                        Style
                                                    </a>
                                                </li>
                                                <li id="menu-item-589"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-589">
                                                    <a href="2017/01/08/annie-ziegler-is-designing-clothes-for-girls-just-like-her-2-2/index.html">
                                                        Modern
                                                        Style
                                                    </a>
                                                </li>
                                                <li id="menu-item-590"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-590">
                                                    <a href="2017/01/08/annie-ziegler-is-designing-clothes-for-girls-just-like-her-2-2/index4514.html?post_layout=modern-b">
                                                        Modern
                                                        Simple
                                                    </a>
                                                </li>
                                                <li id="menu-item-591"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-591">
                                                    <a href="2016/12/29/workouts-everyone-should-try-once-in-a-while-2/index.html">
                                                        Post
                                                        Cover
                                                    </a>
                                                </li>
                                                <li id="menu-item-592"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-592">
                                                    <a href="2016/12/28/25-things-every-proud-owner-of-pc-should-do-2-2/index9f72.html?post_layout=classic-above">
                                                        Classic
                                                        Alt
                                                    </a>
                                                </li>
                                                <li id="menu-item-593"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-593">
                                                    <a href="2016/12/28/25-things-every-proud-owner-of-pc-should-do-2-2/index09cf.html?layout=full">
                                                        Classic
                                                        Full
                                                    </a>
                                                </li>
                                                <li id="menu-item-594"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-594">
                                                    <a href="2017/01/08/annie-ziegler-is-designing-clothes-for-girls-just-like-her-2-2/index8554.html?no_featured=1">
                                                        No
                                                        Featured
                                                    </a>
                                                </li>
                                                <li id="menu-item-595"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-595">
                                                    <a href="2017/01/05/places-everyone-should-visit-in-their-life-before-2018/index.html">Multi-page</a>
                                                </li>
                                                <li id="menu-item-596"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-596">
                                                    <a href="2017/01/06/gadget-are-causing-an-effect-known-as-fomo/index.html">
                                                        Video
                                                        Post
                                                    </a>
                                                </li>
                                                <li id="menu-item-597"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-597">
                                                    <a href="2017/01/05/music-of-the-previous-generations-is-hot-again-this-year/index.html">
                                                        Audio
                                                        Post
                                                    </a>
                                                </li>
                                                <li id="menu-item-598"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-598">
                                                    <a href="2017/01/06/things-to-let-go-now-for-a-healthy-new-year-2/index.html">
                                                        Gallery
                                                        Post
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li id="menu-item-599"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-599">
                                            <a href="#">Category Layouts</a>
                                            <ul class="sub-menu">
                                                <li id="menu-item-600"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-600">
                                                    <a href="category/leisure/index.html">Top Featured: Grid B</a>
                                                </li>
                                                <li id="menu-item-601"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-601">
                                                    <a href="category/leisure/indexf525.html?cat_featured=grid">
                                                        Top
                                                        Featured: Grid
                                                    </a>
                                                </li>
                                                <li id="menu-item-602"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-602">
                                                    <a href="category/fashion/indexf5f9.html?cat_layout=modern">
                                                        Modern
                                                        Listing
                                                    </a>
                                                </li>
                                                <li id="menu-item-603"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-603">
                                                    <a href="category/fashion/indexc6ff.html?cat_layout=modern&amp;layout=full">
                                                        Modern
                                                        3 Columns
                                                    </a>
                                                </li>
                                                <li id="menu-item-604"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-604">
                                                    <a href="category/fashion/index.html">Blog Listing</a>
                                                </li>
                                                <li id="menu-item-605"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-605">
                                                    <a href="category/fashion/indexe2d6.html?cat_layout=classic">
                                                        Classic
                                                        Large
                                                    </a>
                                                </li>
                                                <li id="menu-item-606"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-606">
                                                    <a href="category/fashion/index3f0c.html?cat_layout=grid-overlay">
                                                        Grid
                                                        Overlay
                                                    </a>
                                                </li>
                                                <li id="menu-item-607"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-607">
                                                    <a href="category/fashion/index308b.html?cat_layout=grid-overlay&amp;layout=full">
                                                        Overlay
                                                        3 Cols
                                                    </a>
                                                </li>
                                                <li id="menu-item-608"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-608">
                                                    <a href="category/beauty/index20ec.html?cat_layout=tall-overlay">
                                                        Tall
                                                        Grid
                                                    </a>
                                                </li>
                                                <li id="menu-item-609"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-609">
                                                    <a href="category/fashion/indexcb15.html?cat_layout=timeline">Timeline</a>
                                                </li>
                                                <li id="menu-item-610"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-610">
                                                    <a href="category/opinion/index.html">Infinite Scroll</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li id="menu-item-611"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-611">
                                            <a href="#">Review Posts</a>
                                            <ul class="sub-menu">
                                                <li id="menu-item-612"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-612">
                                                    <a href="2016/12/28/review-of-a-beautiful-product-we-highly-recommend/index.html">
                                                        Points
                                                        Review
                                                    </a>
                                                </li>
                                                <li id="menu-item-613"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-613">
                                                    <a href="2016/12/28/review-of-a-beautiful-product-we-highly-recommend/index53bb.html?review_type=percent">
                                                        Percent
                                                        Review
                                                    </a>
                                                </li>
                                                <li id="menu-item-614"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-614">
                                                    <a href="2016/12/28/review-of-a-beautiful-product-we-highly-recommend/index86a3.html?review_type=stars">
                                                        Stars
                                                        Review
                                                    </a>
                                                </li>
                                                <li id="menu-item-615"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-615">
                                                    <a href="2016/12/28/review-of-a-beautiful-product-we-highly-recommend/indexce45.html?review_pos=top">
                                                        Top
                                                        Position
                                                    </a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li id="menu-item-616"
                                            class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-616">
                                            <a href="#">Header Styles</a>
                                            <ul class="sub-menu">
                                                <li id="menu-item-617"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-617">
                                                    <a target="_blank" href="http://theme-sphere.com/smart-mag/">
                                                        Classic
                                                        Style
                                                    </a>
                                                </li>
                                                <li id="menu-item-618"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-618">
                                                    <a target="_blank" href="../tech/index.html">Tech Style</a>
                                                </li>
                                                <li id="menu-item-619"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-619">
                                                    <a href="index.html">Trendy Style</a>
                                                </li>
                                                <li id="menu-item-620"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-620">
                                                    <a target="_blank" href="../zine/index.html">Dark Style</a>
                                                </li>
                                                <li id="menu-item-621"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-621">
                                                    <a href="index1522.html?header_style=centered">Centered Logo</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li id="menu-item-622"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-622">
                                            <a href="#">Pages &#038; Templates</a>
                                            <ul class="sub-menu">
                                                <li id="menu-item-623"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-623">
                                                    <a href="typography/index.html">Normal Page</a>
                                                </li>
                                                <li id="menu-item-624"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-624">
                                                    <a href="typography/index09cf.html?layout=full">Full Width Page</a>
                                                </li>
                                                <li id="menu-item-625"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-625">
                                                    <a href="author/trendy/index.html">Author Page</a>
                                                </li>
                                                <li id="menu-item-626"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-626">
                                                    <a href="our-authors/index.html">Authors List</a>
                                                </li>
                                                <li id="menu-item-627"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-627">
                                                    <a href="sitemap/index.html">Sitemap Page</a>
                                                </li>
                                                <li id="menu-item-628"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-628">
                                                    <a href="index723a.html?p=1000000">404 Example</a>
                                                </li>
                                                <li id="menu-item-629"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-629">
                                                    <a href="indexcf59.html?s=test">Search Results</a>
                                                </li>
                                                <li id="menu-item-630"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-630">
                                                    <a href="get-in-touch/index.html">Contact Us</a>
                                                </li>
                                                <li id="menu-item-631"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-631">
                                                    <a href="typography/index.html">Typography</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li id="menu-item-632"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-632">
                                            <a href="#">Other Archives</a>
                                            <ul class="sub-menu">
                                                <li id="menu-item-633"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-633">
                                                    <a href="tag/lifestyle/index.html">Tag Archive</a>
                                                </li>
                                                <li id="menu-item-634"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-634">
                                                    <a href="2017/01/index.html">Date Archive</a>
                                                </li>
                                                <li id="menu-item-635"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-635">
                                                    <a href="indexcf59.html?s=test">Search Results</a>
                                                </li>
                                                <li id="menu-item-636"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-636">
                                                    <a href="author/trendy/index.html">Author Archive</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li id="menu-item-637"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-637">
                                            <a href="2017/01/05/places-everyone-should-visit-in-their-life-before-2018/index.html">
                                                Multipage
                                                Slideshow
                                            </a>
                                        </li>
                                        <li id="menu-item-638"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-638">
                                            <a href="http://theme-sphere.com/smart-mag/shop/">Shop/WooCommerce</a>
                                        </li>
                                        <li id="menu-item-639"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-639">
                                            <a href="http://theme-sphere.com/smart-mag/forums/">bbPress Forums</a>
                                        </li>
                                        <li id="menu-item-640"
                                            class="menu-item menu-item-type-custom menu-item-object-custom menu-item-640">
                                            <a href="home-blocks/index.html">Home Blocks</a>
                                        </li>
                                        <li id="menu-item-641"
                                            class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-641">
                                            <a href="#">More Demos</a>
                                            <ul class="sub-menu">
                                                <li id="menu-item-642"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-642">
                                                    <a target="_blank" href="../zine/index.html">TheZine</a>
                                                </li>
                                                <li id="menu-item-643"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-643">
                                                    <a target="_blank"
                                                       href="http://theme-sphere.com/smart-mag/">Classic</a>
                                                </li>
                                                <li id="menu-item-644"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-644">
                                                    <a href="index.html">Lifestyle</a>
                                                </li>
                                                <li id="menu-item-645"
                                                    class="menu-item menu-item-type-custom menu-item-object-custom menu-item-645">
                                                    <a target="_blank" href="../tech/index.html">Tech Demo</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li id="menu-item-39"
                                    class="menu-item menu-item-type-taxonomy menu-item-object-category menu-cat-12 menu-item-39">
                                    <a href="category/leisure/index.html">Leisure</a>
                                </li>
                                <li id="menu-item-36"
                                    class="menu-item menu-item-type-taxonomy menu-item-object-category menu-cat-8 menu-item-36">
                                    <a href="category/business/index.html">Business</a>
                                </li>
                                <li id="menu-item-37"
                                    class="menu-item menu-item-type-taxonomy menu-item-object-category menu-cat-7 menu-item-37">
                                    <a href="category/celebrities/index.html">Celebrities</a>
                                </li>
                                <li id="menu-item-38"
                                    class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-has-children menu-cat-4 menu-item-38">
                                    <a href="category/fashion/index.html">Fashion</a>
                                    <div class="mega-menu row">
                                        <div class="col-3 sub-cats">
                                            <ol class="sub-nav">
                                                <li id="menu-item-44"
                                                    class="menu-item menu-item-type-taxonomy menu-item-object-category menu-cat-11 menu-item-44">
                                                    <a href="category/beauty/index.html">Beauty</a>
                                                </li>
                                                <li id="menu-item-257"
                                                    class="menu-item menu-item-type-taxonomy menu-item-object-category menu-cat-18 menu-item-257">
                                                    <a href="category/lifestyle/index.html">Lifestyle</a>
                                                </li>
                                                <li id="menu-item-256"
                                                    class="menu-item menu-item-type-taxonomy menu-item-object-category menu-cat-9 menu-item-256">
                                                    <a href="category/leisure/travel/index.html">Travel</a>
                                                </li>
                                                <li id="menu-item-46"
                                                    class="menu-item menu-item-type-taxonomy menu-item-object-category menu-cat-10 menu-item-46">
                                                    <a href="category/fitness/index.html">Fitness</a>
                                                </li>
                                            </ol>
                                        </div>
                                        <div class="col-9 extend">
                                            <section class="col-6 featured">
                                                <span class="heading">Featured</span>
                                                <div class="highlights">
                                                    <article>
                                                        <a href="2017/01/08/summer-style-chunky-knit-for-leather-suits-2/index.html"
                                                           title="Summer Style: Chunky Knit For Leather Suits"
                                                           class="image-link">
                                                            <img width="336" height="200"
                                                                 src="images/shutterstock_350007890-336x200.jpg"
                                                                 class="image wp-post-image"
                                                                 alt="shutterstock_350007890"
                                                                 title="Summer Style: Chunky Knit For Leather Suits"
                                                                 srcset="images/shutterstock_350007890-336x200.jpg 336w, images/shutterstock_350007890-336x200@2x.jpg 672w"
                                                                 sizes="(max-width: 336px) 100vw, 336px"/>
                                                        </a>
                                                        <h2 class="post-title">
                                                            <a href="2017/01/08/summer-style-chunky-knit-for-leather-suits-2/index.html"
                                                               title="Summer Style: Chunky Knit For Leather Suits">
                                                                Summer
                                                                Style: Chunky Knit For Leather Suits
                                                            </a>
                                                        </h2>
                                                        <div class="cf listing-meta meta below">
                                                                <span class="meta-item author">
                                                                    By <a href="author/trendy/index.html"
                                                                          title="Posts by Kate Hanson" rel="author">Kate Hanson</a>
                                                                </span>
                                                            <time datetime="2017-01-08T02:30:37+00:00"
                                                                  class="meta-item">
                                                                January 8, 2017
                                                            </time>
                                                        </div>
                                                    </article>
                                                </div>
                                            </section>
                                            <section class="col-6 recent-posts">
                                                <span class="heading">Recent</span>
                                                <div class="posts-list">
                                                    <div class="post">
                                                        <a href="2017/01/08/fashion-chic-x-latest-mejuri-jewelry-collection-of-2017-2/index.html">
                                                            <img width="104" height="69"
                                                                 src="images/shutterstock_536935141-104x69.jpg"
                                                                 class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
                                                                 alt="shutterstock_536935141"
                                                                 title="Fashion Chic X Mejuri Jewelry Collection of 2017"
                                                                 srcset="images/shutterstock_536935141-104x69.jpg 104w, images/shutterstock_536935141-300x196.jpg 300w, images/shutterstock_536935141-1000x653.jpg 1000w, images/shutterstock_536935141-702x459.jpg 702w, images/shutterstock_536935141-214x140.jpg 214w, images/shutterstock_536935141-104x69@2x.jpg 208w, images/shutterstock_536935141-300x196@2x.jpg 600w, images/shutterstock_536935141-1000x653@2x.jpg 2000w, images/shutterstock_536935141-702x459@2x.jpg 1404w, images/shutterstock_536935141-214x140@2x.jpg 428w"
                                                                 sizes="(max-width: 104px) 100vw, 104px"/>
                                                        </a>
                                                        <div class="content">
                                                            <a href="2017/01/08/fashion-chic-x-latest-mejuri-jewelry-collection-of-2017-2/index.html">
                                                                Fashion
                                                                Chic X Mejuri Jewelry Collection of 2017
                                                            </a>
                                                            <div class="cf listing-meta meta below">
                                                                <time datetime="2017-01-08T02:34:37+00:00"
                                                                      class="meta-item">
                                                                    January 8, 2017
                                                                </time>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="post">
                                                        <a href="2017/01/08/trending-bodysuits-and-faded-friendship-jeans-2/index.html">
                                                            <img width="104" height="69"
                                                                 src="images/shutterstock_518581786-104x69.jpg"
                                                                 class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
                                                                 alt="shutterstock_518581786"
                                                                 title="Trending: Bodysuits and Faded Friendship Jeans"
                                                                 srcset="images/shutterstock_518581786-104x69.jpg 104w, images/shutterstock_518581786-300x200.jpg 300w, images/shutterstock_518581786-1000x667.jpg 1000w, images/shutterstock_518581786-702x459.jpg 702w, images/shutterstock_518581786-214x140.jpg 214w, images/shutterstock_518581786-104x69@2x.jpg 208w, images/shutterstock_518581786-300x200@2x.jpg 600w, images/shutterstock_518581786-1000x667@2x.jpg 2000w, images/shutterstock_518581786-702x459@2x.jpg 1404w, images/shutterstock_518581786-214x140@2x.jpg 428w"
                                                                 sizes="(max-width: 104px) 100vw, 104px"/>
                                                        </a>
                                                        <div class="content">
                                                            <a href="2017/01/08/trending-bodysuits-and-faded-friendship-jeans-2/index.html">
                                                                Trending:
                                                                Bodysuits and Faded Friendship Jeans
                                                            </a>
                                                            <div class="cf listing-meta meta below">
                                                                <time datetime="2017-01-08T02:33:37+00:00"
                                                                      class="meta-item">
                                                                    January 8, 2017
                                                                </time>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="post">
                                                        <a href="2017/01/08/summer-style-chunky-knit-for-leather-suits-2/index.html">
                                                            <img width="104" height="69"
                                                                 src="images/shutterstock_350007890-104x69.jpg"
                                                                 class="attachment-post-thumbnail size-post-thumbnail wp-post-image"
                                                                 alt="shutterstock_350007890"
                                                                 title="Summer Style: Chunky Knit For Leather Suits"
                                                                 srcset="images/shutterstock_350007890-104x69.jpg 104w, images/shutterstock_350007890-300x200.jpg 300w, images/shutterstock_350007890-1000x667.jpg 1000w, images/shutterstock_350007890-702x459.jpg 702w, images/shutterstock_350007890-214x140.jpg 214w, images/shutterstock_350007890-104x69@2x.jpg 208w, images/shutterstock_350007890-300x200@2x.jpg 600w, images/shutterstock_350007890-1000x667@2x.jpg 2000w, images/shutterstock_350007890-702x459@2x.jpg 1404w, images/shutterstock_350007890-214x140@2x.jpg 428w"
                                                                 sizes="(max-width: 104px) 100vw, 104px"/>
                                                        </a>
                                                        <div class="content">
                                                            <a href="2017/01/08/summer-style-chunky-knit-for-leather-suits-2/index.html">
                                                                Summer
                                                                Style: Chunky Knit For Leather Suits
                                                            </a>
                                                            <div class="cf listing-meta meta below">
                                                                <time datetime="2017-01-08T02:30:37+00:00"
                                                                      class="meta-item">
                                                                    January 8, 2017
                                                                </time>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </section>
                                        </div>
                                    </div>
                                </li>
                                <li id="menu-item-40"
                                    class="menu-item menu-item-type-taxonomy menu-item-object-category menu-cat-13 menu-item-40">
                                    <a href="category/opinion/index.html">Opinion</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="nav-search nav-light-search wrap">
                    <div class="search-overlay">
                        <a href="#" title="Search" class="search-icon">
                            <i class="fa fa-search"></i>
                        </a>
                        <div class="search">
                            <form role="search" action="" method="get">
                                <input type="text" name="s" class="query live-search-query" value=""
                                       placeholder="Search..."/>
                                <button class="search-button" type="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="breadcrumbs-wrap">
        <div class="wrap">
        </div>
    </div>