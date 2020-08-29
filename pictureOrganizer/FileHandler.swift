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
    let consoleIO = ConsoleIO()
    let testRoot = "/Users/norton/Desktop/Test/"

    func createFolders() {
        do {
            try manager.createDirectory(atPath: "\(manager.currentDirectoryPath)/RAW", withIntermediateDirectories: true, attributes: nil)
            try manager.createDirectory(atPath: "\(manager.currentDirectoryPath)/JPEG", withIntermediateDirectories: true, attributes: nil)

            consoleIO.writeMessage("Folders created sucessfully")

            moveRawPhotos()
            moveJpegPhotos()
        }
        catch {
            consoleIO.writeMessage("Folder creation error", to: .error)
        }
    }

    func moveRawPhotos() {
        let photos = searchDirectory()
        for photo in photos {
            if photo.contains(".CR2") {
                do {
                   try manager.moveItem(atPath: "\(manager.currentDirectoryPath)/\(photo)", toPath: "\(manager.currentDirectoryPath)/RAW/\(photo)")
                }
                catch {
                    consoleIO.writeMessage("Error moving raw photos: \(error)", to: .error)
                }
            }
        }
    }

    func moveJpegPhotos() {
        let photos = searchDirectory()
        for photo in photos {
            if photo.contains(".JPG") {
                do {
                   try manager.moveItem(atPath: "\(manager.currentDirectoryPath)/\(photo)", toPath: "\(manager.currentDirectoryPath)/JPEG/\(photo)")
                }
                catch {
                    consoleIO.writeMessage("Error moving raw photos: \(error)", to: .error)
                }
            }
        }
    }

    func searchDirectory() -> [String] {
        do {
            consoleIO.writeMessage(manager.currentDirectoryPath)
            let contents = try manager.contentsOfDirectory(atPath: testRoot)
            return contents
        }
        catch {
            consoleIO.writeMessage("error", to: .error)
            return []
        }
    }
}
