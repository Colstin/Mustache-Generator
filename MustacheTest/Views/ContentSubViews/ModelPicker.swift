//
//  ModelPicker.swift
//  MustacheTest
//
//  Created by Colstin Donaldson on 5/4/23.
//

import SwiftUI

struct ModelPicker: View {
    
    @Binding var isPlacementEnabled:Bool
    @Binding var selectedModel:String?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 30){
                ForEach(0..<Constants.models.count, id: \.self){ index in
                    
                    Button {
                        isPlacementEnabled = true
                        selectedModel = Constants.models[index]
                        print("\(Constants.models[index])")
                    } label: {
                        //Image(uiImage: UIImage(named: Constants.models[index]))
                        Image("Mustache\(index)")
                            .resizable()
                            .frame(height: 80)
                            .aspectRatio(1/1, contentMode: .fit)
                            .background(.white)
                            .cornerRadius(12)
                            
                    }
                }
            }
        }
        .padding()
        .background(.black.opacity(0.5))
        .padding(.bottom)
    }
  
}

/*
struct ModelPicker_Previews: PreviewProvider {
    static var previews: some View {
        ModelPicker()
    }
}
*/
