//
//  FileManager+Extensions.swift
//  Extensions
//
//  Created by Skywinds on 10/8/20.
//

import Foundation

public extension FileManager {

    func docPath() -> String {
        return self.urls(for: .documentDirectory, in: .userDomainMask).first!.path
    }

    func cachesPath() -> String {
        return self.urls(for: .cachesDirectory, in: .userDomainMask).first!.path
    }
    
    func removeFileIfExists(atPath path: String) {
        if fileExists(atPath: path) {
            do {
                try removeItem(atPath: path)
            } catch {
                print(error)
            }
        }
    }

    func saveImageInCache(_ imageData: Data) -> URL? {
        let groupPath = self.cachesPath() + "/images"
        createDirectoryIfNeeded(at: groupPath)
        
        let filename = UUID().uuidString + ".jpeg"
        let path = groupPath + "/" + filename
        
        if !fileExists(atPath: path) {
            do {
                let url = URL(fileURLWithPath: path)
                try imageData.write(to: url)
                return url
            } catch {
                print(error)
            }
        }
        
        return nil
    }

    func removeCacheLocalImages() {
        let groupPath = self.cachesPath() + "/images"
        self.removeFileIfExists(atPath: groupPath)
    }
    
    func saveImageInDocPath(_ imageData: Data) -> URL? {
        let groupPath = self.docPath() + "/images"
        createDirectoryIfNeeded(at: groupPath)
        
        let filename = UUID().uuidString + ".jpeg"
        let path = groupPath + "/" + filename
        
        if !fileExists(atPath: path) {
            do {
                let url = URL(fileURLWithPath: path)
                try imageData.write(to: url)
                return url
            } catch {
                print(error)
            }
        }
        
        return nil
    }

    func removeLocalImages() {
        let groupPath = self.docPath() + "/images"
        self.removeFileIfExists(atPath: groupPath)
    }
    
    func createDirectoryIfNeeded(at path: String) {
        var isDirectory = ObjCBool(true)
        let existsDirectory = fileExists(atPath: path, isDirectory: &isDirectory)

        if !existsDirectory {
            do {
                try createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error)
            }
        }
    }

}
