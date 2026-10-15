PROCESS AFTER INPUT.
  CHAIN.
    FIELD: lv_ono MODULE ativate.
  ENDCHAIN.

*-----------------------------------------------------------------------------
  MODULE USER_COMMAND_0100.
    MODULE USER_COMMAND_0100 INPUT.
      IF SY-UCOMM = 'HEADER'.
        lv_screen = '0101'.
      ELSE.
        lv_screen = '0102'.
      ENDIF.
       SELECT ONO ODATE PM TA CURR
        FROM ZORDH_28
        INTO TABLE lt_data
        WHERE ono = lv_ono.
    
        IF  lt_data is NOT INITIAL.
          READ TABLE lt_data INTO lwa_data INDEX 1.
          IF  sy-subrc = 0.
            lv_odate = lwa_data-odate.
            lv_pm = lwa_data-PM.
            lv_ta = lwa_data-TA.
            lv_curr = lwa_data-curr.
          ENDIF.
            SELECT ONO OIN ODESC ICOST
              FROM ZORDI_29
              INTO TABLE lt_data1
              FOR ALL ENTRIES IN lt_data
              WHERE ono = lt_data-ono.
        ENDIF.


ENDMODULE.
*-----------------------------------------------------------------------------    

PROCESS ON VALUE-REQUEST.
    FIELD LV_ONO MODULE F4help.

    *----------------------------------------------------------------------*
MODULE F4HELP INPUT.
  TYPES: BEGIN OF lty_ono,
           ono TYPE ZDEONO_28,
         END OF lty_ono.

  DATA: lt_ono TYPE TABLE OF lty_ono,
        lwa_ono TYPE lty_ono.

  SELECT ono
    FROM ZORDH_28
    INTO TABLE lt_ono.

  CALL FUNCTION 'F4IF_INT_TABLE_VALUE_REQUEST'
    EXPORTING
*     DDIC_STRUCTURE         = ' '
      RETFIELD               = 'ONO'
*     PVALKEY                = ' '
     DYNPPROG               = sy-repid
     DYNPNR                 = sy-dynnr
     DYNPROFIELD            = 'LV_ONO'
*     STEPL                  = 0
*     WINDOW_TITLE           =
*     VALUE                  = ' '
     VALUE_ORG              = 'S'
*     MULTIPLE_CHOICE        = ' '
*     DISPLAY                = ' '
*     CALLBACK_PROGRAM       = ' '
*     CALLBACK_FORM          = ' '
*     CALLBACK_METHOD        =
*     MARK_TAB               =
*   IMPORTING
*     USER_RESET             =
    TABLES
      VALUE_TAB              = lt_ono
*     FIELD_TAB              =
*     RETURN_TAB             =
*     DYNPFLD_MAPPING        =
   EXCEPTIONS
     PARAMETER_ERROR        = 1
     NO_VALUES_FOUND        = 2
     OTHERS                 = 3
            .
  IF SY-SUBRC <> 0.
* Implement suitable error handling here
  ENDIF.


ENDMODULE.
