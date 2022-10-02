//
//  CreateFormModel.swift
//  EasyVM
//
//  Created by everettjf on 2022/9/15.
//

import SwiftUI

class CreateFormStateObject: ObservableObject {
    struct LogModel : Identifiable {
        let id = UUID()
        let time: String
        let log: String
        
        init(_ log: String) {
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            self.time = dateFormatter.string(from: date)
            
            self.log = log
        }
    }
    
    
    // phase
    @Published var rootPath: String = "/Users/everettjf/Downloads/NewVirtualMachine.ezvm"

    // phase
    @Published var imagePath: String = "/Users/everettjf/Downloads/UniversalMac_13.0_22A5295h_Restore.ipsw"
    
    @Published var logs: [LogModel] = []
    
    @Published var installingProgress: Double = 0.0
    
    
    init() {
    }
    
    func addLog(_ log: String) {
        DispatchQueue.main.async {
            self.logs.insert(LogModel(log), at: 0)
        }
    }
    
    func changeProgress(_ percent: Double) {
        if percent > 1.0 {
            return
        }
        if percent < 0.0 {
            return
        }
        DispatchQueue.main.async {
            self.installingProgress = percent
        }
    }
    
    func getSystemImagePathForDownload(osType: VMOSType) -> URL? {
        guard let vmDir = URL(string: rootPath) else {
            return nil
        }

        if !FileManager.default.fileExists(atPath: vmDir.path) {
            try? FileManager.default.createDirectory(at: vmDir, withIntermediateDirectories: true)
        }

        var localPath = vmDir.appending(path: "SystemImage.ipsw")
        if osType == .linux {
            localPath = vmDir.appending(path: "SystemImage.iso")
        }
        return localPath
    }
    
    
    
}
