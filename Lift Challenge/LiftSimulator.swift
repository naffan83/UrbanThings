//
//  LiftSimulator.swift
//  Lift Challenge
//
//  Created by Naffan on 11/12/2018.
//  Copyright © 2018 Nathan Costello. All rights reserved.
//

import Foundation

class LiftSimulator {
    
    var lifts = [Lift]()
    
    func calculateLiftTicks(passengerWeights: [Int],
                            passengerDestinationFloors: [Int],
                            floors: Int,
                            maxPassengersPerLift: Int,
                            maxWeightPerLift: Int,
                            numberOfLifts: Int) -> Int{
        
        lifts.removeAll()
        var totalNumberOfTicks = 0
        
        if passengerWeights.count == passengerDestinationFloors.count
            && passengerWeights.count > 0
            && numberOfLifts > 0 {
            
            var passengers = [Passenger]()
            for i in 0..<passengerWeights.count {
                if (passengerWeights[i] <= maxWeightPerLift
                    && passengerDestinationFloors[i] <= floors) {
                    let passenger = Passenger()
                    passenger.weight = passengerWeights[i]
                    passenger.destinationFloor = passengerDestinationFloors[i]
                    passengers.append(passenger)
                }
            }
            
            for i in 0..<numberOfLifts {
                let lift = Lift()
                lift.id = i
                lift.maxPassengers = maxPassengersPerLift
                lift.maxWeight = maxWeightPerLift
                lift.floors = floors
                lifts.append(lift)
            }
            
            while passengers.count > 0 {
                var passengersCurrentlyInTransit = [Passenger]()
                
                for lift in lifts {
                    lift.openDoorsForBoarding()
                }
                
                for passenger in passengers {
                    for lift in lifts {
                        if lift.canPassengerBoardLift(passenger: passenger) {
                            passengersCurrentlyInTransit.append(passenger)
                            break
                        }
                    }
                }
                
                for lift in lifts {
                    lift.runLift()
                }
                
                passengers = passengers.filter() { $0.enteredLift == false }
            }
            
            for lift in lifts {
                lift.completed()
            }
            
        } else {
            print("ERROR: Bad Inputs")
        }
        
        for lift in lifts {
            if lift.numberOfTicks > totalNumberOfTicks {
                totalNumberOfTicks = lift.numberOfTicks
            }
        }
        
        return totalNumberOfTicks
    }
    
}
