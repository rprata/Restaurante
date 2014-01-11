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
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String nome = request.getParameter("nome");
		int idade = Integer.parseInt(request.getParameter("idade"));
		String cpf = request.getParameter("cpf");
		String cargo = request.getParameter("cargo");
		
		Usuario u = new Usuario();
		u.setLogin(login);
		u.setSenha(senha);
		u.setNome(nome);
		u.setIdade(idade);
		u.setCpf(cpf);
				
		
		if (cargo.substring(0, 3).compareTo("Gar") == 0) {
			u.setCargo(Cargo.GAR);
		} else if (cargo.substring(0, 3).compareTo("Coz") == 0) {
			u.setCargo(Cargo.COZ);
		} else {
			u.setCargo(Cargo.GER);
		}
		
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		
		usuarioDAO.atualizarUsuario(u);
		
		out.println("<SCRIPT language='JavaScript'>");
		out.println("alert('Usuário atualizado com sucesso');");
		out.println("history.go(-1);");
		out.println("</SCRIPT>");
		
	%>
</body>
</html>