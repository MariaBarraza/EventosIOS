//
//  ViewController.swift
//  eventos
//
//  Created by Alumno on 11/1/19.
//  Copyright © 2019 fer. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var eventos : [Evento] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("http://localhost:8888/eventos/wp-json/wp/v2/eventos").responseJSON {
            response in switch(response.result){
            case .success(let datos) :
                if let arregloEventos = datos as? NSArray{
                    for evento in arregloEventos {
                        if let diccionarioEvento = evento as? NSDictionary{
                            let nuevoEvento = Evento(diccionar: diccionarioEvento)
                            self.eventos.append(nuevoEvento)
                        }
                    }
                }
            case .failure( _) :
                print("Algo salió mal")
            }
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "cellEvento") as? CeldaEventoController
        celda?.lblNombre.text = eventos[indexPath.row].nombre
        celda?.lblFecha.text = eventos[indexPath.row].fecha
        
        return celda!
    }
}

