<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:widget="http://wdgt.yandex.ru/ns/"  >
<head>
    <!-- Свойства виджета -->
    <meta name="title" content="Hello, World!" />
    <meta name="description" content="Показывает строку Hello, world!"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <style>
        body {
            margin:0;
        }
        .dep-left, .dep-right {
            float: left;
        }
        .dep-left img, .dep-right img {
            width: 110px;
        }
        .dep-left {
            margin-right: 6px;
        }

	.pictures {
	    width: 280px;
	}
        .info {
            width: 100%;
            text-align: center;
            font: .8em Arial,Helvetica,sans-serif;
        }

        .choice, .results {
            display: inline-block;
        }
        .results {
            position: relative;
            left: 4px;
            width: 15px;
            height: 12px;
            text-decoration: none;
            background-image: url('data:image/png;base64,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');

        }
    </style>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" ></script>
    <script type="text/javascript">
        $(function() {
            getIds = function() {
                return $(".depLink").map(function() { return $(this).data('id') })
            }
            $(".depLink").click(function(e) {
                e.preventDefault()

                var link = $(this)
                var depId = link.data('id')
                var ids = getIds()

                var result;
                if(depId == ids[0]) {
                    result = "left"
                }
                else {
                    result = "right"
                }
                url = "/gdinfo/hotornot/ajax.json?first="+ids[0]+"&second="+ids[1]+"&result="+result;

                $.ajax({
                    type:"GET",
                    url: url,
                    dataType:"json",
                    success: function(result){
                        var deps = $(".depLink");
                        deps.fadeOut();
                        deps.each(function(i, link) {
                            link = $(link);
                            link.find("a").data("id", result[i].id)
                            link.find("img").attr("src", result[i]["bigPhotoURL"]);
                        })

                        deps.fadeIn();


                        $(".choice strong").eq(0).text(result[0]["lastName"])
                        $(".choice strong").eq(1).text(result[1]["lastName"])

                    }

                })
            })
        })
    </script>
</head>
<body>
<div class="pictures">
<a class="depLink" data-id="${leftDeputy.id}" href="javascript:;" class="dep-left">
    <img src="${leftDeputy.bigPhotoURL}">
</a>

<a class="depLink" data-id="${rightDeputy.id}" href="javascript:;" class="dep-right">
    <img src="${rightDeputy.bigPhotoURL}">
</a>
</div>

<div class="info">
    <div class="choice"><strong>${leftDeputy.lastName}</strong> или <strong>${rightDeputy.lastName}</strong></b>?</div>
    <a class="results" href="/hotornot" target="_blank"></a>
</div>
</body>
</html>
