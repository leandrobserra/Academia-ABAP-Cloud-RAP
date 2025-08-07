CLASS zcl_fabap_jul2025_ex_extra_lbs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EX_EXTRA_LBS IMPLEMENTATION.


    Method if_oo_adt_classrun~main.

        SELECT * FROM ZI_FABAP_JUL2025_EXER01_LBS
            INTO TABLE @DATA(t_tabela).

        out->write( t_tabela ).

        SELECT * FROM ZI_FABAP_JUL2025_EXER02_LBS
            INTO TABLE @DATA(t_tabela1).

        out->write( t_tabela1 ).

        SELECT * FROM ZI_FABAP_JUL2025_EXER01_LBS
            INTO TABLE @DATA(t_tabela2).

        out->write( t_tabela2 ).

    endmethod.
ENDCLASS.
