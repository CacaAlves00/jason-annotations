/* Initial beliefs */

// initially, I believe that there are some beers in the fridge 
available(beer,fridge).

// my owner should not consume more than 10 beers a day :-)
limit(beer,10).

/* Rules */
too_much(B) :-
    .date(YY,MM,DD) &
    .count(consumed(YY,MM,DD,_,_,_,B),QtdB) &
    limit(B,Limit) &
    QtdB > Limit.

/* Plans */
@h1
+!has(owner,beer)
    : available(beer,fridge) & not too_much(beer)
    <-  !at(robot,fridge);
        open(fridge);
        get(beer);
        close(fridge);
        !at(robot,owner);
        hand_in(beer);
        // remember that another beer will be consumed
        .date(YY,MM,DD); .time(HH,NN,SS);
        +consumed(YY,MM,DD,HH,NN,SS,beer).

@h2
+!has(owner,beer)
    : not available(beer,fridge)
    <- .send(supermarket, achieve, order(beer,5));
    !at(robot,fridge). // go to fridge and wait there.

@h3
+!has(owner,beer)
    : too_much(beer) & limit(beer,L)
    <-  .concat("The Department of Health does not allow me ",
            "to give you more than ", L,
            " beers a day! I am very sorry about that!",M);
        .send(owner,tell,msg(M)).

@m1
+!at(robot,P) : at(robot,P) <- true.

@m2
+!at(robot,P) : not at(robot,P)
    <- move_towards(P);
        !at(robot,P).

// when the supermarket finishes the order, try the ’has’
// goal again
@a1
+delivered(beer,Qtd,OrderId)[source(supermarket)] : true
    <- +available(beer,fridge);
        !has(owner,beer).

// when the fridge is openned, the beer stock is perceived
// and thus the available belief is updated
@a2
+stock(beer,0)
    : available(beer,fridge)
    <- -available(beer,fridge).

@a3
    +stock(beer,N)
    : N > 0 & not available(beer