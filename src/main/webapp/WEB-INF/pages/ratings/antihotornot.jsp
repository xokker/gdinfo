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

        .choise, .results {
            text-align: center;
            margin: 0 auto;
        }
        .choise {
            width: 600px;
        }
        .results > h1{
            width: 300px;
            padding: 0px auto;
            margin: 0px auto;
            font-size: 35pt;
        }
        th{
            font-size: 30pt;
            padding:8px 15px!important;
        }
        td > a{
            font-size: 15pt;
        }
        td > span{
            font-size: 12pt!important;
            margin: 0 auto;
            display: block!important;
        }
        td > p{
            text-align: center;
            font-size: 13pt;
        }
        .num{
            width: 100px;
        }
        .rate{
            width:200px;
        }
    </style>
</head>
<body>


<jsp:include page="../menu.jsp" />

<div class="container">
    <div class="results">
        <h1>Антирейтинг</h1>
        <table class="table" style="text-align: left">
            <thead>
            <tr>
                <th class="num">№</th>
                <th>Депутат</th>
                <th class="rate">Плюсов</th>
                <th class="rate">Минусов</th>
                <th class="rate">Рейтинг</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="dep" items="${rating}" varStatus="counter">
                <tr>
                    <td><p>${counter.count}</p></td>
                    <td><a href="<c:url value="/${dep.id}"/>">${dep.firstName} ${dep.lastName}</a></td>
                    <td><span class="label label-success">${dep.positiveVoices}</span></td>
                    <td><span class="label label-warning">${dep.negativeVoices}</span></td>
                    <td><span class="label label-info">${dep.rating}</span></td>
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