//
//  ViewController.swift
//  eventos
//
//  Created by Alumno on 11/1/19.
//  Copyright © 2019 fer. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var eventos : [Evento] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

