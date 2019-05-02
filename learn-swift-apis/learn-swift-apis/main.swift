//
//  main.swift
//  learn-swift-apis
//
//  Created by Michael Neas on 5/2/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import Foundation

let learnSwiftAPIs = LearnSwiftAPIs()

if CommandLine.argc < 2 {
    learnSwiftAPIs.interactiveMode()
} else {
    learnSwiftAPIs.staticMode()
}

