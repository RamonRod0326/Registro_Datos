<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="layout/header.jsp" %>

<div class="row g-4">
    <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="mb-0">Registros de alumnos</h1>
            <a href="alumno" class="btn btn-primary carga">
                <i class="bi bi-arrow-clockwise"></i> Actualizar registros
            </a>
        </div>
    </div>

    <div class="col-12">
        <c:choose>
            <%-- Si no hay registros en la base de datos --%>
            <c:when test="${empty listaAlumnos}">
                <div class="alert alert-info text-center mt-2" role="alert">
                    <i class="bi bi-info-circle-fill"></i> No hay alumnos registrados en la base de datos.
                </div>
            </c:when>

            <%-- Si hay registros, se listan todos --%>
            <c:otherwise>
                <p class="text-secondary">
                    Total de registros: <strong>${listaAlumnos.size()}</strong>
                </p>

                <div class="table-responsive">
                    <table class="table table-striped table-hover align-middle">
                        <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Edad</th>
                            <th>Matrícula</th>
                            <th>Correo</th>
                            <th>Sexo</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${listaAlumnos}" var="alumno">
                            <tr>
                                <td><strong>${alumno.id}</strong></td>
                                <td>${alumno.nombre}</td>
                                <td>${alumno.apellido}</td>
                                <td>${alumno.edad} años</td>
                                <td><span class="badge bg-secondary">${alumno.matricula}</span></td>
                                <td>${alumno.correo}</td>
                                <td>${alumno.sexo}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<%@ include file="layout/footer.jsp" %>
