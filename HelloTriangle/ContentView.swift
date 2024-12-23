//
//  ContentView.swift
//  HelloTriangle
//
//  Created by Hayden Chalin on 12/23/24.
//

import SwiftUI
import MetalKit

struct ContentView: UIViewRepresentable {
    func makeCoordinator() -> Renderer {
        Renderer(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<ContentView>) -> MTKView {
        // Create a UI View -
        
        let mtkView =  MTKView()
        mtkView.delegate = context.coordinator          // agent resposible for renderring
        mtkView.preferredFramesPerSecond = 60
        mtkView.enableSetNeedsDisplay = true
       
        if let metalDevice = MTLCreateSystemDefaultDevice() {
            mtkView.device = metalDevice            // GPU 
        }
        
        mtkView.framebufferOnly = false
        mtkView.drawableSize = mtkView.frame.size
        
        return mtkView
    }
    
    func updateUIView(_ uiView: MTKView, context: UIViewRepresentableContext<ContentView>) {
        
    }
    
}

#Preview {
    ContentView()
}
