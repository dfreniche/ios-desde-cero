//
//  StateVSBindingApp.swift
//  StateVSBinding
//
//  Created by Diego Freniche Brito on 19/5/22.
//

import SwiftUI

@main
struct StateVSBindingApp: App {
    var body: some Scene {
        WindowGroup {
//            PersonEditorView(person: Person(name: "Perry", surname: "Mason"))
            PeopleListView()
        }
    }
}
