*----------------------------------------------------------------------*
***INCLUDE ZSTATE_REGION_STATUS_0100O01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE STATUS_0100 OUTPUT.
  DATA: LT_VALUES TYPE VRM_VALUES.
  DATA LWA_VALUES TYPE VRM_VALUE.
*  SET PF-STATUS 'xxxxxxxx'.
*  SET TITLEBAR 'xxx'.
  CLEAR: lwa_VALUES.
  IF ZTSTATE_REGION-STATE IS NOT INITIAL.
    REFRESH: LT_VALUES.
    LOOP AT LT_DATA INTO LWA_DATA.
      LWA_VALUES-KEY = LWA_DATA-REGION.
      LWA_VALUES-TEXT = LWA_DATA-REGION.
      APPEND LWA_VALUES TO LT_VALUES.
      CLEAR LWA_VALUES.
    ENDLOOP.
    CLEAR: ZTSTATE_REGION-REGION.

    CALL FUNCTION 'VRM_SET_VALUES'
      EXPORTING
        ID                    = 'ZTSTATE_REGION-REGION'
        VALUES                = LT_VALUES
     EXCEPTIONS
       ID_ILLEGAL_NAME       = 1
       OTHERS                = 2
              .
    IF SY-SUBRC <> 0.
* Implement suitable error handling here
    ENDIF.

  ENDIF.
ENDMODULE.
