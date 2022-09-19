import Foundation
import Files

/// Reads all files in current directory
/// - Parameters:
///   - path: path of the directory we want to list
///   - includeHidden: set to true if you want to include also hidden files
/// - Throws: Error in case path doesn't exists, it's malformed, etc.
/// - Returns: Array of file names
func readFilesInDirectory(path: String = ".", includeHidden: Bool = false) throws -> [String] {
    var fileNames: [String] = []
    
    if includeHidden {
        try Folder(path: path).files.includingHidden.enumerated().forEach { (index, file) in
            fileNames.append(file.name)
        }
    } else {
        try Folder(path: path).files.enumerated().forEach { (index, file) in
            fileNames.append(file.name)
        }
    }
            
    return fileNames
}
