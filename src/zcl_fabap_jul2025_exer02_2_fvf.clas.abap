CLASS zcl_fabap_jul2025_exer02_2_fvf DEFINITION
  PUBLIC
  INHERITING FROM zcl_fabap_jul2025_exer02_fvf
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: calcular_salario REDEFINITION.
    METHODS CONSTRUCTOR
        IMPORTING i_bonus TYPE decfloat16
                  i_nomeFunc TYPE string
                  i_idFunc TYPE string
                  i_salarioBase TYPE decfloat16
        .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA v_bonus TYPE decfloat16.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_2_FVF IMPLEMENTATION.


METHOD calcular_salario.
    r_totalSalario = v_salarioBase + v_bonus .
ENDMETHOD.


METHOD CONSTRUCTOR.
    super->constructor( i_nomeFunc = i_nomeFunc
                        i_idFunc = i_idFunc
                        i_salarioBase = i_salarioBase ).
    v_bonus = i_bonus.
ENDMETHOD.
ENDCLASS.
