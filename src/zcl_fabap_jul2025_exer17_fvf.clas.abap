CLASS zcl_fabap_jul2025_exer17_fvf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fabap_jul2025_exer17_fvf IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_flights,
           carrier_id TYPE /dmo/flight-carrier_id,
           connection_id TYPE /dmo/flight-connection_id,

        END OF ty_flights.

    DATA lt_flights_info TYPE SORTED TABLE OF ty_flights
        WITH NON-UNIQUE KEY carrier_id connection_id.

    TYPES: BEGIN OF ty_booking,
       carrier_id TYPE /dmo/booking-carrier_id,
       connection_id TYPE /dmo/booking-connection_id,
       flight_date TYPE /dmo/booking-flight_date,
    END OF ty_booking.

    DATA lt_booking_info TYPE SORTED TABLE OF ty_booking
        WITH NON-UNIQUE KEY carrier_id connection_id flight_date.

    SELECT carrier_id, connection_id FROM /dmo/flight
    INTO TABLE @lt_flights_info.

   SELECT carrier_id, connection_id, flight_date FROM /dmo/booking
      FOR ALL ENTRIES IN @lt_flights_info
      WHERE carrier_id    = @lt_flights_info-carrier_id
        AND connection_id = @lt_flights_info-connection_id
      INTO TABLE @lt_booking_info.

     LOOP AT lt_flights_info ASSIGNING FIELD-SYMBOL(<fs1>).

     IF line_exists( lt_booking_info[ carrier_id = <fs1>-carrier_id connection_id = <fs1>-connection_id ] ).

      CHECK SY-SUBRC = 0.
      DATA(lv_tabix) = sy-tabix.

       LOOP AT lt_booking_info FROM lv_tabix ASSIGNING FIELD-SYMBOL(<fs2>).
          IF <fs2>-carrier_id <> <fs1>-carrier_id AND <fs2>-connection_id <> <fs1>-connection_id.
             EXIT.
          ENDIF.
          out->write( |Voo { <fs2>-carrier_id } { <fs2>-connection_id }: { <fs2>-flight_date }| ).
       ENDLOOP.
    ENDIF.
     ENDLOOP.

ENDMETHOD.
ENDCLASS.
