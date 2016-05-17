//
//  EndInterfaceController.swift
//  Tarea_Semana4_CreaTuPizza_AppleWatch
//
//  Created by Diseño01 on 13/05/16.
//  Copyright © 2016 DanTuknal. All rights reserved.
//

import WatchKit
import Foundation


class EndInterfaceController: WKInterfaceController {

   var PizzaOrder = Order()
    
    @IBOutlet var botonOK: WKInterfaceButton!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        botonOK.setBackgroundColor(UIColor(red: 226/255, green: 101/255, blue: 47/255, alpha: 1))
        
        PizzaOrder.param1 = ""
        PizzaOrder.param2 = ""
        PizzaOrder.param3 = ""
        PizzaOrder.ingredientes = []
        
        PizzaOrder.param1value = 0
        PizzaOrder.param2value = 0
        PizzaOrder.param3value = 0
        
        PizzaOrder.ordenar = false
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func placeNewOrder() {
        pushControllerWithName("menu", context: PizzaOrder)
    }

}
