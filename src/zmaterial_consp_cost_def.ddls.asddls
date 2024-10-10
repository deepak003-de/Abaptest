@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Consump Cost Defi'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZMaterial_Consp_Cost_def as select from I_MaterialDocumentItem_2 as item
inner join I_MaterialDocumentHeader_2 as header on header.MaterialDocument = item.MaterialDocument
{

key item.MaterialDocument as MaterialDocument,
key item.MaterialDocumentItem as Item,
key item.CompanyCode as CompanyCode,
key item.MaterialDocumentYear as FiscalYear,
header.MaterialDocumentHeaderText as headertext,
item.PostingDate as PostingDate,
item.GoodsMovementType as MovementType,
item.Material as MaterialID,
item.Plant as Plant,
item.StorageLocation as StorageLocation,
item.Batch as BatchNumber,
item.EntryUnit as UOM, 
@Semantics.quantity.unitOfMeasure: 'UOM'
item.QuantityInEntryUnit as ConsumptionQuantity,
item.CompanyCodeCurrency as CUR,
@Semantics.amount.currencyCode: 'CUR'
item.TotalGoodsMvtAmtInCCCrcy as Amount,
@Semantics.amount.currencyCode: 'CUR'
cast( get_numeric_value(item.TotalGoodsMvtAmtInCCCrcy ) / get_numeric_value(item.QuantityInEntryUnit) as abap.dec(12,2)) as Cost,
@Semantics.amount.currencyCode: 'CUR'
cast( item.TotalGoodsMvtAmtInCCCrcy as abap.dec(15,2) ) as TotalGoodsMvtAmtInDEC,
cast( get_numeric_value(item.TotalGoodsMvtAmtInCCCrcy) + ( get_numeric_value(item.TotalGoodsMvtAmtInCCCrcy) * 35 ) / 100 as abap.dec(12,2)) as perc,
item.MaterialDocumentItemText as text
}where item.GoodsMovementType = '201' or item.GoodsMovementType = '202'
