//
//  BlurView.swift
//  Practica_SwiftUI_AGGA
//
//  Created by Alejandro Alberto Gavira García on 4/5/24.
//

import SwiftUI

#if os(watchOS)
#else
struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
#endif

#Preview {
    BlurView(style: .extraLight)
}
