//
//  EgitimBilimleriView.swift
//  KPSS Puan Hesaplama
//
//  Created by Mesut As Developer on 25.07.2024.
//

import SwiftUI

struct EgitimBilimleriView: View {
    
    @State private var genelYetenekDogruSayisi:Double = 30
    @State private var genelYetenekYanlisSayisi:Double = 0
    
    @State private var genelKulturdogruSayisi:Double = 30
    @State private var genelKulturYanlisSayisi:Double = 0
    
    @State private var egitimBilimleriDogruSayisi:Double = 40
    @State private var egitimBilimleriYanlisSayisi:Double = 0
    
 
    
    @State private var sonuc2022:Double = 0
    @State private var sonuc2023:Double = 0
    @State private var sonucEB2022:Double = 0
    @State private var sonucEB2023:Double = 0
    
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack {
            
            Form  {

                
                Section {
                    
                    Stepper("Doğru Sayısı: \(genelYetenekDogruSayisi, specifier: "%.0f")",value: $genelYetenekDogruSayisi , in: 0...(60-genelYetenekYanlisSayisi))
                        .sensoryFeedback(.selection, trigger: genelYetenekDogruSayisi)
                    
                    Stepper("Yanlış Sayısı: \(genelYetenekYanlisSayisi, specifier: "%.0f")", value: $genelYetenekYanlisSayisi, in: 0...(60-genelYetenekDogruSayisi))
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
                    
                    Stepper("Doğru Sayısı: \(genelKulturdogruSayisi, specifier: "%.0f")",value: $genelKulturdogruSayisi , in: 0...(60-genelKulturYanlisSayisi))
//                    kullanıcı tıkladıkça titreşim alacak.
                        .sensoryFeedback(.selection, trigger: genelKulturdogruSayisi)
                    
                    Stepper("Yanlış Sayısı: \(genelKulturYanlisSayisi, specifier: "%.0f")", value: $genelKulturYanlisSayisi, in: 0...(60-genelKulturdogruSayisi))
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
                    
                    Stepper("Doğru Sayısı: \(egitimBilimleriDogruSayisi, specifier: "%.0f")",value: $egitimBilimleriDogruSayisi , in: 0...(80-egitimBilimleriYanlisSayisi))
                        .sensoryFeedback(.selection, trigger: egitimBilimleriDogruSayisi)
                    
                    Stepper("Yanlış Sayısı: \(egitimBilimleriYanlisSayisi, specifier: "%.0f")", value: $egitimBilimleriYanlisSayisi, in: 0...(80-egitimBilimleriDogruSayisi))
                        .sensoryFeedback(.selection, trigger: egitimBilimleriYanlisSayisi)
                    
                    
                }header: {
                    Text("Eğitim Bilimleri")
                        .textCase(.none)
                        .foregroundColor(.orange)
                    
//                    Footer ile mesaj gösteriyoruz.
                } footer: {
                    if (egitimBilimleriDogruSayisi + egitimBilimleriYanlisSayisi > 80 ) {
                        Text("Doğru ve Yanlış sayıların toplamı 80'ı geçemez!")
                            .foregroundStyle(.orange)
                    }
                }
                
                Section {
                    
              

                    
                    HesaplaButton(title: "Hesapla") {
                        
                        let genelKulturNet = genelKulturdogruSayisi - (genelKulturYanlisSayisi / 4)
                        let genelYetenekNet = genelYetenekDogruSayisi - (genelYetenekYanlisSayisi / 4)
                        let egitimBilimleriNet = egitimBilimleriDogruSayisi - (egitimBilimleriYanlisSayisi / 4)
                        
                        withAnimation {
                            sonucEB2022 = 36.812 + genelYetenekNet * 0.3985 + genelKulturNet * 0.3512 + egitimBilimleriNet * 0.34714
                            sonuc2022 = 48.616 + genelYetenekNet * 0.4756 + genelKulturNet * 0.4192
                            
                            sonucEB2023 = 40.405 + genelYetenekNet * 0.3493 + genelKulturNet * 0.3672 + egitimBilimleriNet * 0.37145
                            sonuc2023 = 51.209 + genelYetenekNet * 0.537 + genelKulturNet * 0.418
                            
                            
                        }
                        isShowingSheet.toggle()
                    }
//                    .disabled(formKontrol)
                    .sensoryFeedback(.selection, trigger: sonuc2022)
                    .sheet(isPresented: $isShowingSheet){
                        SonucView(sonuc2023: sonuc2023, sonucEB2023: sonucEB2023, sonucOABT2023: nil, sonuc2022: sonuc2022, sonucEB2022: sonucEB2022, sonucOABT2022: nil)
                    }
                    
                }header: {
                    Text("Sonuç")
                        .textCase(.none)
                        .foregroundColor(.orange)
                }
                
            }
            .navigationTitle("Eğitim Bilimleri")
        }
    }
    
    var formKontrol: Bool {
        if ((genelYetenekDogruSayisi + genelYetenekYanlisSayisi) > 60 || (genelKulturdogruSayisi + genelKulturYanlisSayisi) > 60 || ( egitimBilimleriDogruSayisi + egitimBilimleriYanlisSayisi) > 80 ){
           return  true
        }
        return false
    }
}
#Preview {
    EgitimBilimleriView()
}
