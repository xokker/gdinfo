<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Список депутатов</title>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <style type="text/css">

        .deputy-block .title {
            display: block;
        }
        .results {
            text-align: center;
            margin: 0 auto;
        }

        .results {
            width: 600px;
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

<jsp:include page="menu.jsp" />

<div class="container">
    <div class="results">
        <h3>Список депутатов</h3>
        <table class="table" style="text-align: left">
            <thead>
            <tr>
                <th class="num">№</th>
                <th>Фото</th>
                <th>Депутат</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="dep" items="${rating}" varStatus="counter">
                <tr>
                    <td><p>${counter.count}</p></td>
                    <td><img src="${dep.smallPhotoURL}" class="img-thumbnail"></td>
                    <td><a href="<c:url value="/${dep.id}"/>">${dep.firstName} ${dep.lastName}</a></td>
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