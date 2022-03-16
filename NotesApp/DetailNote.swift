//
//  DetailNote.swift
//  NotesApp WatchKit Extension
//
//  Created by Antonio Paz on 15/03/22.
//

import SwiftUI

struct DetailNote: View {
    //vamos a pasarnos la nota que selecione el usuario para poder mostrar el detalle
    
    let note:Note
    
    
    var body: some View {
        
        
        VStack{
                Text(note.title)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                
            
            
                Spacer()
                Text(note.creationDate)
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
        
        }
        
    }
}

struct DetailNote_Previews: PreviewProvider {
    static var previews: some View {
        DetailNote(note: Note(title: "Esta es una nota de prueba"))
    }
}
