import { getObjectInfo } from 'lightning/uiObjectInfoApi';

const getRecordTypes = (objectApiName) => {
    return getObjectApi(objectApiName).then(objectApi=>{
        console.log(objectApi);
    })
};

const getObjectApi = (objectApiName) => {
    return getObjectInfo (objectApiName);
}

export { getRecordTypes, getObjectApi };
