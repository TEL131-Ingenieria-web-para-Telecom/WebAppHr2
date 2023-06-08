<%@ page import="com.example.webapphr2.Dtos.EmpleadosPorRegionDto" %>
<jsp:useBean id="lista" scope="request" type="java.util.ArrayList<com.example.webapphr2.Dtos.EmpleadosPorRegionDto>"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'/>
        <title>Estadísticas</title>
    </head>
    <body>
        <div class='container'>
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="currentPage" value="est"/>
            </jsp:include>
            <h1 class='mb-5 mt-4'>Estadísticas</h1>
            <hr/>
            <h3 class='mb-3'>Cantidad de empleados por región </h3>
            <table class="table table-sm">
                <thead>
                    <tr>
                        <th>Región</th>
                        <th>Cantidad</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (EmpleadosPorRegionDto e : lista) { %>
                    <tr>
                        <td><%=e.getRegion()%>
                        </td>
                        <td><%=e.getCantidad()%>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <hr/>
            <h3 class='mb-3'>Salario por departamento</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Departamento</th>
                        <th>Salario mínimo</th>
                        <th>Salario promedio</th>
                        <th>Salario máximo</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
            <jsp:include page="../includes/footer.jsp"/>
        </div>
    </body>
</html>



