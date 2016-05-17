//
//  Script.swift
//  Tarea_Semana4_CreaTuPizza_AppleWatch
//
//  Created by Diseño01 on 13/05/16.
//  Copyright © 2016 DanTuknal. All rights reserved.
//

import WatchKit
import Foundation
import UIKit

class Order: NSObject {
    
    var param1:String
    var param2:String
    var param3:String
    var ingredientes:[String]
    
    var param1value:Int
    var param2value:Int
    var param3value:Int
    
    var ordenar : Bool
    
    override init (){
        self.param1 = ""
        self.param2 = ""
        self.param3 = ""
        self.ingredientes = []
        
        self.param1value = 0
        self.param2value = 0
        self.param3value = 0
        
        self.ordenar = false
    }
    
}

let colores = [
    UIColor(red: 226/255, green: 101/255, blue: 47/255, alpha: 1),
    UIColor(white: 1.0, alpha:1),
    UIColor(white: 0, alpha:0),
    UIColor(red: 0/255, green: 177/255, blue: 17/255, alpha: 1)
]

func selectItem (obj:WKInterfaceLabel,item:String,tCol:UIColor){
    obj.setText(item)
}

func darFormatoBoton (obj:WKInterfaceButton,bgCol:UIColor){
    obj.setBackgroundColor(bgCol)
}

func hideL(obj:WKInterfaceLabel) {
    obj.setHidden(true)
}

func showL(obj:WKInterfaceLabel){
    obj.setHidden(false)
}

func hideB(obj:WKInterfaceLabel) {
    obj.setHidden(true)
}

func showB(obj:WKInterfaceLabel){
    obj.setHidden(false)
}