//
//  InterfaceController.swift
//  Tarea_Semana4_CreaTuPizza_AppleWatch WatchKit Extension
//
//  Created by Diseño01 on 10/05/16.
//  Copyright © 2016 DanTuknal. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var PizzaOrder = Order()
    
    @IBOutlet var botOrdenar: WKInterfaceButton!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        botOrdenar.setBackgroundColor(UIColor(red: 226/255, green: 101/255, blue: 47/255, alpha: 1))
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func NuevaOrden() {
        pushControllerWithName("menu", context: PizzaOrder)
    }

}
