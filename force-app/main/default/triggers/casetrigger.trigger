trigger casetrigger on Case (after insert) {
	casetriggerhandler.populatelatestcasenum(trigger.new);
}