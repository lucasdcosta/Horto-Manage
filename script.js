let enxertos = ["Tomate bs 045", "Tomate bs 113", "Tomate bs 114", "Tomate bs 115", "Tomate baby italiano", "Tomate ravena", "Tomate picolo","Sweet haven", "Tomate brutus", "Tomate td1", "Tomate da vinci", "Tomate santino", "Tomate cariri", "Tomate tempra"];
let legume1 = ["Tomate bs 045", "Tomate bs 113", "Tomate bs 114", "Tomate bs 115", "Tomate baby italiano", "Tomate ravena", "Tomate picolo","Sweet haven", "Tomate brutus", "Tomate td1", "Tomate da vinci", "Tomate santino", "Tomate cariri", "Tomate tempra"];
let legume2 = ["Tomate bs 045", "Tomate bs 113", "Tomate bs 114", "Tomate bs 115", "Tomate baby italiano", "Tomate ravena", "Tomate picolo","Sweet haven", "Tomate brutus", "Tomate td1", "Tomate da vinci", "Tomate santino", "Tomate cariri", "Tomate tempra"];

let cima = document.getElementById("cima");
let baixo = document.getElementById("baixo");

enxertos.forEach(function addEnxertos(item){
    let option = document.createElement("option");
    option.text = item;
    option.value = item;
    cima.appendChild(option);
});

cima.onchange = function (){
    baixo.innerHTML = "<option></option>";
    if (this.value == "Tomate bs 045", "Tomate bs 113", "Tomate bs 114", "Tomate bs 115", "Tomate baby italiano", "Tomate ravena", "Tomate picolo","Sweet haven", "Tomate brutus", "Tomate td1", "Tomate da vinci", "Tomate santino", "Tomate cariri", "Tomate tempra") {
        addToBaixo(legume1);
    }

}

function addToBaixo(arr) {
    arr.forEach(function (item){
        let option = document.createElement("option");
        option.text = item;
        option.value = item;
        baixo.appendChild(option);
    });
}

let species = ["Alface", "Tomate"];
let alface = ["Alface Vanda", "Alface Jade", "Alface Grazine","Alface Irene","Alface Lucy Brow", "Alface Brow", "Alface Scarlet", "Alface Regiane", "Alface Angelica"];
let tomate = ["Tomate bs 045", "Tomate bs 113", "Tomate bs 114", "Tomate bs 115", "Tomate baby italiano", "Tomate ravena", "Tomate picolo","Sweet haven", "Tomate brutus", "Tomate td1", "Tomate da vinci", "Tomate santino", "Tomate cariri", "Tomate tempra"];

let slct1 = document.getElementById("slct1");
let slct2 = document.getElementById("slct2");

species.forEach(function addSpecies(item){
    let option = document.createElement("option");
    option.text = item;
    option.value = item;
    slct1.appendChild(option);
});

slct1.onchange = function (){
    slct2.innerHTML = "<option></option>";
    if (this.value == "Alface") {
        addToSlct2(alface);
    }
    if (this.value == "Tomate") {
        addToSlct2(tomate);
    }
}

function addToSlct2(arr) {
    arr.forEach(function (item){
        let option = document.createElement("option");
        option.text = item;
        option.value = item;
        slct2.appendChild(option);
    });
}

//Cadastro Estoque

/*function handleSubmit(event) {
    event.preventDefault(); // Impede o recarregamento da página
  
    const nomeProduto = document.getElementById('product-name').value;
    const quantidade = document.getElementById('quantity').value;
  
    //COMUNICAÇÃO COM O BANCO AQUI
  
    alert(`Produto ${nomeProduto} com ${quantidade} unidades cadastrado!`);
}*/

// Selecione todos os selects com a classe "options" (ou outro seletor apropriado)
const selects = document.querySelectorAll('.options');

// Adicione o event listener a cada select
selects.forEach(select => {
    select.addEventListener('change', function(event) {
      mostrarFormulario(event) // passe o evento para a função
    });
});


//Função mostrarFormulario adaptada para receber o evento e usá-lo
function mostrarFormulario(event) {


    // Ocultar todos os formulários que começam com "card-"
    document.querySelectorAll('[id^="card-"]').forEach(el => el.style.display = 'none');

    // Mostrar o formulário correto
    var selectId = event.target.id;
    var tipoSelecionado = event.target.value; // Valor selecionado no select
    var idFormulario = "card-" + tipoSelecionado.toLowerCase(); //Ajustado para usar o valor em minúsculo do select

    var formulario = document.getElementById(idFormulario)

    if (formulario) {
        formulario.style.display = 'block';
    } else {
        console.error("Formulário não encontrado:", idFormulario);
    }


}

// Função JavaScript para cadastrar produtos via AJAX

// Função para cadastrar produtos via AJAX usando fetch
function cadastrarProduto(event) {
    event.preventDefault();

    const nomeProduto = document.getElementById('product-name').value;
    const quantidade = document.getElementById('quantity').value;
    let tipoProduto = document.getElementById('Tipo_Produto').value;

    tipoProduto = tipoProduto.normalize("NFD").replace(/[\u0300-\u036f]/g, "");


    const produto = {
        Nome_Produto: nomeProduto,
        Quantidade: quantidade,
        Tipo_Produto: tipoProduto
    };

    console.log("Enviando dados:", JSON.stringify(produto));

    fetch('cadastrar_produto.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(produto)
    })
    .then(response => {
        if (!response.ok) {
            // Houve um erro na requisição (código de status fora do intervalo 200-299)
            return response.json().then(errorData => {
                throw new Error(`Erro na requisição: ${response.status} - ${errorData.message || 'Erro desconhecido'}`);
            });
        }
        return response.json(); // Se a resposta for ok, converte para JSON
    })
    .then(data => {
        console.log(JSON.stringify(produto));
        console.log("Resposta do servidor:", data);
        if (data.success) {
            alert("Produto cadastrado com sucesso!");
            document.getElementById('modal-form').reset();
            hideModal(event);
        } else {
            alert(`Erro ao cadastrar o produto: ${data.message}`);
        }
    })
    .catch(error => {
        console.error("Erro:", error);
        alert(`Erro ao cadastrar o produto: ${error.message}`);
    });
}
document.getElementById('modal-form').addEventListener('submit', cadastrarProduto); // Só este listener


