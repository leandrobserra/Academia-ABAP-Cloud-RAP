CLASS zcl_fabap_jul2025_exer02_lbs DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        i_nome    TYPE string
        i_id      TYPE string
        i_salario TYPE decfloat16.

    METHODS calcular_salario
      RETURNING VALUE(r_salario) TYPE decfloat16.

    METHODS exibir_dados
      RETURNING VALUE(r_exibir) TYPE string.

  PROTECTED SECTION.

    DATA gv_nome TYPE string.
    DATA gv_id TYPE string.
    DATA gv_salario TYPE decfloat16.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER02_LBS IMPLEMENTATION.


  METHOD calcular_salario.
    r_salario = gv_salario.
  ENDMETHOD.


  METHOD constructor.
    gv_nome = i_nome.
    gv_id = i_id.
    gv_salario = i_salario.
  ENDMETHOD.


  METHOD exibir_dados.
    r_exibir = |'Nome: ' { gv_nome }, 'Id: ' { gv_id }, 'Salário: ' { gv_salario }|.
  ENDMETHOD.
ENDCLASS.
