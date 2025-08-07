CLASS zcl_fabap_jul2025_exer02_fvf DEFINITION ABSTRACT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS CONSTRUCTOR
    IMPORTING
        i_nomeFunc TYPE string
        i_idFunc TYPE string
        i_salarioBase TYPE decfloat16.

  METHODS calcular_salario
   ABSTRACT RETURNING VALUE(r_totalSalario) TYPE decfloat16

  .

  METHODS exibir_dados
    RETURNING VALUE(r_dados) TYPE string

  .

  PROTECTED SECTION.
    DATA v_nomeFunc TYPE string.
    DATA v_idFunc TYPE string.
    DATA v_salarioBase TYPE decfloat16.

  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_FVF IMPLEMENTATION.


METHOD CONSTRUCTOR.
    v_nomeFunc = i_nomeFunc.
    v_idFunc = i_idFunc .
    v_salarioBase = i_salarioBase .
ENDMETHOD.


METHOD exibir_dados.
    r_dados = |ID: { v_idFunc } - Nome: { v_nomeFunc } |.
ENDMETHOD.
ENDCLASS.
