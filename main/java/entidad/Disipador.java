package entidad;

public class Disipador {
	private int id_disipador, cate_id, tipo_disip_id, precio_disipador, stock_disipador;
	private String descrip_disip;
	public int getId_disipador() {
		return id_disipador;
	}
	public void setId_disipador(int id_disipador) {
		this.id_disipador = id_disipador;
	}
	public int getCate_id() {
		return cate_id;
	}
	public void setCate_id(int cate_id) {
		this.cate_id = cate_id;
	}
	public int getTipo_disip_id() {
		return tipo_disip_id;
	}
	public void setTipo_disip_id(int tipo_disip_id) {
		this.tipo_disip_id = tipo_disip_id;
	}
	public int getPrecio_disipador() {
		return precio_disipador;
	}
	public void setPrecio_disipador(int precio_disipador) {
		this.precio_disipador = precio_disipador;
	}
	public int getStock_disipador() {
		return stock_disipador;
	}
	public void setStock_disipador(int stock_disipador) {
		this.stock_disipador = stock_disipador;
	}
	public String getDescrip_disip() {
		return descrip_disip;
	}
	public void setDescrip_disip(String descrip_disip) {
		this.descrip_disip = descrip_disip;
	}
}
