//
//  VMConfigurationAudioDevicesView.swift
//  EasyVM
//
//  Created by everettjf on 2022/9/30.
//

import SwiftUI

struct VMConfigurationAudioDevicesView: View {
    @EnvironmentObject var state: VMConfigurationViewState
    @State var showingEditView = false
    
    var body: some View {
        content
            .sheet(isPresented: $showingEditView) {
                VMConfigurationAudioDevicesEditView()
            }
    }
    var content: some View {
        
        LabeledContent("Audio Devices") {
            VStack(alignment: .trailing) {
                List(state.audioDevices) { item in
                    HStack {
                        Spacer()
                        Text("\(String(describing: item.data))")
                    }
                }
                .frame(width:400)
                
                VStack {
                    Spacer()
                    Button {
                        showingEditView.toggle()
                    } label: {
                        Image(systemName: "slider.vertical.3")
                    }
                }
            }
        }
    }
}

struct VMConfigurationAudioDevicesView_Previews: PreviewProvider {
    static var previews: some View {
        VMConfigurationAudioDevicesView()
            .environmentObject(VMConfigurationViewState())
    }
}
