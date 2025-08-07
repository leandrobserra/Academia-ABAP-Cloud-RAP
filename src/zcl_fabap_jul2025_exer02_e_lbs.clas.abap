CLASS zcl_fabap_jul2025_exer02_e_lbs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_E_LBS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: t_funcionarios TYPE TABLE OF REF TO zcl_fabap_jul2025_exer02_lbs.
    DATA(o_integral) = NEW zcl_fabap_jul2025_exer02_2_lbs(
      i_nome = 'Vasco'
      i_id = '1'
      i_salario = '1200.0'
      i_bonus = '80.00' ).

    DATA(o_horista) = NEW zcl_fabap_jul2025_exer02_3_lbs(
      i_nome = 'Vanessa'
      i_id = '2'
      i_salario = '57.0'
      i_horas = '160' ).

    APPEND o_integral TO t_funcionarios.
    APPEND o_horista TO t_funcionarios.

    LOOP AT t_funcionarios INTO DATA(o_funcionario).
      out->write( o_funcionario->exibir_dados( ) ).
      out->write( |Salário: { o_funcionario->calcular_salario( ) }| ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
