// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "swift-argument-parser-default-subcommand-repro",
  products: [
    .executable(
      name: "swift-argument-parser-default-subcommand-repro",
      targets: ["swift-argument-parser-default-subcommand-repro"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/apple/swift-argument-parser.git",
      .revision("master")
    ),
  ],
  targets: [
    .target(
      name: "swift-argument-parser-default-subcommand-repro",
      dependencies: ["ArgumentParser"]
    ),
  ]
)
