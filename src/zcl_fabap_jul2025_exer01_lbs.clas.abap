CLASS zcl_fabap_jul2025_exer01_lbs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        i_codigo TYPE string
        i_nome   TYPE string
        i_preco  TYPE decfloat16.

    METHODS adicionar_stock
      IMPORTING i_valor TYPE i.


    METHODS remove_stock
      IMPORTING i_valor           TYPE i
      RETURNING VALUE(rv_sucesso) TYPE abap_bool.

    METHODS calcular_total
      RETURNING VALUE(r_valorTotal) TYPE decfloat16.

    METHODS get_codigo
      RETURNING VALUE(r_codigo) TYPE string.

    METHODS get_nome
      RETURNING VALUE(r_nome) TYPE string.

    METHODS get_preco
      RETURNING VALUE(r_preco) TYPE decfloat16.

    METHODS get_qtd
      RETURNING VALUE(r_qtd) TYPE i.


  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA gv_codigo TYPE string.
    DATA gv_nome TYPE string.
    DATA gv_preco TYPE decfloat16.
    DATA gv_qtd TYPE i.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER01_LBS IMPLEMENTATION.


  METHOD adicionar_stock.
    gv_qtd += i_valor.
  ENDMETHOD.


  METHOD calcular_total.
    r_valorTotal = gv_qtd * gv_preco.
  ENDMETHOD.


  METHOD constructor.
    gv_codigo = i_codigo.
    gv_nome = i_nome.
    gv_preco = i_preco.
  ENDMETHOD.


  METHOD get_codigo.
    r_codigo = gv_codigo.
  ENDMETHOD.


  METHOD get_nome.
    r_nome = gv_nome.
  ENDMETHOD.


  METHOD get_preco.
    r_preco = gv_preco.
  ENDMETHOD.


  METHOD get_qtd.
    r_qtd = gv_qtd.
  ENDMETHOD.


  METHOD remove_stock.
    IF i_valor > gv_qtd.
      rv_sucesso = abap_false.
    ELSE.
      gv_qtd -= i_valor.
      rv_sucesso = abap_false.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
