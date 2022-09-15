// read user task information
var lastUserTask1 = $.usertasks.usertask1.last;
var userTaskSubject = lastUserTask1.subject;
var userTaskProcessor = lastUserTask1.processor;
var userTaskCompletedAt = lastUserTask1.completedAt;
var userDecision = lastUserTask1.decision;


// write 'product' node to workflow context
$.context.userTaskSubject = userTaskSubject;
$.context.userTaskProcessor = userTaskProcessor;
$.context.userTaskCompletedAt = userTaskCompletedAt;
$.context.userTaskSubject = userTaskSubject;
$.context.decision = lastUserTask1.decision;

