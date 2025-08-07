CLASS zcl_fabap_jul2025__exer13_lbs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_FABAP_JUL2025__EXER13_LBS IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " ----------------------------------------------------------------------
    " Tópico: Inline Declarations
    " Descrição: Declaração de variáveis antes do ABAP 7.40.
    " ----------------------------------------------------------------------
    data(lv_carrid) = 'AA'.


##NO_TEXT    out->write( |New Version - Carrier ID: { lv_carrid }| ).

    TYPES: BEGIN OF ty_flight_new,
             carrid      TYPE /dmo/carrier_id,
             connid      TYPE /dmo/connection_id,
             flight_date TYPE /dmo/flight_date,
           END OF ty_flight_new.

    DATA lt_flights_new TYPE STANDARD TABLE OF ty_flight_new WITH EMPTY KEY.

    lt_flights_new = VALUE #( ( carrid = 'LH' connid = '0400' flight_date = '20250725' ) ).



    LOOP AT lt_flights_new INTO data(ls_flight_new).
##NO_TEXT      out->write( |New Version - Flight: { ls_flight_new-carrid }-{ ls_flight_new-connid }| ).
    ENDLOOP.


    SELECT * FROM /dmo/flight "#EC CI_NOWHERE "#EC CI_NOORDER
      INTO TABLE @DATA(lt_flights_select_new)
      UP TO 2 ROWS.

    " DESCRIBE LINES lt_flights_select_new lines lv_lines. ( new )
##NO_TEXT    out->write( |New Version - Flights found (SELECT): { lines( lt_flights_select_new ) }| ).


    " ----------------------------------------------------------------------
    " Tópico: Table Expressions
    " Descrição: Acesso a linhas de tabelas internas antes do ABAP 7.40.
    " ----------------------------------------------------------------------
    try.
        data(ls_flight_expr_new) = lt_flights_new[ 1 ].
##NO_TEXT        out->write( |New Version - First flight: { ls_flight_expr_new-carrid }-{ ls_flight_expr_new-connid }| ).
    CATCH cx_sy_itab_line_not_found.
 ##NO_TEXT       out->write( |New Version - Flight not found.| ).
    ENDTRY.

    try.
        data(ls_flight_key_new) = lt_flights_new[ carrid = 'LH' connid = '0400' ].
##NO_TEXT        out->write( |New Version - Flight { ls_flight_key_new-carrid }-{ ls_flight_expr_new-connid }: { ls_flight_key_new-carrid }-{ ls_flight_expr_new-connid } | ).

    CATCH cx_sy_itab_line_not_found.
##NO_TEXT       out->write( |New Version - Flight not found.| ).
    ENDTRY.

*    " ----------------------------------------------------------------------
*    " Tópico: Conversion Operator CONV
*    " Descrição: Conversão de tipos de dados antes do ABAP 7.40.
*    " ----------------------------------------------------------------------


    data(lv_char_new) = '12345'.
    data(lv_int_new) = conv i( lv_char_new ).
##NO_TEXT    out->write( |New Version - Converted to INT: { lv_int_new }|  ).

*    " ----------------------------------------------------------------------
*    " Tópico: Value Operator VALUE
*    " Descrição: Inicialização de estruturas e tabelas internas antes do ABAP 7.40.
*    " ----------------------------------------------------------------------
    TYPES ty_flight_new_tt TYPE STANDARD TABLE OF ty_flight_new WITH EMPTY KEY.
    DATA(ls_connection_value) = VALUE /dmo/connection(
      airport_from_id = 'FRA'
      airport_to_id   = 'JFK'
    ).
##NO_TEXT    out->write( |New Version - Connection: { ls_connection_value-airport_from_id }-{ ls_connection_value-airport_to_id }| ).

    DATA(lt_flights_value_new) = VALUE ty_flight_new_tt(
      ( carrid = 'UA' connid = '0001' flight_date = '20250725' )
      ( carrid = 'DL' connid = '0002' flight_date = '20250726' )
    ).
##NO_TEXT    out->write( |New Version - Flights count (VALUE): { lines( lt_flights_value_new ) }| ).

*    " ----------------------------------------------------------------------
*    " Tópico: LOOP X FOR operator
*    " Descrição: Criação de tabelas internas com loops explícitos antes do ABAP 7.50.
*    " ----------------------------------------------------------------------

    DATA(lt_flights_for_new) = VALUE ty_flight_new_tt(
                             FOR ls_flights_new in lt_flights_value_new where ( carrid = 'UA' )
                             ( carrid = ls_flights_new-carrid connid = ls_flights_new-connid flight_date = ls_flights_new-flight_date ) ).

