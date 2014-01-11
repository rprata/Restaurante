package br.uerj.restaurante.modelos;

import java.sql.Date;

public class Pedido {
	private int prato;
	private int quantidade;
	private Date data; 
	private int id; // identificador do pedido
	private String status;
	
	public static final String ENTREGUE = "Entregue";
	public static final String PRONTO = "Pronto";
	public static final String ANDAMENTO = "Andamento";
	public static final String CANCELADO = "Cancelado";

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPrato() {
		return prato;
	}

	public void setPrato(int prato) {
		this.prato = prato;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
