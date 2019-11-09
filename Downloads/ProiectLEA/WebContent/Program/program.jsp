<%-- 
    Document   : program
    Created on : Mar 9, 2019, 3:20:01 PM
    Author     : adria
--%>

<%@page import="daw.test.model.FilmDAO"%>
<%@page import="daw.test.model.bean.FilmBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="daw.test.model.ProgramDAO"%>
<%@page import="daw.test.model.bean.ProgramBean"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="cardGroups.css">
        <title>Program Page</title>
    </head>
    <jsp:include page="/Header/menuBar.jsp"/>
    <body>


        <!--
            <script>
            $(function () {
                $('#myTab li:first-child a').tab('show')
            })
        </script>-->

        <br/>


        <%
            Calendar now = Calendar.getInstance();
            int month = now.get(Calendar.MONTH) + 1;
            int dayOfWeek = now.get(Calendar.DAY_OF_WEEK) - 1;
            int nextDay1 = dayOfWeek + 1;
            int date = now.get(Calendar.DATE);
            int year = now.get(Calendar.YEAR);

            Calendar mycal = new GregorianCalendar(year, month - 1, date);

            // Get the number of days in that month
            int daysInMonth = mycal.getActualMaximum(Calendar.DAY_OF_MONTH);

            int days[];
            int months[];
            days = new int[8];
            System.out.println(" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            System.out.println(" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            System.out.println("nr zile in luna " + daysInMonth);
            System.out.println("day of week " + dayOfWeek);
            System.out.println(" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

            int j;
            int add = 1;

            int auxDate = date;

            if (date == 1) {
                auxDate = daysInMonth;
            }

            if (dayOfWeek == 0) {
                //daca prima zi a saptamanii e duminica
                days[6] = date;
                for (j = 0; j < 6; j++) {
                    days[j] = auxDate - dayOfWeek + j + 1;
                }

            } else {
                days[dayOfWeek - 1] = date;
                for (j = 0; j < dayOfWeek - 1; j++) {
                    days[j] = auxDate - dayOfWeek + j + 1;
                }
                for (j = dayOfWeek; j < 7; j++) {
                    days[j] = add + date;
                    add++;
                }
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
            int verifica(int rez[], int contorRez, int idFilm) {
                for (int k = 0; k < contorRez; k++) {
                    if (rez[k] == idFilm) {
                        return 1;
                    }
                }
                return 0;
            }
        %>

        <%!
            int cauta(ArrayList<ProgramBean> program, int rez[], int idProgram[], Date data) {
                int contorRez = 0;
                for (int x = 0; x < program.size(); x++) {
                    if (program.get(x).getData().compareTo(data) == 0 && verifica(rez, contorRez, program.get(x).getIdFilm()) == 0) {

                        rez[contorRez] = program.get(x).getIdFilm();
                        idProgram[contorRez] = program.get(x).getIdProgram();
                        contorRez++;
                    }
                }
                return contorRez;
            }
        %>


        <div class="container">

            <h5>
                ${nCinema}, ${oCinema}
            </h5>
            <br/><br/>

            <div class="nav nav-tabs" id="nav-tab" role="tablist">


                <a class="nav-item nav-link active"  data-toggle="tab" href="#nav-0" role="tab"  aria-selected="true">
                    Luni, 
                    <% out.print(days[0] + "." + month + "." + year);%>
                </a>
                <a class="nav-item nav-link "  data-toggle="tab" href="#nav-1" role="tab"  aria-selected="false">
                    Marti, 
                    <% out.print(days[1] + "." + month + "." + year);%>
                </a>
                <a class="nav-item nav-link "  data-toggle="tab" href="#nav-2" role="tab"  aria-selected="false">
                    Miercuri,
                    <% out.print(days[2] + "." + month + "." + year);%>
                </a>
                <a class="nav-item nav-link "  data-toggle="tab" href="#nav-3" role="tab"  aria-selected="false">
                    Joi,
                    <% out.print(days[3] + "." + month + "." + year);%>
                </a>
                <a class="nav-item nav-link "  data-toggle="tab" href="#nav-4" role="tab"  aria-selected="false">
                    Vineri,
                    <% out.print(days[4] + "." + month + "." + year);%>
                </a>
                <a class="nav-item nav-link "  data-toggle="tab" href="#nav-5" role="tab"  aria-selected="false">
                    Sambata,
                    <% out.print(days[5] + "." + month + "." + year);%>
                </a>
                <a class="nav-item nav-link "  data-toggle="tab" href="#nav-6" role="tab"  aria-selected="false">
                    Duminica,
                    <% out.print(days[6] + "." + month + "." + year);%>
                </a>

            </div>

            <div class="tab-content" id="nav-tabContent">

                <%
                    String id = ProgramDAO.getSelectedIDCinema();
                    ArrayList<ProgramBean> pb = ProgramDAO.getByIdCinema(id);

                    int i;
                    for (i = 0; i < 7; i++) {
                        if (i == 0) {
                %>

                <div class="tab-pane fade show active" id="nav-<%=i%>" role="tabpanel">

                    <%
                    } else {
                    %>

                    <div class="tab-pane fade show " id="nav-<%=i%>" role="tabpanel">

                        <%
                            }
                        %>
                        <br/>
                        <div class="card-deck mainsect container-fluid" >

                            <%
                                int rez[] = new int[50];
                                int idProgram[] = new int[50];
                                if (pb.size() > 0) {
                                    int contorRez = cauta(pb, rez, idProgram, createDates(days[i], year, month));

                                    if (contorRez > 0) {
                            %> 

                            <%
                                for (int y = 0; y < contorRez; y++) {
                                    FilmBean film = new FilmBean();
                                    film = FilmDAO.getById(Integer.toString(rez[y]));
                                    if(y==3){
                            %>
                            
                            <br/><br/>
                            <% 
                                } //doar 3 pe rand
                            %>
                            <div class=" card shadow mycard col-md-3" style="width: 100px; align: left">
                                <div class="inner">  
                                    <a  href="/FilmServlet?id=<%=film.getIdFilm()%>">
                                        <img src="<%= film.getPoza()%>" alt="Paris" class="card-img-top img-fluid">
                                    </a>
                                </div>

                                <div class="card-body">
                                    <h5 class="card-title">
                                        <%= film.getNume()%>
                                    </h5>
                                    <p class="card-text">
                                        <%= film.getDescriere()%>
                                    </p>
                                    <p class="card-text">
                                        <small class="text-muted">
                                            <%= film.getActori()%>
                                        </small>
                                    </p>
                                </div> <!--card body -->
                            </div><!--one card -->
                            <%
                                if(y==3){
                                    %>
                                    <br>
                            <%
                                }
                                        } //for de la cate filme s-au gasit
                                    } // daca s-au gasit filme pt data respectiva
                                } //exista program pt idCinema
                               
                            %>
                        </div><!--card deck (all) -->

                    </div><!--tab-->
                    <%
                        } //pt fiecare zi a saptamanii
                    %>

                </div><!--tab content-->

            </div><!--container-->



    </body>
    <jsp:include page="/Header/footer.jsp" />
</html>
