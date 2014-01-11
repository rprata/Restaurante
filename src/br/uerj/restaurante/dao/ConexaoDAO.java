package br.uerj.restaurante.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConexaoDAO {

	private Statement stmt;
	private Connection con;
	private static String URL = "jdbc:mysql://localhost:3306/restaurante";
	private static String USER = "root";
	private static String PASSWORD = "123456";

	public void openConnectionDB() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = (Connection) DriverManager.getConnection(URL, USER, PASSWORD);
			stmt = (Statement) con.createStatement();

		} catch (java.lang.ClassNotFoundException e) {
			System.err.println("Erro na Classe: " + e.getMessage());
		} catch (SQLException e) {
			System.err.println("Erro no SQL: " + e.getMessage());
		}
	}

	public void closeConnectionDB() {
		try {
			con.close();
		} catch (SQLException e) {
			System.err.print("Erro no SQL: " + e.getMessage());
		}
	}
	
	public Statement getStatement() {
		return stmt;
	}
	
	public Connection getConnection() {
		return con;
	}
	
}
