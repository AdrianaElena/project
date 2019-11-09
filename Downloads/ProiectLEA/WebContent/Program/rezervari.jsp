<%-- 
    Document   : rezervari
    Created on : Apr 17, 2019, 12:12:39 PM
    Author     : adria
--%>

<%@page import="daw.test.model.bean.ProgramBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script>
            function validateForm() {
                var x = document.forms["myForm"]["nrLocuri"].value;
                var y = document.forms["myForm"]["nrLocuriRamase"].value;
                console.log(x);
                console.log(y)
                if (Number(x) > Number(y)) {
                    alert("Mai sunt doar  bilete disponibile");
                    document.getElementById('nrLocuri').focus();
                    return false;
                }
            }
        </script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="film.css">
        <title>Rezervari</title>
    </head>
    <jsp:include page="/Header/menuBar.jsp"/>
    <body onLoad="clearForms()" onunload="clearForms()">

        <div class="container info">

            Nume film: ${film} <br/>
            Cinema: ${numeCinema} <br/>

            <c:forEach items="${pbean}" var="pbean">
                Data: ${pbean.data} <br/>
                Ora: ${pbean.ora} <br/>
                Pret bilet: ${pbean.pret} lei<br/>
            </c:forEach>
            ${nrBilRez}<br/>
            ${pbean.get(0).getTotalLocuri()}

            <c:choose>
                <c:when test="${nrBilRez < pbean.get(0).getTotalLocuri()}"> 

                    <form  action="/RezervatServlet" onsubmit="return validateForm()" method="post" name="myForm">

                        Introduceti nr de locuri: 
                        <input type="number" min="1" name="nrLocuri" class="form-control, col-2" id="nrLocuri" required="required"/> <br/>

                        <input type="hidden" name="idProgram" value="${pbean.get(0).idProgram}"/>
                        <input type="hidden" name="nrLocRamase" id="nrLocRamase" value="${pbean.get(0).getTotalLocuri() - nrBilRez}"/>
                        <br/><br/>

                        <button type="submit" value="submit" class="btn btn-success">
                            Rezerva 
                        </button> 
                    </form>

                </c:when>
                <c:otherwise> <br/> <h6>Ne pare rau, dar nu mai sunt bilete disponibile. </h6></c:otherwise>
            </c:choose>

        </div>

    </body>
    <jsp:include page="/Header/footer.jsp" /> 
</html>
