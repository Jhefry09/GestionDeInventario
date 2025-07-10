package controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.ModelInventario;

/**
 * Servlet implementation class ServletInventario
 */
@WebServlet("/ServletInventario")
public class ServletInventario extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletInventario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String selec = request.getParameter("seleccion");
    switch (selec) {
	case "Listar":
		Listar(request, response);
		break;
	case "buscarcodi":
		//if (dato == null || dato.trim().isEmpty()) {
		//	Listar(request, response);
		//} else {
			//buscar(request, response);
		break;
	case "agregar":
		//agregar(request, response);
		break;
	case "editar":
		//editar(request, response);
		break;
	case "borrar":
		//borrar(request, response);
		break;
	case "btnEditar":
		//btnEditar(request, response);
		break;
	}
    }	
	protected void Listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inven = request.getParameter("inventario");
		ModelInventario inventario = new ModelInventario();
		switch (inven) {
		case "Almacenamiento":
			request.setAttribute("selec", inven);
			request.setAttribute("datos", inventario.tAlmacenamiento());
			break;
		case "AmdGra":
			request.setAttribute("selec", inven);
			request.setAttribute("datos", inventario.tAmdGrafica());
			break;
		case "AmdPro":
			request.setAttribute("selec", inven);
			request.setAttribute("datos", inventario.tAmdProcesador());
			break;
		case "Disipador":
			request.setAttribute("selec", inven);
			request.setAttribute("datos", inventario.tDisipador());
			break;
		case "Fuente":
			request.setAttribute("selec", inven);
			request.setAttribute("datos", inventario.tFuente());
			break;
		case "Intel":
			request.setAttribute("selec", inven);
			request.setAttribute("datos", inventario.tIntelProcesador());
			break;
		case "Nvidia":
			request.setAttribute("selec", inven);
			request.setAttribute("datos", inventario.tNvidiaGrafica());
			break;
		case "Perifericos":
			request.setAttribute("selec", inven);
			request.setAttribute("datos", inventario.tPerifericos());
			break;
		case "PlacaBase":
			request.setAttribute("selec", inven);
			request.setAttribute("datos", inventario.tPlacaBase());
			break;
		case "Ram":
			request.setAttribute("selec", inven);
			request.setAttribute("datos", inventario.tRam());
			break;
		}
		request.getRequestDispatcher("inventario.jsp").forward(request, response);
	}
	
}
