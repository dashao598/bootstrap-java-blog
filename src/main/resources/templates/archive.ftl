<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Blog Template for Bootstrap</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/blog.css" rel="stylesheet">
</head>
<body>
<#include "header.ftl">
<div class="container">
    <div class="row">
        <div class="col-sm-8 blog-main">
        <#list years as year>
            <div>
                <h2>${year}</h2>
            </div>
            <#list archiveMap[year] as yearac>
                <p>${yearac.adddate} >> <a href="${yearac.link}">${yearac.title}</a> </p>
            </#list>
        </#list>
        </div>
    </div>
</div>
<#include "footer.ftl">
<script src="/js/jquery-3.1.1.min.js"></script>
</body>
</html>