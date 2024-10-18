//
//  ViewController.swift
//  EjercicioTablas
//
//  Created by Master Moviles on 18/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var campo: UITextField!
    // Instancia de DSTabla
    let dataSource = DSTabla()
    // Instancia de DelegateTabla
    let delegateTabla = DelegateTabla()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Asignar el dataSource y el delegate de la tabla
        tabla.dataSource = dataSource
        tabla.delegate = delegateTabla
    }
    
    @IBAction func botonInsertar(_ sender: UIButton) {

        guard let nuevoDato = campo.text, !nuevoDato.isEmpty else {
            return
        }
        
        // Insertar el nuevo dato en el array de datos de DSTabla
        dataSource.lista.append(nuevoDato)
        
        // Calcular la posición de la nueva fila
        let nuevaFilaIndex = IndexPath(row: dataSource.lista.count - 1, section: 0)
        
        // Insertar la nueva fila en la tabla
        tabla.insertRows(at: [nuevaFilaIndex], with: .automatic)
        
        // Limpiar el campo de texto
        campo.text = ""
    }
    
    // Clase DelegateTabla que actuará como delegate de la tabla
    class DelegateTabla: NSObject, UITableViewDelegate {

        // Este método se llama cuando una fila es seleccionada
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            // Obtener la celda seleccionada
            if let cell = tableView.cellForRow(at: indexPath) {
                
                // Comprobamos el color del texto para alternar entre rojo y negro
                if cell.textLabel?.textColor == UIColor.red {
                    // Si está en rojo, lo cambiamos a negro y quitamos el checkmark
                    cell.textLabel?.textColor = UIColor.black
                    cell.accessoryType = .none
                } else {
                    // Si está en negro, lo cambiamos a rojo y añadimos el checkmark
                    cell.textLabel?.textColor = UIColor.red
                    cell.accessoryType = .checkmark
                }
            }
            
            // Desmarca la celda después de la selección para evitar que quede resaltada
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}

