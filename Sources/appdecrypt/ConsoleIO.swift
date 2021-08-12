//
//  ConsleIO.swift
//  appdump
//
//  Created by paradiseduo on 2021/7/29.
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
                print("\(message)")
            case .error:
                fputs("Error: \(message)\n", stderr)
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: NSNotification.Name("stop"), object: nil)
                }
        }
    }
    
    func printUsage() {
        writeMessage("""
        Usage: appdecrypt <executable> <out_path>
        """)
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name("stop"), object: nil)
        }
    }
}
