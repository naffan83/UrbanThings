//
//  LiftSimulator.swift
//  Lift Challenge
//
//  Created by Naffan on 11/12/2018.
//  Copyright © 2018 Nathan Costello. All rights reserved.
//

import Foundation

class LiftSimulator {
    
    var lift = Lift()
    
    func calculateLiftTicks(passengerWeights: [Int],
                            passengerDestinationFloors: [Int],
                            floors: Int,
                            maxPassengersPerLift: Int,
                            maxWeightPerLift: Int) -> Int{
        
        if passengerWeights.count == passengerDestinationFloors.count {
            
            var passengers = [Passenger]()
            for i in 0..<passengerWeights.count {
                if (passengerDestinationFloors[i] <= floors) {
                    let passenger = Passenger()
                    passenger.weight = passengerWeights[i]
                    passenger.destinationFloor = passengerDestinationFloors[i]
                    passengers.append(passenger)
                }
            }
            
            lift.maxPassengers = maxPassengersPerLift
            lift.maxWeight = maxWeightPerLift
            lift.floors = floors
            
            if passengers.count > 0 {
                while passengers.count > 0 {
                    var passengersCurrentlyInTransit = [Passenger]()
                    
                    lift.openDoorsForBoarding()
                    
                    for passenger in passengers {
                        if lift.canPassengerBoardLift(passenger: passenger) {
                            passengersCurrentlyInTransit.append(passenger)
                        } else {
                            break;
                        }
                    }
                    
                    lift.runLift()
                    
                    passengers = passengers.filter() { $0.enteredLift == false }
                }
                lift.completed()
            }
            
        } else {
            print("ERROR: Passenger Weight and Destination arrays must be the same length")
        }
        
        return lift.numberOfTicks
    }
    
}
