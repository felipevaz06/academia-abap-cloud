CLASS zcl_fabap_jul2025_exer01_e_fvf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER01_E_FVF IMPLEMENTATION.


METHOD if_oo_adt_classrun~main.

*
DATA v_valor_total TYPE decfloat16.

*Instanciando um produto
    DATA(o_produto2) = NEW zcl_fabap_jul2025_exer01_fvf(
                       i_codProduto = '0001'
                       i_nomeProduto = 'Computador'
                       i_preco = 4000
                       ).

*EXIBINDO PRODUTO
    out->write( |Nome do produto:  { o_produto2->get_nome( ) } | ).
    out->write( 'Codigo do produto: ' &&  o_produto2->get_codigo( ) ).
    out->write( 'Preço do produto: ' &&  o_produto2->get_preco( ) ).
    out->write( 'Quantidade do produto: ' &&  o_produto2->get_estoque( ) ).
    out->write( '----------------------------' ).

*ADICIONANDO 2 NO ESTOQUE
    CALL METHOD o_produto2->adicionar_estoque
        EXPORTING
            i_quantidade = 2
            .

    out->write( 'Nº Final no estoque de: '  && o_produto2->get_nome( ) ).
    out->write( o_produto2->get_estoque( ) ).

*CALCULANDO VALOR TOTAL PÓS ACRÉSCIMO
    CALL METHOD o_produto2->calcular_valor_total
        IMPORTING e_valor_total = v_valor_total.
     .

    out->write( 'Valor total estoque de: '  && o_produto2->get_nome( ) ).
    out->write( v_valor_total ).

*REMOVENDO UM ITEM

    out->write( 'Removendo um item...' ).
    CALL METHOD o_produto2->remover_estoque
        EXPORTING i_quantidade = 1.
     .

    out->write( 'Nº Final no estoque de: '  && o_produto2->get_nome( ) ).
    out->write( o_produto2->get_estoque( ) ).

*REMOVENDO 4 ITENS
    out->write( 'Tentando remover 4 itens...' ).
    IF o_produto2->remover_estoque( 4 ) = abap_true.
            out->write( 'Removido' ).
        ELSE.
            out->write( 'Estoque insuficiente!' ).
        ENDIF.


*CALCULANDO VALOR TOTAL PÓS DECRÉSCIMO
    CALL METHOD o_produto2->calcular_valor_total
        IMPORTING e_valor_total = v_valor_total.
     .

    out->write( 'Valor total final no estoque de: '  && o_produto2->get_nome( ) ).
    out->write( v_valor_total ).


ENDMETHOD.
ENDCLASS.