##NO_TEXT    out->write( |New Version - Flights for UA (FOR): { lines( lt_flights_for_new ) }| ).


*    " ----------------------------------------------------------------------
*    " Tópico: Reduction operator REDUCE
*    " Descrição: Redução de tabelas internas com loops explícitos antes do ABAP 7.50.
*    " ----------------------------------------------------------------------
    types ty_numbers_tt type STANDARD TABLE OF i with empty key.
    data(lt_numbers_new) = VALUE ty_numbers_tt( ( 1 ) ( 2 ) ( 3 ) ).
    data(lv_sum_new) = REDUCE i( init x = 0 for num in lt_numbers_new next x += num ).
##NO_TEXT    out->write( |New Version - Sum: { lv_sum_new }| ).

*    " ----------------------------------------------------------------------
*    " Tópico: Conditional operators COND and SWITCH
*    " Descrição: Expressões condicionais com IF/ELSEIF/ELSE e CASE antes do ABAP 7.40.
*    " ----------------------------------------------------------------------
    data(lv_code_new) = 1.
    data(lv_status_new) = COND #( WHEN lv_code_new = 1 then 'Success' when lv_code_new = 2 then 'Warning' ELSE 'Error' ).
##NO_TEXT    out->write( |New Version - Status (COND): { lv_status_new }| ).
    data(lv_code1_new) = 2.
    data(lv_status1_new) = SWITCH #( lv_code1_new when 1 then 'Success' when 2 then 'Warning' ELSE 'Error' ).
##NO_TEXT    out->write( |New Version - Status (SWITCH): { lv_status1_new }| ).


*    " ----------------------------------------------------------------------
*    " Tópico: Strings
*    " Descrição: Manipulação de strings antes do ABAP 7.40.
*    " ----------------------------------------------------------------------

    data(lv_var1_str_new) = 'ABAP'.
    data(lv_var2_str_new) = '7.40'.
##NO_TEXT    out->write( |New Version - String Template (Strings): Welcome to { lv_var1_str_new } { lv_var2_str_new }!| ).

    data(lv_var3_new) = '00080003371'.
    data(lv_var3_formatted) = |{ lv_var3_new ALPHA = OUT }|.
##NO_TEXT    out->write( |New Version - Embedded Expression (ALPHA) (Strings): { lv_var3_formatted }| ).


*    " ----------------------------------------------------------------------
*    " Tópico: Loop at Group By
*    " Descrição: Agrupamento de dados em loops de tabelas internas antes do ABAP 7.50.
*    " ----------------------------------------------------------------------


    TYPES: BEGIN OF ty_flight_group_new,
             carrid TYPE /dmo/carrier_id,
             connid TYPE /dmo/connection_id,
             price  TYPE /dmo/flight_price,
           END OF ty_flight_group_new.

    data lt_flights_group_new type standard table of ty_flight_group_new with empty key.
    lt_flights_group_new = Value #( ( carrid = 'LH' connid = '0400' price = '100' )
                                    ( carrid = 'LH' connid = '0401' price = '150' )
                                    ( carrid = 'UA' connid = '0001' price = '200' ) ).

    LOOP AT lt_flights_group_new INTO DATA(ls_flight_group_new) GROUP BY ls_flight_group_new-carrid.
      DATA(lv_total_price_group) = REDUCE /dmo/flight_price( INIT s = 0 FOR member IN GROUP ls_flight_group_new NEXT s = s + member-price ).
##NO_TEXT      out->write( |New Version - Carrier { ls_flight_group_new-carrid } Total Price (Group By): { lv_total_price_group }| ).
    ENDLOOP.



** ----------------------------------------------------------------------
** Tópico: Filter
** Descrição: Filtragem de tabelas internas com loops explícitos antes do ABAP 7.40.
** ----------------------------------------------------------------------
    data lt_flights_filter2_new type SORTED TABLE OF ty_flight_new with UNIQUE KEY carrid.
    data(lt_flights_filter_new) = FILTER #( lt_flights_filter2_new WHERE carrid = CONV #( 'AA' ) ).

##NO_TEXT    out->write( |New Version - Filtered flights (LH): { lines( lt_flights_filter_new ) }| ).

  ENDMETHOD.
ENDCLASS.
