*----------------------------------------------------------------------*
***INCLUDE ZPRG3_MP_28_USER_COMMAND_01I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE USER_COMMAND_0100 INPUT.
  SELECT ID PRODUTO QUANTIDADE VALOR STATUS
  FROM zproduto
  INTO TABLE lt_data
  WHERE id = zproduto-id.

  READ TABLE lt_data INTO ls_data INDEX 1.
  IF sy-subrc = 0.
    zproduto-PRODUTO = ls_data-PRODUTO.
    zproduto-QUANTIDADE = ls_data-QUANTIDADE.
    zproduto-VALOR = ls_data-VALOR.
    zproduto-STATUS = ls_data-STATUS.
  ENDIF.

  CALL SCREEN 0200 STARTING AT 10 20 " TOPE LEFT CORNER CORDINATES
                   ENDING AT 50 60. " bottom right corner coodinates
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE USER_COMMAND_0200 INPUT.
LEAVE TO SCREEN 0.
ENDMODULE.
