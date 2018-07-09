global with sharing class cc_demo_INVCtrl {
    global String extendedInvJSON {get;set;}
    global cc_demo_INVCtrl() {
            
            Account a = ccrz.cc_CallContext.currAccount;
            if (a == null) a = ccrz.cc_CallContext.effAccount;
            
            Contact c = ccrz.cc_CallContext.currContact;


        try{
            List<ccrz__E_Invoice__c> invoices = [SELECT Id, ccrz__Comments__c,ccrz__BillTo__c,ccrz__Contact__c FROM ccrz__E_Invoice__c WHERE 
            ccrz__BillTo__c = : a.Id and ccrz__Contact__c =: c.Id];
            
            for(ccrz__E_Invoice__c i : invoices){
            
            
            }
            
            //extendedInvJSON = JSON.serialize(invoices);
            
            final Map<String,Object> customInvData = new Map<String,Object>{
                'invoiceList.sfid'=>'Test'
            };   
            extendedInvJSON = JSON.serialize(new Map<String,Object>{
                 'extInvData' => customInvData
            });
           
        }
        catch(Exception e){
 
        }
         
    }
}