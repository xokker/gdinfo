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
</head>
<body>

<jsp:include page="../menu.jsp" />

<div class="container">
    <div class="results">
        <img src="http://habrastorage.org/storage3/4aa/3e7/32b/4aa3e732b68aa38ca865786816197880.jpg" alt="заседание"/>
    </div>
</div>

</div><!-- /.container -->

</div>
</body>
</html>