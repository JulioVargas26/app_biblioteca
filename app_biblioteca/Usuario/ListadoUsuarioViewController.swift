//
//  ListadoUsuarioViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 30/11/23.
//

import UIKit

class ListadoUsuarioViewController: UIViewController ,UITableViewDataSource,
                                    UITableViewDelegate{

    @IBOutlet weak var tvUsuario: UITableView!
    
    var listaUsuario:[UsuarioEntity]=[]
    var pos = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        listaUsuario=UsuarioController().listarUsuario()
        tvUsuario.dataSource=self
                //
        tvUsuario.delegate=self
                //
        tvUsuario.rowHeight=130
        
        tvUsuario.reloadData()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return listaUsuario.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //crear objeto de la clase ItemTableViewCell invocando
        //a "celda"
        let row=tvUsuario.dequeueReusableCell(withIdentifier: "ItemUsuario")
                  as! ItemUsuarioTableViewCell
        //imprimir datos
        row.lblNombre.text=listaUsuario[indexPath.row].nombre
        row.lblUsuario.text=listaUsuario[indexPath.row].username
        row.lblRol.text=listaUsuario[indexPath.row].rol
        return row
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pos=indexPath.row
        performSegue(withIdentifier: "editUsuario", sender: self)
        print("pos",pos)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            tableView.beginUpdates()
            var del=listaUsuario.remove(at: indexPath.row)
            UsuarioController().eliminarUsuario(bean: del)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
        if segue.identifier=="editUsuario"{
            //crear objeto de la clase EditarViewController
            let pantalla2=segue.destination as! EditarUsuarioViewController
            //acceder
            pantalla2.data=listaUsuario[pos]
        }
           
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
