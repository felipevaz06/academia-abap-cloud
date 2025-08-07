@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Views para resolução do exercicio 01'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_FABAP_EXER01_FVF 
    as select from /dmo/flight as Flight
    inner join /dmo/carrier as Carrier on Flight.carrier_id = Carrier.carrier_id

{
    
   key Flight.carrier_id                            as CarrierId,
   key Flight.connection_id                         as ConnectionId,
   key Flight.flight_date                           as FlightDate,
   Flight.seats_max                                 as SeatsMax,
   Flight.seats_occupied                            as SeatsOccupied,
   Carrier.name                                     as NameCarrier,
   concat(
   cast( 
    cast( Flight.seats_occupied / Flight.seats_max  * 100 as abap.dec(8,2)) as abap.char(10)), 
    '%' )                                           as OccupancyRate
}
