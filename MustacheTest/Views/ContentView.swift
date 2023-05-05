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
            ARViewContainer(selectedModel: $selectedModel, isPlacementEnabled: $isPlacementEnabled).edgesIgnoringSafeArea(.top)
            
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
    @Binding var isPlacementEnabled:Bool
    
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
        
        let modelName = selectedModel
        
        //if let modelName = selectedModel  {
            
        let anchor = try? Entity.loadAnchor(named: modelName ?? "Mustache0")
            
           
            if isPlacementEnabled == true {
                print("hi")
                uiView.scene.addAnchor(anchor!)

                
            } else {
                print("not hi")
                uiView.scene.removeAnchor(anchor!)
                
//                DispatchQueue.main.async {
//                    selectedModel = nil
//
//                }
            }

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
