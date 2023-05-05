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
            ARViewContainer(modelConfirmedForPlacement: $modelConfirmedForPlacement).edgesIgnoringSafeArea(.top)
            
            if isPlacementEnabled {
                PlacementButtons(isPlacementEnabled: $isPlacementEnabled, selectedModel: $selectedModel, modelConfirmedForPlacement: $modelConfirmedForPlacement)

            } else {
                ModelPicker(isPlacementEnabled: $isPlacementEnabled, selectedModel: $selectedModel)
            }
            
         
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    @Binding var modelConfirmedForPlacement:String?
    @State var toggtleScene = Mustache1.self
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let faceAnchor = try! toggtleScene.loadScene()
        
        //Tells the ARView to use a face tracking configuration so that the app uses the correct user facing camera.
        let faceTrackingConfig = ARFaceTrackingConfiguration()
        arView.session.run(faceTrackingConfig)
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(faceAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
        if let modelName = modelConfirmedForPlacement{
            print("adding model \(modelName) to scene")
            
            DispatchQueue.main.async {
                modelConfirmedForPlacement = nil
            }
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
