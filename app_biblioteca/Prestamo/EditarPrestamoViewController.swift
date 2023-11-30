//
//  EditarPrestamoViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 29/11/23.
//

import UIKit
import FirebaseFirestore

class EditarPrestamoViewController: UIViewController {

    @IBOutlet weak var txtID: UILabel!
    @IBOutlet weak var txtUserPresLibro: UITextField!
    @IBOutlet weak var txtTitPresLibro: UITextField!
    @IBOutlet weak var txtFecPresLibro: UITextField!
    @IBOutlet weak var txtFecPresDevLibro: UITextField!
    
    var data:prestamo!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
       self.txtID.isHidden=true
        txtID.text=String(data.id)
        txtUserPresLibro.text=data.nomUsu
        txtTitPresLibro.text=data.titLibro
        txtFecPresLibro.text=data.fec_prestamo
        txtFecPresDevLibro.text=data.fec_devolucion
        
        
        
    }
    
    @IBAction func btnAmpliar(_ sender: UIButton) {
    
        //leer cajas
        let usu=txtUserPresLibro.text ?? ""
        let tit=txtTitPresLibro.text ?? ""
        let feP=txtFecPresLibro.text ?? ""
        let feD=txtFecPresDevLibro.text ?? ""
        
        
        data.nomUsu=usu
        data.titLibro=tit
        data.fec_prestamo=feP
        data.fec_devolucion=feD
                
        actualizarPrestamo(x: data)
        
    }
    func actualizarPrestamo(x:prestamo){
            //acceder a la base de datos
            let bd=Firestore.firestore()
            
            //acceder a la coleccion "tabla"
        bd.collection("prestamo").document(x.id).setData([
            "nomUsu" : x.nomUsu,
            "titLibro" : x.titLibro,
            "fec_prestamo" : x.fec_prestamo,
            "fec_devolucion" : x.fec_devolucion
            
            ]){error in
                if let e=error{
                    print(e.localizedDescription)
                }else{
                    print("Actualizacion OK")
                    
                    self.mostrarAlerta()
                }
            }
        }

    
    func mostrarAlerta() {
            let alerta = UIAlertController(title: "Actualizacion Exitoso", message: "La Fecha se Actualizo correctamente.", preferredStyle: .alert)
            
            // Puedes agregar más acciones al alerta si lo deseas
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        
            alerta.addAction(okAction)

            // Presentar la alerta
            present(alerta, animated: true, completion: nil)
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
