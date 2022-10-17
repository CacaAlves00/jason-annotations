started. // 👈 Initial belief (can be a list)

+started <- .print("Hello, world"). // 👈 Trigger that defines a plan for the agent
// 👆 Whenever you come to believe 'started', print the text 'Hello, world'
// 👆 Empty context == run immediately
// 👆 After printing, the program does not end ! It patiently awaits for new events
// to occur.

// .print 👈 is a internal action
// Others internal actions are: .send, .broadcast and .stopMAS

// There is no magic in the word 'started'
// It could as well have been
cogitoErgoSum.
+cogitoErgoSum <- .print("Hello, world").