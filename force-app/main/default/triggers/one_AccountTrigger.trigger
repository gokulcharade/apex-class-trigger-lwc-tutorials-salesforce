trigger one_AccountTrigger on Account (before insert) {
	system.debug('Trigger before insert event');
}