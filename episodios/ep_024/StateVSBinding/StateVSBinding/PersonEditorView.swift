//
//  ContentView.swift
//  StateVSBinding
//
//  Created by Diego Freniche Brito on 19/5/22.
//

import SwiftUI

struct PersonEditorView: View {
    @Binding var person: Person
    
    var body: some View {
        
        VStack {
            Text("Hello, \( person.surname ) \( person.name )")
                .padding()
            
            TextField("Name", text: $person.name)
            TextField("Surname", text: $person.surname)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PersonEditorView(person: .constant(Person(name: "Perry", surname: "Mason")))
    }
}
