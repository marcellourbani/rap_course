@EndUserText.label: 'Booking BO Projection view'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@Search.searchable: true

define view entity YMU_RAP_CBOOKING 
 as projection on YMU_RAP_Booking as Booking {
  key BookingUuid,
  TravelUuid,
  @Search.defaultSearchElement: true
  BookingId,
  BookingDate,
  @Search.defaultSearchElement: true
  @ObjectModel.text.element: ['CustomerName']
  @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Customer',element: 'CustomerID'} }]
  CustomerId,
  _Customer.LastName as CustomerName,
  @Consumption.valueHelpDefinition: [{entity:{name: '/DMO/I_Carrier',element: 'AirlineID ' } }]
  @ObjectModel.text.element: ['CustomerName']
  CarrierId,
  _Carrier.Name as CarrierName,
  @Consumption.valueHelpDefinition: [{entity:{ name: '/DMO/I_Connection',element: 'ConnectionID' },
                                      additionalBinding: [{localElement: 'CarrierID' , element: 'AirlineID' },
                                                {localElement: 'FlightDate',element: 'FlightDate',usage: #RESULT},
                                                {localElement: 'FlightPrice',element: 'Price',usage: #RESULT},
                                                {localElement: 'CurrencyCode',element: 'CurrencyCode',usage: #RESULT}
                                      ] }]
  ConnectionId,
  FlightDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  FlightPrice,
  @Consumption.valueHelpDefinition: [{entity:{name: 'I_Currency',element: 'Currency'} }]
  CurrencyCode,
  CreatedBy,
  LastChangedBy,
  LocalLastChangedAt,
  /* Associations */
  _Carrier,
  _Connection,
  _Currency,
  _Customer,
  _Flight,
  _Travel : redirected to parent YMU_RAP_CTRAVEL
}
