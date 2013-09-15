<%@ page contentType="text/html; charset=UTF-8" %>
<div class="navbar navbar-inverse navbar-fixed-top">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css">
        #ya-site-form0{
            float: left;
            width:300px;
            position:relative;
            top: 10px;
            left: 10px;
        }
    </style>
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/gdinfo">Gdinfo</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="#">Депутаты</a></li>
                <li><a href="#about">Партии</a></li>
                <li class="active"><a href="/gdinfo/hotornot">Hot Or Not</a></li>
            </ul>

            <!-- Яндекс поиск-->
            <div class="ya-site-form ya-site-form_inited_no" onclick="return {'bg': 'transparent', 'publicname': '\u0444\u044b\u0432\u0430', 'target': '_self', 'language': 'ru', 'suggest': true, 'tld': 'ru', 'site_suggest': true, 'action': 'http://yandex.ru/sitesearch', 'webopt': false, 'fontsize': 12, 'arrow': false, 'fg': '#000000', 'searchid': '2076012', 'logo': 'rb', 'websearch': false, 'type': 2}"><form action="http://yandex.ru/sitesearch" method="get" target="_self"><input type="hidden" name="searchid" value="2076012" /><input type="hidden" name="l10n" value="ru" /><input type="hidden" name="reqenc" value="" /><input type="text" name="text" value="" /><input type="submit" value="Найти" /></form></div><style type="text/css">.ya-page_js_yes .ya-site-form_inited_no { display: none; }</style><script type="text/javascript">(function(w,d,c){var s=d.createElement('script'),h=d.getElementsByTagName('script')[0],e=d.documentElement;(' '+e.className+' ').indexOf(' ya-page_js_yes ')===-1&&(e.className+=' ya-page_js_yes');s.type='text/javascript';s.async=true;s.charset='utf-8';s.src=(d.location.protocol==='https:'?'https:':'http:')+'//site.yandex.net/v2.0/js/all.js';h.parentNode.insertBefore(s,h);(w[c]||(w[c]=[])).push(function(){Ya.Site.Form.init()})})(window,document,'yandex_site_callbacks');</script>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Антирейтинг<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/gdinfo/laziest">Ленивые депутаты</a></li>
                        <%--<li><a href="#">Непопулярные депутаты</a></li>--%>
                        <li><a href="/gdinfo/hotornot/antirating">Not Hot депутаты</a></li>
                    </ul>
                </li>
            </ul>

        </div><!--/.nav-collapse -->
    </div>
</div>