@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'HERZ: ROOT ENTITY reservas'
@Metadata.ignorePropagatedAnnotations: true
define view entity zdd_book_R_HERZ as select from ztb_book_herz_a
 association        to parent ZDD_TRAV_R_HERZ    as _Travel        on  $projection.TravelUUID = _Travel.TravelUUID
  composition [0..*] of zdd_bspl_R_HERZ        as _BookSuppl


  association [1..1] to /DMO/I_Customer          as _Customer      on  $projection.CustomerID = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier           as _Carrier       on  $projection.AirlineID = _Carrier.AirlineID
  association [1..1] to /DMO/I_Connection        as _Conn    on  $projection.AirlineID    = _Conn.AirlineID
                                                                   and $projection.ConnectionID = _Conn.ConnectionID
  association [1..1] to /DMO/I_Booking_Status_VH as _BookStatus on  $projection.BookingStatus = _BookStatus.BookingStatus


{
  key booking_uuid          as BookingUUID,
      parent_uuid           as TravelUUID,

      booking_id            as BookingID,
      booking_date          as BookingDate,
      customer_id           as CustomerID,
      carrier_id            as AirlineID,
      connection_id         as ConnectionID,
      flight_date           as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price          as FlightPrice,
      currency_code         as CurrencyCode,
      booking_status        as BookingStatus,

      //local ETag field
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _Travel,
      _Customer,
      _Carrier,
      _Conn,
      _BookStatus,
      _BookSuppl
}
