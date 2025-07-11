package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Administrador;
import modelo.ModelAdministrador;

/**
 * Servlet implementation class ServletAministrador
 */
@WebServlet("/ServletAdministrador")
public class ServletAdministrador extends HttpServlet {
	ModelAdministrador mat = new ModelAdministrador(); 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAdministrador() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String login, clave;
	login = request.getParameter("txtUsuario");
	clave = request.getParameter("txtClave");
	Administrador admin = mat.iniciarSesion(login, clave);
	if(admin == null) {
		request.setAttribute("error", "clave/usuario incorrecto");
		request.getRequestDispatcher("index.jsp").forward(request, response);
		System.out.println("fallo contraseña");
	}else {
		System.out.println("Inicio de sesion correcto");
		response.sendRedirect("ServletInventario?seleccion=Listar&inventario=ALMACENAMIENTO");
	}
	}
}
