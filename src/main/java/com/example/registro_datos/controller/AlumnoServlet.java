package com.example.registro_datos.controller;

import com.example.registro_datos.model.Alumno;
import com.example.registro_datos.model.dao.AlumnoDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AlumnoServlet", value = "/alumno")
public class AlumnoServlet extends HttpServlet {

    private final AlumnoDao alumnoDao = new AlumnoDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Alumno> lista = alumnoDao.getAll();
        request.setAttribute("listaAlumnos", lista);
        request.getRequestDispatcher("layout/gestion-alumnos.jsp").forward(request, response);    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String matricula = request.getParameter("matricula");
            String correo = request.getParameter("correo");
            String sexo = request.getParameter("sexo");

            Alumno nuevoAlumno = new Alumno();
            nuevoAlumno.setNombre(nombre);
            nuevoAlumno.setApellidos(apellidos);
            nuevoAlumno.setEdad(edad);
            nuevoAlumno.setMatricula(matricula);
            nuevoAlumno.setCorreo(correo);
            nuevoAlumno.setSexo(sexo);

            alumnoDao.create(nuevoAlumno);
        } catch (NumberFormatException e) {
            System.err.println("Error al transformar datos numéricos en el registro: " + e.getMessage());
            e.printStackTrace();
        }

        response.sendRedirect("alumno");
    }
}
