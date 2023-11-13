//
//  LoginController.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit
import CoreData
import Toaster

class LoginController: NSObject {
    
    func IniciarSesion(username: String, contrasenia: String) -> (success: Bool, rol: String?) {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        guard let bd = delegate?.persistentContainer.viewContext else {
            print("Error al obtener el contexto de la base de datos")
            return (false, nil)
        }
        
        let fetchRequest = NSFetchRequest<UsuarioEntity>(entityName: "UsuarioEntity")
        
        let condicion1 = NSPredicate(format: "username == %@", username)
        let condicion2 = NSPredicate(format: "contrasenia == %@", contrasenia)
        
        let unir = NSCompoundPredicate(andPredicateWithSubpredicates: [condicion1, condicion2])
        
        fetchRequest.predicate = unir
        
        do {
            let resultado = try bd.fetch(fetchRequest)
            
            guard let usuario = resultado.first else {
                // No se encontró un usuario con las credenciales proporcionadas
                return (false, nil)
            }
            
            // Aquí puedes agregar la condición basada en el rol del usuario
            if let rol = usuario.rol {
                if rol == "administrador" {
                    return (true, "administrador")
                } else if rol == "usuario" {
                    return (true, "usuario")
                } else {
                    // Puedes manejar otros roles aquí si es necesario
                    return (false, nil)
                }
            } else {
                print("Error: El rol del usuario es nil")
                return (false, nil)
            }
            
        } catch {
            print("Error al recuperar datos de inicio de sesión: \(error)")
            return (false, nil)
        }
    }
    
    func cambiarContrasena(correo: String, nuevaContraseña: String, confirmarNuevaContraseña: String) -> Bool {
            // Validar que los campos no estén vacíos
            guard !correo.isEmpty, !nuevaContraseña.isEmpty, !confirmarNuevaContraseña.isEmpty else {
                Toast(text: "Todos los campos son obligatorios").show()
                return false
            }

            let delegate = UIApplication.shared.delegate as! AppDelegate
            let bd = delegate.persistentContainer.viewContext

            let fetchRequest = NSFetchRequest<UsuarioEntity>(entityName: "UsuarioEntity")
            fetchRequest.predicate = NSPredicate(format: "correo == %@", correo)

            do {
                let usuarios = try bd.fetch(fetchRequest)

                guard let usuario = usuarios.first else {
                    // El correo no existe en la base de datos
                    Toast(text: "Correo no encontrado").show()
                    return false
                }

                // Verificar que la nueva contraseña coincida con la confirmación
                guard nuevaContraseña == confirmarNuevaContraseña else {
                    // La nueva contraseña y la confirmación no coinciden
                    Toast(text: "La nueva contraseña y la confirmación no coinciden").show()
                    return false
                }

                // Actualizar la contraseña
                usuario.contrasenia = nuevaContraseña

                // Guardar los cambios en Core Data
                try bd.save()

                Toast(text: "Contraseña cambiada exitosamente").show()
                return true
            } catch {
                print("Error al cambiar la contraseña: \(error.localizedDescription)")
                return false
            }
        }

}
