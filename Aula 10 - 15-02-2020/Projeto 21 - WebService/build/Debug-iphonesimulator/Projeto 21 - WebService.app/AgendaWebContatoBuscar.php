<?php

	$db_host = "localhost";
	$db_user = "root";
	$db_pass = "root";
	$db_database = "db_agenda";

	$contato_id = $_GET["id"];
	
	if($contato_id == ""){
		echo "Falha get parameters";
	}else{
		$db_connection = mysqli_connect($db_host,$db_user,$db_pass);
		mysqli_select_db($db_connection,$db_database);
		mysqli_set_charset($db_connection,'utf8');
		$db_sql = "SELECT * FROM contato WHERE id='$contato_id'";
		$db_result = mysqli_query($db_connection,$db_sql) or die("Erro");
		mysqli_close($db_connection);
		$contatos = array();
		while ($contato = mysqli_fetch_assoc($db_result)) {
    		$contatos[] = $contato;
		}
		echo json_encode($contatos);
		
	}

?>