//
//  ConfirmInterfaceController.swift
//  Tarea_Semana4_CreaTuPizza_AppleWatch
//
//  Created by Diseño01 on 13/05/16.
//  Copyright © 2016 DanTuknal. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmInterfaceController: WKInterfaceController {

    var PizzaOrder = Order ()
    
    @IBOutlet var l1: WKInterfaceLabel!
    @IBOutlet var l2: WKInterfaceLabel!
    @IBOutlet var l3: WKInterfaceLabel!
    @IBOutlet var l4: WKInterfaceLabel!
    
    @IBOutlet var botonCambiar1: WKInterfaceButton!
    @IBOutlet var botonCambiar2: WKInterfaceButton!
    @IBOutlet var botonCambiar3: WKInterfaceButton!
    @IBOutlet var botonCambiar4: WKInterfaceButton!
    
     @IBOutlet var botonOK: WKInterfaceButton!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        let c = context as! Order
        PizzaOrder.param1 = c.param1
        PizzaOrder.param2 = c.param2
        PizzaOrder.param3 = c.param3
        PizzaOrder.ingredientes = c.ingredientes
        
        PizzaOrder.param1value = c.param1value
        PizzaOrder.param2value = c.param2value
        PizzaOrder.param3value = c.param3value
        
        PizzaOrder.ordenar = true
        
        botonOK.setBackgroundColor(UIColor(red: 226/255, green: 101/255, blue: 47/255, alpha: 1))
        
        l1.setText(PizzaOrder.param1)
        l2.setText(PizzaOrder.param2)
        l3.setText(PizzaOrder.param3)
        l4.setText(PizzaOrder.ingredientes.joinWithSeparator("\u{0085}"))
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func changeSize() {
        pushControllerWithName("paso1", context: PizzaOrder)
    }
    @IBAction func changeCrust() {
        pushControllerWithName("paso2", context: PizzaOrder)
    }
    @IBAction func changeCheese() {
        pushControllerWithName("paso3", context: PizzaOrder)
    }
    @IBAction func changeIngredients() {
        pushControllerWithName("paso4", context: PizzaOrder)
    }
    @IBAction func CancelOrder() {
        PizzaOrder.param1 = ""
        PizzaOrder.param2 = ""
        PizzaOrder.param3 = ""
        PizzaOrder.ingredientes = []
        PizzaOrder.param1value = 0
        PizzaOrder.param2value = 0
        PizzaOrder.param3value = 0
        PizzaOrder.ordenar = false
        pushControllerWithName("menu", context: PizzaOrder)
    }
    @IBAction func placeOrder() {
        pushControllerWithName("end", context: PizzaOrder)
    }
    

}
