<%-- 
    Document   : UtilizacionCadaDia
    Created on : Oct 7, 2020, 8:11:34 PM
    Author     : potz
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Informe_Examen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/textstyle.css?6.0">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel="stylesheet" href="../css/searchbar.css">
        <title>Utilizacion de cada dia</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp"%>
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
                <% Informe_Examen cm = new Informe_Examen();%>         
                <table class="containero" style="z-index: 99;">
                    <% if (!(request.getParameter("gen") == null)) {
                            String filtro;
                            try {
                                ResultSet rs = null;
                                String fechainicio = String.valueOf(request.getParameter("fechainicio"));
                                String fechafinal = String.valueOf(request.getParameter("fechafinal"));
                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                LocalDate fechai = LocalDate.parse(fechainicio, formatter);
                                LocalDate fechaf = LocalDate.parse(fechafinal, formatter);
                                rs = cm.buscarInformeUtilizacion(fechai, fechaf, String.valueOf(session.getAttribute("Laboratorista")));
                                if (!(rs.next())) {
                    %><h4>No hay ningun Examen realizado</h4><%
                    } else {
                        rs = cm.buscarInformeUtilizacion(fechai, fechaf, String.valueOf(session.getAttribute("Laboratorista")));

                    %> <tr>
                        <th><h1>Cantidad</h1></th>
                        <th><h1>Fecha</h1></th>
                    </tr>
                    <%                        while (rs.next()) {
                    %>
                    <tr>
                        <td><h2><%= String.valueOf(rs.getObject("cantidad"))%></h2></td>
                        <td><h2><%= String.valueOf(rs.getObject("fecha"))%></h2></td>
                    </tr>

                    <%
                        }%>

                </table>
                <%

                    }
                } catch (Exception e) {
                %><h3>No hay ningun Examen realizado</h3><%
                        }
                    }%>







            </div>

        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>

