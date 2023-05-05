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
    
    var body: some View {
      
        ZStack(alignment: .bottom){
            ARViewContainer().edgesIgnoringSafeArea(.top)
            
            ModelPicker()
         
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let faceAnchor = try! Mustache3.loadScene()
        
        //Tells the ARView to use a face tracking configuration so that the app uses the correct user facing camera.
        let faceTrackingConfig = ARFaceTrackingConfiguration()
        arView.session.run(faceTrackingConfig)
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(faceAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
