import { LightningElement, api, wire} from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getRecordTypes, getObjectApi } from 'c/objectApi';

export default class DynamicForm extends LightningElement {
    // Flexipage provides recordId and objectApiName
    @api recordId;
    @api objectApiName='Book__c';
    fields = ['Description__c', 'Name', 'Subject__c', 'Thenes__c'];

    @wire(getObjectInfo, { objectApiName: '$objectApiName'})
    objectInfos;

    currentStep = 1; /*
        1 - recordType choose
        2 - Form display based on record type
    */

    currentCancelName = 'cancel'
    currentSaveName = 'next'
    selectedRecordTypeId='';

    
    get recordTypes() {
        // Returns a map of record type Ids 
        console.log('getting recordtypes');
        if(this.objectInfos && this.objectInfos.data){
            console.log('object infos defined');
            const recordTypes = this.objectInfos.data.recordTypeInfos;
            console.log(recordTypes);
            let rts = Object.keys(recordTypes).map((key)=>{
                let recordType = recordTypes[key];
                return {
                    label:recordType.name,
                    value: recordType.recordTypeId, 
                    master: recordType.master
                };
            });
            console.log(rts);
            return rts.filter(rt=>rt.master===false);
        }
        return [];
        
    }

    get isFirstStep(){
        return this.currentStep==1;
    }
    get isSecondStep(){
        return this.currentStep==2;
    }
    
    handleNext(event){
        let name = event.target.dataset.name;
        if(name==='next'){
            //Navigate to the next step
            this.currentStep++;
            this.currentCancelName='prev';
            console.log('Navigate next');
        }
        else if(name==='save'){
            console.log('Save the form');
        }
    }
    handleCancel(event){
        let name = event.target.dataset.name;
        if(name==='cancel'){
            //Cancel the process
            console.log('Cancel');
        }
        else if(name==='prev'){
            console.log('Navigate back');
            this.currentStep--;
            if(this.currentStep===1){
                this.currentCancelName='cancel';
            }
        }
    }


}