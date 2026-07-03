<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="layout/header.jsp" %>
<div class="row g-4">
    <div class="col-12">
        <h1 class="mb-4">Bienvenidos a la escuela</h1>
    </div>

    <div class="col-md-7">
        <div class="row">
            <h4 class="text-secondary col-6">Aquí están todos los alumnos</h4>
            <a href="alumno" class="btn btn-primary col-6 align-content-center text-center carga"><i class="bi bi-arrow-clockwise"></i> Cargar alumnos</a>
        </div>

        <c:choose>
            <%-- Condición 1: Si la lista es nula o está vacía --%>
            <c:when test="${empty listaAlumnos}">
                <div class="alert alert-info text-center mt-4" role="alert">
                    <i class="bi bi-info-circle-fill"></i> No hay alumnos registrados en este momento.
                </div>
            </c:when>

            <%-- Condición por defecto: Si la lista SÍ tiene datos --%>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table table-striped table-hover mt-4 align-middle">
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

    <div class="col-md-5">
        <div class="card shadow-sm">
            <div class="card-body">
                <h4 class="card-title text-primary mb-4"><i class="bi bi-plus-circle-fill"></i> ¡Registra a un alumno!</h4>

                <form action="alumno" method="POST">
                    <input type="hidden" name="action" value="create">

                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre del Alumno</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ej: Juan" required>
                    </div>

                    <div class="mb-3">
                        <label for="apellido" class="form-label">Apellido</label>
                        <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Ej: Pérez" required>
                    </div>

                    <div class="mb-3">
                        <label for="edad" class="form-label">Edad (Años)</label>
                        <input type="number" class="form-control" id="edad" name="edad" placeholder="Ej: 20" required min="0" max="100">
                    </div>

                    <div class="mb-3">
                        <label for="matricula" class="form-label">Matrícula</label>
                        <input type="text" class="form-control" id="matricula" name="matricula" placeholder="Ej: A12345" required>
                    </div>

                    <div class="mb-3">
                        <label for="correo" class="form-label">Correo</label>
                        <input type="email" class="form-control" id="correo" name="correo" placeholder="ejemplo@correo.com" required>
                    </div>

                    <div class="mb-4">
                        <label for="sexo" class="form-label">Sexo</label>
                        <select class="form-select" id="sexo" name="sexo" required>
                            <option value="" selected disabled>Selecciona una opción...</option>
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                            <option value="Otro">Otro</option>
                        </select>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary carga" id="guardar"><i class="bi bi-save"></i> Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="layout/footer.jsp" %>
