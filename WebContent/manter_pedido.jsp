<%@page import="br.uerj.restaurante.dao.VendaDAO"%>
<%@page import="br.uerj.restaurante.dao.CardapioDAO"%>
<%@page import="br.uerj.restaurante.modelos.Cardapio"%>
<%@page import="br.uerj.restaurante.modelos.Venda"%>
<%@page import="br.uerj.restaurante.dao.PedidoDAO"%>
<%@page import="br.uerj.restaurante.modelos.Pedido"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String type = request.getParameter("type");
		int id = Integer.parseInt(request.getParameter("id"));
		String pageStr = request.getParameter("page");

		PedidoDAO pedidoDAO = new PedidoDAO();
		pedidoDAO.atualizarStatus(id, type);

		if (pageStr.compareTo("visualizar") == 0)
			response.sendRedirect("visualizar_pedidos.jsp");
		
		if (pageStr.compareTo("entregar") == 0) {

			Pedido p = pedidoDAO.getPedido(id);

			CardapioDAO cardapioDAO = new CardapioDAO();
			Cardapio c = cardapioDAO.getDadosCardapio(p.getPrato());

			Venda v = new Venda();
			v.setPedido(id);
			v.setPreçoTotal(p.getQuantidade() * c.getPreco());

			VendaDAO vendaDAO = new VendaDAO();
			vendaDAO.realizarVenda(v);

			response.sendRedirect("entregar_pedido.jsp");

		}
	%>
</body>
</html>