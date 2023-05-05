//
//  PlacementButtons.swift
//  MustacheTest
//
//  Created by Colstin Donaldson on 5/4/23.
//

import SwiftUI

struct PlacementButtons: View {
    
    @Binding var isPlacementEnabled:Bool
    @Binding var selectedModel:String?
    @Binding var modelConfirmedForPlacement: String?
    
    var body: some View {
        HStack{
            //Cancel Button
            Button {
                setButtonActivity()
                //selectedModel = nil

            } label: {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
            
            //Confirm Button
            Button {
                setButtonActivity()
                //modelConfirmedForPlacement = selectedModel
            } label: {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            }
        }
    }
    
    func setButtonActivity(){
        isPlacementEnabled = false
        //selectedModel = nil
    }
}

/*
struct PlacementButtons_Previews: PreviewProvider {
    static var previews: some View {
        PlacementButtons()
    }
}
*/
