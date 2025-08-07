CLASS zcl_fabap_jul2025_exer02_2_lbs DEFINITION
  PUBLIC
  INHERITING FROM zcl_fabap_jul2025_exer02_lbs
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        i_nome    TYPE string
        i_id      TYPE string
        i_salario TYPE decfloat16
        i_bonus   TYPE decfloat16.

    METHODS: calcular_salario REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA gv_bonus TYPE decfloat16.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_2_LBS IMPLEMENTATION.


  METHOD calcular_salario.
    r_salario = super->calcular_salario( ) + gv_bonus.
  ENDMETHOD.


  METHOD constructor.

    super->constructor( i_nome = i_nome i_id = i_id i_salario = i_salario ).
    gv_bonus = i_bonus.

  ENDMETHOD.
ENDCLASS.
