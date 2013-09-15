<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap</title>
    <!-- Bootstrap -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" ></script>

    <style type="text/css">
        img{
            width: 250px;
            height: 250px
        }
        .tableParty{
            margin:25px auto;
        }
        .tableParty > td{
            display: inline-block;
            margin: 25px!important;
        }
    </style>
</head>
<body>

<jsp:include page="../menu.jsp" />

<div class="container">
    <table class="tableParty">
        <tbody>
        <tr>
            <td>
                <a href="http://ec2-54-202-33-121.us-west-2.compute.amazonaws.com/gdinfo/party/1">
                    <img src="http://habrastorage.org/storage3/271/1d2/400/2711d2400bd20d27e5d89a4e9501f06b.jpg"/>
                </a>
            </td>
            <td>
                <a href="http://ec2-54-202-33-121.us-west-2.compute.amazonaws.com/gdinfo/party/3">
                    <img src="http://habrastorage.org/storage3/98f/3f9/129/98f3f91291e557ec7456a8bdf6e6ddb2.jpg"/>
                </a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="http://ec2-54-202-33-121.us-west-2.compute.amazonaws.com/gdinfo/party/2">
                    <img src="http://habrastorage.org/storage3/809/f4d/4ff/809f4d4ff55dd37ee9edd3c859bd2bdc.jpg"/>
                </a>
            </td>
            <td>
                <a href="http://ec2-54-202-33-121.us-west-2.compute.amazonaws.com/gdinfo/party/4">
                    <img src="http://habrastorage.org/storage3/58a/270/8df/58a2708df753a3b9ace85fd9269437ac.jpg"/>
                </a>
            </td>
        </tr>
        </tbody>
    </table>
</div><!-- /.container -->

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
</div>
</body>
</html>