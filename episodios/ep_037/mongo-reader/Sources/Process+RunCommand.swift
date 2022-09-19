import Foundation

extension Process {
    /// Runs a command from this program
    /// - Parameters:
    ///   - command: full path to the program we want to launch
    ///   - arguments: Array of arguments passed to that program
    ///
    /// Example:
    /// `Process.launch("/bin/ps", arguments: ["a", "u"])`
    static func launch(command: String, arguments:[String] = []) {
        let url = URL(fileURLWithPath: command)
        do {
           try Process.run(url, arguments: arguments) { (process) in
              print("\ndidFinish: \(!process.isRunning)")
           }
        } catch {
            print("Error opening file \(error)")
        }
    }
}
