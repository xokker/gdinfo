<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Информация о партии "${party.shortName}"</title>
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


    <jsp:include page="../menu.jsp" />

        <div class="container">

            <div class="row">
                <div class="col-md-2">
                    <img src="${party.pictureURL}" class="img-thumbnail">
                </div>

                <div class="col-md-10">
                    <div class="information">
                        <h1>${party.name}</h1>
                        <p>${party.numberOfMembers} членов в ГД</p>
                        <p>${party.numberOfLaws} законов внесены в ГД</p>
                        <p><a target="_blank" href="${party.link}">Официальный сайт партии</a></p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-2">

                </div>

                <div class="col-md-5">
                    <c:choose>
                    <c:when test="${rate_map['62698'] gt 0.01}">
                        <h3>Государственное строительство и конституционные
                            права граждан</h3>

                        <div class="progress">
                            <div class="progress-bar progress-bar-success"
                                 role="progressbar"
                                 aria-valuenow="${rate_map['62698']}"
                                 aria-valuemin="0" aria-valuemax="100"
                                 style="width: ${rate_map['62698']}%">
                                <span class="sr-only">${rate_map['62698']}% Complete (success)</span>
                            </div>
                        </div>
                    </c:when>  </c:choose>
                    <c:choose>
                    <c:when test="${rate_map['62699'] gt 0.01}">
                        <h3>Экономическая политика</h3>

                        <div class="progress">
                            <div class="progress-bar progress-bar-success"
                                 role="progressbar"
                                 aria-valuenow="${rate_map['62699']}"
                                 aria-valuemin="0" aria-valuemax="100"
                                 style="width: ${rate_map['62699']}%">
                                <span class="sr-only">${rate_map['62699']}% Complete</span>
                            </div>
                        </div>
                    </c:when>
                    </c:choose>

                    <c:choose>
                    <c:when test="${rate_map['62700'] gt 0.01}">
                    <h3>Социальная политика</h3>

                    <div class="progress">
                        <div class="progress-bar progress-bar-success"
                             role="progressbar"
                             aria-valuenow="${rate_map['62700']}"
                             aria-valuemin="0" aria-valuemax="100"
                             style="width: ${rate_map['62700']}%">
                            <span class="sr-only">${rate_map['62700']}% Complete (warning)</span>
                        </div>
                    </div>
                    </c:when>
                    </c:choose>
                    <c:choose>
                    <c:when test="${rate_map['62701'] gt 0.01}">
                        <h3>Бюджетное, налоговое, финансовое
                            законодательство</h3>

                        <div class="progress">
                            <div class="progress-bar progress-bar-success"
                                 role="progressbar"
                                 aria-valuenow="${rate_map['62701']}"
                                 aria-valuemin="0" aria-valuemax="100"
                                 style="width: ${rate_map['62701']}%">
                                <span class="sr-only">${rate_map['62701']}% Complete (success)</span>
                            </div>
                        </div>
                    </c:when>
                    </c:choose>
                    <c:choose>
                    <c:when test="${rate_map['62702'] gt 0.01}">
                        <h3>Оборона и безопасность</h3>

                        <div class="progress">
                            <div class="progress-bar progress-bar-success"
                                 role="progressbar"
                                 aria-valuenow="${rate_map['62702']}"
                                 aria-valuemin="0" aria-valuemax="100"
                                 style="width: ${rate_map['62702']}%">
                                <span class="sr-only">${rate_map['62702']}% Complete (success)</span>
                            </div>
                        </div>
                    </c:when>
                    </c:choose>
                    <c:choose>
                    <c:when test="${rate_map['62703'] gt 0.01}">
                        <h3>Ратификация международных договоров Российской
                            Федерации</h3>

                        <div class="progress">
                            <div class="progress-bar progress-bar-success"
                                 role="progressbar"
                                 aria-valuenow="${rate_map['62703']}"
                                 aria-valuemin="0" aria-valuemax="100"
                                 style="width: ${rate_map['62703']}%">
                                <span class="sr-only">${rate_map['62703']}% Complete (success)</span>
                            </div>
                        </div>
                    </c:when>
                    </c:choose>

                    <%--<h2>Факторы</h2>--%>
                    <%--<div class="activities">--%>
                        <%--<div class="activity">--%>
                            <%--<div class="percent">80%</div>--%>
                            <%--<div class="comment">Активность</div>--%>
                        <%--</div>--%>

                        <%--<div class="activity">--%>
                            <%--<div class="percent">90%</div>--%>
                            <%--<div class="comment">Популярность</div>--%>
                        <%--</div>--%>

                        <%--<div class="activity">--%>
                            <%--<div class="percent">70%</div>--%>
                            <%--<div class="comment">Hot Or Not</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                </div>
            </div>




        </div><!-- /.container -->

            <script src="http://code.jquery.com/jquery-latest.js"></script>
            <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        </div>
    </body>
</html>