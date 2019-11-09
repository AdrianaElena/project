<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%
    response.setHeader("Cache-Control", "no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <script>
            function clearForms() {
                var i;
                for (i = 0; (i < document.forms.length); i++)
                    document.forms[i].reset();
            }
            function validateForm() {
                var x = document.forms["myForm"]["un"].value;
                if (x == null || x == "") {
                    alert("Username must be filled out");
                    document.getElementById('un').focus();
                    return false;
                }
                var y = document.forms["myForm"]["pw"].value;
                if (y == null || y == "") {
                    alert("password must be filled out");
                    document.getElementById('pw').focus();
                    return false;
                }
            }
        </script>
        <title>Login Page</title>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="/Login/logincss.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    </head>
    <body onLoad="clearForms()" onunload="clearForms()">


        <div class="modal-dialog text-center">
            <div class="col-md-9 main-section">
                <div class="modal-content">

                    <div class="col-12 user-icon">
                        <i class="fas fa-user-alt"></i>
                    </div>

                    <form class="col-12" action="/LoginServlet" onsubmit="return validateForm()" method="post" name="myForm">
                        <div class="form-group">
                            <input type="text" name="un" id="un" class="form-control form-control-lg" placeholder="Enter username"><br>
                            <input type="password" name="pw" id="pw" class="form-control form-control-lg" placeholder="Enter password" >
                        </div>

                        <button type="submit" value="submit" class="btn">
                            <i class="fas fa-sign-in-alt icon-log"></i>Login 
                        </button>    
                    </form>

                    <br>

                    <div class="col-12 register">
                        <a href="/Login/RegisterPage.jsp">
                            <p>
                                If you don't have an account,
                            </p> 
                            <p>
                                please register first! 
                            </p> 
                        </a>
                    </div>

                </div>
            </div>
        </div>

    </body>
</html>

