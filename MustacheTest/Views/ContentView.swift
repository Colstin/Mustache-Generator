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
    @State var modelCancelled = false
    
    var body: some View {
      
        ZStack(alignment: .bottom){
            ARViewContainer(selectedModel: $selectedModel, isPlacementEnabled: $isPlacementEnabled, modelCancelled: $modelCancelled).edgesIgnoringSafeArea(.top)
            
            if isPlacementEnabled {
                PlacementButtons(isPlacementEnabled: $isPlacementEnabled, selectedModel: $selectedModel, modelCancelled: $modelCancelled)

            } else {
                ModelPicker(isPlacementEnabled: $isPlacementEnabled, selectedModel: $selectedModel)
                    .onAppear(){
                        modelCancelled = false
                    }
                    
                    
            }
            
         
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    //@Binding var modelConfirmedForPlacement:String?
    //@State var toggtleScene = Mustache1.self
    @Binding var selectedModel:String?
    @Binding var isPlacementEnabled:Bool
    @Binding var modelCancelled:Bool
    
  

    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)

        //Tells the ARView to use a face tracking configuration so that the app uses the correct user facing camera.
        let faceTrackingConfig = ARFaceTrackingConfiguration()
        arView.session.run(faceTrackingConfig)
        
        
//        if let anchor = try? Entity.loadAnchor(named: "Mustache1"){
//            arView.scene.addAnchor(anchor)
//        }

        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
        // Load the "Mustache" scene from the "Mustache1" Reality File
        
         if let modelName = selectedModel {
             print("Adding \(modelName) to scene")
             
             let anchor = try? Entity.loadAnchor(named: modelName)
              uiView.scene.removeAnchor(anchor!)
             
              uiView.scene.addAnchor(anchor!)
             
            
             if modelCancelled == true {
                // selectedModel = nil
                 print("true")


             } else {
                // uiView.scene.removeAnchor(anchor!)
                 print("false")
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
//https://www.youtube.com/watch?v=9R_G0EI-UoI
