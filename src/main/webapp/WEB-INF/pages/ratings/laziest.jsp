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
            font-size: 15pt;
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
            width: 40px;
        }
        .num{
            width: 100px;
        }
        .rate{
            width:200px;
        }
        h1{
            width: 400px!important;
        }
        .btn-primary{
            margin: auto;
            display: block!important;
            font-size: 20pt;
        }
    </style>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" ></script>
    <script>
        $(document).ready(function() {
            var num=0;
            var numEnd=num+19;
            var jsonMassiveLazy;
            $.ajax({
                type:"GET",
                url: "http://ec2-54-202-33-121.us-west-2.compute.amazonaws.com/gdinfo/laziest/ajax.json",
                success: function(result){
                    jsonMassiveLazy = result;
                    for(num;num<=numEnd;num++){
                        $(".table").children("tbody").append("<tr><td><p>"+(num+1)+"</p></td><td><a href='http://ec2-54-202-33-121.us-west-2.compute.amazonaws.com/gdinfo/"+jsonMassiveLazy[num]['id']+"'>"+jsonMassiveLazy[num]['lastName']+" "+jsonMassiveLazy[num]['firstName']+"</td><td><span class='label label-success'>"+jsonMassiveLazy[num]['lawCount']+"</span></td></tr>");
                    }
                    numEnd=num+19;
                    console.log(numEnd);
                },
                dataType:"json"
            });

            $(".btn").click(function(){
                for(num;num<=numEnd;num++){
                    $(".table").children("tbody").append("<tr><td><p>"+(num+1)+"</p></td><td><a href='http://ec2-54-202-33-121.us-west-2.compute.amazonaws.com/gdinfo/"+jsonMassiveLazy[num]['id']+"'>"+jsonMassiveLazy[num]['lastName']+" "+jsonMassiveLazy[num]['firstName']+"</td><td><span class='label label-success'>"+jsonMassiveLazy[num]['lawCount']+"</span></td></tr>");
                }
                numEnd = num + 19;
            })
        });
    </script>
</head>
<body>

<jsp:include page="../menu.jsp" />

<div class="container">
    <div class="results">
        <h1>Самые ленивые депутаты</h1>
        <table class="table table-condensed" style="text-align: left">
            <thead>
            <tr>
                <th class="num">№</th>
                <th class="surname">Депутат</th>
                <th class="rate">Подано</th>
                <%--<th class="rate"><span>% непринятых</span></th>--%>
            </tr>
            </thead>

            <tbody>
            <%--<c:forEach var="dep" items="${rating}" varStatus="counter">--%>
                <%--<tr>--%>
                    <%--<td><p>${counter.count}</p></td>--%>
                    <%--<td><a href="<c:url value="/${dep.id}"/>">${dep.firstName} ${dep.lastName}</a></td>--%>
                    <%--<td><span class="label label-success">${dep.lawCount}</span></td>--%>
                    <%--&lt;%&ndash;<td><span class="label label-warning">${dep.laziness}</span></td>&ndash;%&gt;--%>
                <%--</tr>--%>
            <%--</c:forEach>--%>
            </tbody>
        </table>
    </div>
    <button class="btn btn-primary">Дальше</button>
</div>

</div><!-- /.container -->

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
</div>
</body>
</html>