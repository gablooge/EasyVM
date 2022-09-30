//
//  CreatePhaseCompleteView.swift
//  EasyVM
//
//  Created by everettjf on 2022/9/12.
//

import SwiftUI



class CreatePhaseCompleteViewHandler: CreateStepperGuidePhaseHandler {
    
    func verifyForm(context: CreateStepperGuidePhaseContext) -> CreateStepperGuidePhaseVerifyResult {
        return .success
    }
    func onStepMovedIn(context: CreateStepperGuidePhaseContext) -> Bool {
        return true
    }
}


struct CreatePhaseCompleteView: View {
    @EnvironmentObject var formData: CreateFormStateObject
    var body: some View {
        Text("Congratulations :)")
            .font(.title)
            .padding(.all)
    }
}

struct CreatePhaseCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        let formData = CreateFormStateObject()
        CreatePhaseCompleteView()
            .environmentObject(formData)
    }
}
