<%@page import="br.uerj.restaurante.dao.EstoqueDAO"%>
<%@page import="br.uerj.restaurante.modelos.Estoque"%>
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
		String ingrediente = request.getParameter("ingrediente");
		float quantidade = Float.parseFloat(request.getParameter("quantidade").replace(',', '.'));
		String unidade = request.getParameter("unidade");
		
		Estoque e = new Estoque();
		e.setIngrediente(ingrediente);
		e.setQuantidade(quantidade);
		e.setUnidades(unidade);
		
		EstoqueDAO estoqueDAO = new EstoqueDAO();
		
		estoqueDAO.inserirIngrediente(e);
		
		out.println("<SCRIPT language='JavaScript'>");
		out.println("alert('Pedido Inserido com sucesso');");
		out.println("history.go(-1);");
		out.println("</SCRIPT>");
		
	%>
</body>
</html>