#!/usr/bin/swift sh
import Foundation
import XcodeProj // @brightdigit ~> 6.8.0
import PathKit // kylef/PathKit

let projectPath = Path("therbe.xcodeproj")
let proj = try XcodeProj(path: projectPath)

for target in proj.pbxproj.nativeTargets {
  if target.name == "therbe-app-watchOS" {
    target.productType = PBXProductType.watch2AppContainer
  }
}

try proj.write(path: projectPath)
//guard CommandLine.arguments.count == 2 else {
//    let arg0 = Path(CommandLine.arguments[0]).lastComponent
//    fputs("usage: \(arg0) <project> <new-version>\n", stderr)
//    exit(1)
//}
//
//let projectPath = Path(CommandLine.arguments[1])
//let proj = try XcodeProj(path: projectPath)
//
//for target in proj.pbxproj.nativeTargets {
//    debugPrint(target)
//}
