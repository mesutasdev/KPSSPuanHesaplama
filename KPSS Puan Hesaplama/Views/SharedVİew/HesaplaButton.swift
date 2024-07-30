//
//  HesaplaButton.swift
//  KPSS Puan Hesaplama
//
//  Created by Mesut As Developer on 25.07.2024.
//

import SwiftUI

struct HesaplaButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
          Label(title, systemImage: "plus.forwardslash.minus")
                .font(.title2)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
        }.buttonStyle(.borderedProminent)
            .tint(.orange)

    }
}

#Preview {
    HesaplaButton(title: "Hesapla") {
        print("Mesut As")
    }
}
