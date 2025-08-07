CLASS zcl_fabap_jul2025_exer04_2_lbs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025_EXER04_2_LBS IMPLEMENTATION.


    method if_oo_adt_classrun~main.
    zcl_fabap_jul2025_exer04_lbs=>get_data( IMPORTING et_data = DATA(lt_data) ).

    out->write( lt_data ).
    endmethod.
ENDCLASS.
