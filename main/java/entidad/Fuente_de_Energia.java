package entidad;

public class Fuente_de_Energia {
	private Integer  id_fuente, cate_id, capacidad_fuente_id, certificado_fuente_id, precio_fuente, Stock_fuente;
	private String  descripcion_fuente;
	public Integer getId_fuente() {
		return id_fuente;
	}
	public void setId_fuente(Integer id_fuente) {
		this.id_fuente = id_fuente;
	}
	public Integer getCate_id() {
		return cate_id;
	}
	public void setCate_id(Integer cate_id) {
		this.cate_id = cate_id;
	}
	public Integer getCapacidad_fuente_id() {
		return capacidad_fuente_id;
	}
	public void setCapacidad_fuente_id(Integer capacidad_fuente_id) {
		this.capacidad_fuente_id = capacidad_fuente_id;
	}
	public Integer getCertificado_fuente_id() {
		return certificado_fuente_id;
	}
	public void setCertificado_fuente_id(Integer certificado_fuente_id) {
		this.certificado_fuente_id = certificado_fuente_id;
	}
	public Integer getPrecio_fuente() {
		return precio_fuente;
	}
	public void setPrecio_fuente(Integer precio_fuente) {
		this.precio_fuente = precio_fuente;
	}
	public Integer getStock_fuente() {
		return Stock_fuente;
	}
	public void setStock_fuente(Integer stock_fuente) {
		Stock_fuente = stock_fuente;
	}
	public String getDescripcion_fuente() {
		return descripcion_fuente;
	}
	public void setDescripcion_fuente(String descripcion_fuente) {
		this.descripcion_fuente = descripcion_fuente;
	}
}
