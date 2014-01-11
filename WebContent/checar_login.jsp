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
		
		if (login.length() == 0 || senha.length() == 0) {
			out.println("<SCRIPT language='JavaScript'>");
			out.println("alert('Os campos precisam estar preenchidos');");
			out.println("history.go(-1);");
			out.println("</SCRIPT>");
		} else {
			UsuarioDAO usuarioDAO = new UsuarioDAO();
			if (!usuarioDAO.verificaUsuario(login)) { 
				out.println("<SCRIPT language='JavaScript'>");
				out.println("alert('Usuário não cadastrado');");
				out.println("history.go(-1);");
				out.println("</SCRIPT>");
			} else {
				Usuario usuario = usuarioDAO.getDadosUsuario(login);
				if (senha.compareTo(usuario.getSenha()) == 0) {
					Cargo c = usuario.getCargo();
					switch (c) {
					case GER: 
					    pageContext.forward("inicio_ger.jsp");
						break;
					case COZ:
					    pageContext.forward("inicio_coz.jsp");
						break;
					case GAR:
					    pageContext.forward("inicio_gar.jsp");
						break;
					default: break;
					}
					
				} else {
					out.println("<SCRIPT language='JavaScript'>");
					out.println("alert('Senha incorreta');");
					out.println("history.go(-1);");
					out.println("</SCRIPT>");
				}
					
			}
			
		}
		
		
	%>
</body>
</html>