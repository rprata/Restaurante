<%@page import="br.uerj.restaurante.dao.CardapioDAO"%>
<%@page import="br.uerj.restaurante.modelos.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.uerj.restaurante.dao.PedidoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Página Inicial - Garçom</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Add custom CSS here -->
<link href="css/sb-admin.css" rel="stylesheet">
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
</head>

<body>

	<div id="wrapper">

		<!-- Sidebar -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand">Página Inicial - Garçom</a>
		</div>

		<ul class="nav navbar-nav navbar-right navbar-user">
			<li class="dropdown messages-dropdown"><a href="index.jsp"><i
					class="fa fa-power-off"></i> Sair</a>
		</ul>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav side-nav">
				<li><a href="inicio_gar.jsp"><i class="fa fa-dashboard"></i>
						Início</a></li>
				<li><a href="fazer_pedido.jsp"><i class="fa fa-desktop"></i>
						Fazer Pedido</a></li>
				<li><a href="entregar_pedido.jsp"><i class="fa fa-file"></i>
						Entregar Pedido</a></li>
			</ul>

		</div>
		<!-- /.navbar-collapse --> </nav>

		<div id="page-wrapper">

			<div class="row">
				<div class="col-lg-12">
					<h1>Entregar Pedido</h1>
					<ol class="breadcrumb">
						<li><a href="inicio_gar.jsp"><i class="icon-dashboard"></i>
								Página Inicial</a></li>
						<li class="active"><i class="icon-file-alt"></i> Entregar
							Pedido</li>
					</ol>
				</div>
			</div>
			<!-- /.row -->

		</div>
		<!-- /#page-wrapper -->
		<div class="table-responsive">
			<table class="table table-hover table-striped tablesorter">
				<thead>
					<tr>
						<th class="header"># <i class="fa"></i></th>
						<th class="header">Prato <i class="fa"></i></th>
						<th class="header">Quantidade <i class="fa"></i></th>
						<th class="header">Opção <i class="fa"></i></th>
					</tr>
				</thead>
				<tbody>
					<%
						PedidoDAO pedidoDAO = new PedidoDAO();
						ArrayList<Pedido> pedidos = pedidoDAO.getTodosPedidosProntos();

						CardapioDAO cardapioDAO = new CardapioDAO();

						for (Pedido p : pedidos) {
							out.println("<tr>");
							out.println("<td>" + p.getId() + "</td>");

							String prato = cardapioDAO.getDadosCardapio(p.getPrato())
									.getPrato();
							out.println("<td>" + prato + "</td>");
							out.println("<td>" + p.getQuantidade() + "</td>");
							String input = "<td><a href=\"manter_pedido.jsp?page=entregar&type=Entregue&id="
									+ p.getId()
									+ "\">Entregar</a>";
							out.println(input);
							out.println("</tr>");

						}
					%>
				</tbody>
			</table>
		</div>
		<!-- /#wrapper -->
	</div>
	<!-- JavaScript -->
	<script src="js/jquery-1.10.2.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
