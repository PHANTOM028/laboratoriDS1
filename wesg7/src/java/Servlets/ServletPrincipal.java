/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;
import Models.viewModelcliente;
import Models.viewModelEmpleados;
import Models.viewModelRecepcionista;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author A21-PC11
 */
@WebServlet (name = "ServletPrincipal", urlPatterns = {"/ServletPrincipal"})
public class ServletPrincipal extends HttpServlet {
    private final String user = "sa";
    private final String pass = "12345ec";
    private final String servidor = "localhost:1433";
    private final String bd = "Hotel_Data";

    String url = "jdbc:sqlserver://"
            + servidor
            + ";databaseName="+bd
            + ";user="+user
            +";password="+pass
            +";encrypt=false;trustServerCertificate=false;";
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPrincipal</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPrincipal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
    public void mostrarEmpleados(HttpServletRequest request, HttpServletResponse response) {
    try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        try (Connection conn = DriverManager.getConnection(url)) {
            request.setAttribute("mensaje_conexion", "Ok!");
            
            String sqlQuery = "SELECT * FROM Empleado";
            try (PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                 ResultSet rs = pstmt.executeQuery()) {

                ArrayList<viewModelEmpleados> listaEmpleados = new ArrayList<>();
                while (rs.next()) {
                    viewModelEmpleados empleado = new viewModelEmpleados();
                    empleado.setIdEmpleado(rs.getInt("id_empleado"));
                    empleado.setNombresEmpleado(rs.getString("nombres"));
                    empleado.setApellidosEmpleado(rs.getString("apellidos"));
                    empleado.setDui(rs.getString("DUI"));
                    empleado.setIsss(rs.getString("ISSS_Empleado"));
                    empleado.setTelefono(rs.getString("telefono"));                  
                    empleado.setIdCargo(rs.getInt("id_cargo"));
                    empleado.setCargo(rs.getString("cargo"));
                    empleado.setIdDireccion(rs.getInt("id_direccion"));
                    empleado.setDireccionFull(rs.getString("direccion"));
                    listaEmpleados.add(empleado);
                }
                request.setAttribute("listaEmpleados", listaEmpleados);
            }
        } catch (SQLException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
        }
    } catch (ClassNotFoundException ex) {
        request.setAttribute("mensaje_conexion", "Error al cargar el controlador JDBC.");
    }
}

    
    public void agregarEmpleado(HttpServletRequest request, HttpServletResponse response) {
       //CAPTURA DE VARIABLES
        //El ID de los empleados es autoincrementable
        String DUI_Empleado = request.getParameter("dui");
        String ISSS_Empleado = request.getParameter("isss");
        String nombresEmpleado = request.getParameter("nombresEmpleado");
        String apellidosEmpleado = request.getParameter("apellidosEmpleado");
        String telefonoEmpleado = request.getParameter("telefono");
        String ID_Cargo = request.getParameter("idCargo");
        String ID_Direccion = request.getParameter("idDireccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Empleados values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                //Nombres, Apellidos, FechaNac, DUI_Empleado, ISSS, Telefono, Correo, ID_Cargo, ID_Direccion
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombresEmpleado);
                pstmt.setString(2, apellidosEmpleado);            
                pstmt.setString(3, DUI_Empleado);
                pstmt.setString(4, ISSS_Empleado);
                pstmt.setString(5, telefonoEmpleado );
                pstmt.setString(6, ID_Cargo);
                pstmt.setString(7, ID_Direccion);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
        }
    }
    
    //Funciones de actualizacion de registros (UPDATE)
    public void modificarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        //CAPTURA DE VARIABLES
        String ID_Empleado = request.getParameter("ID_Empleado");
        String DUI_Empleado = request.getParameter("DUI_Empleado");
        String ISSS_Empleado = request.getParameter("ISSS_Empleado");
        String nombresEmpleado = request.getParameter("nombresEmpleado");
        String apellidosEmpleado = request.getParameter("apellidosEmpleado");
        String telefonoEmpleado = request.getParameter("telefonoEmpleado");
        String ID_Cargo = request.getParameter("ID_Cargo");
        String ID_Direccion = request.getParameter("ID_Direccion");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "update Empleados set "
                 + "dui='"+DUI_Empleado+"', "
                 + "ISSS='"+ISSS_Empleado+"', "
                 + "nombresEmpleado='"+nombresEmpleado+"', "
                 + "apellidosEmpleado='"+apellidosEmpleado+"', "
                 + "telefono='"+telefonoEmpleado+"', "
                 + "idCargo='"+ID_Cargo+"', "
                 + "idDireccion='"+ID_Direccion+"' " 
                 + "where idEmpleado='"+ID_Empleado+"'";
                
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
        }
    }
    
    //Funciones de eliminacion de registros (DELETE)
    public void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response) {
        String ID_Empleado = request.getParameter("ID_Empleado");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Empleados where idEmpleado='" + ID_Empleado + "'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
        }
    }
    // clientes metodos
    public void mostrarClientes(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaClientes";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<ViewModelClientes> listaClientes = new ArrayList<>();
                while (rs.next()) {
                    ViewModelClientes cliente = new ViewModelClientes();
                    cliente.setIdCliente(rs.getInt("idCliente"));
                    cliente.setDui(rs.getString("dui"));
                    cliente.setNombresCliente(rs.getString("nombresCliente"));
                    cliente.setApellidosCliente(rs.getString("apellidosCliente"));
                    cliente.setTelefono(rs.getString("telefono"));
                    cliente.seteMail(rs.getString("eMail"));
                    cliente.setIdDireccion(rs.getInt("idDireccion"));
                    cliente.setDireccionFull(rs.getString("DireccionCompleta"));
                    listaClientes.add(cliente);
                }               
                request.setAttribute("listaClientes", listaClientes);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
        }
    }
    public void agregarCliente(HttpServletRequest request, HttpServletResponse response) {
       //CAPTURA DE VARIABLES
       //El ID de los clientes es autoincrementable
        String DUI_Cliente = request.getParameter("dui");
        String nombresCliente = request.getParameter("nombresCliente");
        String apellidosCliente = request.getParameter("apellidosCliente");
        String telefonoCliente = request.getParameter("telefono");
        String correo = request.getParameter("eMail");
        String iddireccion = request.getParameter("idDireccion");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Clientes values (?, ?, ?, ?, ?, ?)";
                //nombresCliente, apellidosCliente, dui, telefono, eMail, idDireccion
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombresCliente);
                pstmt.setString(2, apellidosCliente);
                pstmt.setString(3, DUI_Cliente);
                pstmt.setString(4, telefonoCliente);
                pstmt.setString(5, correo);
                pstmt.setString(6, iddireccion );
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
        }
    }
    
    public void modificarCliente(HttpServletRequest request, HttpServletResponse response) {
    // Captura de variables
    int idCliente = 0;
    String nombreCliente = request.getParameter("nombre");
    String apellidoCliente = request.getParameter("apellido");
    String identificacionCliente = request.getParameter("identificacion");
    String telefonoCliente = request.getParameter("telefono");

    try {
        // Manejo de la conversión de idCliente a entero
        idCliente = Integer.parseInt(request.getParameter("idCliente"));

        // Carga del controlador JDBC
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

        try (Connection conn = DriverManager.getConnection(url);
             PreparedStatement pstmt = conn.prepareStatement(
                     "UPDATE Cliente "
                             + "SET nombre = ?, "
                             + "apellido = ?, "
                             + "identificacion = ?, "
                             + "telefono = ? "
                             + "WHERE idcliente = ?")) {

            // Asignación de valores a los parámetros de la sentencia SQL
            pstmt.setString(1, nombreCliente);
            pstmt.setString(2, apellidoCliente);
            pstmt.setString(3, identificacionCliente);
            pstmt.setString(4, telefonoCliente);
            pstmt.setInt(5, idCliente);

            // Ejecución de la sentencia SQL
            int registros = pstmt.executeUpdate();

            // Registro de éxito o falla de la actualización
            if (registros > 0) {
                request.getSession().setAttribute("exito", true);
            } else {
                request.getSession().setAttribute("exito", false);
            }
        }
    } catch (NumberFormatException | ClassNotFoundException | SQLException ex) {
        request.getSession().setAttribute("exito", false);
    }
}

    //Funciones de eliminacion de registros (DELETE)
    public void eliminarCliente(HttpServletRequest request, HttpServletResponse response) {
        String ID_Cliente = request.getParameter("ID_Cliente");
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "delete from Clientes where IDCliente= '"+ID_Cliente+"'";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
        }
    }
    
    // proveedores
    public void mostrarRecepcionista(HttpServletRequest request, HttpServletResponse response) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            try(Connection conn = DriverManager.getConnection(url)){
            //try (Connection conn = DriverManager.getConnection(url);) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sqlQuery = "select * from VistaRecepcionista";
                PreparedStatement pstmt = conn.prepareStatement(sqlQuery);
                ResultSet rs = pstmt.executeQuery();
                ArrayList<viewModelProveedores> listaProveedores = new ArrayList<>();
                while (rs.next()) {
                    viewModelRecepcionista Recepcionista = new viewModelRecepcionista();
                    Recepcionista.setRecepcionista(rs.getInt("idRecepcionista"));
                    Recepcionista.setNombresRecepcionista(rs.getString("nombre"));
                    Recepcionista.setApellidosRecepcionista(rs.getString("apellido"));
                    Recepcionista.setIdentificacion(rs.getString("identificacion"));
                    Recepcionista.setPosicion(rs.getString("posicion"));
                    Recepcionista.setId_Empleado(rs.getString("idEmpleado"));
                    Recepcionista.setId_Cargo(rs.getInt("idCargo"));
                    listaRecepcionista.add(Recepcionista);
                }               
                request.setAttribute("listaProveedores", listaProveedores);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.setAttribute("mensaje_conexion", ex.getMessage());
        }
    }
    
    public void agregarRecepcionista(HttpServletRequest request, HttpServletResponse response) {
//CAPTURA DE VARIABLES
        String nombreRecepcionista = request.getParameter("nombre_recepcionista");
        String apellidosRecepcionista = request.getParameter("apellido_recepcionista");
        String identificacionRecepcionista = request.getParameter("identificacion_recepcionista");
        String posicionRecepcionista = request.getParameter("posicion_recepcionista");

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection conn = DriverManager.getConnection(url)) {
                request.setAttribute("mensaje_conexion", "Ok!");
                String sql = "insert into Proveedores values (?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, nombresContacto);
                pstmt.setString(2, apellidosContacto);
                pstmt.setString(3, telefonoProveedor);
                pstmt.setString(4, correo);
                pstmt.setString(5, compania);
                pstmt.setString(6, ID_Direccion);
                int registros = pstmt.executeUpdate();
                if (registros > 0) {
                    request.getSession().setAttribute("exito", true);
                } else {
                    request.getSession().setAttribute("exito", false);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            request.getSession().setAttribute("exito", false);
            ex.printStackTrace();
        }
    }
    
  

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");
        
        if (accion == null) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
        else if (accion.equals("Login")) {
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
        else if (accion.equals("GestionEmpleados")) {
            mostrarEmpleados(request, response);
            request.getRequestDispatcher("/acciones/empleado/gestionarEmpleados.jsp").forward(request, response);
        }
        
        
       
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        
        if (accion.equals("Login")) {
            String user = request.getParameter("tfUser");
            String pass = request.getParameter("tfPass");
            
            try(PrintWriter print = response.getWriter()){
                if (user.equals("admin") && pass.equals("root")) {
                    request.getRequestDispatcher("paneles/panelDeControl.jsp").forward(request, response);
                }else{
                    print.println("<!DOCTYPE html>");
                    print.println("<html>");
                    print.println("<head>");
                    print.println("<title>Logi WES</title>");
                    print.println("</head>");
                    print.println("<body>");
                    print.println("<h1>ERROR: USUARIO O CONTRASEÑA INCORRECTOS...</h1>");
                    print.println("</body>");
                    print.println("</html>");
                }
            }
        }
        
  
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private static class ViewModelClientes {

        public ViewModelClientes() {
        }

        private void setIdCliente(int aInt) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setDui(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setNombresCliente(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setApellidosCliente(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setTelefono(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void seteMail(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setIdDireccion(int aInt) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }

        private void setDireccionFull(String string) {
            throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
        }
    }

    private static class viewModelProveedores {

        public viewModelProveedores() {
        }
    }

}
