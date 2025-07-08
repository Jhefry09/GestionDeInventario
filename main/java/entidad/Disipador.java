package entidad;

public class Disipador {
	private Integer id_disipador, cate_id, tipo_disip_id, precio_disipador, stock_disipador;
	private String descrip_disip;
	public Integer getId_disipador() {
		return id_disipador;
	}
	public void setId_disipador(Integer id_disipador) {
		this.id_disipador = id_disipador;
	}
	public Integer getCate_id() {
		return cate_id;
	}
	public void setCate_id(Integer cate_id) {
		this.cate_id = cate_id;
	}
	public Integer getTipo_disip_id() {
		return tipo_disip_id;
	}
	public void setTipo_disip_id(Integer tipo_disip_id) {
		this.tipo_disip_id = tipo_disip_id;
	}
	public Integer getPrecio_disipador() {
		return precio_disipador;
	}
	public void setPrecio_disipador(Integer precio_disipador) {
		this.precio_disipador = precio_disipador;
	}
	public Integer getStock_disipador() {
		return stock_disipador;
	}
	public void setStock_disipador(Integer stock_disipador) {
		this.stock_disipador = stock_disipador;
	}
	public String getDescrip_disip() {
		return descrip_disip;
	}
	public void setDescrip_disip(String descrip_disip) {
		this.descrip_disip = descrip_disip;
	}
}
