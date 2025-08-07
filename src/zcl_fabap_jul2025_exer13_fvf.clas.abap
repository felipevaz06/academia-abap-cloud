CLASS zcl_fabap_jul2025_exer13_fvf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fabap_jul2025_exer13_fvf IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
    "---------------------------------------
    "Inline Declarations
    "---------------------------------------
    DATA(lv_carrid) = 'AA'.
    out->write( |New Version - Carrier ID: { lv_carrid }| ).

    TYPES: BEGIN OF ty_flight_new,
             carrid      TYPE /dmo/carrier_id,
             connid      TYPE /dmo/connection_id,
             flight_date TYPE /dmo/flight_date,
           END OF ty_flight_new.
    DATA lt_flights_new TYPE STANDARD TABLE OF ty_flight_new WITH EMPTY KEY.

    lt_flights_new = VALUE #(
        ( carrid = 'LH' connid = '0400' flight_date = '20250725' )
    ).

    LOOP AT lt_flights_new INTO DATA(ls_flight_new).
        out->write( |New Version - Flight: { ls_flight_new-carrid }-{ ls_flight_new-connid }| ).
    ENDLOOP.

    SELECT FROM /dmo/flight
    FIELDS *
    INTO TABLE @DATA(lt_flights_select_new)
    UP TO 2 ROWS.

    out->write( |New Version - Flights found (SELECT): { lines( lt_flights_select_new ) }| ).

    "-------------------------------------------
    "Table Expressions
    "-------------------------------------------
    IF line_exists( lt_flights_new[ 1 ] ).
         DATA(ls_flight_expr_new) = lt_flights_new[ 1 ].
         out->write( |New Version - First Flight: { ls_flight_expr_new-carrid }-{ ls_flight_expr_new-connid }| ).
    ENDIF.

    IF line_exists( lt_flights_new[ carrid = 'LH' connid = '0400' ] ).
         DATA(ls_flight_key_new) = lt_flights_new[ carrid = 'LH' connid = '0400' ].
         out->write( |New Version - Flight LH-0400: { ls_flight_key_new-carrid }-{ ls_flight_key_new-connid }| ).
    ENDIF.


    "--------------------------------------------
    "Conversion Operator CONV
    "--------------------------------------------
    DATA(lv_char_new) = '12345'.
    DATA(lv_int_new) = CONV i( lv_char_new ).
    out->write( |New Version - Converted to INT: { lv_int_new }| ).

    "--------------------------------------------
    "value operator VALUE
    "--------------------------------------------
    DATA(ls_connection_new) = VALUE /dmo/connection( airport_from_id = 'FRA'
                                                   airport_to_id   = 'JFK' ).

    out->write( |New Version - Connection: { ls_connection_new-airport_from_id }-{ ls_connection_new-airport_to_id }| ).

    DATA lt_flights_value_new TYPE SORTED TABLE OF ty_flight_new
        WITH NON-UNIQUE KEY carrid.
    ASSIGN lt_flights_value_new TO FIELD-SYMBOL(<fs_flight_value>).
    lt_flights_value_new = VALUE #( BASE lt_flights_new
       ( carrid = 'UA' connid = '0001' flight_date = '20250725' )
     ).
     out->write( |New Version - Flights count (VALUE) { lines( lt_flights_value_new ) }| ).

    "---------------------------------------------
    "LOOOP X FOR Operator
    "---------------------------------------------
    SELECT carrier_id, connection_id, flight_date
      FROM /dmo/flight
      INTO TABLE @DATA(lt_flights_for_new).

    CONSTANTS ua TYPE c LENGTH 3 VALUE 'UA'.
    lt_flights_for_new = FILTER #(
             lt_flights_value_new
             WHERE carrid = ua
     ).

     out->write( |New Version - Flights for UA (FOR) { lines( lt_flights_for_new ) }| ).

    "---------------------------------------------
    "Reduce
    "---------------------------------------------
    DATA lt_numbers_new TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    lt_numbers_new =  VALUE #( ( 1 ) ( 2 ) ( 3 ) ).
    DATA(lv_sum_new) = REDUCE i( INIT a = 0 FOR b IN lt_numbers_new NEXT a = a + b ).
    out->write( |New Version - Sum: { lv_sum_new }| ).

    "---------------------------------------------
    "COND/SWITCH
    "---------------------------------------------
    DATA(lv_code_new) = 1.
    DATA(lv_status_new) = COND string(
         WHEN lv_code_new = 1 THEN 'Success'
         WHEN lv_code_new = 2 THEN 'Warning'
         ELSE 'Error'
     ).
     out->write( |New Version - Status (COND): { lv_status_new }| ).

    DATA(lv_code_switch_new) = 2.
    DATA(lv_status_switch_new) = SWITCH string( lv_code_switch_new
         WHEN 1 THEN 'Success'
         WHEN 2 THEN 'Warning'
         ELSE 'Error'
     ).
     out->write( |New Version - Status (SWITCH): { lv_status_switch_new }| ).



ENDMETHOD.
ENDCLASS.
