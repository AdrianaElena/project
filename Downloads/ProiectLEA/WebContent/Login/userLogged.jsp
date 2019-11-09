<%@page import="daw.test.model.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"
         import = "daw.test.model.*"
         %>


<%
    response.setHeader("Cache-Control", "no-store,must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", -1);
    if (session.getAttribute("currentSessionUser") != null) {
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

        <link rel="stylesheet" type="text/css" href="cardGroups.css">

        <title>User Logged Successfully</title>
        <!--    <script type="text/javascript">
                function noBack() {
                    window.history.forward();
                }
            </script>-->
    </head>

    <jsp:include page="/Header/menuBar.jsp"/>



    <body onload="noback()">
        <br>
        <%
            UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
        %>
        
        <br><br>
        <br>

        <div class=" card-deck mainsect container-fluid  table-responsive-md">
            <table class=" container mytable">

                <c:forEach items="${filme}" var="film" varStatus="rowCounter">

                    <c:if test="${rowCounter.count % 3 == 1}">
                        <tr>
                        </c:if>

                        <td class="mycell">
                            <div class="card shadow mycard container">

                                <div class="inner">  
                                    <a  href="/FilmServlet?id=${film.idFilm}">
                                        <img src="<c:out value="${film.poza}"/>" alt="Apasati pentru mai multe informatii" class="card-img-top img-fluid">
                                    </a>
                                </div>

                                <div class="card-body">
                                    <h5 class="card-title">
                                        <c:out value="${film.nume}"/>
                                    </h5>
                                    <p class="card-text">
                                        <c:out value="${film.descriere}"/>
                                    </p>
                                    <p class="card-text">
                                        <small class="text-muted">
                                            <c:out value="${film.actori}"/>
                                        </small>
                                    </p>
                                </div> 

                            </div> 
                        </td>

                        <c:if test="${rowCounter.count % 3 ==0 || rowCounter.count==fn:length(values)}">
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>

    </body>
    <jsp:include page="/Header/footer.jsp" /> 
</html>

<%
    } else {
        response.sendRedirect("/Login/LoginPage.jsp");
    }
%>