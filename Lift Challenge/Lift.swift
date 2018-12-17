//
//  Lift.swift
//  Lift Challenge
//
//  Created by Naffan on 11/12/2018.
//  Copyright © 2018 Nathan Costello. All rights reserved.
//

import Foundation

class Lift {
    internal var currentFloor: Int = 1
    private var passengers = [Passenger]()
    internal var floorsToMoveInOneTick = 1
    
    var id: Int = 0
    var maxPassengers: Int = 0
    var maxWeight: Int = 0
    var floors: Int = 0
    var numberOfTicks: Int = 0
    
    // MARK: Boarding
    func openDoorsForBoarding() {
        numberOfTicks += 1
        print("Lift: \(id) - Tick: \(numberOfTicks) - Loading at floor \(currentFloor)")
    }
    
    func canPassengerBoardLift(passenger: Passenger) -> Bool {
        if passengers.count < maxPassengers
            && (calculateCurrentWeight() + passenger.weight) <= maxWeight {
            passenger.enteredLift = true
            passengers.append(passenger)
            return true
        }
        return false
    }
    
    private func calculateCurrentWeight() -> Int {
        var currentWeight: Int = 0
        for passenger in passengers {
            currentWeight += passenger.weight
        }
        
        return currentWeight
    }
    
    // MARK: Running
    func runLift() {
        while passengers.count > 0
            && currentFloor < floors {
                goUpAFloor()
                unloadLift()
        }
        
        while currentFloor > 1 {
            goDownAFloor()
        }
        
        // Added just incase a Passenger was trying to go to a floor that doesn't exist
        if passengers.count > 0 {
            passengers.removeAll()
            numberOfTicks += 1
            print("Lift: \(id) - Tick: \(numberOfTicks) - Unloading at \(currentFloor)")
        }
    }
    
    internal func goUpAFloor() {
        currentFloor += floorsToMoveInOneTick
        numberOfTicks += 1
        print("Lift: \(id) - Tick: \(numberOfTicks) - Moving to floor \(currentFloor)")
    }
    
    private func unloadLift() {
        let startingPassengerCount = passengers.count
        if startingPassengerCount > 0 {
            passengers = passengers.filter() { $0.destinationFloor != currentFloor }
            if passengers.count < startingPassengerCount {
                numberOfTicks += 1
                print("Lift: \(id) - Tick: \(numberOfTicks) - Unloading at \(currentFloor)")
            }
        }
    }
    
    internal func goDownAFloor() {
        currentFloor -= floorsToMoveInOneTick
        numberOfTicks += 1
        
        print("Lift: \(id) - Tick: \(numberOfTicks) - Moving to floor \(currentFloor)")
    }
    
    func completed() {
        numberOfTicks += 1
        print("Lift: \(id) - Tick: \(numberOfTicks) - Completed")
    }
}
