<%-- 
    Document   : addFilm
    Created on : Jun 4, 2019, 11:35:17 PM
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
        
        <title>Add Film</title>
    </head>
    <jsp:include page="/Header/menuBar.jsp"/>
    <body>
        <div class="container">
            
            <form action="/InsertFilm" method="post">
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label">Nume film</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="nume" id="nume" required="required">
                    </div>
                </div>
                    
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">An</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="an" id="an" required="required">
                    </div>
                </div>
                    
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label">Genul</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="genul" id="genul" required="required">
                    </div>
                </div>
                    
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label">Durata</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="durata" id="durata" required="required">
                    </div>
                </div>
                    
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label">Descriere</label>
                    <div class="col-sm-10">
                        <input  class="form-control" name="descriere" id="descriere" required="required">
                    </div>
                </div>
                    
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label">Actori</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="actori" id="actori" required="required">
                    </div>
                </div>
                    
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label">Format</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="format" id="format" required="required">
                    </div>
                </div>
                
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label">Traducere</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="traducere" id="traducere" required="required">
                    </div>
                </div>
                
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label">Poza</label>
                    <div class="col-sm-10">
                        <input type="file" name="poza" id="poza" >
                    </div>
                </div>
                
                <div class="form-group row">
                    <label  class="col-sm-2 col-form-label"> Link Trailer</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="video" id="video">
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
