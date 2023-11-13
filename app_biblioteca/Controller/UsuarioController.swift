//
//  UsuarioController.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit

class UsuarioController: NSObject {
    
    /*******  ESTA CLASE SER PARA TENER LOS METODOS PARA EL CRUD EN LA BD  * ******/
    
    //METODO PARA REGISTRAR
    func registrarUsuario(bean:Usuario){
    //PASOS 1 : objeto de la clase appdelegate , osea del delegate la bd creamos el objeto
        //accdeder a la clase Appdelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        
    //PASO 2
        //acceder a la coneccion de la bd de ese objeto
        let contextoBD=delegate.persistentContainer.viewContext
        
    //PASO 3
        // establecer tablas , debemos especificar q tipo de tabla de ese objeto para decidir a que insertar .etc//
        //objeto del cliente de la clase guia , obtiene UsuarioEntity es tu entidad en la tabla
        //UsuarioEntity es la tabla
        let obj=UsuarioEntity(context: contextoBD)
        
    //PASO 4
        //asignar valor a los atributos del objeto tabla
        //bean es el objeto parametro , fijarse en los tipos de datos o convertir , segun el CoreDataModel
        obj.id=Int16(bean.id)
        obj.nombre=bean.nombre
        obj.direccion=bean.direccion
        obj.correo=bean.correo
        obj.telefono=Int32(bean.telefono)
        obj.username=bean.username
        obj.contrasenia=bean.contrasenia
        obj.rol=bean.rol
        
    //PASO 5
        //controlar exceptiones, pueden haber errores
        do{
            
    //PASO 6
            //grabar o insertar en la tabla
            try contextoBD.save()
            print("Usuario registrado")
            
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
    }
    
    //METODO PARA LISTAR
    //ClienteEntity es la tabla a listar
    func listarUsuario()-> [UsuarioEntity]{
        
        //declarar, esto es q despues sera inizializado
        var datos:[UsuarioEntity]!
        
    //PASOS 1 : objeto de la clase appdelegate , osea del delegate la bd creamos el objeto
            //accdeder a la clase Appdelegate
            let delegate=UIApplication.shared.delegate as! AppDelegate
            
    //PASO 2
        //acceder a la coneccion de la bd de ese objeto
            let contextoBD=delegate.persistentContainer.viewContext
            
    //PASO 3
        //controlar execpiones
        do{
    //PASO 4:
            //obtener el contenido de UsuarioEntity
            let lista=UsuarioEntity.fetchRequest()
            
    //PASO 5 :
            //leer filas del objeto registros y guardar en datos , osea es como  1 while para cada fila (el fetch)
            datos = try contextoBD.fetch(lista)
            
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
        
        //retorna la fila lista para listar
        return datos
    }
    
    //METODO PARA ACTUALIZAR
    func actualizarUsuario(bean:UsuarioEntity){
        
    //PASOS 1 : objeto de la clase appdelegate , osea del delegate la bd creamos el objeto
        //accdeder a la clase Appdelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        
    //PASO 2
        //acceder a la coneccion de la bd de ese objeto
        let contextoBD=delegate.persistentContainer.viewContext
        
    //PASO 3
        //controlar exceptiones, pueden haber errores
        do{
    //PASO 4
            //grabar o insertar en la tabla
            try contextoBD.save()
            print("Usuario actualizado")
            
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
    }
    
    //METODO PARA ELIMINAR
    func eliminarUsuario(bean:UsuarioEntity){
        
    //PASOS 1 : objeto de la clase appdelegate , osea del delegate la bd creamos el objeto
        //accdeder a la clase Appdelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
        
    //PASO 2
        //acceder a la coneccion de la bd de ese objeto
        let contextoBD=delegate.persistentContainer.viewContext
        
    //PASO 3
        //controlar exceptiones, pueden haber errores
        do{
    //PASO 4
            //eliminar en la tabla
            contextoBD.delete(bean)
    //PASO 5
            //grabar o insertar en la tabla
            try contextoBD.save()
            print("Usuario ELIMINADO")
            
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
    }
    
    //METODO PARA BUSCAR
    //retorna 1 objeto de Usuario
    func buscarUsuario(apellido:String)-> [UsuarioEntity]{
        
        //declarar , ! esto es q despues sera inizializado
        var datos:[UsuarioEntity]!
        
        
    //PASOS 1 : objeto de la clase appdelegate , osea del delegate la bd creamos el objeto
        //accdeder a la clase Appdelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate
            
    //PASO 2
        //acceder a la coneccion de la bd de ese objeto
        let contextoBD=delegate.persistentContainer.viewContext
            
    //PASO 3
        //controlar execpiones
        do{
    //PASO 4
            //obtener el contenido de UsuarioEntity
            let lista=UsuarioEntity.fetchRequest()
            
    //PASO 5
            //filtro ,"titulo" igual del  modelo , BEGINSWITH[c] ignora mayuscu y minis , %@ filtro en base cadena
            let predicate=NSPredicate(format: "apellido BEGINSWITH[c] %@", apellido)
            
    //PASO 6
            //enviar filtro
            lista.predicate=predicate
            
    //PASO 7
            //leer filas del objeto registros y guardar en datos , osea es como  1 while para cada fila (el fetch)
            //ACA SE GUARDA TODO
            datos = try contextoBD.fetch(lista)
            
        }catch let ex as NSError{
            print(ex.localizedDescription)
        }
        
        //retorna la fila lista para listar
        return datos
    }
    
    
    
}
