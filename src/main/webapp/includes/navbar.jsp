<% String currentPage = request.getParameter("currentPage"); %>
<jsp:useBean id="usuarioLog" scope="session" type="com.example.webapphr2.Beans.Employee"
             class="com.example.webapphr2.Beans.Employee"/>

<nav class="navbar navbar-expand-md navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%=request.getContextPath()%>">Gestión HR</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link <%=currentPage.equals("emp") ? "active" : ""%>"
                       href="<%=request.getContextPath()%>/EmployeeServlet">
                        Employees
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%=currentPage.equals("job") ? "active" : ""%>"
                       href="<%=request.getContextPath()%>/JobServlet">
                        Jobs
                    </a>
                </li>
                <li class="nav-item <%=currentPage.equals("est") ? "active" : ""%>">
                    <a class="nav-link" href="<%=request.getContextPath()%>/EmployeeServlet?action=est">Estadísticas</a>
                </li>
                <div class="form-inline font-italic my-2 my-lg-0">
                    <% if (usuarioLog.getEmployeeId() > 0) { //esto logueado %>
                    <span><%=usuarioLog.getFirstName() + " " + usuarioLog.getLastName()%></span><a
                        href="<%=request.getContextPath()%>/login?action=logout">(Cerrar sesión)</a>
                    <% } else { //no estoy loggedIn %>
                    <a class="nav-link" style="color: #007bff;" href="<%=request.getContextPath()%>/login">
                        (Iniciar Sesión)
                    </a>
                    <% } %>
                </div>
            </ul>
        </div>
    </div>
</nav>
