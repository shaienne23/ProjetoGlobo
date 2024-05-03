
trigger AccountTrigger on Account (after insert, after update) {

    if(Trigger.isInsert && Trigger.isAfter || Trigger.isUpdate){
        AccountTrigger.sendEmailNotification(Trigger.new);
    }
}