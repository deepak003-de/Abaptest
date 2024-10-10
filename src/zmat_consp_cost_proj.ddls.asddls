@EndUserText.label: 'Material Consumption Cost Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define root view entity ZMAT_CONSP_COST_PROJ 
provider contract transactional_query
as projection on ZMaterial_Consp_Cost_def
{
    key MaterialDocument,
    key Item,
    key CompanyCode,
    key FiscalYear,
    headertext,
    PostingDate,
    MovementType,
    MaterialID,
    Plant,
    StorageLocation,
    BatchNumber,
    UOM,
    @Semantics.quantity.unitOfMeasure: 'UOM'
    ConsumptionQuantity,
    CUR,
    @Semantics.amount.currencyCode: 'CUR'
    Amount,
    @Semantics.amount.currencyCode: 'CUR'
    Cost,
    @Semantics.amount.currencyCode: 'CUR'  
    perc,
    text
}
