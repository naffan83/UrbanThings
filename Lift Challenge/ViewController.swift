//
//  ViewController.swift
//  Lift Challenge
//
//  Created by Naffan on 11/12/2018.
//  Copyright © 2018 Nathan Costello. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let liftSimulator = LiftSimulator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberOfTicks =
            liftSimulator.calculateLiftTicks(passengerWeights: [60, 80, 40],
                                             passengerDestinationFloors: [2, 3, 4],
                                             floors: 5,
                                             maxPassengersPerLift: 2,
                                             maxWeightPerLift: 200,
                                             numberOfNormalLifts: 1,
                                             numberOfExpressLifts: 3)
        
        print("Total Number Of Ticks: \(numberOfTicks)")
    }
}

