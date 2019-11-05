//
//  Evento.swift
//  eventos
//
//  Created by Alumno on 11/1/19.
//  Copyright © 2019 fer. All rights reserved.
//

import Foundation

class Evento {
    var nombre : String
    var fecha : String
    var urlFlyer : String
    
    var lugar : String?
    var tipoEvento : String?
    
    init(nombre : String, fecha : String, urlFlyer : String) {
        self.nombre = nombre
        self.fecha = fecha
        self.urlFlyer = urlFlyer
    }
    
    init(diccionar : NSDictionary){
        self.nombre = ""
        if let title = diccionar.value(forKey: "title") as? NSDictionary {
            if let rendered = title.value(forKey: "rendered") as? String {
                self.nombre = rendered
            }
        }
        
        self.fecha = ""
        self.urlFlyer = ""
        if let acf = diccionar.value(forKey: "acf") as? NSDictionary {
            if let fecha = acf.value(forKey: "fecha") as? String{
                self.fecha = fecha
            }
            if let flyer = acf.value(forKey: "flyer") as? String{
                self.urlFlyer = flyer
            }
        }
    }
}
