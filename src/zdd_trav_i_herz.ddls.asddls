@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'HERZ: PROJECTION VIEW INTERFACE viajes'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZDD_TRAV_I_HERZ 
provider contract transactional_interface
    as projection on ZDD_TRAV_R_HERZ
{
  key TravelUUID,
      TravelID,
      AgencyID,
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,

      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      LastChangedAt,

      /* Associations */
      _Agency,
      _Booking : redirected to composition child zdd_book_I_HERZ,
      _Currency,
      _Customer,
      _OverallStatus
}
