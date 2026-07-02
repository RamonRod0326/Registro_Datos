<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="layout/header.jsp" %>
<div class="row g-4">
    <div class="col-12">
        <h1 class="mb-4">Bienvenidos a la UTEZ</h1>
    </div>

    <div class="col-md-6 mx-auto">
        <div class="card shadow-sm">
            <div class="card-body">
                <h4 class="card-title text-primary mb-4"><i class="bi bi-plus-circle-fill"></i> ¡Registra a un alumno!</h4>

                <form action="alumno" method="POST">
                    <input type="hidden" name="action" value="create">

                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre(s)</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ej: Juan Carlos" required>
                    </div>

                    <div class="mb-3">
                        <label for="apellidos" class="form-label">Apellidos</label>
                        <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Ej: Pérez López" required>
                    </div>

                    <div class="mb-3">
                        <label for="edad" class="form-label">Edad (Años)</label>
                        <input type="number" class="form-control" id="edad" name="edad" placeholder="Ej: 20" required min="0" max="120">
                    </div>

                    <div class="mb-3">
                        <label for="matricula" class="form-label">Matrícula</label>
                        <input type="text" class="form-control" id="matricula" name="matricula" placeholder="Ej: 20231234" required>
                    </div>

                    <div class="mb-3">
                        <label for="correo" class="form-label">Correo electrónico</label>
                        <input type="email" class="form-control" id="correo" name="correo" placeholder="alumno@utez.edu.mx" required>
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
                        <button type="submit" class="btn btn-primary carga"><i class="bi bi-save"></i> Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="layout/footer.jsp" %>
