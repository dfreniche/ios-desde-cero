import SwiftUI

struct ContentView: View {
    
    let aboutMeText = """
    Lorem fistrum diodeno ese pedazo de te va a hasé pupitaa. La caidita por la gloria de mi madre a wan no puedor pecador diodenoo tiene musho peligro. A gramenawer ese hombree jarl ese pedazo de ahorarr. Tiene musho peligro pupita ahorarr caballo blanco caballo negroorl ese que llega me cago en tus muelas. Caballo blanco caballo negroorl torpedo ahorarr la caidita ahorarr a wan fistro torpedo.
    
    Lorem fistrum diodeno ese pedazo de te va a hasé pupitaa. La caidita por la gloria de mi madre a wan no puedor pecador diodenoo tiene musho peligro. A gramenawer ese hombree jarl ese pedazo de ahorarr. Tiene musho peligro pupita ahorarr caballo blanco caballo negroorl ese que llega me cago en tus muelas. Caballo blanco caballo negroorl torpedo ahorarr la caidita ahorarr a wan fistro torpedo.
    """
    
    var body: some View {
        ScrollView {
            VStack {
                Text("About Me")
                    .fontWeight(.heavy)
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding()
                
                Text("Diego Freniche")
                
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
