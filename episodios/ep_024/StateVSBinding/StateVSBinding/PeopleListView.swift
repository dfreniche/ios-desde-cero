//
//  PeopleListView.swift
//  StateVSBinding
//
//  Created by Diego Freniche Brito on 19/5/22.
//

import SwiftUI

struct PeopleListView: View {
    
    @State var people = [
        Person(name: "Perry", surname: "Mason"),
        Person(name: "Teniente", surname: "Colombo"),
        Person(name: "Hercules", surname: "Poirot"),
        Person(name: "Agatha", surname: "Christie"),
        Person(name: "Antonio", surname: "Torrente"),
        Person(name: "Harry", surname: "Bosh"),
    ]
    
    var body: some View {
        
        NavigationView {
            List($people) { person in
                NavigationLink(destination: PersonEditorView(person: person)) {
                    // this is the "cell"
                    Text("\(person.wrappedValue.name)")
                }
            }
            .navigationTitle("Private Investigators")
        }.onAppear() {
            people.append(Person(name: "Added", surname: "Now"))
        }
        
    }
}

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView()
    }
}
