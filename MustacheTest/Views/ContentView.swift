//
//  ContentView.swift
//  MustacheTest
//
//  Created by Colstin Donaldson on 5/4/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    
    @State var isPlacementEnabled = false
    @State var selectedModel:String?
    @State var modelConfirmedForPlacement: String?
    
    var body: some View {
      
        ZStack(alignment: .bottom){
            ARViewContainer(selectedModel: $selectedModel).edgesIgnoringSafeArea(.top)
            
            if isPlacementEnabled {
                PlacementButtons(isPlacementEnabled: $isPlacementEnabled, selectedModel: $selectedModel, modelConfirmedForPlacement: $modelConfirmedForPlacement)

            } else {
                ModelPicker(isPlacementEnabled: $isPlacementEnabled, selectedModel: $selectedModel)
            }
            
         
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    //@Binding var modelConfirmedForPlacement:String?
    //@State var toggtleScene = Mustache1.self
    @Binding var selectedModel:String?
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)

        //Tells the ARView to use a face tracking configuration so that the app uses the correct user facing camera.
        let faceTrackingConfig = ARFaceTrackingConfiguration()
        arView.session.run(faceTrackingConfig)
        
        
//        if let anchor = try? Entity.loadAnchor(named: Constants.models[0]){
//            arView.scene.addAnchor(anchor)
//        }
        
      

        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
        // Load the "Mustache" scene from the "Mustache1" Reality File
        if let modelName = selectedModel {
            if let anchor = try? Entity.loadAnchor(named: modelName){
                uiView.scene.addAnchor(anchor)
                
                DispatchQueue.main.async {
                    selectedModel = nil
                }
            }
        }
       
        
        //arView.scene.addAnchor(anchor)
        
    }
   
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
//https://www.youtube.com/watch?v=9R_G0EI-UoI
