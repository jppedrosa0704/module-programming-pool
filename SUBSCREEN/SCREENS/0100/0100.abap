PROCESS BEFORE OUTPUT.
CALL SUBSCREEN SUB INCLUDING sy-repid '0200'.
* MODULE STATUS_0100.
*
PROCESS AFTER INPUT.
 MODULE EXIT AT EXIT-COMMAND.
 MODULE USER_COMMAND_0100.


MODULE USER_COMMAND_0100 INPUT.
  SELECT  ID PRODUTO QUANTIDADE VALOR STATUS
    FROM ZPRODUTO
    INTO TABLE lt_data
    WHERE ID = zproduto-ID.

   READ TABLE lt_data INTO ls_data INDEX 1.

   IF sy-subrc = 0.
     zproduto-PRODUTO = ls_data-PRODUTO.
     zproduto-QUANTIDADE = ls_data-QUANTIDADE.
     zproduto-VALOR = ls_data-VALOR.
     zproduto-STATUS = ls_data-STATUS.
   ENDIF.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  EXIT  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE EXIT INPUT.
  LEAVE TO TRANSACTION 'ZTC5_28'.
ENDMODULE.
