package controlador;

import java.io.IOException;
import java.util.Optional;

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
	ModelInventario inventario = new ModelInventario();
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
    String dato = request.getParameter("txtBuscar");
    switch (selec) {
	case "Listar":
		Listar(request, response);
		break;
	case "Buscar":
		if (dato == null || dato.trim().isEmpty()) {
			System.out.println("no buscó");
			Listar(request, response);
		} else {
			Buscar(request, response);
			}
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
		Optional<String> vacio = Optional.empty();
		String vaci = "";
		request.setAttribute("selec", inven);
		request.setAttribute("nombreSelec", "DESCRIPCION");
		request.setAttribute("tipoSelec", "nom");

	switch (inven ) {
		case "ALMACENAMIENTO":
			request.setAttribute("nombre", "ALMACENAMIENTO");
			request.setAttribute("datos", inventario.tAlmacenamiento(vaci, vacio, vacio));
			break;
		case "AmdGra":
			request.setAttribute("nombre", "GRAFICAS AMD");
			request.setAttribute("datos", inventario.tAmdGrafica(vaci, vacio, vacio));
			break;
		case "AmdPro":
			request.setAttribute("nombre", "PROCESADORES AMD");
			request.setAttribute("datos", inventario.tAmdProcesador(vaci, vacio, vacio));
			break;
		case "DISIPADORES":
			request.setAttribute("nombre", "DISIPADORES");
			request.setAttribute("datos", inventario.tDisipador(vaci, vacio, vacio));
			break;
		case "FUENTES":
			request.setAttribute("nombre", "FUENTES DE ENERGIA");
			request.setAttribute("datos", inventario.tFuente(vaci, vacio, vacio));
			break;
		case "Intel":
			request.setAttribute("nombre", "PROCESADORES INTEL");
			request.setAttribute("datos", inventario.tIntelProcesador(vaci, vacio, vacio));
			break;
		case "Nvidia":
			request.setAttribute("nombre", "GRAFICAS NVIDIA");
			request.setAttribute("datos", inventario.tNvidiaGrafica(vaci, vacio, vacio));
			break;
		case "PERIFERICOS":
			request.setAttribute("nombre", "PERIFERICOS");
			request.setAttribute("datos", inventario.tPerifericos(vaci, vacio, vacio));
			break;
		case "PlacaBase":
			request.setAttribute("nombre", "PLACAS BASE");
			request.setAttribute("datos", inventario.tPlacaBase(vaci, vacio, vacio));
			break;
		case "RAM":
			request.setAttribute("nombre", "RAM");
			request.setAttribute("datos", inventario.tRam(vaci, vacio, vacio));
			break;
		}
		request.getRequestDispatcher("inventario.jsp").forward(request, response);
	}
	protected void Buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inven = request.getParameter("inventario");
		Optional<String> tipoSelec = Optional.of(request.getParameter("tipoBuscar"));
		Optional<String> datos = Optional.of(request.getParameter("txtBuscar"));
		String tipoBuscar = "";
		System.out.println(tipoSelec.get());
		System.out.println(datos.get());
		request.setAttribute("tipoSelec", tipoSelec.get());
		request.setAttribute("selec", inven);
		
		switch (tipoSelec.get()) {
		case "id":
			request.setAttribute("nombreSelec", "ID");
			break;
		case "pre":
			request.setAttribute("nombreSelec", "PRECIO");
			break;

		default:
			request.setAttribute("nombreSelec", "DESCRIPCION");
			break;
		}

		switch (inven) {
		case "ALMACENAMIENTO":
			request.setAttribute("nombre", "ALMACENAMIENTO");
			switch (tipoSelec.get()) {
			case "id": {
				tipoBuscar = "a.id_almac = ";
				break;
			}
			case "pre": {
				tipoBuscar = "a.precio_almac BETWEEN 0 AND ";
				break;
			}
			default: {
				tipoBuscar = "a.descrip_almace LIKE" ;
				break;
			}
			}			
			request.setAttribute("datos", inventario.tAlmacenamiento(tipoBuscar, datos, tipoSelec));
			
			break;
			case "AmdGra":
				request.setAttribute("nombre", "GRAFICAS AMD");
				switch (tipoSelec.get()) {
				case "id": {
					tipoBuscar = "ga.id_grafica_amd = ";
					break;
				}
				case "pre": {
					tipoBuscar = "ga.precio_grafi_amd BETWEEN 0 AND ";
					break;
				}
				default: {
					tipoBuscar = "ga.descripcion_grafi_amd LIKE ";
					break;
				}
				}
				request.setAttribute("datos", inventario.tAmdGrafica(tipoBuscar, datos, tipoSelec));
				break;
			
			case "AmdPro":
				request.setAttribute("nombre", "PROCESADORES AMD");
				switch (tipoSelec.get()) {
				case "id": {
					tipoBuscar = "pa.id_proce_AMD = ";
					break;
				}
				case "pre": {
					tipoBuscar = "pa.precio_proce_AMD BETWEEN 0 AND ";
					break;
				}
				default: {
					tipoBuscar = "gp.nom_gama_proc_amd LIKE ";
					break;
				}
				}
				request.setAttribute("datos", inventario.tAmdProcesador(tipoBuscar, datos, tipoSelec));
				break;
			case "DISIPADORES":
				request.setAttribute("nombre", "DISIPADORES");
				switch (tipoSelec.get()) {
				case "id": {
					tipoBuscar = "d.id_disipador = ";
					break;
				}
				case "pre": {
					tipoBuscar = "d.precio_disipador BETWEEN 0 AND ";
					break;
				}
				default: {
					tipoBuscar = "d.descrip_disip LIKE ";
					break;
				}
				}
				request.setAttribute("datos", inventario.tDisipador(tipoBuscar, datos, tipoSelec));
				break;
			case "FUENTES":
				request.setAttribute("nombre", "FUENTES DE ENERGIA");
				switch (tipoSelec.get()) {
				case "id": {
					tipoBuscar = "f.id_fuente = ";
					break;
				}
				case "pre": {
					tipoBuscar = "f.precio_fuente BETWEEN 0 AND ";
					break;
				}
				default: {
					tipoBuscar = "f.descripcion_fuente LIKE ";
					break;
				}
				}
				request.setAttribute("datos", inventario.tFuente(tipoBuscar, datos, tipoSelec));
				break;
			case "Intel":
				request.setAttribute("nombre", "PROCESADORES INTEL");
				switch (tipoSelec.get()) {
				case "id": {
					tipoBuscar = "pi.id_proce_intel = ";
					break;
				}
				case "pre": {
					tipoBuscar = "pi.precio_proce_intel BETWEEN 0 AND ";
					break;
				}
				default: {
					tipoBuscar = "gi.nom_gama_intel LIKE ";
					break;
				}
				}
				request.setAttribute("datos", inventario.tIntelProcesador(tipoBuscar, datos, tipoSelec));
				break;
			case "Nvidia":
				request.setAttribute("nombre", "GRAFICAS NVIDIA");
				switch (tipoSelec.get()) {
				case "id": {
					tipoBuscar = "gn.id_grafica_nvidia = ";
					break;
				}
				case "pre": {
					tipoBuscar = "gn.precio_grafi_nvidia BETWEEN 0 AND ";
					break;
				}
				default: {
					tipoBuscar = "gn.descripcion_grafi_nvidia LIKE ";
					break;
				}
				}
				request.setAttribute("datos", inventario.tNvidiaGrafica(tipoBuscar, datos, tipoSelec));
				break;
			case "PERIFERICOS":
				request.setAttribute("nombre", "PERIFERICOS");
				switch (tipoSelec.get()) {
				case "id": {
					tipoBuscar = "p.id_perifericos = ";
					break;
				}
				case "pre": {
					tipoBuscar = "p.precio_perifericos BETWEEN 0 AND ";
					break;
				}
				default: {
					tipoBuscar = "p.descripc_perifericos LIKE ";
					break;
				}
				}
				request.setAttribute("datos", inventario.tPerifericos(tipoBuscar, datos, tipoSelec));
				break;
			case "PlacaBase":
				request.setAttribute("nombre", "PLACAS BASE");
				switch (tipoSelec.get()) {
				case "id": {
					tipoBuscar = "pb.id_placa_base = ";
					break;
				}
				case "pre": {
					tipoBuscar = "pb.precio_placa_base BETWEEN 0 AND ";
					break;
				}
				default: {
					tipoBuscar = "pb.descri_placa_base LIKE ";
					break;
				}
				}
				request.setAttribute("datos", inventario.tPlacaBase(tipoBuscar, datos, tipoSelec));
				break;
			case "RAM":
				request.setAttribute("nombre", "RAM");
				switch (tipoSelec.get()) {
				case "id": {
					tipoBuscar = "r.id_ram = ";
					break;
				}
				case "pre": {
					tipoBuscar = "r.precio_ram BETWEEN 0 AND ";
					break;
				}
				default: {
					tipoBuscar = "r.descrip_ram LIKE ";
					break;
				}
				}
				request.setAttribute("datos", inventario.tRam(tipoBuscar, datos, tipoSelec));
				break;
			}
		request.getRequestDispatcher("inventario.jsp").forward(request, response);
	}
}




