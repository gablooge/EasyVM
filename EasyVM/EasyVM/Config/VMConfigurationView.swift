//
//  VMConfigurationView.swift
//  EasyVM
//
//  Created by everettjf on 2022/9/12.
//

import SwiftUI



struct VMConfigurationView: View {
    @ObservedObject var state: VMConfigurationViewState
    
    init(location: VMLocationModel) {
        self.state = VMConfigurationViewState(location: location)
    }
    
    var body: some View {
        content
            .environmentObject(state)
    }
    
    var content: some View {
        Form {
            Section ("CPU / Memory / Disk") {
                VMConfigurationCPUView()
                VMConfigurationMemoryView()
                VMConfigurationDiskView()
            }
            
            Section ("Display / Storage / Network") {
                VMConfigurationGraphicDevicesView()
                VMConfigurationStorageDevicesView()
                VMConfigurationNetworkDevicesView()
                
            }
            Section ("Pointing / Audio") {
                VMConfigurationPointingDevicesView()
                VMConfigurationAudioDevicesView()
            }
        }
        .formStyle(.grouped)
    }
}

struct VMConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        VMConfigurationView(location: VMLocationModel(root: "", image: ""))
            .frame(width: 700, height:1000)
    }
}
