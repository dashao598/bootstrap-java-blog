<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Blog Template for Bootstrap</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
</head>
<div class="container">
    <div class="row">
        <div class="col-sm-5">
            <div class="form-group">
                <div>
                <label for="tilte">title:</label>
                <input type="text" class="form-control" id="source_title">
                </div>
                <label for="source">source:</label>
                <textarea class="form-control" rows="20" id="source"></textarea>
            </div>
            <button type="button" class="btn btn-default navbar-btn" id="savebutton">保存</button>
        </div>

        <div class="col-sm-2">
        </div>

        <div class="col-sm-5">
            <label for="source">output:</label>
            <div id="output">

            </div>
        </div>
    </div>
</div>

<script src="/js/jquery-3.1.1.min.js"></script>
<script src="/js/showdown.min.js"></script>
<script>
    $(document).ready(function () {
        var converter = new showdown.Converter();
        $("#source").keyup(function () {
            var text = $("#source").val();
            var html = converter.makeHtml(text);
            html = "<h2>"+$("#source_title").val()+"</h2>"+html;
            $("#output").html(html)
        })

        $("#source").keydown(function (e) {
            var keyCode = e.keyCode || e.which;
            if (keyCode == 9) {
                e.preventDefault();
                var start = $(this).get(0).selectionStart;
                var end = $(this).get(0).selectionEnd;

                // set textarea value to: text before caret + tab + text after caret
                $(this).val($(this).val().substring(0, start)
                        + "\t"
                        + $(this).val().substring(end));

                // put caret at right position again
                $(this).get(0).selectionStart =
                        $(this).get(0).selectionEnd = start + 1;
            }
        })


        $("#savebutton").click(function () {
            var title = $("#source_title").val();
            var text = $("#source").val();
            console.log(title)
            console.log(text);
//            send ajax request to save the content.
            $.ajax({
                url: "/addContent",
                data: {
                    title:title,
                    sourceContent:text
                },
                type: "GET",
                dataType: "json",
            }).done(function (json) {
                console.log(json);
                window.location.href="/";
            })
        })
    })
</script>
<body>
</body>

</html>