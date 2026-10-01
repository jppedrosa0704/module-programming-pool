📑 Funcionalidades Principais
🔹 1. Navegação por Abas (Tabstrip)
O programa utiliza o controle ZTAB_ORDER, permitindo alternar entre duas abas:

TAB1 → Subscreen 0101

TAB2 → Subscreen 0102

A lógica de seleção da aba ativa é tratada pelos módulos:

ZTAB_ORDER_ACTIVE_TAB_SET

ZTAB_ORDER_ACTIVE_TAB_GET

🔹 2. Manipulação de Table Control
Na aba 0102, o programa utiliza o Table Control ZTC_ORDER, permitindo:

Inserir linhas

Excluir linhas marcadas

Marcar todas as linhas

Desmarcar todas as linhas

Navegar entre páginas (scrolling)

Essas ações são tratadas por formulários dedicados, como:

FCODE_INSERT_ROW

FCODE_DELETE_ROW

FCODE_TC_MARK_LINES

FCODE_TC_DEMARK_LINES

COMPUTE_SCROLLING_IN_TC

🧱 Estrutura de Dados
O programa define duas estruturas internas:

lty_data
Usada para a primeira aba (produtos):

Campo	Tipo	Descrição
ID	ZINT	Identificador
PRODUTO	ZEPRODUTO	Nome do produto
QUANTIDADE	ZEQUANTIDADE	Quantidade
VALOR	ZEVALOR	Valor
STATUS	ZCHAR_ABC	Status


lty_data1
Usada no Table Control:

Campo	Tipo	Descrição
ID	ZINT	Identificador
OIN	ZEPRODUTO	Código do item
ODESC	ZEQUANTIDADE	Descrição
ICOST	ZEVALOR	Custo


⚙️ Fluxo de Execução
O usuário navega entre abas usando o Tabstrip.

Na aba 0102, o Table Control exibe e manipula os dados da tabela interna LT_DATA1.

Comandos do usuário (INSR, DELE, MARK, etc.) são capturados via SY-UCOMM.

O formulário USER_OK_TC identifica o comando e chama a rotina correspondente.

O Table Control é atualizado dinamicamente conforme as ações.

🧩 Pontos Técnicos Importantes
Uso de FIELD-SYMBOLS para manipulação dinâmica de tabelas.

Construção de nomes de variáveis em tempo de execução (CONCATENATE).

Controle de cursor e linha ativa (GET CURSOR).

Atualização de linhas visíveis no Table Control (DESCRIBE TABLE).

Função padrão SAP: SCROLLING_IN_TABLE.

📂 Estrutura do Repositório
Código
/src
 └── ZPRG4_MP_28.abap
/README.md
🚀 Objetivo do Projeto
Este programa serve como:

Material de estudo para desenvolvedores ABAP iniciantes e intermediários

Exemplo prático de manipulação de Table Controls

Referência para criação de interfaces clássicas SAP GUI

Base para projetos que exigem edição de listas em tela
