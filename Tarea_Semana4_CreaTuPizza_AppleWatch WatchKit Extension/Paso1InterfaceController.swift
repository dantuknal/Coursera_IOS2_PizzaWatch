//
//  Paso1InterfaceController.swift
//  Tarea_Semana4_CreaTuPizza_AppleWatch
//
//  Created by Diseño01 on 13/05/16.
//  Copyright © 2016 DanTuknal. All rights reserved.
//

import WatchKit
import Foundation


class Paso1InterfaceController: WKInterfaceController {
    
    var PizzaOrder = Order ()
    
    let size : [String] = ["Chica","Mediana","Grande"]
    
    @IBOutlet var sizeslide: WKInterfaceSlider!
    @IBOutlet var sizeSelect: WKInterfaceLabel!
    @IBOutlet var descAlert: WKInterfaceLabel!
    
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
        
        PizzaOrder.ordenar = c.ordenar
        
        botonOK.setBackgroundColor(UIColor(red: 226/255, green: 101/255, blue: 47/255, alpha: 1))
        
        if PizzaOrder.param1 != "" {
            sizeSelect.setText(PizzaOrder.param1)
            sizeslide.setValue(Float(PizzaOrder.param1value))
            
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
    
    @IBAction func selectSize(value: Float) {
        sizeSelect.setText(size[Int(value)])
        PizzaOrder.param1 = size[Int(value)]
        PizzaOrder.param1value = Int(value)
    }
    
    @IBAction func selectOK() {
        if PizzaOrder.param1 != "" {
            if !PizzaOrder.ordenar {
                pushControllerWithName("menu", context: PizzaOrder)
            } else {
                pushControllerWithName("confirm", context: PizzaOrder)
            }
        } else {
            descAlert.setText("Debes seleccionar un tamaño!")
            descAlert.setTextColor(UIColor.redColor())
        }
    }
    
}
