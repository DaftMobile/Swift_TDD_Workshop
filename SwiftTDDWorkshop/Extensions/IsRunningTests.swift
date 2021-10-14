import Foundation

public var isRunningTests: Bool {
	ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
}
