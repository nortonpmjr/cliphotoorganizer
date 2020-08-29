//
//  ConsoleIO.swift
//  pictureOrganizer
//
//  Created by Norton Pigozzo Martins Junior on 8/29/20.
//  Copyright © 2020 Norton Pigozzo Martins Junior. All rights reserved.
//

import Foundation

enum OutputType {
    case error
    case standard
}

class ConsoleIO {
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print ("\(message)")
        case .error:
            fputs("Error: \(message)\n", stderr)
        }
    }

    func printUsage() {

      let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent

      writeMessage("usage:")
      writeMessage("\(executableName) -a string1 string2")
      writeMessage("or")
      writeMessage("\(executableName) -p string")
      writeMessage("or")
      writeMessage("\(executableName) -h to show usage information")
      writeMessage("Type \(executableName) without an option to enter interactive mode.")
    }
}
