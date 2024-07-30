//
//  Result.swift
//  KPSS Puan Hesaplama
//
//  Created by Artı Studio on 26.07.2024.
//

import Foundation
import SwiftData

//swiftData strucklarla çalışmıyor. Bu yüzden sınıfla çalışacağız. Not: Sınıfların yapıcı metodlarını olmak zorundadır. strucklarda bunlar yoktur. Yapıcı Metod dediğimiz şey init() açmaktır.

@Model
class Result : Identifiable {
    
    @Attribute(.unique) let id = UUID()
    let sinavAdi: String
    let genelYetenekNet: Double
    let genelKulturNet: Double
    let egitimBilimleriNet: Double?
    let OABTNet: Double?
    let tarih = Date()
    let sonuc: Double
    
    init(sinavAdi: String, genelYetenekNet: Double, genelKulturNet: Double, egitimBilimleriNet: Double? = nil , OABTNet: Double? = nil , sonuc: Double) {
        self.sinavAdi = sinavAdi
        self.genelYetenekNet = genelYetenekNet
        self.genelKulturNet = genelKulturNet
        self.egitimBilimleriNet = egitimBilimleriNet
        self.OABTNet = OABTNet
        self.sonuc = sonuc
    }
    
}
