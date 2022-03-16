//
//  Tools.swift
//  NotesApp WatchKit Extension
//
//  Created by Antonio Paz on 16/03/22.
//


/*
 
 Vamos a crear una clase single tom osea que vamos a tener dentro de la clase nuestros metodos para guardar o el metodo recuperar.
 
 Vamos a crear una propiedad shared y es estatic osea que no se pude guardar otra variable igual.
 
 un single tom es cuando por medio de una propiedad podemos acceder a nuestro metodo de guardado como el de carga.
 
 vamoas a crear un constructor privado para que nadie mas pueda acceder a el mas que solo la clase.
 
 set lo vamos a utilizar para guardar siempre tenemos que utilziar los userdefaults
 
 siempre necesitamos una llave para guardar
 siempre necesitamos una llave para recuperar
 
 puede ser una cadena no requieres de más.
 
 el archivo de note ya es codable por eso ya puede ser transformado a json y vamos a pasar este arreglo a json
 
 */

import Foundation

class Tools{
    
    let key:String = "NotesApp"
    
    static let shared = Tools()

    
    private init(){}
    
    func save(array: [Note]){
        
        //estamos pasando a json cada elemento del array por medio del mapeo
        let data = array.map{ try? JSONEncoder().encode($0)}
        
        UserDefaults.standard.set(data, forKey: key)
        
    }
    
    
    func load() -> [Note]{
        
        //guard es para que no se rompa. cuidado por que tenemos que combertir el arreglo a un arreglo de tipo note.
        guard let saveData = UserDefaults.standard.array(forKey: key) as? [Data] else{
            
            return []
        }
        
        //aqui estamos poniendo un force por que para este punto si o si tiene que tener datos de lo contrario fallaria en guardarlos.
        return saveData.map{try! JSONDecoder().decode(Note.self, from: $0)}
        
                
        
    }
    
}
