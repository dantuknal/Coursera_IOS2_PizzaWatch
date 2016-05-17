//
//  MenuInterfaceController.swift
//  Tarea_Semana4_CreaTuPizza_AppleWatch
//
//  Created by Diseño01 on 13/05/16.
//  Copyright © 2016 DanTuknal. All rights reserved.
//

import WatchKit
import Foundation


class MenuInterfaceController: WKInterfaceController {
    
    var PizzaOrder = Order ()
    
    @IBOutlet var descAlert: WKInterfaceLabel!
    
    @IBOutlet var b1: WKInterfaceButton!
    @IBOutlet var b2: WKInterfaceButton!
    @IBOutlet var b3: WKInterfaceButton!
    @IBOutlet var b4: WKInterfaceButton!
    
    @IBOutlet var botOrdenarFin: WKInterfaceButton!
    
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
        
        PizzaOrder.ordenar = c.ordenar
        
        if PizzaOrder.param1 != "" {
            darFormatoBoton(b1,bgCol: colores[1])
        }
        if PizzaOrder.param2 != "" {
           darFormatoBoton(b2,bgCol: colores[1])
        }
        if PizzaOrder.param3 != "" {
            darFormatoBoton(b3,bgCol: colores[1])
        }
        if PizzaOrder.ingredientes.count > 0 {
            darFormatoBoton(b4,bgCol: colores[1])
        }
        
        if PizzaOrder.param1 != "" && PizzaOrder.param2 != "" && PizzaOrder.param3 != "" && PizzaOrder.ingredientes.count > 0 {
            botOrdenarFin.setHidden(false)
            botOrdenarFin.setBackgroundColor(UIColor(red: 226/255, green: 101/255, blue: 47/255, alpha: 1))
            descAlert.setText("   ¡Ya puedes ordenar!")
        } else {
            botOrdenarFin.setHidden(true)
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func selectSize() {
        pushControllerWithName("paso1", context: PizzaOrder)
    }
    
    @IBAction func selectCrust() {
        pushControllerWithName("paso2", context: PizzaOrder)
    }
    
    @IBAction func selectCheese() {
        pushControllerWithName("paso3", context: PizzaOrder)
    }
    
    @IBAction func selectIngredients() {
        pushControllerWithName("paso4", context: PizzaOrder)
    }
    
    @IBAction func PlaceOrder() {
        pushControllerWithName("confirm", context: PizzaOrder)
    }
    
}
