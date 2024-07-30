//
//  RootView.swift
//  KPSS Puan Hesaplama
//
//  Created by Mesut As Developer on 25.07.2024.
//

import SwiftUI
import AppTrackingTransparency

struct RootView: View {
    
    @State private var selectionItem = 0
    
    var body: some View {
        TabView(selection: $selectionItem) {
            MainView()
                .tabItem{
                    Label("Başlangıç", systemImage: "house")
//                    burda ikonlarını içini boş göstermeyi yapıyoruz.
                        .environment(\.symbolVariants, selectionItem == 0 ? .fill : .none)
                }
                .tag(0)
            
            
            ResultView()
                .tabItem {
                    Label("Hesaplamalar", systemImage: "arrow.counterclockwise.circle")
                        .environment(\.symbolVariants, selectionItem == 1 ? .fill : .none)
                }
                .tag(1)
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)){ _ in
            ATTrackingManager.requestTrackingAuthorization(completionHandler:{ status in })
        }
        .tint(.orange)
    }
}

#Preview {
    RootView()
}
