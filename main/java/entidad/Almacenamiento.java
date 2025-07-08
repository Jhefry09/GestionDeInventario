package entidad;

public class Almacenamiento {
	private Integer id_almac, cate_id, capac_almac_id, tipo_almac_id, precio_almac, stock_almace;
	private String descrip_almace;

	public Integer getId_almac() {
		return id_almac;
	}

	public void setId_almac(Integer id_almac) {
		this.id_almac = id_almac;
	}

	public Integer getCate_id() {
		return cate_id;
	}

	public void setCate_id(Integer cate_id) {
		this.cate_id = cate_id;
	}

	public Integer getCapac_almac_id() {
		return capac_almac_id;
	}

	public void setCapac_almac_id(Integer capac_almac_id) {
		this.capac_almac_id = capac_almac_id;
	}

	public Integer getTipo_almac_id() {
		return tipo_almac_id;
	}

	public void setTipo_almac_id(Integer tipo_almac_id) {
		this.tipo_almac_id = tipo_almac_id;
	}

	public Integer getPrecio_almac() {
		return precio_almac;
	}

	public void setPrecio_almac(Integer precio_almac) {
		this.precio_almac = precio_almac;
	}

	public Integer getStock_almace() {
		return stock_almace;
	}

	public void setStock_almace(Integer stock_almace) {
		this.stock_almace = stock_almace;
	}

	public String getDescrip_almace() {
		return descrip_almace;
	}

	public void setDescrip_almace(String descrip_almace) {
		this.descrip_almace = descrip_almace;
	}
}
