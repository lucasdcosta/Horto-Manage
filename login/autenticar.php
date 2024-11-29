<?php
session_start();

// Conexão com o banco de dados
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hortomanage";

$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica a conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Obtém os dados do formulário
$Usuario = $_POST['Usuario'];
$Senha = $_POST['Senha'];

// Prepara e executa a declaração SQL para verificar o usuário
$sql = "SELECT * FROM Usuario WHERE Usuario = ? AND Senha = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $Usuario, $Senha);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // Usuário autenticado com sucesso
    $_SESSION['Usuario'] = $Usuario;
    header("Location: home.html");
    exit();
} else {
    // Falha na autenticação
    echo "Usuário ou senha incorretos!";
}

$stmt->close();
$conn->close();
?>
