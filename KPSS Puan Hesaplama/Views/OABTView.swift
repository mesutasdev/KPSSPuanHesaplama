//
//  OABTView.swift
//  KPSS Puan Hesaplama
//
//  Created by Mesut As Developer on 25.07.2024.
//

import SwiftUI

struct OABTView: View {
    
    @State private var genelYetenekDogruSayisi:Double = 30
    @State private var genelYetenekYanlisSayisi:Double = 0
    
    @State private var genelKulturdogruSayisi:Double = 30
    @State private var genelKulturYanlisSayisi:Double = 0
    
    @State private var egitimBilimleriDogruSayisi:Double = 40
    @State private var egitimBilimleriYanlisSayisi:Double = 0
    
    @State private var oabtDogru:Double = 30
    @State private var oabtYanlis:Double = 0
    
 
    
    @State private var sonuc2022:Double = 0
    @State private var sonuc2023:Double = 0
    
    @State private var sonucEB2022:Double = 0
    @State private var sonucEB2023:Double = 0
    
    @State private var sonucOABT2023:Double = 0
    @State private var sonucOABT2022:Double = 0
    
    @State private var oabtKatSayi = 0.4334
    @State private var oabtPuan = 43.805
    
    
    @State private var selectedOption = 0
    
    let options = [
           (0.4334,43.805, "Beden Eğitimi"),
           (0.3666,41.071, "Biyoloji"),
           (0.4301,39.060, "Coğrafya"),
           (0.4052,34.908, "Din Kültürü"),
           (0.3679,42.156, "Edebiyat"),
           (0.5388,39.313, "Fen Bilgisi"),
           (0.3817,41.604, "Fizik"),
           (0.5225,36.309, "İlköğretim Matematik"),
           (0.3883,37.962, "İmam Hatip Meslek Dersleri Ö."),
           (0.3791,40.920, "İngilizce"),
           (0.4542,42.157, "Kimya"),
           (0.4247,41.759, "Lise Matematik"),
           (0.4944,33.292, "Okul Öncesi"),
           (0.4883,29.014, "Rehberlik "),
           (0.6184,33.598, "Sınıf Öğretmenliği"),
           (0.6142,34.101, "Sosyal Bilgiler"),
           (0.3521,41.418, "Tarih"),
           (0.4565,34.329, "Türkçe")
       ]

    @State private var isShowingSheet = false
    
    
    var body: some View {
        VStack {
            
            Form  {

                
                Section {
                    
                    Stepper(value: $genelYetenekDogruSayisi , in: 0...(60-genelYetenekYanlisSayisi)){
                        Label ("Doğru Sayısı: \(genelYetenekDogruSayisi, specifier: "%.0f")", systemImage: "checkmark.circle")
                    }
                        .sensoryFeedback(.selection, trigger: genelYetenekDogruSayisi)
                    
                    Stepper(value: $genelYetenekYanlisSayisi, in: 0...(60-genelYetenekDogruSayisi)){
                        Label("Yanlış Sayısı: \(genelYetenekYanlisSayisi, specifier: "%.0f")", systemImage: "xmark.circle")
                    }
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
                    
                    Picker("Bölüm Seçiniz", selection: $selectedOption) {
                        ForEach(0..<options.count, id:\.self){ index in
                            HStack{
                                Image(systemName: "person.circle.fill")
                                Text(options[index].2)
                            }
                        }
                    }
                    .onChange(of: selectedOption){
                        oabtKatSayi = options[selectedOption].0
                        oabtPuan = options[selectedOption].1
                    }
                    
                    Stepper("Doğru Sayısı: \(oabtDogru, specifier: "%.0f")",value: $oabtDogru , in: 0...(75-oabtYanlis))
                        .sensoryFeedback(.selection, trigger: egitimBilimleriDogruSayisi)
                    
                    Stepper("Yanlış Sayısı: \(oabtYanlis, specifier: "%.0f")", value: $oabtYanlis, in: 0...(75-oabtDogru))
                        .sensoryFeedback(.selection, trigger: egitimBilimleriYanlisSayisi)
                    
                    HesaplaButton(title: "Hesapla") {
                        
                        let genelKulturNet = genelKulturdogruSayisi - (genelKulturYanlisSayisi / 4)
                        let genelYetenekNet = genelYetenekDogruSayisi - (genelYetenekYanlisSayisi / 4)
                        let egitimBilimleriNet = egitimBilimleriDogruSayisi - (egitimBilimleriYanlisSayisi / 4)
                        _ = oabtDogru - (oabtYanlis / 4)
                        
                        sonuc2022 = 48.616 + genelYetenekNet * 0.4756 + genelKulturNet * 0.4192
                        sonucEB2022 = 36.812 + genelYetenekNet * 0.3985 + genelKulturNet * 0.3512 + egitimBilimleriNet * 0.34714
                        sonucOABT2022 = oabtPuan + genelYetenekNet * 0.1720 + genelKulturNet * 0.1515 + egitimBilimleriNet * oabtKatSayi
                           
                        sonuc2023 = 51.209 + genelYetenekNet * 0.537 + genelKulturNet * 0.418
                        sonucEB2023 = 40.405 + genelYetenekNet * 0.3493 + genelKulturNet * 0.3672 + egitimBilimleriNet * 0.37145
                           
                        isShowingSheet.toggle()
                        
                    }
//                    .disabled(formKontrol)
                    .sensoryFeedback(.selection, trigger: sonuc2022)
                    .sheet(isPresented: $isShowingSheet){
                        SonucView(sonuc2023: sonuc2023, sonucEB2023: sonucEB2023, sonucOABT2023: nil, sonuc2022: sonuc2022, sonucEB2022: sonucEB2022, sonucOABT2022: sonucOABT2022)
                    }
                    
                }header: {
                    Text("ÖABT")
                        .textCase(.none)
                        .foregroundColor(.orange)
                    
//                    Footer ile mesaj gösteriyoruz.
                } footer: {
                    if (egitimBilimleriDogruSayisi + egitimBilimleriYanlisSayisi > 80 ) {
                        Text("Doğru ve Yanlış sayıların toplamı 75'ı geçemez!")
                            .foregroundStyle(.orange)
                    }
                }
              
            }
            .navigationTitle("ÖABT")
        }
//        tabbarı gizlemek için kullanılıyor. farklı şeyler de gizlenebilir.
        .toolbar(.hidden, for: .tabBar)
    }
    
    var formKontrol: Bool {
        if ((genelYetenekDogruSayisi + genelYetenekYanlisSayisi) > 60 || (genelKulturdogruSayisi + genelKulturYanlisSayisi) > 60 || ( egitimBilimleriDogruSayisi + egitimBilimleriYanlisSayisi) > 80 || (oabtDogru + oabtYanlis ) > 75 ){
           return  true
        }
        return false
    }
}

#Preview {
    OABTView()
}
