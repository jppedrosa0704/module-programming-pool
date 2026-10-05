*&--------------------------------------------
*& ModulPool ZPRG2_MP_28
*&--------------------------------------------

PROGRAM ZPRG2_MP_28.

TABLES: zproduto.

TYPES: BEGIN OF lty_data,
        ID          TYPE  ZINT,
        PRODUTO	    TYPE ZEPRODUTO,
        QUANTIDADE  TYPE  ZEQUANTIDADE,
        VALOR       TYPE ZEVALOR,
        STATUS      TYPE ZCHAR_ABC,
       END OF lty_data.

DATA: lt_data TYPE TABLE OF lty_data,
      ls_data TYPE lty_data.

INCLUDE zprg2_mp_28_user_command_01i01.
