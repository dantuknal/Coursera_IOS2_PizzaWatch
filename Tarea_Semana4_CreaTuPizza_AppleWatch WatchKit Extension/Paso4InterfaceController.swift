//
//  Paso4InterfaceController.swift
//  Tarea_Semana4_CreaTuPizza_AppleWatch
//
//  Created by Diseño01 on 13/05/16.
//  Copyright © 2016 DanTuknal. All rights reserved.
//

import WatchKit
import Foundation


class Paso4InterfaceController: WKInterfaceController {

    var PizzaOrder = Order ()
    
    let ingredientes : [String] = ["Jamon","Pepperoni","Pavo","Tocino","Aceituna","Cebolla","Pimiento","Piña","Alcachofa"]
    
    @IBOutlet var sw1: WKInterfaceSwitch!
    @IBOutlet var sw2: WKInterfaceSwitch!
    @IBOutlet var sw3: WKInterfaceSwitch!
    @IBOutlet var sw4: WKInterfaceSwitch!
    @IBOutlet var sw5: WKInterfaceSwitch!
    @IBOutlet var sw6: WKInterfaceSwitch!
    @IBOutlet var sw7: WKInterfaceSwitch!
    @IBOutlet var sw8: WKInterfaceSwitch!
    @IBOutlet var sw9: WKInterfaceSwitch!
    
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
        //botonOK.setEnabled(false)
        
        if PizzaOrder.ingredientes.count != 0 {
            if compareItem (ingredientes[0]) {
                sw1.setOn(true)
            }
            if compareItem (ingredientes[1]) {
                sw2.setOn(true)
            }
            if compareItem (ingredientes[2]) {
                sw3.setOn(true)
            }
            if compareItem (ingredientes[3]) {
                sw4.setOn(true)
            }
            if compareItem (ingredientes[4]) {
                sw5.setOn(true)
            }
            if compareItem (ingredientes[5]) {
                sw6.setOn(true)
            }
            if compareItem (ingredientes[6]) {
                sw7.setOn(true)
            }
            if compareItem (ingredientes[7]) {
                sw8.setOn(true)
            }
            if compareItem (ingredientes[8]) {
                sw9.setOn(true)
            }
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
    
    
    @IBAction func select1(value: Bool) {
        SelectDeselectBot(sw1, value: value, label: ingredientes[0])
    }
    @IBAction func select2(value: Bool) {
        SelectDeselectBot(sw2, value: value, label: ingredientes[1])
    }
    @IBAction func select3(value: Bool) {
        SelectDeselectBot(sw3, value: value, label: ingredientes[2])
    }
    @IBAction func select4(value: Bool) {
        SelectDeselectBot(sw4, value: value, label: ingredientes[3])
    }
    @IBAction func select5(value: Bool) {
        SelectDeselectBot(sw5, value: value, label: ingredientes[4])
    }
    @IBAction func select6(value: Bool) {
        SelectDeselectBot(sw6, value: value, label: ingredientes[5])
    }
    @IBAction func select7(value: Bool) {
        SelectDeselectBot(sw7, value: value, label: ingredientes[6])
    }
    @IBAction func select8(value: Bool) {
        SelectDeselectBot(sw8, value: value, label: ingredientes[7])
    }
    @IBAction func select9(value: Bool) {
        SelectDeselectBot(sw9, value: value, label: ingredientes[8])
    }
    
    
    func SelectDeselectBot(obj:WKInterfaceSwitch,value: Bool, label:String){
        
        if (value) {
            
            if PizzaOrder.ingredientes.count <= 4 {
                
                selectItem (label)
                print(PizzaOrder.ingredientes.count,PizzaOrder.ingredientes)
                
            } else {
                
                obj.setOn(false)
                
            }
            
        } else {
            
            for var i = 0; i < PizzaOrder.ingredientes.count; i++ {
                if PizzaOrder.ingredientes[i] == label{
                    PizzaOrder.ingredientes.removeAtIndex(i)
                }
            }
            
        }
        
    }
    
    func selectItem (item:String){
        PizzaOrder.ingredientes += ["\(item)"]
    }
    
    func compareItem (item:String) -> Bool {
        var es = false
        for var i = 0; i < PizzaOrder.ingredientes.count; i++ {
            if PizzaOrder.ingredientes[i] == item {
                es = true
            }
        }
        return es
    }
    
    
    @IBAction func selectOK() {
        if PizzaOrder.ingredientes.count != 0 {
            if !PizzaOrder.ordenar {
                pushControllerWithName("menu", context: PizzaOrder)
            } else {
                pushControllerWithName("confirm", context: PizzaOrder)
            }
        } else {
            descAlert.setText("Debes seleccionar al menos un ingrediente!")
            descAlert.setTextColor(UIColor.redColor())
        }
    }

}
