CLASS zcl_fabap_jul2025_exer15_lbs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fabap_jul2025_exer15_lbs IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.


    SELECT f~carrier_id, f~connection_id, f~price, c~distance from /dmo/flight as f
        inner join /dmo/connection as c on f~carrier_id = c~carrier_id
                                        and f~connection_id = c~connection_id
                                        where f~carrier_id = 'UA'
                                        and c~distance > 1000
                                        into table @data(lt_flights).

    LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<ls_flight>).
        <ls_flight>-price = <ls_flight>-price * '1.10'.
        out->write( |Preço atualizado para voo { <ls_flight>-carrier_id }-{ <ls_flight>-connection_id }| ).
    ENDLOOP.
    endmethod.

ENDCLASS.
