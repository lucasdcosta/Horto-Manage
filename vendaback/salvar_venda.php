<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hortomanage";


$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}


$nome_cliente = $_POST['nome_cliente'];
$produto = $_POST['produto'];
$quantidade = $_POST['quantidade'];
$valor = $_POST['valor'];


$sql = "INSERT INTO vendas (nome_cliente, produto, quantidade, valor) VALUES (?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ssii", $nome_cliente, $produto, $quantidade, $valor);


if ($stmt->execute()) {
    echo "Registro inserido com sucesso!";
} else {
    echo "Erro ao inserir registro: " . $stmt->error;
}


$stmt->close();
$conn->close();
?>
