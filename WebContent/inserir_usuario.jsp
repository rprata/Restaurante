<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Página Inicial - Gerência</title>

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
			<a class="navbar-brand">Página Inicial - Gerência</a>
		</div>

		<ul class="nav navbar-nav navbar-right navbar-user">
			<li class="dropdown messages-dropdown"><a href="index.jsp"><i
					class="fa fa-power-off"></i> Sair</a>
		</ul>


		<!-- Collect the nav links, forms, and other content for toggling -->
		        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <ul class="nav navbar-nav side-nav">
            <li><a href="inicio_ger.jsp"><i class="fa fa-dashboard"></i>   Início</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-caret-square-o-down"></i>   Manter Usuário <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="inserir_usuario.jsp">Novo Usuário</a></li>
                <li><a href="atualizar_usuario.jsp">Atualizar Usuário</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-caret-square-o-down"></i>   Manter Cardápio <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="inserir_cardapio.jsp">Novo Prato</a></li>
                <li><a href="atualizar_cardapio.jsp">Atualizar Prato</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-caret-square-o-down"></i>   Manter Estoque <b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="inserir_estoque.jsp">Novo Ingrediente</a></li>
                <li><a href="atualizar_estoque.jsp">Atualizar Quantidade</a></li>
              </ul>
            </li>
            <li><a href="selecionar_data_relatorio_vendas.jsp"><i class="fa fa-table"></i>   Relatório de Vendas</a></li>
          </ul>
          
        </div><!-- /.navbar-collapse -->
		
		<!-- /.navbar-collapse --> </nav>

		<!-- /#page-wrapper -->
		<div id="page-wrapper">

			<div class="row">
				<div class="col-lg-12">
					<h1>Novo Usuário</h1>
					<ol class="breadcrumb">
						<li><a href="inicio_ger.jsp"><i class="icon-dashboard"></i>
								Página Inicial</a></li>
						<li class="active"><i class="icon-file-alt"></i> Manter
							Usuário</li>
						<li class="active"><i class="icon-file-alt"></i> Novo
							Usuário</li>
					</ol>
				</div>
			</div>
			<!-- /.row -->

		</div>


		<div class="col-lg-6">

			<form method="POST" action="manter_usuario_inserir.jsp">

				<div class="form-group">
					<label>Login</label> <input class="form-control"
						placeholder="Digite o login do novo usuário" name="login">
				</div>

				<div class="form-group">
					<label>Senha</label> <input class="form-control"
						placeholder="Digite a senha do novo usuário" type="password"
						name="senha">
				</div>

				<div class="form-group">
					<label>Nome</label> <input class="form-control"
						placeholder="Digite o nome completo do novo usuário" name="nome">
				</div>

				<div class="form-group">
					<label>Idade</label> <select class="form-control" name="idade">
						<%
							for (int i = 15; i <= 100; i++) {
								out.println("<option>" + i + "</option>");
							}
						%>

					</select>
				</div>

				<div class="form-group">
					<label>CPF</label> <input class="form-control"
						placeholder="Digite o CPF do novo usuário (apenas os números)"
						name="cpf" type="text">
				</div>

				<div class="form-group">
					<label>Cargo</label> <select class="form-control" name="cargo">
						<option>Garçom</option>
						<option>Cozinheiro</option>
						<option>Gerente</option>

					</select>
				</div>
				<button type="submit" class="btn btn-default">Inserir</button>
				<button type="reset" class="btn btn-default">Limpar</button>
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
