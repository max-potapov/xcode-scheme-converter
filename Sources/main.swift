import Foundation

extension String: Error {}

extension URL {
    static let customScheme = FileManager.default.homeDirectoryForCurrentUser
        .appendingPathComponent("Library/Developer/Xcode/UserData/FontAndColorThemes/California.xccolortheme")

    static let classicScheme = URL(fileURLWithPath: "/Applications/Xcode.app/Contents/SharedFrameworks/DVTUserInterfaceKit.framework/Versions/A/Resources/FontAndColorThemes/Classic (Light).xccolortheme")
}

typealias Content = [String: Any]

func content(at url: URL) throws -> Content {
    guard
        FileManager.default.isReadableFile(atPath: url.relativePath),
        let content = NSDictionary(contentsOf: url) as? Content
    else {
        throw "Can't read the file at: \(url)"
    }
    return content
}

do {
    let customScheme = try content(at: .customScheme)
    var classicScheme = try content(at: .classicScheme)
    customScheme.keys.forEach {
        if $0.hasSuffix("Color") || $0.hasSuffix("Colors") || $0.hasSuffix("Background") {
            classicScheme[$0] = customScheme[$0]
        }
    }
    try (classicScheme as NSDictionary).write(to: .customScheme)
    print("done. check result in: \(URL.customScheme)")
} catch {
    print(error)
}
