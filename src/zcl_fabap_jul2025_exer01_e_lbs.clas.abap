CLASS zcl_fabap_jul2025_exer01_e_lbs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER01_E_LBS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
* Tabelas

* Estruturas

* Variáveis
    DATA o_produto TYPE REF TO zcl_fabap_jul2025_exer01_lbs.

    o_produto = NEW #( i_codigo = '001'
                      i_nome = 'Produto1'
                      i_preco = 10 ).

    out->write( 'Código do Produto:' ).
    out->write( o_produto->get_codigo(  ) ).

    out->write( 'Nome do Produto :' ).
    out->write( o_produto->get_nome(  ) ).

    out->write( 'Preço do Produto:' ).
    out->write( o_produto->get_preco(  ) ).

    out->write( 'Quantidade de Produto:' ).
    out->write( o_produto->get_qtd(  ) ).


    out->write( 'Nova quantidade de Produto: 50 de quantidade' ).
    o_produto->adicionar_stock( 50 ).
    out->write( o_produto->get_qtd(  ) ).

    data(v_sucesso) = o_produto->remove_stock( 20 ).

    IF v_sucesso = abap_true.
      out->write( |Stock removido com sucesso!| ).
      out->write( |Novo stock: { o_produto->get_qtd( ) }| ).
    ELSE.
      out->write( |Stock insuficiente!| ).
    ENDIF.

    v_sucesso = o_produto->remove_stock( 60 ).

    IF v_sucesso = abap_true.
      out->write( |Stock removido com sucesso!| ).
      out->write( |Novo stock: { o_produto->get_qtd( ) }| ).
    ELSE.
      out->write( |Stock insuficiente!| ).
    ENDIF.

    out->write( 'Valor total' ).
    out->write( o_produto->calcular_total(  ) ).

  ENDMETHOD.
ENDCLASS.
