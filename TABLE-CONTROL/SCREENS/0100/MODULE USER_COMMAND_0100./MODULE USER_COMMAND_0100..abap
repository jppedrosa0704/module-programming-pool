*----------------------------------------------------------------------*
***INCLUDE ZPRG1_MP_28_USER_COMMAND_01I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE USER_COMMAND_0100 INPUT.
  IF sy-UCOMM = 'DISPLAY'.
    WRITE 'ok'.
  ENDIF.
  SELECT ID PRODUTO QUANTIDADE VALOR STATUS
    FROM ZPRODUTO
    INTO TABLE lt_data
    WHERE id = zproduto-id.


  IF lt_data IS NOT INITIAL.
    SELECT ID OIN ODESC ICOST
      FROM ZORDI_28
      INTO TABLE lt_data1
      FOR ALL ENTRIES IN lt_data
      WHERE ID = lt_data-id.
  ENDIF.

    READ TABLE lt_data INTO ls_data INDEX 1.
    IF sy-subrc = 0.
      zproduto-produto = ls_data-produto.
      zproduto-quantidade = ls_data-quantidade.
      zproduto-valor = ls_data-valor.
      zproduto-status = ls_data-status.
    ENDIF.

  IF sy-ucomM = 'HEADER'.
    CALL SCREEN '0200'.
  ENDIF.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE USER_COMMAND_0200 INPUT.
  CALL SCREEN '0100'.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  EXIT  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE EXIT INPUT.
  LEAVE TO TRANSACTION 'ZTC5_28'.
ENDMODULE.
