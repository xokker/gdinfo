<%@ page contentType="text/html; charset=UTF-8" %>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Gdinfo</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="#">Депутаты</a></li>
                <li><a href="#about">Партии</a></li>
                <li class="active"><a href="/gdinfo/hotornot">Hot Or Not</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Антирейтинг <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Ленивые депутаты</a></li>
                        <li><a href="#">Непопулярные депутаты</a></li>
                        <li><a href="/gdinfo/hotornot/antirating">Not Hot депутаты</a></li>
                    </ul>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>