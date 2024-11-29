<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hortomanage";

// Cria uma conexão com o banco de dados
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica a conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Obtém os dados do formulário
$Nome = $_POST['Nome'];
$Email = $_POST['Email'];
$rua = $_POST['rua'];
$bairro = $_POST['bairro'];
$numero_casa = $_POST['numero_casa'];
$contato = $_POST['contato'];

// Prepara a declaração SQL para inserção
$sql = "INSERT INTO pessoa (Nome, Email, contato) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sss", $Nome, $Email, $rua, $bairro, $numero_casa, $contato);

// Executa a declaração e verifica se foi bem-sucedida
if ($stmt->execute()) {
    echo "Registro inserido com sucesso!";
} else {
    echo "Erro ao inserir registro: " . $stmt->error;
}

$sql = "INSERT INTO endereco (Cidade, rua, bairro, numero_casa, contato) VALUES (?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sssss", $Nome, $Email, $rua, $bairro, $numero_casa, $contato);

// Executa a declaração e verifica se foi bem-sucedida
if ($stmt->execute()) {
    echo "Registro inserido com sucesso!";
} else {
    echo "Erro ao inserir registro: " . $stmt->error;
}

// Fecha a conexão
$stmt->close();
$conn->close();
?>
