CLASS zcl_fabap_jul2025_exer02_e_fvf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_E_FVF IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.
    DATA: t_funcionarios TYPE TABLE OF REF TO zcl_fabap_jul2025_exer02_fvf.
    DATA v_salarioTotal TYPE decfloat16.

    APPEND NEW zcl_fabap_jul2025_exer02_2_fvf( i_nomeFunc = 'Felipe'
                                               i_idFunc = '0001'
                                               i_salarioBase = 2000
                                               i_bonus = 250
     ) TO t_funcionarios.


    APPEND NEW zcl_fabap_jul2025_exer02_3_fvf( i_nomeFunc = 'Gustavo'
                                               i_idFunc = '0002'
                                               i_salarioBase = 50
                                               i_horas = 40 ) TO t_funcionarios.

    LOOP AT t_funcionarios INTO DATA(o_funcionario).

      out->write( o_funcionario->exibir_dados( ) ).
      v_salarioTotal = o_funcionario->calcular_salario( ).
      out->write( |Salario Total: { v_salarioTotal } | ).

    ENDLOOP.
ENDMETHOD.
ENDCLASS.
