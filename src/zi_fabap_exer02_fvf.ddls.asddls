@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS view para resolução do exercicio 02'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_FABAP_EXER02_FVF 
    as select from /dmo/connection as Connection
    inner join /dmo/carrier as Carrier on Connection.carrier_id = Carrier.carrier_id
        
{
    key Connection.carrier_id                   as CarrierId,
    Carrier.name                                as Name,
    count( distinct Connection.connection_id)   as ConnectionCount,
    max(Connection.distance)                    as MaxDistance
}
group by 
    Connection.carrier_id,
    Carrier.name
