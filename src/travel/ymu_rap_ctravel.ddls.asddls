@EndUserText.label: 'Travel BO Projection view'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@Search.searchable: true


define root view entity ymu_RAP_cTRAVEL
  as projection on ymu_RAP_Travel as Travel
{
  key TravelUuid,
      @Search.defaultSearchElement: true
      TravelId,
      @Consumption.valueHelpDefinition: [{ entity :{name: '/DMO/I_Agency',element: 'AgencyID' } }]
      @ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true
      AgencyId,
      _Agency.Name        as AgencyName,
      @Consumption.valueHelpDefinition: [{ entity :{name: '/DMO/I_Customer',element: 'CustomerID '} }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerId,
      _Customer.last_name as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{entity :{name: 'I_Currency',element: 'Currency'} }]
      CurrencyCode,
      Description,
      TravelStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      
      /* Associations */
      _Agency,
      _Booking : redirected to composition child ymu_RAP_CBOOKING,
      _Currency,
      _Customer
}
