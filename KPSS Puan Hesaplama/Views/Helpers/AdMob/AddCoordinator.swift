//
//  AddCoordinator.swift
//  KPSS Puan Hesaplama
//
//  Created by Mesut As Developer on 28.07.2024.
//

import Foundation
import GoogleMobileAds

class AdCoordinator: NSObject {
  private var ad: GADInterstitialAd?

  func loadAd() {
    GADInterstitialAd.load(
      withAdUnitID: "ca-app-pub-1385286564118510/5798287127", request: GADRequest()
    ) { ad, error in
      if let error = error {
        return print("Failed to load ad with error: \(error.localizedDescription)")
      }

      self.ad = ad
    }
  }

  func presentAd() {
    guard let fullScreenAd = ad else {
      return print("Ad wasn't ready")
    }

    // View controller is an optional parameter. Pass in nil.
    fullScreenAd.present(fromRootViewController: nil)
  }
}
