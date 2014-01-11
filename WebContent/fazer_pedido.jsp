<%@page import="br.uerj.restaurante.modelos.Cardapio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.uerj.restaurante.dao.CardapioDAO"%>
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
			<a class="navbar-brand">Página Inicial - Cozinha</a>
		</div>

		<ul class="nav navbar-nav navbar-right navbar-user">
			<li class="dropdown messages-dropdown"><a href="index.jsp"><i
					class="fa fa-power-off"></i> Sair</a>
		</ul>

		<!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav side-nav">
            <li><a href="inicio_gar.jsp"><i class="fa fa-dashboard"></i>   Início</a></li>
            <li><a href="fazer_pedido.jsp"><i class="fa fa-desktop"></i>   Fazer Pedido</a></li>
            <li><a href="entregar_pedido.jsp"><i class="fa fa-file"></i>   Entregar Pedido</a></li>
          </ul>

		</div>
		<!-- /.navbar-collapse --> </nav>

		<div id="page-wrapper">

			<div class="row">
				<div class="col-lg-12">
					<h1>Fazer Pedido</h1>
					<ol class="breadcrumb">
						<li><a href="inicio_gar.jsp"><i class="icon-dashboard"></i>
								Página Inicial</a></li>
						<li class="active"><i class="icon-file-alt"></i> Fazer
							Pedido</li>
					</ol>
				</div>
			</div>
			<!-- /.row -->

		</div>
		<!-- /#page-wrapper -->
		
		<div class="col-lg-6">

            <form method="POST" action="realizar_pedido.jsp">

			  <div class="form-group">
                <label>Prato</label>
                <select class="form-control" name="prato">
                  <%
                  	CardapioDAO cardapioDAO = new CardapioDAO();
					ArrayList<Cardapio> cardapios = cardapioDAO.getTodosElementos();
					
					for (Cardapio c : cardapios) {
						out.println("<option>"+ c.getPrato() +"</option>");
					}
                  
                  %>
                </select>
              </div>
				
              <div class="form-group">
                <label>Quantidade</label>
                <select class="form-control" name="quantidade">
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
                  <option>4</option>
                  <option>5</option>
                  <option>6</option>
                  <option>7</option>
                  <option>8</option>
                  <option>9</option>
                  <option>10</option>
                </select>
              </div>

              <button type="submit" class="btn btn-default">Realizar Pedido</button>
              </br> </br> </br>            
            </form>

          </div>
		
		
		</div>
		<!-- /#wrapper -->



		<!-- JavaScript -->
		<script src="js/jquery-1.10.2.js"></script>
		<script src="js/bootstrap.js"></script>
</body>
</html>
