*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_connection DEFINITION CREATE PRIVATE.
    PUBLIC SECTION.

    METHODS CONSTRUCTOR
          IMPORTING
            i_codProduto TYPE string
            i_nomeProduto TYPE string
            i_preco TYPE decfloat16.


    CLASS-METHODS get_instance IMPORTING i_codProduto TYPE string
                                         i_nomeProduto TYPE string
                                         i_preco TYPE decfloat16
                               RETURNING VALUE(ro_connection) TYPE REF TO lcl_Connection.

    PROTECTED SECTION.

    PRIVATE SECTION .
    DATA v_codProduto TYPE string.
    DATA v_nomeProduto TYPE string.
    DATA v_preco TYPE decfloat16.
    DATA v_quantEstoque TYPE i.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

METHOD CONSTRUCTOR.
    me->v_codproduto = i_codProduto.
    me->v_nomeProduto = i_nomeProduto.
    me->v_preco = i_preco.


ENDMETHOD.


METHOD get_instance.
    ro_connection = NEW #( i_codProduto        = i_codProduto
                           i_nomeProduto = i_nomeProduto
                           i_preco      = i_preco
                          ).
ENDMETHOD.


ENDCLASS.
