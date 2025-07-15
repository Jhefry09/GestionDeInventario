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
    case "Listar" -> Listar(request, response);
    case "Buscar" -> {
    	if (dato == null || dato.trim().isEmpty()) {
    		System.out.println("no buscó");
    		Listar(request, response);
    	} else {
    		Buscar(request, response);
    	}
    	}
    case "agregar"-> BtnAgregar(request, response);
    case "editar"-> Edicion(request, response);
    case "BtnBorrar"-> BtnBorrar(request, response);
    case "btnEditar"-> BtnEditar(request, response);
    };
    }
	protected void BtnAgregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void Edicion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void BtnEditar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void Listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String inven = request.getParameter("inventario");
	request.setAttribute("selec", inven);
	request.setAttribute("nombreSelec", "DESCRIPCION");
	request.setAttribute("tipoSelec", "nom");
	Optional<String> vacio = Optional.empty();
		String nombreTabla = switch (inven) {
			case "ALMACENAMIENTO" ->{
				request.setAttribute("datos", inventario.tAlmacenamiento(null, vacio, vacio));
				yield "ALMACENAMIENTO";}
			case "AmdGra" ->{
				request.setAttribute("datos", inventario.tAmdGrafica(null, vacio, vacio));
				yield "GRAFICAS AMD";}
			case "AmdPro"-> {
				request.setAttribute("datos", inventario.tAmdProcesador(null, vacio, vacio));
				yield "PROCESADORES AMD";}
			case "DISIPADORES"->{
				request.setAttribute("datos", inventario.tDisipador(null, vacio, vacio));
				yield "DISIPADORES";}
			case "FUENTES"->{
				request.setAttribute("datos", inventario.tFuente(null, vacio, vacio));
				yield "FUENTES DE ENERGIA";}
			case "Intel"->{
				request.setAttribute("datos", inventario.tIntelProcesador(null, vacio, vacio));
				yield "PROCESADORES INTEL";}
			case "Nvidia"->{
				request.setAttribute("datos", inventario.tNvidiaGrafica(null, vacio, vacio));
				yield "GRAFICAS NVIDIA";}
			case "PERIFERICOS"->{
				request.setAttribute("datos", inventario.tPerifericos(null, vacio, vacio));
				yield "PERIFERICOS";}
			case "PlacaBase"->{
				request.setAttribute("datos", inventario.tPlacaBase(null, vacio, vacio));
				yield "PLACAS BASE";}
			case "RAM"->{
				request.setAttribute("datos", inventario.tRam(null, vacio, vacio));
				yield "RAM";}
			default ->{
				System.out.println("Fallo");
				yield "FALLO";}
			};
	request.setAttribute("nombre", nombreTabla);
	request.getRequestDispatcher("inventario.jsp").forward(request, response);
	}
	protected String TipoBuscar(String id, String precio, String descripcion, HttpServletRequest request ) {
		Optional<String> tipoSelec = Optional.of(request.getParameter("tipoBuscar"));
		String tipo = switch (tipoSelec.get()) {
		case "id" -> id +" = ";
		case "pre" -> precio + " BETWEEN 0 AND ";
		default -> descripcion + " LIKE";
		};
		return tipo;
	}
	
	protected void Buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inven = request.getParameter("inventario");
		request.setAttribute("selec", inven);
		String tipoBuscar = "";
		Optional<String> tipoSelec = Optional.of(request.getParameter("tipoBuscar"));
		Optional<String> datos = Optional.of(request.getParameter("txtBuscar"));
		request.setAttribute("tipoSelec", tipoSelec.get());
		
		String seleccionado = switch (tipoSelec.get()) {
			case "id" ->"ID";
			case "pre" ->"PRECIO";	
			default -> "DESCRIPCION";	
		};
		System.out.println("Buscando con " + seleccionado);
		request.setAttribute("nombreSelec", seleccionado);
		
		String nombre = switch (inven) {
		case "ALMACENAMIENTO"->{
			tipoBuscar = TipoBuscar("a.id_almac", "a.precio_almac", "a.descrip_almace", request);
			request.setAttribute("datos", inventario.tAlmacenamiento(tipoBuscar, datos, tipoSelec));
			yield "ALMACENAMIENTO";
		}
		case "AmdGra"->{
			tipoBuscar = TipoBuscar("ga.id_grafica_amd", "ga.precio_grafi_amd", "ga.descripcion_grafi_amd", request);
			request.setAttribute("datos", inventario.tAmdGrafica(tipoBuscar, datos, tipoSelec));
			yield "GRAFICAS AMD";
		}
		case "AmdPro"->{
			tipoBuscar = TipoBuscar("pa.id_proce_AMD ", "pa.precio_proce_AMD", "gp.nom_gama_proc_amd", request);
			request.setAttribute("datos", inventario.tAmdProcesador(tipoBuscar, datos, tipoSelec));
			yield "PROCESADORES AMD";
		}
		case "DISIPADORES"->{
			tipoBuscar = TipoBuscar("d.id_disipador", "d.precio_disipador", "d.descrip_disip", request);
			request.setAttribute("datos", inventario.tDisipador(tipoBuscar, datos, tipoSelec));
			yield "DISIPADORES";
		}
		case "FUENTES"->{
			tipoBuscar = TipoBuscar("f.id_fuente", "f.precio_fuente", "f.descripcion_fuente", request);
			request.setAttribute("datos", inventario.tFuente(tipoBuscar, datos, tipoSelec));
			yield "FUENTES DE ENERGIA";
		}
		case "Intel"->{
			tipoBuscar = TipoBuscar("pi.id_proce_intel", "pi.precio_proce_intel", "gi.nom_gama_intel", request);
			request.setAttribute("datos", inventario.tIntelProcesador(tipoBuscar, datos, tipoSelec));
			yield "PROCESADORES INTEL";
		}
		case "Nvidia"->{
			tipoBuscar = TipoBuscar("gn.id_grafica_nvidia", "gn.precio_grafi_nvidia", "gn.descripcion_grafi_nvidia", request);
			request.setAttribute("datos", inventario.tNvidiaGrafica(tipoBuscar, datos, tipoSelec));
			yield "GRAFICAS NVIDIA";
		}
		case "PERIFERICOS"->{
			tipoBuscar = TipoBuscar("p.id_perifericos", "p.precio_perifericos", "p.descripc_perifericos", request);
			request.setAttribute("datos", inventario.tPerifericos(tipoBuscar, datos, tipoSelec));
			yield "PERIFERICOS";
		}
		case "PlacaBase"->{
			tipoBuscar = TipoBuscar("pb.id_placa_base", "pb.precio_placa_base", "pb.descri_placa_base", request);
			request.setAttribute("datos", inventario.tPlacaBase(tipoBuscar, datos, tipoSelec));
			yield "PLACAS BASE";
		}
		case "RAM"->{
			tipoBuscar = TipoBuscar("r.id_ram", "r.precio_ram", "r.descrip_ram", request);
			request.setAttribute("datos", inventario.tRam(tipoBuscar, datos, tipoSelec));
			yield "RAM";
		}
		default ->{
			yield "fallo";
		}};
		System.out.println(datos.get());
		request.setAttribute("nombre", nombre);
		request.getRequestDispatcher("inventario.jsp").forward(request, response);
	}
	protected void BtnBorrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer idBorrar = Integer.parseInt(request.getParameter("codigo"));
		String nomTabla = request.getParameter("NomTabla");
		String tipoId = switch (nomTabla) {
		case "GestionDeInventario.Ram" -> "id_ram";
		case "GestionDeInventario.PlacaBase" -> "id_placa_base";
		case "GestionDeInventario.Perifericos" -> "id_perifericos";
		case "GestionDeInventario.Grafica_nvidia" -> "id_grafica_nvidia";
		case "GestionDeInventario.Grafica_amd" -> "id_grafica_amd";
		case "GestionDeInventario.ProcesadorAMD" -> "id_proce_AMD";
		case "GestionDeInventario.ProcesadorIntel" -> "id_proce_intel";
		case "GestionDeInventario.Fuente_de_Energia" -> "id_fuente";
		case "GestionDeInventario.Disipador" -> "id_disipador";
		case "GestionDeInventario.Almacenamiento" -> "id_almac";
		default -> "FALLO";
		};
		System.out.println(idBorrar);
		System.out.println(nomTabla);
		System.out.println(tipoId);
		inventario.Borrar(idBorrar, nomTabla, tipoId);
		Listar(request, response);
	}	
}