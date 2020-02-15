<?php

	$db_host = "localhost";
	$db_user = "root";
	$db_pass = "root";
	$db_database = "db_agenda";

	$contato_nome = $_GET["nome"];
	$contato_fone = $_GET["fone"];
	$contato_email = $_GET["email"];
	
	if($contato_nome == "" || $contato_fone == "" || $contato_email == ""){
		echo "Falha get parameters";
	}else{
		$db_connection = mysqli_connect($db_host,$db_user,$db_pass);
		mysqli_select_db($db_connection,$db_database);
		mysqli_set_charset($db_connection,'utf8');
		$db_sql = "INSERT INTO contato (nome,fone,email) VALUES ('$contato_nome','$contato_fone','$contato_email')";
		$db_result = mysqli_query($db_connection,$db_sql) or die("Erro");
		mysqli_close($db_connection);
		if($db_result == true){
			echo "Sucesso dados inseridos";
		}else{
			echo "Falha inserir dados";
		}
	}
	

?>