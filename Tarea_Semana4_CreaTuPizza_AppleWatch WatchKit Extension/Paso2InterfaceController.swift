//Paso2InterfaceController.swift
//  Tarea_Semana4_CreaTuPizza_AppleWatch
//
//  Created by Diseño01 on 13/05/16.
//  Copyright © 2016 DanTuknal. All rights reserved.
//

import WatchKit
import Foundation


class Paso2InterfaceController: WKInterfaceController {
    
    var PizzaOrder = Order ()
    
    let crust : [String] = ["Delgada","Crujiente","Gruesa"]
    
    @IBOutlet var descAlert: WKInterfaceLabel!
    @IBOutlet var picker: WKInterfacePicker!
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
        
        var pickerItems: [WKPickerItem] = []
        for i in 0...2 {
            let item = WKPickerItem()
            item.title = crust[i]
            if crust[i] == PizzaOrder.param2 {
                picker.setSelectedItemIndex(i)
            }
            pickerItems.append(item)
        }
        picker.setItems(pickerItems)
        
        picker.setSelectedItemIndex(PizzaOrder.param2value)
        
        botonOK.setBackgroundColor(UIColor(red: 226/255, green: 101/255, blue: 47/255, alpha: 1))
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    @IBAction func selectCrust(value: Int) {
        PizzaOrder.param2 = crust[value]
        PizzaOrder.param2value = value
    }
    
    @IBAction func selectOK() {
        if PizzaOrder.param2 != "" {
            if !PizzaOrder.ordenar {
                pushControllerWithName("menu", context: PizzaOrder)
            } else {
                pushControllerWithName("confirm", context: PizzaOrder)
            }
        } else {
            descAlert.setText("Debes seleccionar un tipo de masa!")
            descAlert.setTextColor(UIColor.redColor())
        }
    }
}
