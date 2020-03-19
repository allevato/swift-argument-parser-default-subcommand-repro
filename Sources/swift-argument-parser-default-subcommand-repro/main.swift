import ArgumentParser

struct MainCommand: ParsableCommand {
  static var configuration = CommandConfiguration(
    commandName: "main",
    subcommands: [DefaultCommand.self, FooCommand.self, BarCommand.self],
    defaultSubcommand: DefaultCommand.self
  )
}

struct DefaultCommand: ParsableCommand {
  static var configuration = CommandConfiguration(shouldDisplay: false)

  enum Mode: String, CaseIterable, ExpressibleByArgument {
    case foo
    case bar
  }

  @Option(name: .shortAndLong, default: .foo)
  var mode: Mode

  func run() throws {
    switch mode {
    case .foo:
      try FooCommand().run()

    case .bar:
      try BarCommand().run()
    }
  }
}

struct FooCommand: ParsableCommand {
  static var configuration = CommandConfiguration(commandName: "foo")

  func run() throws {
    print("FooCommand executed")
  }
}

struct BarCommand: ParsableCommand {
  static var configuration = CommandConfiguration(commandName: "bar")

  func run() throws {
    print("BarCommand executed")
  }
}

MainCommand.main()
