global with sharing class cc_demo_PDPCtrl {
    global String extendedProdJSON {get;set;}
    global cc_demo_PDPCtrl() {
        String skuId = ApexPages.currentPage().getParameters().get('sku');
        try{
            ccrz__E_Product__c product = [SELECT Id, ccrz__Taxable__c FROM ccrz__E_Product__c WHERE ccrz__SKU__c = :skuId LIMIT 1];
            final Map<String,Object> customProdData = new Map<String,Object>{
                'customField1'=>product.ccrz__Taxable__c
            };   
            extendedProdJSON = JSON.serialize(new Map<String,Object>{
                 'extProdData' => customProdData
            });
        }
        catch(Exception e){
 
        }
         
    }
}