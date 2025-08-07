CLASS zcl_fabap_jul2025_exer02_3_fvf DEFINITION
  PUBLIC
  INHERITING FROM zcl_fabap_jul2025_exer02_fvf

  CREATE PUBLIC .

  PUBLIC SECTION.
   METHODS: calcular_salario REDEFINITION.
   METHODS CONSTRUCTOR
        IMPORTING i_horas TYPE i
                  i_nomeFunc TYPE string
                  i_idFunc TYPE string
                  i_salarioBase TYPE decfloat16
        .
  PROTECTED SECTION.
  PRIVATE SECTION.
   DATA v_horas TYPE i.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_3_FVF IMPLEMENTATION.


METHOD calcular_salario.
    r_totalSalario = v_salarioBase * v_horas .
ENDMETHOD.


METHOD CONSTRUCTOR.
    super->constructor( i_nomeFunc = i_nomeFunc
                        i_idFunc = i_idFunc
                        i_salarioBase = i_salarioBase ).
    v_horas = i_horas.
ENDMETHOD.
ENDCLASS.
