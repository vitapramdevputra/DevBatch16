trigger AccountTrigger2 on Account (before delete, after delete) {

    if(trigger.isBefore){
        system.debug('before delete account trigger trigger.new: ' + trigger.new);
    }
    if(trigger.isAfter){
        system.debug('after delete account trigger trigger.new: ' + trigger.new);
    }
}