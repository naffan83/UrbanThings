//
//  ExpressLift.swift
//  Lift Challenge
//
//  Created by Naffan on 12/12/2018.
//  Copyright © 2018 Nathan Costello. All rights reserved.
//

class ExpressLift : Lift {
    
    override func goUpAFloor() {
        
        if currentFloor == 1 {
            floorsToMoveInOneTick = 1
        } else {
            floorsToMoveInOneTick = 2
        }
        
        super.goUpAFloor()
    }
    
    override func goDownAFloor() {
        if currentFloor == 2 {
            floorsToMoveInOneTick = 1
        } else {
            floorsToMoveInOneTick = 2
        }
        
        super.goDownAFloor()
    }
}
