package br.uerj.restaurante.modelos;

public class Venda {

	private int id;
	private int pedido;
	private float precoTotal;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPedido() {
		return pedido;
	}

	public void setPedido(int pedido) {
		this.pedido = pedido;
	}

	public float getPreçoTotal() {
		return precoTotal;
	}

	public void setPreçoTotal(float preçoTotal) {
		this.precoTotal = preçoTotal;
	}
}
