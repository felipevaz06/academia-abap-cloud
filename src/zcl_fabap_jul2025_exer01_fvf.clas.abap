CLASS zcl_fabap_jul2025_exer01_fvf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS CONSTRUCTOR
          IMPORTING
            i_codProduto TYPE string
            i_nomeProduto TYPE string
            i_preco TYPE decfloat16.


     METHODS adicionar_estoque
            IMPORTING i_quantidade TYPE i
            EXPORTING e_quantidade TYPE i.

     METHODS remover_estoque
            IMPORTING i_quantidade TYPE i
            EXPORTING e_quantidade TYPE i
            RETURNING VALUE(rv_sucesso) TYPE abap_bool
            EXCEPTIONS ex_quantidade_error    .

     METHODS calcular_valor_total
        EXPORTING e_valor_total TYPE decfloat16 .


    METHODS get_codigo
        RETURNING VALUE(r_codigo) TYPE string.

    METHODS get_nome
        RETURNING VALUE(r_nome) TYPE string.

    METHODS get_preco
        RETURNING VALUE(r_preco) TYPE decfloat16.

    METHODS get_estoque
        RETURNING VALUE(r_estoque) TYPE i.



  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA v_codProduto TYPE string.
    DATA v_nomeProduto TYPE string.
    DATA v_preco TYPE decfloat16.
    DATA v_quantEstoque TYPE i.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER01_FVF IMPLEMENTATION.


METHOD adicionar_estoque.
    v_quantEstoque += i_quantidade.

    IF e_quantidade IS SUPPLIED .
        e_quantidade = v_quantEstoque.
    ENDIF.
ENDMETHOD.


METHOD calcular_valor_total.
    e_valor_total = v_quantEstoque * v_preco.
ENDMETHOD.


METHOD CONSTRUCTOR.
    v_codProduto = i_codProduto.
    v_nomeProduto = i_nomeProduto.
    v_preco = i_preco.


ENDMETHOD.


METHOD get_codigo.
    r_codigo = v_codProduto.
ENDMETHOD.


METHOD get_estoque.
    r_estoque = v_quantEstoque.
ENDMETHOD.


METHOD get_nome.
    r_nome = v_nomeProduto.
ENDMETHOD.


METHOD get_preco.
    r_preco = v_preco.
ENDMETHOD.


METHOD remover_estoque.
    IF i_quantidade <= v_quantEstoque.
        v_quantEstoque -= i_quantidade.

        IF e_quantidade IS SUPPLIED.
            e_quantidade = v_quantEstoque.
        ENDIF.
     ELSE.
     "MENSAGEM DE ERRO
        MESSAGE s001(ZFABAP_JUL2025_FVF)
               DISPLAY LIKE 'E'
               RAISING ex_quantidade_error.
    ENDIF.
ENDMETHOD.
ENDCLASS.
