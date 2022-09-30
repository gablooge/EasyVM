//
//  CreatePhaseConfigurationView.swift
//  EasyVM
//
//  Created by everettjf on 2022/9/12.
//

import SwiftUI


class CreatePhaseConfigurationViewHandler: CreateStepperGuidePhaseHandler {
    
    func verifyForm(context: CreateStepperGuidePhaseContext) -> CreateStepperGuidePhaseVerifyResult {
        return .success
    }
    func onStepMovedIn(context: CreateStepperGuidePhaseContext) -> Bool {
        return true
    }
}


struct CreatePhaseConfigurationView: View {
    @EnvironmentObject var formData: CreateFormStateObject
    var body: some View {
        VStack {
            Text("Config Virtual Hardwares")
                .font(.title3)
                .padding(.all)
            VMConfigurationView()
        }
    }
}

struct CreatePhaseConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        let formData = CreateFormStateObject()
        CreatePhaseConfigurationView()
            .environmentObject(formData)
    }
}
