trigger AccountTrigger on Account (after insert, after update) {
    if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
        if (Trigger.isInsert) {
            AccountTrigger.sendEmailOnInsert(Trigger.new);
        } else if (Trigger.isUpdate) {
            AccountTrigger.sendEmailOnUpdate(Trigger.new);
        }
    }
}