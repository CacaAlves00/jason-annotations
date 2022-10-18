!get(beer). // inital goal

// Plans

@g
+!get(beer) : true
    <- .send(robot, achieve, has(owner,beer)).
    // 👆 when the robot has achieved the goal, the owner perceives this, and the 
    //    belief has(owner,beer)[source(percept)] is added to the belief base,
    // which, then, will trigger the event @h1

@h1
+has(owner,beer) : true
    <- !drink(beer).

@h2
-has(owner,beer): true
    <- !get(beer).

// while I have beer, sip
@d1
+!drink(beer): has(owner,beer)
    <-  sip(beer);
        !drink(beer).

@d2
+!drink(beer): not has(owner,beer)
    <- true.

+msg(M)[source(Ag)]: true
    <- .print("Message from ", Ag, ": ", M);
    -msg(M).