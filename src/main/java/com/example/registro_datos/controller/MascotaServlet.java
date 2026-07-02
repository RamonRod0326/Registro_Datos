package com.example.registro_datos.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.registro_datos.model.Mascota;
import com.example.registro_datos.model.dao.MascotaDao;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MascotaServlet", value = "/mascota")
public class MascotaServlet extends HttpServlet {

    private final MascotaDao mascotaDao = new MascotaDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Mascota> lista = mascotaDao.getAll();
        request.setAttribute("listaMascotas", lista);
        request.getRequestDispatcher("gestion-mascotas.jsp").forward(request, response);
    }

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

            Mascota nuevaMascota = new Mascota();
            nuevaMascota.setNombre(nombre);
            nuevaMascota.setApellidos(apellidos);
            nuevaMascota.setEdad(edad);
            nuevaMascota.setPersonalidad(personalidad);
            nuevaMascota.setCorreo(correo);
            nuevaMascota.setSexo(sexo);

            mascotaDao.create(nuevaMascota);
        } catch (NumberFormatException e) {
            System.err.println("Error al transformar datos numéricos en el registro: " + e.getMessage());
            e.printStackTrace();
        }

        response.sendRedirect("mascota");
    }
}