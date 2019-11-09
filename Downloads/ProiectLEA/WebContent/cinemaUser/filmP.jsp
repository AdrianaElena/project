<%-- 
    Document   : home
    Created on : Apr 4, 2019, 9:23:20 PM
    Author     : adria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>

        <script>
            $(document).ready(function () {
                $('#dtBasicExample').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
        </script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="/cinemaUser/tables.css">

        <title>Film Page</title>
    </head>
    <jsp:include page="/Header/menuBar.jsp"/>
    <body>

        <div class="container">
            <!--
            <form class="form-inline my-2 my-lg-0 mr-lg-10 navbtn" >
                    <input class="form-control mr-sm-2" type="search" placeholder="Find a movie" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>-->
            <br/><br/>
            <table class="table" id="dtBasicExample">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Nume</th>
                        <th scope="col">Anul</th>
                        <th scope="col">Genul</th>
                        <th scope="col">Durata</th>
                        <th scope="col">Actori</th>
                        <th scope="col">Format</th>
                        <th scope="col">Adauga la program</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${filme}" var="film">
                        <tr>
                            <td>${film.getNume()}</td>
                            <td>${film.getAn()}</td>
                            <td>${film.getGenul()}</td>
                            <td>${film.getDurata()}</td>
                            <td>${film.getActori()}</td>
                            <td>${film.getFormat()}</td>
                            <td>
                                <a  class="btn btn-success" href="/cinemaUser/addProgram.jsp?id=${film.getIdFilm()}" role="button">
                                    add
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <br/>
            <a  class="btn btn-success" href="/cinemaUser/addFilm.jsp" role="button">
                Adauga film
            </a>
        </div>
    </body>
    <jsp:include page="/Header/footer.jsp" />
</html>
