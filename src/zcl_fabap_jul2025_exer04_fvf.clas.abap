CLASS zcl_fabap_jul2025_exer04_fvf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER04_FVF IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
    SELECT * FROM ZI_FABAP_EXER01_FVF
        INTO TABLE @DATA(t_tabela01) .

    SELECT * FROM ZI_FABAP_EXER02_FVF
        INTO TABLE @DATA(t_tabela02) .

    SELECT * FROM ZI_FABAP_EXER03_FVF
        INTO TABLE @DATA(t_tabela03) .

    out->write( t_tabela01 ).
    out->write( |_________________________________________________________________________________| ).
    out->write( t_tabela02 ).
    out->write( |_________________________________________________________________________________| ).
    out->write( t_tabela03 ).
ENDMETHOD.
ENDCLASS.
