package br.uerj.restaurante.modelos;

public class Estoque {
	private int id;
	private String ingrediente;
	private float quantidade;
	private String unidades;

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id; 
	}
	
	public String getIngrediente() {
		return ingrediente;
	}

	public void setIngrediente(String ingrediente) {
		this.ingrediente = ingrediente;
	}

	public float getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(float quantidade) {
		this.quantidade = quantidade;
	}

	public String getUnidades() {
		return unidades;
	}

	public void setUnidades(String unidades) {
		this.unidades = unidades;
	}

}
