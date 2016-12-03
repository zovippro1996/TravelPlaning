<%-- 
    Document   : Location
    Created on : Dec 3, 2016, 10:17:22 AM
    Author     : Steven
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image Upload Download Example</title>
    </head>
    <body>
        
        
<!--        <script>
            function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#preview').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#imgInp").change(function(){
    readURL(this);
});
            </script>-->
        <h1>Picture upload</h1>
        <form action="ImageController" method="post" enctype="multipart/form-data">
            <label>Location name: </label>
    <input type="text" name="locname" />
    <input type="file" name="uploadFile" id="uploadFile" />
    <input type="hidden" name="command" value="upload">
    <img id="preview" src="#" alt="Preview Image" />
    <input type="submit" value="Upload Image" />
</form>
        <h1>Picture download</h1>
        <form action="ImageController" method="post">
            <label>Location name: </label>
    <input type="text" name="description" />
    <input type="hidden" name="command" value="download">
    <input type="submit" />
</form>
    </body>
</html>
