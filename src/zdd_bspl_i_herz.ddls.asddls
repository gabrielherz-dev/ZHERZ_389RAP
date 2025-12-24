@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'HERZ: PROJECTION VIEW INTERFACEbooksupl'
@Metadata.ignorePropagatedAnnotations: true
define view entity zdd_bspl_I_HERZ 
as projection on zdd_bspl_R_HERZ
{
   key BookSupplUUID,
      TravelUUID,
      BookingUUID,
      BookingSupplementID,
      SupplementID,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      LocalLastChangedAt,
      
      /* Associations */
      _Booking : redirected to parent zdd_book_I_HERZ,
      _Product,
      _SupplementText,
      _Travel : redirected to ZDD_TRAV_I_HERZ
}
