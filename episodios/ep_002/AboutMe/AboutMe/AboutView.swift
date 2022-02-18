import SwiftUI

struct AboutView: View {
    
    let name: String
    let aboutMeText: String
    
    var body: some View {
        ScrollView {
            VStack {
                Text("About Me")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding()
                
                Text(name)
                
                Image("meUglyFace")
                    .resizable()
                    .frame(width: 300, height: 300, alignment: .center)
                    .cornerRadius(150)
                
                Spacer()
                
                Text(aboutMeText)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(15)
                
                Label("How cool is that!", systemImage: "macpro.gen1.fill")
                    .font(.largeTitle)
                    .shadow(color: .blue, radius: 5, x: 0, y: 10)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                
                Spacer()
            }
        }
    }
}


// MARK: - Previews 😂

struct ContentView_Previews: PreviewProvider {
    
    static let aboutMeText = """
    Lorem fistrum diodeno ese pedazo de te va a hasé pupitaa. La caidita por la gloria de mi madre a wan no puedor pecador diodenoo tiene musho peligro. A gramenawer ese hombree jarl ese pedazo de ahorarr. Tiene musho peligro pupita ahorarr caballo blanco caballo negroorl ese que llega me cago en tus muelas. Caballo blanco caballo negroorl torpedo ahorarr la caidita ahorarr a wan fistro torpedo.
    
    Lorem fistrum diodeno ese pedazo de te va a hasé pupitaa. La caidita por la gloria de mi madre a wan no puedor pecador diodenoo tiene musho peligro. A gramenawer ese hombree jarl ese pedazo de ahorarr. Tiene musho peligro pupita ahorarr caballo blanco caballo negroorl ese que llega me cago en tus muelas. Caballo blanco caballo negroorl torpedo ahorarr la caidita ahorarr a wan fistro torpedo.
    """
    
    static var previews: some View {
        Group {
            AboutView(name: "Diego Freniche De los Santos de La Morena Lopez", aboutMeText: aboutMeText)
                .preferredColorScheme(.dark)
            
            AboutView(name: "Pepito", aboutMeText: "About text")
                .preferredColorScheme(.light)
            
            AboutView(name: "Pepito", aboutMeText: aboutMeText)
                .previewInterfaceOrientation(.landscapeLeft)
                .environment(\.sizeCategory, .extraLarge)
                .previewDevice("iPad (9th generation)")
                .preferredColorScheme(.light)
        }
    }
}
