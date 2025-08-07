CLASS zcl_fabap_jul2025_exer16_lbs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fabap_jul2025_exer16_lbs IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    SELECT carrier_id, connection_id
        FROM /dmo/flight
        INTO TABLE @DATA(lt_flights).

    SELECT carrier_id, connection_id, flight_date
        FROM /dmo/booking
        FOR ALL ENTRIES IN @lt_flights
        WHERE carrier_id    = @lt_flights-carrier_id
          AND connection_id = @lt_flights-connection_id
        INTO TABLE @DATA(lt_bookings).

    SORT lt_flights BY carrier_id connection_id.
    SORT lt_bookings BY carrier_id connection_id.

    LOOP AT lt_flights INTO DATA(ls_flights).

        check line_exists( lt_bookings[ carrier_id    = ls_flights-carrier_id
                                      connection_id = ls_flights-connection_id ] ).
        data(lv_index) = line_index( lt_bookings[ carrier_id    = ls_flights-carrier_id
                                      connection_id = ls_flights-connection_id ] ).


        LOOP AT lt_bookings FROM lv_index INTO DATA(ls_booking).
            IF ls_booking-carrier_id NE ls_flights-carrier_id OR ls_booking-connection_id NE ls_flights-connection_id.
                EXIT.
            ENDIF.
            out->write( |Voo { ls_booking-carrier_id } { ls_booking-connection_id }: { ls_booking-flight_date }| ).
        ENDLOOP.

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
