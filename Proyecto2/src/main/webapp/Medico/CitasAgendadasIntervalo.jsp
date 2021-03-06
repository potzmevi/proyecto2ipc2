<%-- 
    Document   : CitasAgendadasIntervalo
    Created on : Oct 7, 2020, 6:51:40 AM
    Author     : potz
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Cita_Medica"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/textstyle.css?5.0">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel="stylesheet" href="../css/searchbar.css">
        <title>Citas Agendadadas en un intervalo</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form>
            <div class="caja">
                 <h4>Fecha inicio:</h4>
                <div class="inputAnimate">
                    <input type="date" id="start" name="fechainicio" 
                           min="1900-01-01" max="2022-12-31" required >

                </div>
               <h4>Fecha final:</h4>
                <div class="inputAnimate">
                    <input type="date" id="start" name="fechafinal"
                           min="1900-01-01" max="2022-12-31" required >

                </div>
                <button class="draw" type="submit" name="gen">Filtrar</button>
                <table class="containero" style="z-index: 99;">

                    <% if(!(request.getParameter("gen")==null)){ Cita_Medica cm = new Cita_Medica();
                        String filtro;
                        
                      String fechainicio = String.valueOf(request.getParameter("fechainicio"));
                      String fechafinal = String.valueOf(request.getParameter("fechafinal"));
                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                LocalDate fechai= LocalDate.parse(fechainicio, formatter);
                                LocalDate fechaf= LocalDate.parse(fechafinal, formatter);
                        try {
                            

                            ResultSet rs = null;
                            String atributo = "";
                            if (!(request.getParameter("atributo") == null)) {
                                atributo = request.getParameter("atributo");
                            } else {
                                atributo = "codigo";
                            }
                            rs = cm.buscarIntervalo(fechai, fechaf, String.valueOf(session.getAttribute("Medico")));
                            if (!(rs.next())) {
                    %><h4>No hay ninguna cita medica</h4><%
                    } else {
                        rs = cm.buscarIntervalo(fechai, fechaf, String.valueOf(session.getAttribute("Medico")));

                    %> <tr>
                        <th><h1>Codigo</h1></th>
                        <th><h1>Fecha</h1></th>
                        <th><h1>Hora</h1></th>
                        <th><h1>Paciente</h1></th>
                        <th><h1>Especialidad</h1></th>


                    </tr>
                    <%                        while (rs.next()) {
                    %>

                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("codigo"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("fecha"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("hora"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("codp"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("ESPECIALIDAD_nombre"))%></h2></td>
                    </tr>

                    <%
                        }%>

                </table>
                <%

                    }
                } catch (Exception e) {
                %><h3>Error con la cita</h3><%
                    }}%>
            </div>

        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>


