<%-- 
    Document   : filmPage
    Created on : Feb 24, 2019, 10:42:33 AM
    Author     : adria
--%>

<%@page import="java.util.Locale"%>
<%@page import="daw.test.model.FilmDAO"%>
<%@page import="daw.test.model.bean.ProgramBean"%>
<%@page import="daw.test.model.ProgramDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="daw.test.model.bean.CinemaBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daw.test.model.CinemaDAO"%>
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

        <link rel="stylesheet" type="text/css" href="film.css">
        <title>FIlm Page</title>
    </head> 
    <jsp:include page="/Header/menuBar.jsp"/>
    <body>



        <div class="mycarousel container-fluid d-flex justify-content-center">
            <div id="carouselExampleIndicators" class="carousel slide" style="height: 420px; width: 750px;" data-ride="carousel">
                
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                </ol>
                
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="<c:out value="${fbean.poza}"/>"  style="height: 400px; width: 750px;">
                    </div>
                    <div class="carousel-item">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item " src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" allowfullscreen></iframe>
                        </div> 
                    </div>
                </div>
                    
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div class="info">
            <p>
                <b> <c:out value="${fbean.nume}"/></b><br>
                An: <c:out value="${fbean.an}"/><br>
                Genul <c:out value="${fbean.genul}"/> <br>
                Durata: <c:out value="${fbean.durata}"/> <br>
                Actori: <c:out value="${fbean.actori}"/> <br>
                Treducere: <c:out value="${fbean.traducere}"/> <br>
                Format: <c:out value="${fbean.format}"/> <br>
            </p>
            <p>
                <c:out value="${fbean.descriere}"/>
            </p>
        </div>

        <br/><br/>




        <% int idFilm = FilmDAO.getIdFIlm(); %>
        <br/>

        <%
            ArrayList<CinemaBean> cinemas = new ArrayList<CinemaBean>();
            cinemas = CinemaDAO.getAll();

        %>  


        <br/><br/>
        <div class="container">
            <div class="row">
                <div class="col-4">

                    <div class="list-group" id="list-tab" role="tablist">
                        <%                            
                            int i;
                            for (i = 0; i < cinemas.size(); i++) {
                        %>
                        
                        <a class="list-group-item list-group-item-action" data-toggle="list" href="#list-<%=cinemas.get(i).getIdCinema()%>" role="tab">
                            <% out.println(cinemas.get(i).getOras());%>, 
                            <% out.println(cinemas.get(i).getNume());%>
                        </a>
                        
                        <%
                            }
                        %>
                    </div>
                </div>

                    
                <%
                    Calendar now = Calendar.getInstance();
                    int month = now.get(Calendar.MONTH) + 1;
                    int dayOfWeek = now.get(Calendar.DAY_OF_WEEK) - 1;
                    int nextDay1 = dayOfWeek + 1;
                    int date = now.get(Calendar.DATE);
                    int year = now.get(Calendar.YEAR);

                    int days[];
                    days = new int[8];

                    int j;
                    int add = 1;
                    days[dayOfWeek - 1] = date;
                    
                    for (j = 0; j < dayOfWeek - 1; j++) {
                        days[j] = date - dayOfWeek + j + 1;
                    }
                    for (j = dayOfWeek; j < 7; j++) {
                        days[j] = add + date;
                        add++;
                    }

                %>

                <%!
                    Date createDates(int day, int year, int month) {
                        String data = Integer.toString(year) + "-" + Integer.toString(month) + "-" + Integer.toString(day);
                        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                        Date Data = new Date();
                        try {
                            Data = format.parse(data);

                        } catch (Exception e) {
                            System.out.println(e);
                        }
                        return Data;
                    }
                %>


                <%!
                    int cauta(ArrayList<ProgramBean> program, String rez[], int idProgram[], Date data) {
                        int contorRez = 0;
                        System.out.println("size in filmPage" + program.size());
                        for (int x = 0; x < program.size(); x++) {
                            System.out.println("program " + program.get(x).getData());
                            System.out.println("data " + data);
                            if (program.get(x).getData().compareTo(data) == 0) {
                                rez[contorRez] = program.get(x).getOra();
                                idProgram[contorRez] = program.get(x).getIdProgram();
                                contorRez++;
                            }
                        }
                        return contorRez;
                    }
                %>

                <div class="col-8">
                    <div class="tab-content" id="nav-tabContent">
                        
                        
                        <%  
                            ArrayList<ProgramBean> program = new ArrayList<ProgramBean>();
                            
                            for (i = 0; i < cinemas.size(); i++) {
                                System.out.println("cinema: "+i);

                                program = ProgramDAO.getProgram(cinemas.get(i).getIdCinema(), idFilm);
                        %>

                        
                        <div class="tab-pane fade" id="list-<%=cinemas.get(i).getIdCinema()%>" role="tabpanel">

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            Luni <br/> <% out.print(days[0] + "/" + month + "/" + year); %>
                                        </th>
                                        <th scope="col">
                                            Marti <br/><% out.print(days[1] + "/" + month + "/" + year);%>
                                        </th>
                                        <th scope="col">
                                            Miercuri <br/><% out.print(days[2] + "/" + month + "/" + year);%>
                                        </th>
                                        <th scope="col">
                                            Joi <br/><% out.print(days[3] + "/" + month + "/" + year); %>
                                        </th>
                                        <th scope="col">
                                            Vineri <br/><% out.print(days[4] + "/" + month + "/" + year);%>
                                        </th>
                                        <th scope="col">
                                            Sambata <br/><% out.print(days[5] + "/" + month + "/" + year);%>
                                        </th>
                                        <th scope="col">
                                            Duminica <br/><% out.print(days[6] + "/" + month + "/" + year); %>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <%
                                            for (int c = 0; c < 7; c++) {
                                        %>


                                        <td>
                                            <%
                                                String rez[] = new String[20];
                                                int idProgram[] = new int[20];
                                                if (program.size() > 0) {
                                                    int contorRez = cauta(program, rez, idProgram, createDates(days[c], year, month));
                                                    System.out.println("nr program: "+contorRez);
                                                    if (contorRez > 0) {

                                                        for (int y = 0; y < contorRez; y++) {
                                            %>
                                            <a  class="btn btn-success" href="/BookingServlet?idProgram=<%=idProgram[y]%>&amp;numeCinema=<%=cinemas.get(i).getNume()%>&amp;film=${fbean.nume}" role="button">
                                                <%
                                                    out.println(rez[y]);
                                                %>
                                            </a>
                                                            <br/><br/>
                                                            <%
                                                        }
                                                    }
                                                }
                                            %>
                                        </td>


                                        <%
                                            }
                                        %>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>

            </div><!-- row -->
        </div><!-- container -->
        <br/>
    </body>
    <jsp:include page="/Header/footer.jsp" />   
</html>
