//
//  Lift_ChallengeTests.swift
//  Lift ChallengeTests
//
//  Created by Naffan on 11/12/2018.
//  Copyright © 2018 Nathan Costello. All rights reserved.
//

import XCTest
@testable import Lift_Challenge

class Lift_ChallengeTests: XCTestCase {

    let liftSimulator = LiftSimulator()
    
    // MARK: Successful Simulations
    func testLiftSimulator_1passenger() {
        let numberOfTicks =
            liftSimulator.calculateLiftTicks(passengerWeights: [60],
                                             passengerDestinationFloors: [5],
                                             floors: 5,
                                             maxPassengersPerLift: 2,
                                             maxWeightPerLift: 200)
        
        print("Total Number Of Ticks: \(numberOfTicks)")
        
        XCTAssert(numberOfTicks == 11)
    }

    func testLiftSimulator_3passengers() {
        let numberOfTicks =
            liftSimulator.calculateLiftTicks(passengerWeights: [60, 80, 40],
                                             passengerDestinationFloors: [2, 3, 2],
                                             floors: 5,
                                             maxPassengersPerLift: 2,
                                             maxWeightPerLift: 200)
        
        print("Total Number Of Ticks: \(numberOfTicks)")
        
        XCTAssert(numberOfTicks == 12)
    }
    
    // Error Testing
    func testLiftSimulator_1farTooHeavyPassenger() {
        let numberOfTicks =
            liftSimulator.calculateLiftTicks(passengerWeights: [300],
                                             passengerDestinationFloors: [5],
                                             floors: 5,
                                             maxPassengersPerLift: 2,
                                             maxWeightPerLift: 200)
        
        print("Total Number Of Ticks: \(numberOfTicks)")
        
        XCTAssert(numberOfTicks == 0)
    }
    
    func testLiftSimulator_1passenger_1heavyPassenger() {
        let numberOfTicks =
            liftSimulator.calculateLiftTicks(passengerWeights: [60, 300],
                                             passengerDestinationFloors: [4, 5],
                                             floors: 5,
                                             maxPassengersPerLift: 2,
                                             maxWeightPerLift: 200)
        
        print("Total Number Of Ticks: \(numberOfTicks)")
        
        XCTAssert(numberOfTicks == 9)
    }

}
