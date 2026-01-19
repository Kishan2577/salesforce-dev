trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    // List to hold tasks to be inserted
    List<Task> tasksToInsert = new List<Task>();

    for (Opportunity opp : Trigger.new) {

        // Check if Stage is Closed Won
        if (opp.StageName == 'Closed Won') {

            // For update, ensure stage just changed to Closed Won
            if (Trigger.isInsert ||
               (Trigger.isUpdate && Trigger.oldMap.get(opp.Id).StageName != 'Closed Won')) {

                Task followUpTask = new Task();
                followUpTask.Subject = 'Follow Up Test Task';
                followUpTask.WhatId = opp.Id;
                followUpTask.Status = 'Not Started';
                followUpTask.Priority = 'Normal';

                tasksToInsert.add(followUpTask);
            }
        }
    }

    // Insert all tasks in one DML operation (bulkified)
    if (!tasksToInsert.isEmpty()) {
        insert tasksToInsert;
    }
}