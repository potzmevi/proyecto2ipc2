<%-- 
    Document   : AgeExamen
    Created on : Oct 5, 2020, 12:52:04 AM
    Author     : potz
--%>

<%@page import="java.util.Set"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.Time"%>
<%@page import="Entity.Cita_Examen"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.google.protobuf.StringValue"%>
<%@page import="DataBase.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Entity.Laboratorista"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String codigo = request.getParameter("codigo");
    String codigoex = request.getParameter("codigoex");
    String ordens = request.getParameter("orden");
    try {
        if (!codigo.equals("")) {
            session.setAttribute("LAB", request.getParameter("codigo"));
        }
        if (!codigoex.equals("")) {
            session.setAttribute("EX", request.getParameter("codigoex"));
        }
        if (!ordens.equals("")) {
            session.setAttribute("OR", request.getParameter("orden"));
        }

    } catch (Exception e) {
    }
    String codigolab = String.valueOf(session.getAttribute("LAB"));
    String codigoexa = String.valueOf(session.getAttribute("EX"));
    String orden = String.valueOf(session.getAttribute("OR"));%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" href="../css/textstyle.css">
        <link rel="stylesheet" href="../css/tablestyle.css">
        <link rel="stylesheet" href="../css/select.css">
        <link rel="stylesheet" href="../css/button.css">
        <link rel="stylesheet" href="../css/searchbar.css">
        <title>Agendar Examen</title>
    </head>
    <body style="background: url('../img/pacienteindex.jpg') no-repeat top center / cover;">
        <%@include file="header.jsp" %>
        <form >
            <div class="caja">
                <h4>Fecha de cita:</h4>
                <div class="inputAnimate">
                    <input type="date" id="start" name="fecha"
                           min="1900-01-01" max="2022-12-31" value="<%=request.getParameter("fecha")%>" required >
                </div>
                
                <button class="draw" type="submit" name="veri">Verificar</button>

                <%
                    Laboratorista la = new Laboratorista();
                    ResultSet rs = la.obtenerDias(codigolab);
                %><h4>Dias que trabaja:</h4>
                <% ArrayList dias = new ArrayList();
                    while (rs.next()) {
                %>
                <label for=<%= String.valueOf(rs.getObject("dia"))%>><%= String.valueOf(rs.getObject("dia"))%></label><%
                        dias.add(rs.getObject("dia"));
                    }
                    if (!(request.getParameter("veri") == null)) {

                   
                        try {
                            String fecha = String.valueOf(request.getParameter("fecha"));
                            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                            LocalDate localDate = LocalDate.parse(fecha, formatter);
                            String diaSemana[] = {"Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"};
                            Date fechaSemana = Date.valueOf(request.getParameter("fecha"));
                            String dia = String.valueOf(fechaSemana.getDay());
                            int diaSeleccionado = Integer.parseInt(dia);
                            boolean diasi = false;
                            for (int i = 0; i < dias.size(); i++) {

                                if (dias.get(i).equals(diaSemana[diaSeleccionado])) {
                                    diasi = true;

                                }
                            }

                            if (diasi) {
                             String fechain = request.getParameter("fecha");
                        try {
                            if (!fechain.equals("")) {
                                session.setAttribute("Fecha", request.getParameter("fecha"));
                            }

                        } catch (Exception e) {
                        }
                                response.sendRedirect("ConfirmarAgendar.jsp");
                                
                        } else {%><h2>El laboratorista no trabaja ese dia</h2><%                    }
                       
                    } catch (Exception e) {
                %><h3>Error para comprobar</h3><%
                    }
                }


                %>


            </div>
        </form>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script  src="../js/text.js"></script>
        <script type="text/javascript" src="../js/select.js"></script>
    </body>
</html>
