CLASS zcl_fabap_jul2025_exer05_e_fvf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER05_E_FVF IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    zcl_fabap_jul2025_exer05_fvf=>get_data( IMPORTING et_data = DATA(lt_data) ).

    out->write( lt_data ).
  ENDMETHOD.
ENDCLASS.
