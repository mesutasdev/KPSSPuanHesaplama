//
//  ResultVİew.swift
//  KPSS Puan Hesaplama
//
//  Created by Mesut As Developer on 25.07.2024.
//

import SwiftUI
import SwiftData
//import Lottie

struct ResultView: View {
    
    @Environment(\.modelContext) private var modelContext
    
//    sort ve order ile filtreleme yaptık.
    
    @Query (sort: \Result.tarih, order: .reverse) private var results:[Result]
    
    var body: some View {
        NavigationStack {
            VStack {
                List  {
                    ForEach(results){ result in
                        VStack(alignment: .leading) {
                            Text(result.sinavAdi)
                                .bold()
                                .font(.headline)
                            HStack{
                                HStack(alignment: .top){
                                    Text("Genel Yetenek:")
                                    Text(result.genelYetenekNet.formatted())
                                    
                                }
                                Spacer()
                                HStack(alignment: .top){
                                    Text("ÖABT:")
                                    Text((result.OABTNet ?? 0).formatted())
                                }
                            }
                            
                            HStack{
                                HStack(alignment: .top){
                                    Text("Genel Kültür:")
                                    Text(result.genelKulturNet.formatted())
                                    
                                }
                                Spacer()
                                HStack(alignment: .top){
                                    Text("Eğitim Bilimleri:")
                                    Text((result.egitimBilimleriNet ?? 0).formatted())
                                }
                            }
                            
                          
                                HStack(alignment: .top){
                                    Text("Puan:")
                                    Text(result.sonuc.formatted())
                                        .bold()
                                        .italic()
                                    
                                }
                              
                            HStack {
                                Spacer()
                                Text(result.tarih.formatted(date: .complete, time: .standard ))
                                    .font(.footnote)
                                    .italic()
                                }
                            }
                            
                        }
                    .onDelete{ indexSet in
                        for index in indexSet {
                            modelContext.delete(results[index])
                        }
                    }
                 
                }
                .overlay{
                    if results.isEmpty {
                       
                        ContentUnavailableView("Sonuç Bulumadı", systemImage:"magnifyingglass", description: Text("Henüz sonuç bulunamadı. Puan Hesaplamaya başlamak için lütfen Başlangıç sekmesini kullanın."))
                    } 
                }
            }
            .navigationTitle("Geçmiş Hesaplamalar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                EditButton()
            }
            }
           
        }
        
    }


#Preview {
    ResultView()
}
