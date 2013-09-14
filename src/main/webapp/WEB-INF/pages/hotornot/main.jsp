<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
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
        .deputy-block {
            display: inline-block;
            width: 170px;
        }
        .deputy-block .title {
            display: block;
        }
        .choise, .results {
            text-align: center;
            margin: 0 auto;
        }
        .choise {
            width: 600px;
        }
        .results {
            width: 600px;
        }
        .versus {
            display: inline-block;
            position: relative;
            top: -100px;
        }
        td > .label{
            display: block;
            width: 50px;
        }
        .num{
            width: 30px;
        }
    </style>
</head>
<body>

<jsp:include page="../menu.jsp" />

<div class="container">
    <div class="choise">
        <div class="deputy-block">
            <a href="<c:url value="/hotornot">
            <c:param name="first" value="${leftDeputy.id}" />
            <c:param name="second" value="${rightDeputy.id}" />
            <c:param name="result" value="left" />
            </c:url>"><img src="${leftDeputy.bigPhotoURL}" class="img-thumbnail"></a>
            <a href="#" class="title">${leftDeputy.lastName}</a>
        </div>
        <div class="versus">
            <span class="label label-primary">vs</span>
        </div>
        <div class="deputy-block">
            <a href="<c:url value="/hotornot">
            <c:param name="first" value="${leftDeputy.id}" />
            <c:param name="second" value="${rightDeputy.id}" />
            <c:param name="result" value="right" />
            </c:url>"><img src="${rightDeputy.bigPhotoURL}" class="img-thumbnail"></a>
            <a href="#" class="title">${rightDeputy.lastName}</a>
        </div>
    </div>

    <div class="results">
        <h3>Результаты</h3>
        <table class="table" style="text-align: left">
            <thead>
            <tr>
                <th class="num">№</th>
                <th>Депутат</th>
                <th>Плюсов</th>
                <th>Минусов</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="dep" items="${rating}" varStatus="counter">
                <tr>
                    <td><p>${counter.count}</p></td>
                    <td><a href="">${dep.firstName} ${dep.lastName}</a></td>
                    <td><span class="label label-success"><c:out value="${dep.positiveVoices}"/></span></td>
                    <td><span class="label label-warning"><c:out value="${dep.negativeVoices}"/></span></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</div><!-- /.container -->

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
</div>
</body>
</html>