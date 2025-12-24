@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'HERZ: PROJECTION VIEW INTERFACE reservas'
@Metadata.ignorePropagatedAnnotations: true
define view entity zdd_book_I_HERZ 
as projection on zdd_book_R_HERZ
{
  key BookingUUID,
      TravelUUID,
      BookingID,
      BookingDate,
      CustomerID,
      AirlineID,
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LocalLastChangedAt,

      /* Associations */
      _BookStatus,
      _BookSuppl : redirected to composition child zdd_bspl_I_HERZ,
      _Carrier,
      _Conn,
      _Customer,
      _Travel            : redirected to parent ZDD_TRAV_I_HERZ
}
