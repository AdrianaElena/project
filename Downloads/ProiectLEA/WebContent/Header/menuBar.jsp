<%-- 
    Document   : menuBar
    Created on : Feb 17, 2019, 2:11:41 PM
    Author     : adria
--%>

<%@page import="daw.test.model.bean.UserBean"%>
<%@page import="daw.test.model.CinemaDAO"%>
<%@page import="daw.test.model.bean.CinemaBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="C:\Users\adria\Downloads\bootstrap-4.3.1-dist">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>


        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="/navbar.css">
    
    </head>
    <body>


        <%
            UserBean user = new UserBean();
            HttpSession session1 = request.getSession();
            user = (UserBean) session1.getAttribute("currentSessionUser");
            
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark text-white sticky-top" style="opacity: 0.9;">

            <button class="navbar-toggler" data-toggle="collapse" data-target="#collapse_target">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="collapse_target">
                <a class="navbar-brand  h1 ">
                    <i class="fas fa-film iconlogo"></i>
                </a>
                <span class="navbar-text logotxt">Cinemas</span>

                <ul class="navbar-nav mr-auto navlink">

                    <%
                        if (user.getRole().equals("normal")) {
                            System.out.println("user is normal 1");
                    %>

                    <!--first link Home-->
                    <li class="nav-item">
                        <a class="nav-link" href="/HomeServlet">
                            Home
                        </a>
                    </li>

                    <!-- Dropdown menu for Program -->
                    <li class="nav-item dropdown">

                        <a class="nav-link dropdown-toggle" href="#" id="dropdownmenu" data-toggle="dropdown" aria-haspopup="true" role="button" >
                            Program
                            <span class="caret"></span>
                        </a>

                        <!-- dropdown content -->
                        <div class="dropdown-menu" aria-labelledby="dropdownmenu">

                            <%
                                ArrayList<CinemaBean> cinemas = new ArrayList<CinemaBean>();
                                cinemas = CinemaDAO.getAll();

                                int i;
                                for (i = 0; i < cinemas.size(); i++) {
                            %>
                            <a class="dropdown-item" href="/ProgramServlet?id=<%=cinemas.get(i).getIdCinema()%>&amp;nCinema=<%=cinemas.get(i).getNume()%>&amp;oCinema=<%=cinemas.get(i).getOras()%>">
                                <% out.println(cinemas.get(i).getNume() + ", " + cinemas.get(i).getOras());%>
                            </a>
                            <%
                                if (i < cinemas.size() - 1) {
                            %>
                            <div class="dropdown-divider"></div>
                            <%
                                    }
                                }
                            %>
                        </div>

                    </li>
                    <!--
                    <li class="nav-item">
                        <a class="nav-link " href="#">Link 3</a>
                    </li>-->
                    <%
                    } else {
                    %>
                    <li class="nav-item">
                        <a class="nav-link " href="/Film">Filme</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="/Program">Program</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="/Rezervari">Rezervari</a>
                    </li>
                    <%
                        }
                    %>
                </ul>

                <%
                    if (user.getRole().equals("normal")) {
                %>
                <!--
                <form class="form-inline my-2 my-lg-0 mr-lg-10 navbtn" >
                    <input class="form-control mr-sm-2" type="search" placeholder="Find a movie" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form> Search -->

                <!--Logout -->
                <ul class="nav navbar-nav navbar-right m-lg-1 ml-lg-5 navbtn">
                    <div class="btn-group">
                        <a href="LogoutServlet" class="btn btn-outline-light my-2 my-sm-0" role="button">Logout</a>
                        <button type="button" class="btn btn-outline-light my-2 my-sm-0 dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="/InfoServlet">Contul meu</a>
                            <a class="dropdown-item" href="/RezervatServlet">Rezervarile mele</a>

                        </div>
                    </div>
                </ul>

                <%
                } else {
                %>
                <ul class="nav navbar-nav navbar-right m-lg-1 ml-lg-5 navbtn">
                    <div class="btn-group">
                        <a href="/LogoutServlet" class="btn btn-outline-light my-2 my-sm-0" role="button">Logout</a>
                        <button type="button" class="btn btn-outline-light my-2 my-sm-0 dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="sr-only">Toggle Dropdown</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="/InfoServlet">Contul meu</a>
                            <!--<a class="dropdown-item" href="/RezervatServlet">Rezervarile mele</a>-->

                        </div>
                    </div>
                </ul>
                <%
                }
                %>
            </div><!--collapse navbar-->
        </nav>


        <!-- jumbotron -->
        <div class="bg">
            <div class="jumbotron jumbotron-fluid text-white ">
                <div class="container  headtxt jbt">
                    <h1 class="display-1">Cinemas</h1>
                    <p class="lead">All cinemas that you are looking for</p>

                </div>
            </div>
        </div>
        <c:forEach items="${cinema}" var="cinema">
            ------${cinema.oras}-----, ${cinema.nume}-----

        </c:forEach>

    </body>
</html>
