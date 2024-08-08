//
//  SphereView.swift
//  MyFirstAPP
//
//  Created by Lavenda Shan on 7/22/24.
//

import SwiftUI
import _RealityKit_SwiftUI

struct SphereView: View {
    @State private var scale = false
    
    var body: some View {
        // Model Creation
        RealityView { content in
            let model = ModelEntity(
                mesh: .generateSphere(radius: 0.1),
                materials: [SimpleMaterial(color: .white, isMetallic: true)])
            // Enable interactions on the entity
            model.components.set(InputTargetComponent())
            model.components.set(CollisionComponent(shapes: [.generateSphere(radius: 0.1)]))
            content.add(model)
        } update: { content in
            if let model = content.entities.first {
                model.transform.scale = scale ? [1.2, 1.2, 1.2] : [1.0, 1.0, 1.0]
            }
        }
        // .onEnded is a modifier that specifies what should happen when the tap gesture is completed (i.e., when the user lifts their finger after tapping).
        // { _ in ... }: takes one argument, which represents the gesture’s value when it ends. The _ is used to ignore this argument since it is not needed in this context.
        .gesture(TapGesture().targetedToAnyEntity().onEnded { _ in
            scale.toggle()
        })
    }
}



#Preview(windowStyle: .automatic) {
    SphereView()
}

