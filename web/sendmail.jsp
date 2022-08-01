<%-- 
    Document   : sendmail
    Created on : Jul 30, 2022, 11:14:57 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet"
              href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container" style="margin-top: 10px;">
            <div class="row"
                 style="border: 1px darkgrey solid; border-radius: 10px; width: 50%; margin: 0 auto; padding: 20px;">
                <div class="col-sm-12">
                    <h2 class="myclass">Information</h2>
                    <form action="SendMailController" >
                        <input type="hidden" name="userID" value="${Email_PT.userID}" />
                        <div class="form-group">
                            <label>To:</label> 
                            <input type="text"
                                   class="form-control" name="email"  value="${Email_PT.email}" readonly="">
                        </div>
                        <div class="form-group">
                            <label>Subject:</label> 
                            <input type="text"
                                   class="form-control" name="subject" placeholder="Enter Subject">
                        </div>
                        <div class="form-group">
                            <label for="content">Content:</label>
                            <textarea id="comment" class="form-control" rows="3"  name="content"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Send</button>
                        <button type="reset" class="btn btn-primary">Cancel</button>
                    </form>
                </div>
            </div>
        </div>
        <script src="ckeditor/ckeditor.js" type="text/javascript"></script>
        <script>
            var editor = '';
            $(document).ready(function () {
                editor = CKEDITOR.replace('comment');
            });
        </script>

    </body>
</html>