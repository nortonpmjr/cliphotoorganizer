//
//  FileHandler.swift
//  pictureOrganizer
//
//  Created by Norton Pigozzo Martins Junior on 8/29/20.
//  Copyright © 2020 Norton Pigozzo Martins Junior. All rights reserved.
//

import Foundation

class FileHandler {
    let manager = FileManager()

    func createFolders() {
        do {
            
         try manager.createDirectory(atPath: "/Users/norton/Desktop/Test/RAW", withIntermediateDirectories: true, attributes: nil)
        }
        catch {
            print("Folder creation errro")
        }
    }
}
