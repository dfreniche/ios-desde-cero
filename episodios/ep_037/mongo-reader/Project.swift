import ProjectDescription

// change all this to fullfill your needs
let appName = "mongoreader"
let bundleId = "com.mongodb.mongoreader"
let organizationName = "Diego Freniche"

// the compiled binary will be copied in this directory ($HOME by default)
// there's a Run Script phase added to the target that does that
let destinationFolder = "~"

let project = Project(
    name: appName,
    organizationName: organizationName,
    targets: [
        Target(
            name: appName,
            platform: .macOS,
            product: .commandLineTool,
            bundleId: bundleId,
            deploymentTarget: .macOS(targetVersion: "10.14"),
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: [
            ],
            scripts: [
                // Script that will run after building and will copy our binary to ``destinationFolder``

                TargetScript.post(script: "cp $BUILT_PRODUCTS_DIR/\(appName) \(destinationFolder)",
                                  name: "Copy Binary",
                                  shellPath: "/bin/bash")
            ],
            dependencies: [
                // add your packages here, also review Tuist/Dependencies.swift
                
                .external(name: "ANSITerminal"),
                .external(name: "ArgumentParser"),
                .external(name: "SwiftFigletKit"),
                .external(name: "Files")
            ]
        )
    ]
//    schemes: [
//        Scheme(
//            name: appName,
//            shared: true,
//            buildAction: .buildAction(targets: [appName]),
//            testAction: .targets(["AppTests"]),
//            runAction: .runAction(executable: appName)
//        ),
//        Scheme(
//            name: "App-Release",
//            shared: true,
//            buildAction: .buildAction(targets: [appName]),
//            runAction: .runAction(executable: appName)
//        )
//    ],
//    additionalFiles: [
//        "Dangerfile.swift",
//        "Documentation/**",
//        .folderReference(path: "Website")
//    ]
)
