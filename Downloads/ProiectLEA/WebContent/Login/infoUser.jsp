<%-- 
    Document   : infoUser
    Created on : May 10, 2019, 10:24:26 PM
    Author     : adria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

        <title>JSP Page</title>
    </head>
    <jsp:include page="/Header/menuBar.jsp"/>
    <body>
        
        <br/><br/>
        <div class="container">
            
            <form action="/UpdateUserServlet" method="post">
                
                <input type="hidden" class="form-control" name="iduser" id="iduser" value="${userInfo.idUser}">
                
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label">Nume utilizator</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="un" id="un" value="${userInfo.username}" required="required">
                    </div>
                </div>
                    
                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label" >Parola</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="pw" id="pw" id="inputPassword3" value="${userInfo.password}" pattern=".{5,15}" required title="5 to 15 characters">
                    </div>
                </div>
                    
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label">Numele</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="lname" id="lname" value="${userInfo.lastName}" required="required">
                    </div>
                </div>
                    
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label">Prenumele</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="fname" id="fname" value="${userInfo.firstName}" required="required">
                    </div>
                </div>
                    
                <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" name="email" id="email" value="${userInfo.email}" required="required">
                    </div>
                </div>
                    
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label">Numar de telefon</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="nrtel" id="nrtel" value="${userInfo.nrtel}" required pattern="[0-9]{10}" required title="10 characters">
                    </div>
                </div>
                    
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label">Oras</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="oras" id="oras" value="${userInfo.oras}" required="required">
                    </div>
                </div>
               <br/>
                <div class="form-group row">
                    <div class="col-sm-10">
                        <button type="submit" value="submit" class="btn btn-primary">Salveaza</button>
                    </div>
                </div>

            </form>
        </div>
    </body>
    <jsp:include page="/Header/footer.jsp" /> 
</html>
