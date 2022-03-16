//
//  Note.swift
//  NotesApp WatchKit Extension
//
//  Created by Antonio Paz on 15/03/22.
//

/* necesitamos utilizar el protocolo identifiable para que nos de un id pero este id le tenemos que pasar un identificador universal por lo tanto tenemos que crear un constructor que genere este id y nos de la fecha pero la fecha nos da un formato muy grande por lo que tenemos que formatear la fecha por ultimo le estamos diciendo que creationdate le vamos a pasar una fecha formateada del dato que almacenamos en date.
 
    El protocolo codable es para que la informacion pueda ser guardada y recueperada por json
 
 
 
 */



import SwiftUI

struct Note:Codable, Identifiable{
    var id: UUID
    
    
    var title:String
    var creationDate:String
    
    init(title: String){
        
        self.id = UUID()
        self.title = title
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        
        self.creationDate = dateFormatter.string(from: date)
        
        
    }
    
    
}
