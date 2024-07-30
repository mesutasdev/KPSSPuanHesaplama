//
//  LisansVİew.swift
//  KPSS Puan Hesaplama
//
//  Created by Mesut As Developer on 25.07.2024.
//

import SwiftUI

struct LisansView: View {
    
    @State private var genelYetenekDogruSayisi:Double = 30
    @State private var genelYetenekYanlisSayisi:Double = 0
    
    @State private var genelKulturdogruSayisi:Double = 30
    @State private var genelKulturYanlisSayisi:Double = 0
    
    @State private var sonuc2022:Double = 0
    @State private var sonuc2023:Double = 0
    
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
                    
                    Text("2023 KPSS Sonucu: \(sonuc2023, specifier: "%.3f")")
                    Text("2022 KPSS Sonucu: \(sonuc2022, specifier: "%.3f")")
                   
                    
                    HesaplaButton(title: "Hesapla") {
                        
                        let genelKulturNet = genelKulturdogruSayisi - (genelKulturYanlisSayisi / 4)
                        let genelYetenekNet = genelYetenekDogruSayisi - (genelYetenekYanlisSayisi / 4)
                        
                        withAnimation {
                            
                            sonuc2023 = 51.209 + genelYetenekNet * 0.537 + genelKulturNet * 0.418
                            sonuc2022 = 48.416 + genelYetenekNet * 0.4756 + genelKulturNet * 0.4192
                           
                        }
                        
                    }
//                    .disabled(formKontrol)
                    .sensoryFeedback(.selection, trigger: sonuc2022)
                    
                    
                }header: {
                    Text("Sonuç")
                        .textCase(.none)
                        .foregroundColor(.orange)
                }
                
            }
            .navigationTitle("Lisans(B Grubu)")
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
    LisansView()
}
