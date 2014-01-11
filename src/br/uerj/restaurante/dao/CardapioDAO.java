package br.uerj.restaurante.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import br.uerj.restaurante.modelos.Cardapio;

import com.mysql.jdbc.PreparedStatement;

public class CardapioDAO extends ConexaoDAO {

	public ArrayList<Cardapio> getTodosElementos() {
		ArrayList<Cardapio> elementos = new ArrayList<Cardapio>();

		openConnectionDB();

		String query = "SELECT * FROM cardapio ORDER BY id";
		try {
			ResultSet rs = getStatement().executeQuery(query);
			while (rs.next()) {
				Cardapio cardapio = new Cardapio();
				cardapio.setId(rs.getInt("id"));
				cardapio.setPrato(rs.getString("prato"));
				cardapio.setPreco(rs.getFloat("preco"));
				cardapio.setDescricao(rs.getString("descricao"));
				cardapio.setReceita(rs.getString("receita"));
				elementos.add(cardapio);
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
			rs = getStatement().executeQuery(
					"SELECT COUNT(id)FROM cardapio");
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

	public Cardapio getDadosCardapio(String prato) {
		Cardapio cardapio = new Cardapio();
		openConnectionDB();
		try {
			ResultSet rs = (ResultSet) getStatement().executeQuery(
					"SELECT * FROM cardapio WHERE prato='" + prato + "'");
			while (rs.next()) {
				cardapio.setId(rs.getInt("id"));
				cardapio.setPrato(rs.getString("prato"));
				cardapio.setPreco(rs.getFloat("preco"));
				cardapio.setDescricao(rs.getString("descricao"));
				cardapio.setReceita(rs.getString("receita"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		closeConnectionDB();
		return cardapio;
	}
	
	public Cardapio getDadosCardapio(int id) {
		Cardapio cardapio = new Cardapio();
		openConnectionDB();
		try {
			ResultSet rs = (ResultSet) getStatement().executeQuery(
					"SELECT * FROM cardapio WHERE id='" + id + "'");
			while (rs.next()) {
				cardapio.setId(rs.getInt("id"));
				cardapio.setPrato(rs.getString("prato"));
				cardapio.setPreco(rs.getFloat("preco"));
				cardapio.setDescricao(rs.getString("descricao"));
				cardapio.setReceita(rs.getString("receita"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		closeConnectionDB();
		return cardapio;
	}
	
	public void inserirPrato(Cardapio c) {

		openConnectionDB();
		PreparedStatement pstm = null;

		try {

			String sql = "INSERT INTO cardapio (id, prato, preco, descricao, receita) values(?,?,?,?,?)";
			pstm = (PreparedStatement) getConnection().prepareStatement(sql);

			pstm.setInt(1, c.getId());
			pstm.setString(2, c.getPrato());
			pstm.setFloat(3, c.getPreco());
			pstm.setString(4, c.getDescricao());
			pstm.setString(5, c.getReceita());
			
			pstm.execute();
		} catch (SQLException e) {

			JOptionPane.showMessageDialog(null,
					"Não foi possível salvar os dados!\nInformações sobre o erro:"
							+ e, "Inserir", JOptionPane.ERROR_MESSAGE);
			e.printStackTrace();
		}

		closeConnectionDB();
	}
	
	public void atualizarUsuario(Cardapio c) {

		openConnectionDB();
		PreparedStatement pstm = null;

		try {
			String sql = "UPDATE cardapio SET preco = ?, descricao = ?, receita = ? WHERE prato = '"+ c.getPrato() +"'";
			pstm = (PreparedStatement) getConnection().prepareStatement(sql);

			pstm.setFloat(1, c.getPreco());
			pstm.setString(2, c.getDescricao());
			pstm.setString(3, c.getReceita());
			
			pstm.execute();
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null,
					"Não foi possível salvar os dados!\nInformações sobre o erro:"
							+ e, "Inserir", JOptionPane.ERROR_MESSAGE);
			e.printStackTrace();
		}

		closeConnectionDB();
	}
}
