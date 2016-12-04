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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    </head>
    <body>
<!--        
        This form upload a file name "LocationName" to Local Server 
        then to Dropbox Directory Apps/TravelPlanning/LocationName.FileExtension-->
        
      <h1>Picture upload</h1>
        <form action="ImageController" method="post" enctype="multipart/form-data">
            <label>Location name: </label>
    <input type="text" name="locname" value="default"/>
    <input type="file" name="uploadFile" id="uploadFile" />
    <input type="hidden" name="command" value="upload">
    <img width="200" padding-top="56.25%" id="image_upload_preview" src="#" alt="Preview Image" />
    <input type="submit" value="Upload Image" />
</form>
        <h1>Picture download</h1>
        <form action="ImageController" method="post">
            <label>Location name: </label>
    <input type="text" name="Locname" />
    <input type="hidden" name="command" value="download">
    <input type="submit" />
</form>
        <%
        if(session.getAttribute("imageurl") != null)
        { %>
        <img src="<%=session.getAttribute("imageurl")%>" width="200" padding-top="56.25%" >
     
             <%
                 }
                 %>
        
<!--        Script to preview image-->
        <script>
function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#image_upload_preview').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#uploadFile").change(function () {
        readURL(this);
    });
</script>  
    </body>
</html>
