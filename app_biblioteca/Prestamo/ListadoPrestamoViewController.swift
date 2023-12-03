//
//  ListadoPrestamoViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 28/11/23.
//

import UIKit
import FirebaseFirestore

class ListadoPrestamoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet weak var tvPrestamo: UITableView!
    
    var listPrestamo:[prestamo]=[]
    var pos = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tvPrestamo.dataSource=self
        //
        tvPrestamo.delegate=self
        //alto de la celda
        tvPrestamo.rowHeight = 130
        listado()
    }
    
    func listado(){
        let db = Firestore.firestore()
        db.collection("prestamo").addSnapshotListener{(data, error) in
            
            guard let info=data?.documents else {
                return
            }
            
            self.listPrestamo=info.map{(e)->prestamo in
                let row=e.data()
                let nom=row["nomUsu"] as! String
                let tit=row["titLibro"] as! String
                let fecP=row["fec_prestamo"] as! String
                let fecD=row["fec_devolucion"] as! String
                return prestamo(id: e.documentID, nomUsu: nom, titLibro: tit, fec_prestamo: fecP, fec_devolucion: fecD)
            }
            
            self.tvPrestamo.reloadData()
            print(self.listPrestamo.count)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPrestamo.count
        print("number",listPrestamo.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //crear objeto de la clase ItemTableViewCell invocando
        //a "celda"
        let row=tvPrestamo.dequeueReusableCell(withIdentifier: "ItemPrestamo") as! ItemListadoPrestamoTableViewCell
            
        row.lblTitLibroPres.text = listPrestamo[indexPath.row].titLibro
        row.lblFecDLibroPres.text = listPrestamo[indexPath.row].fec_devolucion
            print("row",row)
        return row
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            pos=indexPath.row
            performSegue(withIdentifier: "editarListPres", sender: self)
            print("pos",pos)
        }
        
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            tableView.beginUpdates()
            
           // eliminarPrestamo(x: )
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        }
    }
    
    func eliminarPrestamo(x:prestamo){
        //acceder a la base de datos
        let bd=Firestore.firestore()
        
        //acceder a la coleccion "tabla"
        bd.collection("prestamo").document(x.id).delete(){error in
            if let e=error{
                print(e.localizedDescription)
            }else{
                print("Eliminacion OK")
            }
        }
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if segue.identifier=="editarListPres"{
                //crear objeto de la clase EditarViewController
                let pantalla2=segue.destination as! EditarPrestamoViewController
                //acceder
                pantalla2.data=listPrestamo[pos]
                
                
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
