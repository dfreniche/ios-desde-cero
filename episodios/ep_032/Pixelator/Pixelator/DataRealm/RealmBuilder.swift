// (C) Diego Freniche 2022 - MIT License

import Foundation
import Realm
import RealmSwift

public struct RealmBuilder {
    public enum RealmConfig {
        case inMemory
        case development
        case mongoDBSync

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

            case .mongoDBSync:
                return Realm.Configuration()
            }
        }
    }

    public func getRealm(_ config: RealmConfig) async -> Realm? {
        if config == .mongoDBSync {
            return await getMongoDBSyncRealm()
        }

        do {
            return try await Realm(configuration: RealmConfig.config(using: config))
        } catch {
            print("💀 something bad happened \(error)")
            return nil
        }
    }

    public static var user: User?
    public static var syncedRealm: Realm?

    public func getMongoDBSyncRealm() async -> Realm? {
        guard RealmBuilder.syncedRealm == nil else { return RealmBuilder.syncedRealm }

        let app = App(id: "pixelator-otrgx")

        do {
            let _ = try await app.login(credentials: Credentials.anonymous)

            if let user = app.currentUser {
                RealmBuilder.user = user

                let partitionValue = "\(user.id)"
                let configuration = user.configuration(partitionValue: partitionValue)

                Realm.asyncOpen(configuration: configuration) { result in
                    switch result {
                    case let .failure(error):
                        print("\(error)")
                        RealmBuilder.syncedRealm = nil
                    case let .success(realm):
                        RealmBuilder.syncedRealm = realm
                    }
                }
            }
        } catch {
            print("\(error)")
        }

        return RealmBuilder.syncedRealm
    }
}
