// (C) Diego Freniche 2022 - MIT License

import Foundation
import Realm
import RealmSwift

public struct RealmBuilder {
    public enum RealmConfig {
        case inMemory
        case development

        public static func config(using: RealmConfig) -> Realm.Configuration {
            switch using {
            case .inMemory:
                return Realm.Configuration(fileURL: nil,
                                           inMemoryIdentifier: "Pixelator",
                                           syncConfiguration: nil,
                                           encryptionKey: nil,
                                           readOnly: false,
                                           schemaVersion: 1,
                                           migrationBlock: nil,
                                           deleteRealmIfMigrationNeeded: false,
                                           shouldCompactOnLaunch: nil,
                                           objectTypes: nil,
                                           seedFilePath: nil)
            case .development:
                return Realm.Configuration(fileURL: URL(string: RLMRealmPathForFile("Pixelator.realm")),
                                           inMemoryIdentifier: nil,
                                           syncConfiguration: nil,
                                           encryptionKey: nil,
                                           readOnly: false,
                                           schemaVersion: 1,
                                           migrationBlock: nil,
                                           deleteRealmIfMigrationNeeded: true,
                                           shouldCompactOnLaunch: nil,
                                           objectTypes: nil,
                                           seedFilePath: nil)
            }
        }
    }

    public func getRealm(_ config: RealmConfig) async -> Realm? {
        do {
            return try await Realm(configuration: RealmConfig.config(using: config))
        } catch {
            print("💀 something bad happened \(error)")
            return nil
        }
    }
}
