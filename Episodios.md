⚠️ __(Este es un doc. que uso para tener un guión / idea de qué hablar en cada episodio y no irme por las ramas. Puede cambiar y cambiará sobre la marcha y sin previo aviso)__

## Ideas para los episodios

- Ep 000
    - presentación del canal
    - Qué vamos a ver y qué no
        - SwiftUI vs UIKit
        - Objective C vs Swift
    - [Este repo](https://github.com/dfreniche/ios-desde-cero) como punto de encuentro
        - issues
        - Code of Conduct
    - instalación de herramientas: [Xcode](https://developer.apple.com/xcode/)
    - cuenta developer en Apple, merece la pena?
        - tipos de cuentas de desarrollador
    - Las mejores prácticas
    - Playgrounds Swift y el mínimo Swift imprescindible
        - Código en Inglés
        - `let / var`
- Ep 001
    - presentación del canal / Diego (que se me olvidó)
    - Cosas que recomiendo: https://twitter.com/XcodeReleases
    - Playgrounds Swift y el mínimo Swift imprescindible
        - `class / struct`
            - structs: value types
            - fluent API para "cambiar" un Struct
        - `array`
        - `if`
        - funciones
            - argumentos de funciones
            - omitir `return`
        - clausuras
            - argumentos en clausuras
            - `$0`, etc.
            - trailing closures
    - Hello World iOS!
        - crear el proyecto
        - ficheros, File Navigator ⌘+1
        - código
            - @main
            - App protocol
        - Simulador iOS: seleccionar el Sim
        - ejecución y parada del proyecto
    - [Text](https://developer.apple.com/documentation/swiftui/text)
- Ep 002
    - ℹ️ canal
        - mil gracias por todos los follows y visualizaciones
        - comentarios actualizados en Youtube
        - respondo a las [issues en Github](https://github.com/dfreniche/ios-desde-cero)
            - shoutout Aitor Uranga for https://twitimer.com/ 
    - [Text](https://developer.apple.com/documentation/swiftui/text)
        - Modifiers
            - `foregroundColor`
            - `background`
            - `padding`
            - `font`
            - `fontWeight`
            - `shadow`
            - `cornerRadius`
    - [Color](https://developer.apple.com/documentation/swiftui/color)
    - Attributes Inspector `⌥ + ⌘ + 4`
    - [Label](https://developer.apple.com/documentation/swiftui/label) 
        - Texto + icono!
        - [SF Symbols](https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/), app SFSymbols
    - [Spacer](https://developer.apple.com/documentation/swiftui/spacer)
    - Más de una View a la vez, ViewBuilders
    - [VStack](https://developer.apple.com/documentation/swiftui/vstack)
    - [ScrollView](https://developer.apple.com/documentation/swiftui/scrollview)
    - [Image](https://developer.apple.com/documentation/swiftui/image) (local)
    - 💻 Pantalla de Acerca de
- Ep 003
    - ℹ️ canal
    - [Button](https://developer.apple.com/documentation/swiftui/button)
    - [TextField](https://developer.apple.com/documentation/swiftui/textfield)
    - conditional rendering (if)
    - `@State` variables
    - SwiftUI Previews
        - ⚠️ no ejecutar en Macs con procesador Core i🔥 else 🚁
        - cambiar propiedades de las previews
        - múltiples dispositivos
        - `// MARK: - SwiftUI Previews` comments
    - 💻 Adivina el número que estoy pensando
- Ep 4
    - ℹ️ canal
    - Añadir SwiftUI Views usando Library
    - AsyncImage
        https://pokeapi.co/ 
    - `.border(Color.red, width: 5)`
    - Crear vistas personalizadas
    - 💻 Cargar imágenes a izquierda y derecha pulsando un botón
        - usando un array de URLs (strings)
        - `.frame(width: 320, height: 200, alignment: .center)`
        - cambiar background color de la vista
    - Assets Catalogs: uso para colores
    - [HStack](https://developer.apple.com/documentation/swiftui/hstack)
    - Separator
- Ep 5
    - Clausuras en Swift: toma segunda
        - argumentos en clausuras
        - `$0`, etc.
        - trailing closures
    - 💻 Mejorar Pokepedia Screen
        - full screen
        - Mejorar botón
        - Imagen con tamaño adecuado
        - añadir placeholder
        - extraer modelo
- Ep 6
    - Separar vista que itera por los Pokemons de la que muestra un Pokemon
    - Separar datos de Pokemons en un método mocked
    - List
        - [forEach](https://developer.apple.com/documentation/swiftui/foreach)
        - usando un array de Pokemons
    - NavigationView
---

- Backlog
    - VStack `alignment` y `spacing`
    - .buttonStyle(.borderedProminent)
    - 💻 programa que imprima tu nombre en un Label
    - Bindings, $ wrapper
        - La diferencia es que el tipo que espera el TexField es Binding<String>, para poder cambiarlo desde dentro del TextField. Si no pones el $ el error que tienes es:
            Cannot convert value 'number' of type 'String' to expected type 'Binding<String>', use wrapper instead

        Es decir, el $ es una manera “rápida”de crear un Binding<String>
        Si no usas el $, tienes que escribir esto:
        ```swift
        TextField("Your guess", text:  Binding<String>(get: {
                return self.number
            },
                set: { newValue in
                self.number = newValue
            }))
        ```
    - [TabView](https://developer.apple.com/documentation/swiftui/tabview)
    - 🛠 Xcode: Project, targets, Unit tests Target
    - `some` keyword
    - Networking
        - crear un hosting estático en MongoDB Realm
            - buscar una API y copiar el JSON
            - hospedarlo de manera estática
            - Ej: https://dog.ceo/api/breeds/list/all
            - Ej: https://application-0-xbjwv.mongodbstitch.com/example.json
        - acceder a la red para bajar una imagen
        - bajar JSON de la red
            - parseo de JSON
- Controles
    - [TextEditor](https://developer.apple.com/documentation/swiftui/texteditor)
    - Stepper
    - [ZStack](https://developer.apple.com/documentation/swiftui/zstack)
    - Toggle
    - Picker
    - Form
- Xcode
    - Navigators
    - Panels
    - Settings
    - Debug area
    - etc.
- Ep Debugging sencillo
- Ep Debugging avanzado
- Ep code signing
    - bit
- Ep maps
    - GPS
    - Pedir permisos
- Ep SwiftUI Canvas
- Sensores
    - Cámara y permisos
    - Acelerómetro
    - 💻 App estaciones del año
- Ep XX
    - Testing
    - Unit Testing con XCFramework
- Ep XX
    - Simulador, dónde se almacenan nuestros programas
    - Inspeccionando nuestro programa
        - binario
        - bundle
        - recursos
- UIKit 
    - UIKit Dynamics
    - SpriteKit particle generator
- Ep XX
    - DocC
- Ep XX
    - Compilando desde la línea de comandos
    - Github Actions
- Ep XX
    - Incorporando librerías de terceros: SPM
    - 
- Ep XX
    - Creando nuestros propios paquetes con SPM!
    - Local Packages


