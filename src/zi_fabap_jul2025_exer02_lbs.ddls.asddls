@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Exercicio 2 - CDS Views'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_FABAP_JUL2025_EXER02_LBS 
    as select from /dmo/connection as Connection
    inner join /dmo/carrier as Carrier on Connection.carrier_id = Carrier.carrier_id
{
    key Connection.carrier_id as CarrierId,
        count( distinct Connection.connection_id ) as ConnectionCount,
        max( Connection.distance ) as MaxDistance,
        Carrier.name as CarrierName
   
}

group by 
  Connection.carrier_id,
  Carrier.name
