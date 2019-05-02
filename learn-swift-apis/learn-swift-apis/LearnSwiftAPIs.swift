//
//  LearnSwiftAPIs.swift
//  learn-swift-apis
//
//  Created by Michael Neas on 5/2/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import Foundation

enum OptionType: String {
    case foundation
    case help = "h"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
        case "foundation": self = .foundation
        case "h": self = .help
        case "q": self = .quit
        default: self = .unknown
        }
    }
}


class LearnSwiftAPIs {
    let consoleIO = ConsoleIO()
    
    func staticMode() {
        let argCount = CommandLine.argc
        let argument = CommandLine.arguments[1]
        let (option, value) = getOption(String(argument.suffix(from: argument.index(argument.startIndex, offsetBy: 1))))
        switch option {
        case .foundation:
            if argCount == 3 {
                //let first = CommandLine.arguments[2]
                let type = CommandLine.arguments[2]
                consoleIO.writeMessage("Argument count: \(argCount) Option: \(option) value: \(value), trying to learn \(type)")
            }
        default:
            consoleIO.writeMessage("Unknown option \(value)")
            consoleIO.printUsage()
        }
    }
    
    func getOption(_ option: String) -> (option: OptionType, value: String) {
        return (OptionType(value: option), option)
    }
    
    func interactiveMode() {
        consoleIO.writeMessage("Welcome to Learn Swift APIs. This program helps you learn swift apis.")
        var shouldQuit = false
        while !shouldQuit {
            consoleIO.writeMessage("Type 'foundation' to learn about Foundation or 'q' to quit.")
            let (option, value) = getOption(consoleIO.getInput())
            
            switch option {
            case .foundation:
                consoleIO.writeMessage("How could you make my word \"ImAgInAtIoN\" all lowercase?")
                let answer = consoleIO.getInput()
                
                if answer == ".lowercased" {
                    consoleIO.writeMessage("\(answer) is correct!!")
                } else {
                    consoleIO.writeMessage("\(answer) is not correct, try again!")
                }
            case .quit:
                shouldQuit = true
            default:
                consoleIO.writeMessage("Unknown option \(value)", to: .error)
            }
        }
    }

}
