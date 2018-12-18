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
    func testLiftSimulator_1passenger_1regularLift_1expressLift() {
        let numberOfTicks =
            liftSimulator.calculateLiftTicks(passengerWeights: [60],
                                             passengerDestinationFloors: [6],
                                             floors: 6,
                                             maxPassengersPerLift: 2,
                                             maxWeightPerLift: 200,
                                             numberOfNormalLifts: 1,
                                             numberOfExpressLifts: 1)
        
        print("Total Number Of Ticks: \(numberOfTicks)")
        
        XCTAssert(numberOfTicks == 9)
    }
    
    func testLiftSimulator_3passengers_1regularLift_1expressLift() {
        let numberOfTicks =
            liftSimulator.calculateLiftTicks(passengerWeights: [60, 80, 40],
                                             passengerDestinationFloors: [2, 3, 6],
                                             floors: 6,
                                             maxPassengersPerLift: 2,
                                             maxWeightPerLift: 200,
                                             numberOfNormalLifts: 1,
                                             numberOfExpressLifts: 1)
        
        print("Total Number Of Ticks: \(numberOfTicks)")
        
        XCTAssert(numberOfTicks == 10)
    }
    
    func testLiftSimulator_3passengers_1regularLift_1expressLift_allEvenFloors_liftsCanOnlyHold1() {
        let numberOfTicks =
            liftSimulator.calculateLiftTicks(passengerWeights: [60, 80, 40],
                                             passengerDestinationFloors: [2, 4, 6],
                                             floors: 6,
                                             maxPassengersPerLift: 1,
                                             maxWeightPerLift: 200,
                                             numberOfNormalLifts: 1,
                                             numberOfExpressLifts: 1)
        
        print("Total Number Of Ticks: \(numberOfTicks)")
        
        XCTAssert(numberOfTicks == 19)
    }
    
    func testLiftSimulator_3passengers_1regularLift_1expressLift_allEvenFloors_liftsCanOnlyHold2() {
        let numberOfTicks =
            liftSimulator.calculateLiftTicks(passengerWeights: [60, 80, 40],
                                             passengerDestinationFloors: [2, 4, 6],
                                             floors: 6,
                                             maxPassengersPerLift: 2,
                                             maxWeightPerLift: 200,
                                             numberOfNormalLifts: 1,
                                             numberOfExpressLifts: 1)
        
        print("Total Number Of Ticks: \(numberOfTicks)")
        
        XCTAssert(numberOfTicks == 16)
    }
    
    func testLiftSimulator_3passengers_1regularLift_1expressLift_allEvenFloors_liftsCanHoldAll3() {
        let numberOfTicks =
            liftSimulator.calculateLiftTicks(passengerWeights: [60, 80, 40],
                                             passengerDestinationFloors: [2, 4, 6],
                                             floors: 6,
                                             maxPassengersPerLift: 3,
                                             maxWeightPerLift: 200,
                                             numberOfNormalLifts: 1,
                                             numberOfExpressLifts: 1)
        
        print("Total Number Of Ticks: \(numberOfTicks)")
        
        XCTAssert(numberOfTicks == 11)
    }
    
    func testLiftSimulator_1passenger_1regularlift() {
        let numberOfTicks =
            liftSimulator.calculateLiftTicks(passengerWeights: [60],
                                             passengerDestinationFloors: [4],
                                             floors: 5,
                                             maxPassengersPerLift: 2,
                                             maxWeightPerLift: 200,
                                             numberOfNormalLifts: 1,
                                             numberOfExpressLifts: 0)
        
        print("Total Number Of Ticks: \(numberOfTicks)")
        
        XCTAssert(numberOfTicks == 9)
    }
    
    // Error Testing
    func testLiftSimulator_1farTooHeavyPassenger_1regularlift() {
        let numberOfTicks =
            liftSimulator.calculateLiftTicks(passengerWeights: [300],
                                             passengerDestinationFloors: [5],
                                             floors: 5,
                                             maxPassengersPerLift: 2,
                                             maxWeightPerLift: 200,
                                             numberOfNormalLifts: 1,
                                             numberOfExpressLifts: 0)
        
        print("Total Number Of Ticks: \(numberOfTicks)")
        
        XCTAssert(numberOfTicks == 1)
    }
    
    func testLiftSimulator_1passenger_1heavyPassenger_1regularlift() {
        let numberOfTicks =
            liftSimulator.calculateLiftTicks(passengerWeights: [60, 300],
                                             passengerDestinationFloors: [4, 5],
                                             floors: 5,
                                             maxPassengersPerLift: 2,
                                             maxWeightPerLift: 200,
                                             numberOfNormalLifts: 1,
                                             numberOfExpressLifts: 0)
        
        print("Total Number Of Ticks: \(numberOfTicks)")
        
        XCTAssert(numberOfTicks == 9)
    }
    
    func testLiftSimulator_1passenger_0regularlifts() {
        let numberOfTicks =
            liftSimulator.calculateLiftTicks(passengerWeights: [60, 300],
                                             passengerDestinationFloors: [4, 5],
                                             floors: 5,
                                             maxPassengersPerLift: 2,
                                             maxWeightPerLift: 200,
                                             numberOfNormalLifts: 0,
                                             numberOfExpressLifts: 1)
        
        print("Total Number Of Ticks: \(numberOfTicks)")
        
        XCTAssert(numberOfTicks == 0)
    }

}
