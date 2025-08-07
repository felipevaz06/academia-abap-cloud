CLASS zcl_fabap_jul2025_exer15_fvf DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fabap_jul2025_exer15_fvf IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF ty_flights,
             carrier_id     TYPE /dmo/carrier_id,
             connection_id  TYPE /dmo/connection_id,
             flight_date    TYPE /dmo/flight_date,
             price          TYPE /dmo/flight-price,
             distance       TYPE /dmo/connection-distance,
           END OF ty_flights.

    TYPES ty_flights_info TYPE STANDARD TABLE OF ty_flights WITH EMPTY KEY.

   SELECT fli~carrier_id,
           fli~connection_id,
           fli~flight_date,
           fli~price,
           conn~distance
    FROM /dmo/flight AS fli
    INNER JOIN /dmo/connection AS conn
    ON fli~carrier_id    = conn~carrier_id
    AND fli~connection_id = conn~connection_id
    WHERE fli~carrier_id = 'UA'
     AND conn~distance > 1000
    INTO TABLE @DATA(lt_flights).

    LOOP AT lt_flights ASSIGNING FIELD-SYMBOL(<fs_flight>).
        <fs_flight>-price = <fs_flight>-price * '1.10'.
        out->write( |Preço atualizado para voo { <fs_flight>-carrier_id }-{ <fs_flight>-connection_id }| ).
    ENDLOOP.

ENDMETHOD.
ENDCLASS.
