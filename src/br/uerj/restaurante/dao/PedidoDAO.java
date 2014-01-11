package br.uerj.restaurante.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import br.uerj.restaurante.modelos.Pedido;

import com.mysql.jdbc.PreparedStatement;

public class PedidoDAO extends ConexaoDAO {

	public ArrayList<Pedido> getTodosPedidos()	{
		ArrayList<Pedido> elementos = new ArrayList<Pedido>();

		openConnectionDB();

		String query = "SELECT * FROM pedido ORDER BY id";
		try {
			ResultSet rs = getStatement().executeQuery(query);
			while (rs.next()) {
				Pedido pedido = new Pedido();
				pedido.setId(rs.getInt("id"));
				pedido.setPrato(rs.getInt("prato"));
				pedido.setQuantidade(rs.getInt("quantidade"));
				pedido.setStatus(rs.getString("status"));
				pedido.setData(rs.getDate("data"));
				elementos.add(pedido);
			}
			closeConnectionDB();
			return elementos;
		} catch (SQLException e) {
			System.err.print("Erro no SQL: " + e.getMessage());
		}
		closeConnectionDB();
		return elementos;
	}

	
	public ArrayList<Pedido> getTodosPedidosAndamento()	{
		ArrayList<Pedido> elementos = new ArrayList<Pedido>();

		openConnectionDB();

		String query = "SELECT * FROM pedido WHERE status='Andamento' ORDER BY id;";
		try {
			ResultSet rs = getStatement().executeQuery(query);
			while (rs.next()) {
				Pedido pedido = new Pedido();
				pedido.setId(rs.getInt("id"));
				pedido.setPrato(rs.getInt("prato"));
				pedido.setQuantidade(rs.getInt("quantidade"));
				pedido.setStatus(rs.getString("status"));
				pedido.setData(rs.getDate("data"));
				elementos.add(pedido);
			}
			closeConnectionDB();
			return elementos;
		} catch (SQLException e) {
			System.err.print("Erro no SQL: " + e.getMessage());
		}
		closeConnectionDB();
		return elementos;
	}
	
	public ArrayList<Pedido> getTodosPedidosProntos()	{
		ArrayList<Pedido> elementos = new ArrayList<Pedido>();

		openConnectionDB();

		String query = "SELECT * FROM pedido WHERE status='Pronto' ORDER BY id;";
		try {
			ResultSet rs = getStatement().executeQuery(query);
			while (rs.next()) {
				Pedido pedido = new Pedido();
				pedido.setId(rs.getInt("id"));
				pedido.setPrato(rs.getInt("prato"));
				pedido.setQuantidade(rs.getInt("quantidade"));
				pedido.setStatus(rs.getString("status"));
				pedido.setData(rs.getDate("data"));
				elementos.add(pedido);
			}
			closeConnectionDB();
			return elementos;
		} catch (SQLException e) {
			System.err.print("Erro no SQL: " + e.getMessage());
		}
		closeConnectionDB();
		return elementos;
	}
	
	public int getQuantidadeDePratos() {
		openConnectionDB();
		ResultSet rs;
		int total = 0;
		try {
			rs = getStatement().executeQuery("SELECT COUNT(id) FROM pedido");
			if (rs.next()) {
				total = rs.getInt(1);
			}
			closeConnectionDB();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return total;

	}

	public void inserirPedido(Pedido p) {

		openConnectionDB();
		PreparedStatement pstm = null;

		try {

			String sql = "INSERT INTO pedido (id, prato, quantidade, status, data) values(?,?,?,?,?)";
			pstm = (PreparedStatement) getConnection().prepareStatement(sql);

			pstm.setInt(1, p.getId());
			pstm.setInt(2, p.getPrato());
			pstm.setInt(3, p.getQuantidade());
			pstm.setString(4, p.getStatus());
			pstm.setDate(5, p.getData());

			pstm.execute();
		} catch (SQLException e) {

			JOptionPane.showMessageDialog(null,
					"Não foi possível salvar os dados!\nInformações sobre o erro:"
							+ e, "Inserir", JOptionPane.ERROR_MESSAGE);
			e.printStackTrace();
		}

		closeConnectionDB();
	}
	
	public void atualizarStatus(int id, String status) {

		openConnectionDB();
		PreparedStatement pstm = null;

		try {
			String sql = "UPDATE pedido SET status = ? WHERE id =" + id + ";";
			pstm = (PreparedStatement) getConnection().prepareStatement(sql);

			pstm.setString(1, status);

			pstm.execute();
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null,
					"Não foi possível salvar os dados!\nInformações sobre o erro:"
							+ e, "Inserir", JOptionPane.ERROR_MESSAGE);
			e.printStackTrace();
		}

		closeConnectionDB();
	}
	
	public Pedido getPedido(int id) {
		Pedido pedido = new Pedido();
		openConnectionDB();
		try {
			ResultSet rs = (ResultSet) getStatement().executeQuery("SELECT * FROM pedido WHERE id="+id+";");
			while(rs.next()) {
				pedido.setId(rs.getInt("id"));
				pedido.setPrato(rs.getInt("prato"));
				pedido.setQuantidade(rs.getInt("quantidade"));
				pedido.setStatus(rs.getString("status"));
				pedido.setData(rs.getDate("data"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		closeConnectionDB();
		return pedido;
	}
	
}
