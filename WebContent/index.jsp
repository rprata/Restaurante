<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Meu Restaurante</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.css" media="screen">
<link rel="stylesheet" href="css/bootswatch.min.css">
<link rel="stylesheet" href="css/form.css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="../bower_components/bootstrap/assets/js/html5shiv.js"></script>
      <script src="../bower_components/bootstrap/assets/js/respond.min.js"></script>
    <![endif]-->
<script type="text/javascript">
	var _gaq = _gaq || [];
	_gaq.push([ '_setAccount', 'UA-23019901-1' ]);
	_gaq.push([ '_setDomainName', "bootswatch.com" ]);
	_gaq.push([ '_setAllowLinker', true ]);
	_gaq.push([ '_trackPageview' ]);

	(function() {
		var ga = document.createElement('script');
		ga.type = 'text/javascript';
		ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl'
				: 'http://www')
				+ '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(ga, s);
	})();
</script>
</head>
<body>
	<br>
	<br>
	<img class="displayed" src="img/logo.jpg" alt="Restaurante"
		height="110" width="325">


	<div class="col-md-5 col-md-offset-4">
		<form class="form-signin mg-btm" method="POST" action="checar_login.jsp">
			<h2 class="heading-desc">Acesso ao Painel de Controle</h2>
			<div class="main">
				<input 
				type="text" class="form-control" name="login" placeholder="Digite seu login" autofocus > 
				<input
					type="password" class="form-control" name="senha" placeholder="Digite sua senha" >
			</div>
			<div class="login-footer">
				<div class="row">
					<div class="col-xs-6 col-md-6">
						<div class="left-section">
							<!-- <h6 style="color:red">teste 123</h6> -->
						</div>
					</div>

					<div class="col-xs-6 col-md-6 pull-right">
						<button type="submit" class="btn btn-large btn-primary pull-right">Entrar</button>
					</div>
				</div>

			</div>
		</form>
	</div>

</body>
</html>