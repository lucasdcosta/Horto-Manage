<?php

// Dados de conexão
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hortomanage";

$conn = new mysqli($servername, $username, $password, $dbname);

header('Content-Type: application/json');

$conn->begin_transaction(); // Inicia a transação

try {
    $input = json_decode(file_get_contents('php://input'), true);
    if (!is_array($input) || !isset($input['Nome_Produto'], $input['Quantidade'], $input['Tipo_Produto'])) {
        throw new Exception("Dados inválidos: " . json_encode($input));
    }

    if (is_array($input) && isset($input['Nome_Produto'], $input['Quantidade'], $input['Tipo_Produto'])) {
        $Nome_Produto = $conn->real_escape_string($input['Nome_Produto']);
        $Quantidade = (int)$input['Quantidade'];
        $descricao_tipo_produto = $conn->real_escape_string($input['Tipo_Produto']);

        // Verifica se o tipo de produto já existe
        $stmt = $conn->prepare("SELECT Id_Tipo_Produto FROM tipo_produto WHERE Descricao_Tipo_Produto = ?");
        $stmt->bind_param("s", $descricao_Tipo_Produto);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows == 0) {
            // Tipo de produto não existe, insere um novo
            $stmt = $conn->prepare("INSERT INTO tipo_produto (Descricao_Tipo_Produto) VALUES (?)");
            $stmt->bind_param("i", $descricao_Tipo_Produto);
            $stmt->execute();
            $id_tipo_produto = $conn->insert_id; // Obtém o ID gerado

            // Insere o produto
            $stmt = $conn->prepare("INSERT INTO produto (Nome_Produto, Quantidade, Id_Tipo_Produto) VALUES (?, ?, ?)");
            $stmt->bind_param("sii", $Nome_Produto, $Quantidade, $id_tipo_produto);
            $stmt->execute();

            if ($stmt->affected_rows > 0) {
                $conn->commit(); // Confirma a transação
                echo json_encode(['success' => true, 'message' => 'Produto cadastrado com sucesso!']);
            } else {
                throw new Exception("Erro ao inserir o produto.");
            }
        } else {
            // Tipo de produto já existe, usa o ID existente
            $row = $result->fetch_assoc();
            $id_tipo_produto = $row['Id_Tipo_Produto'];

            // Insere o produto
            $stmt = $conn->prepare("INSERT INTO tipo_produto (Descricao_Tipo_Produto) VALUES (?)");
            $stmt->bind_param("s", $descricao_tipo_produto);
            $stmt->execute();

            $stmt = $conn->prepare("INSERT INTO produto (Nome_Produto, Quantidade, Id_Tipo_Produto) VALUES (?, ?, ?)");
            $stmt->bind_param("sii", $Nome_Produto, $Quantidade, $id_tipo_produto);
            $stmt->execute();
        }
        $stmt->close();
    } else {
        throw new Exception("Dados inválidos ou incompletos.");
    }
} catch (Exception $e) {
    $conn->rollback(); // Reverte a transação em caso de erro
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}

$conn->close();
?>