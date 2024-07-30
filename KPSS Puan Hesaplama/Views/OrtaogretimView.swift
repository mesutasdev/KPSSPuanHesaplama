//
//  ortaogretimView.swift
//  KPSS Puan Hesaplama
//
//  Created by Mesut As Developer on 25.07.2024.
//

import SwiftUI

struct OrtaogretimView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var genelYetenekDogruSayisi:Double = 40
    @State private var genelYetenekYanlisSayisi:Double = 10
    
    @State private var genelKulturdogruSayisi:Double = 50
    @State private var genelKulturYanlisSayisi:Double = 5
    
    @State private var sonuc:Double = 0
    
    let adCoordinator = AdCoordinator()
    
    init() {
        adCoordinator.loadAd()
    }
    
    var body: some View {
        VStack {
            
            Form  {
          
                Section {
                    
                    Stepper("Doğru Sayısı: \(genelYetenekDogruSayisi, specifier: "%.0f")",value: $genelYetenekDogruSayisi , in: 1...(60-genelYetenekYanlisSayisi))
                        .sensoryFeedback(.selection, trigger: genelYetenekDogruSayisi)
                    
                    Stepper("Yanlış Sayısı: \(genelYetenekYanlisSayisi, specifier: "%.0f")", value: $genelYetenekYanlisSayisi, in: 1...(60-genelYetenekDogruSayisi))
                        .sensoryFeedback(.selection, trigger: genelYetenekYanlisSayisi)
                    
                    
                }header: {
                    Text("Genel Yetenek")
                        .textCase(.none)
                        .foregroundColor(.orange)
                    
//                    Footer ile mesaj gösteriyoruz.
                } footer: {
                    if (genelYetenekDogruSayisi + genelYetenekYanlisSayisi > 60 ) {
                        Text("Doğru ve Yanlış sayıların toplamı 60'ı geçemez!")
                            .foregroundStyle(.orange)
                    }
                }
                
                Section {
                    
                    Stepper("Doğru Sayısı: \(genelKulturdogruSayisi, specifier: "%.0f")",value: $genelKulturdogruSayisi , in: 1...(60-genelKulturYanlisSayisi))
//                    kullanıcı tıkladıkça titreşim alacak.
                        .sensoryFeedback(.selection, trigger: genelKulturdogruSayisi)
                    
                    Stepper("Yanlış Sayısı: \(genelKulturYanlisSayisi, specifier: "%.0f")", value: $genelKulturYanlisSayisi, in: 1...(60-genelKulturdogruSayisi))
                        .sensoryFeedback(.selection, trigger: genelKulturYanlisSayisi)
                    
                }header: {
                    Text("Genel Kültür")
                        .textCase(.none)
                        .foregroundColor(.orange)
                    
                } footer: {
                    if (genelKulturdogruSayisi + genelKulturYanlisSayisi > 60 ){
                        Text("Doğru ve Yanlış sayıların toplamı 60'ı geçemez!")
                            .foregroundStyle(.orange)
                    }
                }
                
                
                Section {
                    
                    Text("KPSS Sonucu: \(sonuc, specifier: "%.3f")")
                    
                    HesaplaButton(title: "Hesapla") {
                        
                        let genelKulturNet = genelKulturdogruSayisi - (genelKulturYanlisSayisi / 4)
                        let genelYetenekNet = genelYetenekDogruSayisi - (genelYetenekYanlisSayisi / 4)
                        
                        withAnimation {
                            sonuc = 55.839 + genelYetenekNet * 0.348 + genelKulturNet * 0.431
                        }
//                         SwiftData
                        let result = Result(sinavAdi: "2022 Ortaöğretim KPSS", genelYetenekNet: genelYetenekNet, genelKulturNet: genelKulturNet, sonuc: sonuc)
                        modelContext.insert(result)
                        
                         
                        
//                        Admob
                        
//                        adCoordinator.presentAd()
                        
                        
                        
                    }
//                    .disabled(formKontrol)
                    
                    
                }header: {
                    Text("Sonuç")
                        .textCase(.none)
                        .foregroundColor(.orange)
                }
                
            }
            .navigationTitle("Ortaöğretim")
        }
    }
    
    var formKontrol: Bool {
        if ((genelYetenekDogruSayisi + genelYetenekYanlisSayisi) > 60 || (genelKulturdogruSayisi + genelKulturYanlisSayisi) > 60 ){
            return true 
        }
        return false
    }
}

#Preview {
    OrtaogretimView()
}
