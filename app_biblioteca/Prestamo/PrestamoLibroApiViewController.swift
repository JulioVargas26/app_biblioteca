//
//  PrestamoLibroApiViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 20/11/23.
//

import UIKit
import FirebaseFirestore

class PrestamoLibroApiViewController: UIViewController {

    @IBOutlet weak var txtIdUser: UITextField!
    @IBOutlet weak var txtTitLibroApi: UITextField!
    @IBOutlet weak var txtFecPrestamo: UITextField!
    @IBOutlet weak var txtFecDevolucion: UITextField!
    @IBOutlet weak var ckAceLibApi: UIButton!
    
    let defaults = UserDefaults.standard
    
    
    
    var datPresLibApi:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let sesionMenu = defaults.object(forKey: "IDUSER") as! [String:String]
        let sesionNombre = sesionMenu["sesionNOM"]
        
        //let dateFormatter = DateFormatter()
        //    dateFormatter.dateFormat = "yyyy-MM-dd"
        
        txtIdUser.text=sesionNombre
        txtTitLibroApi.text=datPresLibApi
        txtFecPrestamo.text=String(Date.now.formatted())
        txtFecDevolucion.text=String(Date.now.formatted())
    }
    
    @IBAction func btnPrestar(_ sender: UIButton) {
        
        let usu=txtIdUser.text ?? ""
        let tit=txtTitLibroApi.text ?? ""
        let fecP=txtFecPrestamo.text ?? ""
        let fecD=txtFecDevolucion.text ?? ""
        let bean=prestamo(id: "", nomUsu: usu, titLibro: tit, fec_prestamo: fecP, fec_devolucion: fecD)
        
        registrarPrestamo(pres: bean)
        
    }
    
    func registrarPrestamo(pres:prestamo){
        let db = Firestore.firestore()
        //GENERAR EL ID DEL DOCUMENTO
        let ID = UUID().uuidString
        //ACCEDER A LA COLECCION
        
        db.collection("prestamo").document(ID).setData([
            "nomUsu" : pres.nomUsu,
            "titLibro" : pres.titLibro,
            "fec_prestamo" : pres.fec_prestamo,
            "fec_devolucion" : pres.fec_devolucion
        ]){ ex in
            if let e = ex {
                print(e.localizedDescription)
            }
            else {
                print("REGISTRO EXITOSO")
                self.mostrarAlerta()
            }
        }
    }
    
    func mostrarAlerta() {
            let alerta = UIAlertController(title: "Registro Exitoso", message: "El Prestamo se registró correctamente.", preferredStyle: .alert)
            
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
