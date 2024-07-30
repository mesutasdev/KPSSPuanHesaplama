//
//  SonucView.swift
//  KPSS Puan Hesaplama
//
//  Created by Artı Studio on 26.07.2024.
//

import SwiftUI

struct SonucView: View {
    
    let sonuc2023: Double
    let sonucEB2023: Double
    let sonucOABT2023: Double?
    
    let sonuc2022: Double
    let sonucEB2022: Double
    let sonucOABT2022: Double?
    
    @Environment(\.dismiss) private var dismiss
    
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                List {
                    
                    Section {
                        
                      
                            Text("2023 P3 (Memur): \(sonuc2023, specifier: "%.3f")")
                            Text("2023 P10 (Öğretmen): \(sonucEB2023, specifier: "%.3f")")
                        
                        if sonucOABT2023 != nil {
                            Text("2023 P121 (Alan): \(sonucOABT2023 ?? 0 , specifier: "%.3f")")
                        }
                           
                        
                        
                    } header: {
                        Text("2023 KPSS")
                            .foregroundStyle(.orange)
                    }
                    
                    Section {
                       
                            Text("2022 P3 (Memur): \(sonuc2022, specifier: "%.3f")")
                            Text("2022 P10 (Öğretmen): \(sonucEB2022, specifier: "%.3f")")
                        if sonucOABT2022 != nil {
                            Text("2022 P121 (Alan): \(sonucOABT2022 ?? 0 , specifier: "%.3f")")
                        }
                           
                      
                    } header: {
                        Text("2022 KPSS")
                            .foregroundStyle(.orange)
                    }
                }
            }
            .navigationTitle("Sonuç")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem{
                        Button("Kapat", systemImage: "xmark") {
                            dismiss()
                        }
                    }
                }
        }
    }
}

#Preview {
    SonucView(sonuc2023: 0, sonucEB2023: 0, sonucOABT2023: 0, sonuc2022: 0, sonucEB2022: 0, sonucOABT2022: 0)
}
