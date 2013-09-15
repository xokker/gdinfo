<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Список депутатов</title>
</head>
<body>

<div class="container">
    <div class="results">
        <h1>Список депутатов</h1>
        <table class="table" style="text-align: left">
            <thead>
            <tr>
                <th class="num">№</th>
                <th>Депутат</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="dep" items="${rating}" varStatus="counter">
                <tr>
                    <td><p>${counter.count}</p></td>
                    <td><a href="<c:url value="/${dep.id}"/>">${dep.firstName} ${dep.middleName} ${dep.lastName}</a></td>
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