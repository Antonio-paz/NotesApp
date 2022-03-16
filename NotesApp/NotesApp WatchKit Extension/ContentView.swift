//
//  ContentView.swift
//  NotesApp WatchKit Extension
//
//  Created by Antonio Paz on 15/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
                NavigationLink("Agregar Nota", destination: AddNote())
                NavigationLink("Listar Notas", destination: ListNotes())
        }
        .navigationTitle("Notes App")
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
