<?php

	$db_host = "localhost";
	$db_user = "root";
	$db_pass = "root";
	$db_database = "db_agenda";

	$contato_id = $_GET["id"];
	$contato_nome = $_GET["nome"];
	$contato_fone = $_GET["fone"];
	$contato_email = $_GET["email"];
	
	if($contato_nome == "" || $contato_fone == "" || $contato_email == "" || $contato_id == ""){
		echo "Falha get parameters";
	}else{
		$db_connection = mysqli_connect($db_host,$db_user,$db_pass);
		mysqli_select_db($db_connection,$db_database);
		mysqli_set_charset($db_connection,'utf8');
		$db_sql = "UPDATE contato SET nome='$contato_nome' , fone='$contato_fone' ,email='$contato_email' WHERE id='$contato_id'";
		$db_result = mysqli_query($db_connection,$db_sql) or die("Erro");
		mysqli_close($db_connection);
		if($db_result == true){
			echo "Sucesso dados atualizados";
		}else{
			echo "Falha atualizar dados";
		}
	}

?>