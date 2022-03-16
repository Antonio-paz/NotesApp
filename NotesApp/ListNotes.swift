//
//  ListNotes.swift
//  NotesApp WatchKit Extension
//
//  Created by Antonio Paz on 15/03/22.
//



//cuando nosotros queremos eliminar una nota vamos a utilizar un for eacth

//vamos a utilizar un onapper para hacer el cargado de nuestras notas esto es por que cuando tenga la informacion aparecera en pantalla.
import SwiftUI

struct ListNotes: View {
    
    @State private var notes = [Note]()
    
    var body: some View {
        
       
        
        VStack{
            
            Text("Notas \(notes.count)")
            List{
                
                
                    ForEach(0..<notes.count, id: \.self){
                        
                        i in
                        
                        NavigationLink(destination: DetailNote(note: notes[i]), label: {
                            
                            Text(notes[i].title)
                                .lineLimit(1)
                            
                        })
                    }
                    .onDelete(perform: delete)
                
            }
        }.onAppear(perform: {
            
            notes = Tools.shared.load()
        })
    }
    
    func delete(offsets: IndexSet){
        
        withAnimation{
            
            notes.remove(atOffsets: offsets)
            
            
        }
        
        Tools.shared.save(array: notes)
        
    }
}

struct ListNotes_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListNotes()
            
        }
    }
}
