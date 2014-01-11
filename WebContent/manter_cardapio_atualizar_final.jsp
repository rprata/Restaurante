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
		float preco = Float.parseFloat(request.getParameter("preco"));
		String descricao = request.getParameter("descricao");
		String receita = request.getParameter("receita");
		
		Cardapio c = new Cardapio();
		c.setPrato(prato);
		c.setPreco(preco);
		c.setDescricao(descricao);
		c.setReceita(receita);
		
		CardapioDAO cardapioDAO = new CardapioDAO();
		
		cardapioDAO.atualizarUsuario(c);
		
		out.println("<SCRIPT language='JavaScript'>");
		out.println("alert('Prato atualizado com sucesso');");
		out.println("history.go(-1);");
		out.println("</SCRIPT>");
		
	%>
</body>
</html>