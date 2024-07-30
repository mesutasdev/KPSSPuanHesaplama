//
//  KPSS_Puan_HesaplamaApp.swift
//  KPSS Puan Hesaplama
//
//  Created by Mesut As Developer on 25.07.2024.
//

import SwiftUI
import SwiftData
import GoogleMobileAds

@main
struct KPSS_Puan_HesaplamaApp: App {
    
    init(){
        
        let appearanceNav = UINavigationBarAppearance()
        appearanceNav.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearanceNav
        UINavigationBar.appearance().scrollEdgeAppearance = appearanceNav
        
        let apperanceTab = UITabBarAppearance()
        apperanceTab.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = apperanceTab
        UITabBar.appearance().scrollEdgeAppearance = apperanceTab
        
        
    
//                              AdMob SDK
            GADMobileAds.sharedInstance().start(completionHandler: nil)

    
    }
    
    
    var body: some Scene {
        WindowGroup {
          RootView()
        }
        
        .modelContainer(for:Result.self)
    }
}
