📘 README — Programa ZMP_MULTIPLE_SUBSCREENS
📌 Descrição Geral
O programa ZMP_MULTIPLE_SUBSCREENS implementa uma interface ABAP baseada em subscreens e um Table Control para manipulação de dados de ordens e itens.
Ele permite visualizar, inserir, excluir, marcar e desmarcar linhas de uma tabela interna exibida na tela.

O código utiliza a estrutura padrão gerada pelo Screen Painter Wizard para controle de Table Control, incluindo módulos PBO/PAI e rotinas de manipulação de linhas.

🧱 Estrutura do Programa
O programa é dividido em:

Declaração de tipos e tabelas internas

Controle do Table Control (ZTC_JPMP)

Módulos PBO/PAI gerados pelo Wizard

Rotinas de manipulação de linhas (INSERT, DELETE, MARK, SCROLL)

Includes para lógica de telas e F4

zmp_multiple_subscreens_usei01

zmp_multiple_subscreens_f4hi01

📂 Tipos e Tabelas Internas
Dados da Ordem
abap
TYPES: BEGIN OF lty_data,
        ono   TYPE zdeono_28,
        odate TYPE zdeodate_28,
        pm    TYPE zdepm_28,
        ta    TYPE zdeta_28,
        curr  TYPE zedcur_28,
      END OF lty_data.
Dados dos Itens
abap
TYPES: BEGIN OF lty_data1,
        ono   TYPE zdeono_28,
        oin   TYPE zdeoitmno_28,
        odesc TYPE zdeodesc_28,
        icost TYPE zdeoicost28,
      END OF lty_data1.
As tabelas internas lt_data e lt_data1 armazenam os dados exibidos nos subscreens.

🖥️ Table Control — ZTC_JPMP
O Table Control é definido assim:

abap
CONTROLS: ZTC_JPMP TYPE TABLEVIEW USING SCREEN 0102.
E possui controle de linhas:

abap
DATA: G_ZTC_JPMP_LINES LIKE sy-loopc.
🔄 Módulos PBO/PAI do Table Control
Atualização do número de linhas
abap
MODULE ZTC_JPMP_CHANGE_TC_ATTR OUTPUT.
  DESCRIBE TABLE lt_data1 LINES ZTC_JPMP-lines.
ENDMODULE.
Captura de linhas visíveis
abap
MODULE ZTC_JPMP_GET_LINES OUTPUT.
  G_ZTC_JPMP_LINES = sy-loopc.
ENDMODULE.
Processamento de comandos do usuário
abap
MODULE ZTC_JPMP_USER_COMMAND INPUT.
  ok_code = sy-ucomm.
  PERFORM user_ok_tc USING 'ZTC_JPMP' 'LT_DATA1' ' ' CHANGING ok_code.
  sy-ucomm = ok_code.
ENDMODULE.
⚙️ Rotinas de Manipulação do Table Control
O programa implementa todas as operações clássicas:

➕ Inserir linha
FORM fcode_insert_row  
Insere uma linha inicial na tabela interna e ajusta o cursor.

➖ Excluir linha
FORM fcode_delete_row  
Remove linhas marcadas com o campo FLAG.

✔️ Marcar todas as linhas
FORM fcode_tc_mark_lines

❌ Desmarcar todas as linhas
FORM fcode_tc_demark_lines

📜 Scroll vertical
FORM compute_scrolling_in_tc  
Usa a função padrão SAP:

Código
SCROLLING_IN_TABLE
🧩 Includes
O programa utiliza dois includes para separar lógica:

zmp_multiple_subscreens_usei01
Contém módulos PBO/PAI das telas e subscreens.

zmp_multiple_subscreens_f4hi01
Contém rotinas de ajuda de pesquisa (F4).

🧭 Fluxo de Execução
Usuário abre a tela principal.

Subscreen carrega dados da ordem.

Table Control exibe itens da ordem.

Usuário pode:

Inserir linhas

Excluir linhas

Marcar/desmarcar

Navegar com scroll

Includes tratam eventos adicionais e F4.

🛠️ Pontos Técnicos Importantes
Uso de FIELD-SYMBOLS para manipular tabelas dinamicamente.

Controle de cursor com GET CURSOR.

Ajuste automático de TOP_LINE para scroll.

Estrutura padrão do Wizard para Table Control.

Separação modular via includes.

📌 Resumo
Este programa demonstra uma implementação completa de subscreens + table control, com manipulação dinâmica de tabelas internas e navegação estruturada.
É um exemplo sólido para quem está aprendendo SAP GUI, Table Controls e lógica PBO/PAI.
