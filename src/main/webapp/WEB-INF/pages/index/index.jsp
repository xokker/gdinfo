<!DOCTYPE html>
<html>
    <head>
        <title>Bootstrap</title>
        <!-- Bootstrap -->
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <style type="text/css">
        body {
            padding-top: 60px;
        }

        .activity {
            display: inline-block;
            margin-right: 10px;
            width: 100px;
            color: white;
            height: 80px;
            text-align: center;
            background-color: #5cb85c;
            border-radius: 5px;
        }
        .activity    .percent {
            font-size: 30px;

            padding-top: 16px;

            margin-bottom: 2px
        }
        .activity .comment {
            font-size: 12px
        }
        </style>
    </head>
    <body>

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
                <li class="active"><a href="#">Депутаты</a></li>
                <li><a href="#about">Партии</a></li>
                <li><a href="#contact">Hot Or Not</a></li>
              </ul>

              <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Антирейтинг <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="#">Ленивые депутаты</a></li>
                    <li><a href="#">Непопулярные депутаты</a></li>
                    <li><a href="#">Not Hot депутаты</a></li>
                  </ul>
                </li>
              </ul>
            </div><!--/.nav-collapse -->
          </div>
        </div>

        <div class="container">

            <div class="row">
                <div class="col-md-2">
                    <img src="http://www.duma.gov.ru/upload/iblock/28b/28b3374efb18ddc91c72373265e2f001.jpg" class="img-thumbnail">
                </div>

                <div class="col-md-10">
                    <div class="information">
                        <h1>Иванов Иван Иванович</h1>
                        <p>Дата родения:<span class="birthday">1 апреля 2000 г.</span></p>
                        <p>Стаж в думе:<span class="experience">10 лет</span></p>
                        <p>
                            <a href="http://www.duma.gov.ru/structure/deputies/131221/" class="duma_govProfile">Профиль на сайте Госдумы</a>
                        </p>
                        <p>
                            <a href="https://twitter.com/ageev_a" class="twitterProfile">Профиль на сайте twitter</a>
                        </p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-2">

                </div>

                <div class="col-md-5">
                    <h3>Образование</h3>
                    <div class="progress">
                      <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                        <span class="sr-only">40% Complete (success)</span>
                      </div>
                    </div>
                    <h3>Обучение</h3>
                    <div class="progress">
                      <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                        <span class="sr-only">20% Complete</span>
                      </div>
                    </div>
                    <h3>Другая категория</h3>
                    <div class="progress">
                      <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                        <span class="sr-only">60% Complete (warning)</span>
                      </div>
                    </div>

                    <h2>Факторы</h2>
                    <div class="activities">
                        <div class="activity">
                            <div class="percent">80%</div>
                            <div class="comment">Активность</div>
                        </div>

                        <div class="activity">
                            <div class="percent">90%</div>
                            <div class="comment">Популярность</div>
                        </div>

                        <div class="activity">
                            <div class="percent">70%</div>
                            <div class="comment">Hot Or Not</div>
                        </div>
                    </div>

                </div>
            </div>




        </div><!-- /.container -->

            <script src="http://code.jquery.com/jquery-latest.js"></script>
            <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        </div>
    </body>
</html>