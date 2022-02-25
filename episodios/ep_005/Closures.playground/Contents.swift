import Foundation

if true {
//   print("Hola")
    
    let x = 0
    
    x
}

do {
    let y: Int = 9
    
    
}

func greetings() -> Void {
    print("greetings")
}

let greet = greetings

//greetings()
//greet()

func customGreeting(functionGreeting: () -> Void) {
    print(" xxxxxxx ")
    functionGreeting()
}

customGreeting(functionGreeting: greetings)
customGreeting(functionGreeting: greet)

func otroGreeting() -> Void {
   print("Totalmente distinto")
}

customGreeting(functionGreeting: otroGreeting)


let closure = { () -> Void in
    print("greetings")
}

closure()

customGreeting(functionGreeting: { () -> Void in
    print("greetings")
})

// step 1
customGreeting(functionGreeting: {
    print("greetings")
})

// step 2
customGreeting { 
    print("greetings")
}
