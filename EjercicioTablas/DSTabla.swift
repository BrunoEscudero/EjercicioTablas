//
//  DSTabla.swift
//  EjercicioTablas
//
//  Created by Master Moviles on 18/10/24.
//

import Foundation
import UIKit

class DSTabla: NSObject, UITableViewDataSource {
    
    //en la clase DSTabla, definimos e inicializamos la propiedad
    var lista = ["Daenerys Targaryen", "Jon Nieve", "Cersei Lannister", "Eddard Stark"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = lista[indexPath.row]
        
        return cell
    }
    
}
