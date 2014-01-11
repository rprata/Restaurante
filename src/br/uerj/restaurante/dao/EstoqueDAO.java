package br.uerj.restaurante.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import br.uerj.restaurante.modelos.Estoque;

import com.mysql.jdbc.PreparedStatement;

public class EstoqueDAO extends ConexaoDAO {

	public void inserirIngrediente(Estoque e) {

		openConnectionDB();
		PreparedStatement pstm = null;

		try {

			String sql = "INSERT INTO estoque (id, ingrediente, quantidade, unidade) values(?,?,?,?)";
			pstm = (PreparedStatement) getConnection().prepareStatement(sql);

			pstm.setInt(1, e.getId());
			pstm.setString(2, e.getIngrediente());
			pstm.setFloat(3, e.getQuantidade());
			pstm.setString(4, e.getUnidades());

			pstm.execute();
		} catch (SQLException e1) {

			JOptionPane.showMessageDialog(null,
					"Não foi possível salvar os dados!\nInformações sobre o erro:"
							+ e1, "Inserir", JOptionPane.ERROR_MESSAGE);
			e1.printStackTrace();
		}

		closeConnectionDB();
	}

	public Estoque getDadosEstoque(String ingrediente) {
		Estoque estoque = new Estoque();
		openConnectionDB();
		try {
			ResultSet rs = (ResultSet) getStatement().executeQuery(
					"SELECT * FROM estoque WHERE ingrediente='" + ingrediente + "'");
			while (rs.next()) {
				estoque.setId(rs.getInt("id"));
				estoque.setIngrediente(rs.getString("ingrediente"));
				estoque.setQuantidade(rs.getFloat("quantidade"));
				estoque.setUnidades(rs.getString("unidade"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		closeConnectionDB();
		return estoque;
	}

	public ArrayList<Estoque> getTodoEstoque() {
		ArrayList<Estoque> elementos = new ArrayList<Estoque>();

		openConnectionDB();

		String query = "SELECT * FROM estoque ORDER BY id";
		try {
			ResultSet rs = getStatement().executeQuery(query);
			while (rs.next()) {
				Estoque estoque = new Estoque();
				estoque.setId(rs.getInt("id"));
				estoque.setIngrediente(rs.getString("ingrediente"));
				estoque.setQuantidade(rs.getFloat("quantidade"));
				estoque.setUnidades(rs.getString("unidade"));
				elementos.add(estoque);
			}
			closeConnectionDB();
			return elementos;
		} catch (SQLException e) {
			System.err.print("Erro no SQL: " + e.getMessage());
		}
		closeConnectionDB();
		return elementos;
	}
	
	public void atualizarQuantidade(Estoque e) {

		openConnectionDB();
		PreparedStatement pstm = null;

		try {
			String sql = "UPDATE estoque SET quantidade = ? WHERE ingrediente = '"+ e.getIngrediente() +"'";
			pstm = (PreparedStatement) getConnection().prepareStatement(sql);

			pstm.setFloat(1, e.getQuantidade());
			
			pstm.execute();
		} catch (SQLException e1) {
			JOptionPane.showMessageDialog(null,
					"Não foi possível salvar os dados!\nInformações sobre o erro:"
							+ e1, "Inserir", JOptionPane.ERROR_MESSAGE);
			e1.printStackTrace();
		}

		closeConnectionDB();
	}

}
