package br.uerj.restaurante.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import br.uerj.restaurante.modelos.Usuario;
import br.uerj.restaurante.modelos.utils.Cargo;

import com.mysql.jdbc.PreparedStatement;

public class UsuarioDAO extends ConexaoDAO{

	public boolean verificaUsuario(String login) {
		openConnectionDB();
		try {
			ResultSet rs = (ResultSet) getStatement().executeQuery("SELECT * FROM usuario WHERE login='"+login+"'");
			if (rs.next()) {
				closeConnectionDB();
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		closeConnectionDB();
		return false;
	}
	
	public Usuario getDadosUsuario(String login) {
		Usuario usuario = new Usuario();
		openConnectionDB();
		try {
			ResultSet rs = (ResultSet) getStatement().executeQuery("SELECT * FROM usuario WHERE login='"+login+"'");
			while(rs.next()) {
				usuario.setLogin(rs.getString("login"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setNome(rs.getString("nome"));
				usuario.setIdade(rs.getInt("idade"));
				usuario.setCpf(rs.getString("cpf"));
				String cargo = rs.getString("cargo");
				if (cargo.compareTo("GER") == 0) 
					usuario.setCargo(Cargo.GER);
				else if (cargo.compareTo("COZ") == 0) 
					usuario.setCargo(Cargo.COZ);
				else 
					usuario.setCargo(Cargo.GAR);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		closeConnectionDB();
		return usuario;
	}
	
	public void inserirUsuario(Usuario u) {

		openConnectionDB();
		PreparedStatement pstm = null;

		try {

			String sql = "INSERT INTO usuario (login, senha, nome, idade, cpf, cargo) values(?,?,?,?,?,?)";
			pstm = (PreparedStatement) getConnection().prepareStatement(sql);

			pstm.setString(1, u.getLogin());
			pstm.setString(2, u.getSenha());
			pstm.setString(3, u.getNome());
			pstm.setInt(4, u.getIdade());
			pstm.setString(5, u.getCpf());
			
			switch (u.getCargo()) {
			case GAR:
				pstm.setString(6, "GAR");
				break;
			case COZ:
				pstm.setString(6, "COZ");
				break;
			case GER:
				pstm.setString(6, "GER");
				break;
			default:
				break;
			}
			pstm.execute();
		} catch (SQLException e) {

			JOptionPane.showMessageDialog(null,
					"Não foi possível salvar os dados!\nInformações sobre o erro:"
							+ e, "Inserir", JOptionPane.ERROR_MESSAGE);
			e.printStackTrace();
		}

		closeConnectionDB();
	}
	
	public void atualizarUsuario(Usuario u) {

		openConnectionDB();
		PreparedStatement pstm = null;

		try {
			String sql = "UPDATE usuario SET senha = ?, nome = ?, idade = ?, cpf = ?, cargo = ? WHERE login = '"+ u.getLogin() +"'";
			pstm = (PreparedStatement) getConnection().prepareStatement(sql);

			pstm.setString(1, u.getSenha());
			pstm.setString(2, u.getNome());
			pstm.setInt(3, u.getIdade());
			pstm.setString(4, u.getCpf());
			
			switch (u.getCargo()) {
			case GAR:
				pstm.setString(5, "GAR");
				break;
			case COZ:
				pstm.setString(5, "COZ");
				break;
			case GER:
				pstm.setString(5, "GER");
				break;
			default:
				break;
			}
			

			pstm.execute();
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null,
					"Não foi possível salvar os dados!\nInformações sobre o erro:"
							+ e, "Inserir", JOptionPane.ERROR_MESSAGE);
			e.printStackTrace();
		}

		closeConnectionDB();
	}
	
	public ArrayList<Usuario> getTodosElementos() {
		ArrayList<Usuario> elementos = new ArrayList<Usuario>();

		openConnectionDB();

		String query = "SELECT * FROM usuario ORDER BY login";
		try {
			ResultSet rs = getStatement().executeQuery(query);
			while (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setLogin(rs.getString("login"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setNome(rs.getString("nome"));
				usuario.setIdade(rs.getInt("idade"));
				usuario.setCpf(rs.getString("cpf"));
				String cargo = rs.getString("cargo");
				if (cargo.compareTo("GER") == 0) 
					usuario.setCargo(Cargo.GER);
				else if (cargo.compareTo("COZ") == 0) 
					usuario.setCargo(Cargo.COZ);
				else 
					usuario.setCargo(Cargo.GAR);
				elementos.add(usuario);
			}
			closeConnectionDB();
			return elementos;
		} catch (SQLException e) {
			System.err.print("Erro no SQL: " + e.getMessage());
		}
		closeConnectionDB();
		return elementos;
	}
}
