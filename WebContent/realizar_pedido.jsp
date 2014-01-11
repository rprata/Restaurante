<%@page import="java.util.Calendar"%>
<%@page import="br.uerj.restaurante.modelos.Pedido"%>
<%@page import="br.uerj.restaurante.modelos.Cardapio"%>
<%@page import="br.uerj.restaurante.dao.PedidoDAO"%>
<%@page import="br.uerj.restaurante.dao.CardapioDAO"%>
<%@page import="br.uerj.restaurante.modelos.utils.Cargo"%>
<%@page import="br.uerj.restaurante.modelos.Usuario"%>
<%@page import="br.uerj.restaurante.dao.UsuarioDAO"%>
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
		String prato = request.getParameter("prato");
		int quantidade = Integer.parseInt(request.getParameter("quantidade"));
		
		CardapioDAO cardapioDAO = new CardapioDAO();
		Cardapio c = cardapioDAO.getDadosCardapio(prato);
		
		Pedido p = new Pedido();
		
		PedidoDAO pedidoDAO = new PedidoDAO();
		p.setPrato(c.getId());
		p.setQuantidade(quantidade);
	
		java.util.Calendar cal = java.util.Calendar.getInstance();
		java.util.Date utilDate = cal.getTime();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		
		p.setData(sqlDate);
		p.setStatus(Pedido.ANDAMENTO);
		
		pedidoDAO.inserirPedido(p);
		
		out.println("<SCRIPT language='JavaScript'>");
		out.println("alert('Pedido Inserido com sucesso');");
		out.println("history.go(-1);");
		out.println("</SCRIPT>");
		
		
	%>
</body>
</html>