package br.uerj.restaurante.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import br.uerj.restaurante.modelos.Venda;

import com.mysql.jdbc.PreparedStatement;

public class VendaDAO extends ConexaoDAO {

	public String gerarRelatorioVendas(String dataInicio, String dataFim) {
		String result = "";
		String query = "select c.prato, round(sum(v.preco_total),2) as preco_total_final, sum(p.quantidade) as quantidade "
				+ "from cardapio as c, venda as v, pedido as p "
				+ "where c.id = p.prato and p.id = v.pedido and p.`data` >= \""
				+ dataInicio
				+ "\" and  p.`data` < \""
				+ dataFim
				+ "\" "
				+ "group by c.prato " + "order by preco_total_final desc; ";
		
		openConnectionDB();
		try {
			ResultSet rs = (ResultSet) getStatement().executeQuery(query);
			while (rs.next()) {
				result += "<tr>";
				result += "<td>" + rs.getString("prato") + "</td>";
				result += "<td>" + rs.getInt("quantidade") + "</td>";
				result += "<td>"
						+ String.valueOf(String.format("%.2f", rs.getFloat("preco_total_final")))
								.replace('.', ',') + "</td>";
				result += "</tr>";
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		closeConnectionDB();

		return result;
	}

	public void realizarVenda(Venda v) {
		openConnectionDB();
		PreparedStatement pstm = null;

		try {

			String sql = "INSERT INTO venda (id, preco_total, pedido) values (?,?,?)";
			pstm = (PreparedStatement) getConnection().prepareStatement(sql);

			pstm.setInt(1, v.getId());
			pstm.setFloat(2, v.getPreçoTotal());
			pstm.setInt(3, v.getPedido());

			pstm.execute();
		} catch (SQLException e) {

			JOptionPane.showMessageDialog(null,
					"Não foi possível salvar os dados!\nInformações sobre o erro:"
							+ e, "Inserir", JOptionPane.ERROR_MESSAGE);
			e.printStackTrace();
		}

		closeConnectionDB();
	}

	public static String getMes(int mes) {
		switch (mes) {
		case 1:
			return "Janeiro";
		case 2:
			return "Fevereiro";
		case 3:
			return "Março";
		case 4:
			return "Abril";
		case 5:
			return "Maio";
		case 6:
			return "Junho";
		case 7:
			return "Julho";
		case 8:
			return "Agosto";
		case 9:
			return "Setembro";
		case 10:
			return "Outubro";
		case 11:
			return "Novembro";
		case 12:
			return "Dezembro";
		default:
			return "";

		}
	}

}
