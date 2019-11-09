<%-- 
    Document   : rezervariUser
    Created on : May 8, 2019, 2:33:50 PM
    Author     : adria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

        <title>JSP Page</title>
        <script type="text/javascript">
            function noBack() {
                window.history.go(-3);
            }
        </script>

    </head>
    <jsp:include page="/Header/menuBar.jsp"/>
    <body onload="noback();">

        <div class="container">

            <table class="table">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Film</th>
                        <th scope="col">Cinema</th>
                        <th scope="col">Oras</th>
                        <th scope="col">Data</th>
                        <th scope="col">Ora</th>
                        <th scope="col">Pret</th>
                        <th scope="col">Nr bilete</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${rezervatList}" var="rList" varStatus="rowCounter">
                        <tr>
                            <td>${rList.getFilm()}</td>
                            <td>${rList.getCinema()}</td>
                            <td>${rList.getOras()}</td>
                            <td>${rList.getData()}</td>
                            <td>${rList.getOra()}</td>
                            <td>${rList.getPret()}</td>
                            <td>${rList.getNrBilete()}</td>
                        </tr>
                    </c:forEach>
                        
                </tbody>
            </table>

        </div>

    </body>
    <jsp:include page="/Header/footer.jsp" /> 
</html>
