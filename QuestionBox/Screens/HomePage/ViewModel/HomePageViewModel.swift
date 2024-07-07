//
//  HomePageViewModel.swift
//  QuestionBox
//
//  Created by Ertugrul Berber on 17.06.2024.
//

import Foundation

class HomePageViewModel: BaseViewModel {
    let kategoriler: [Kategori] = [
        Kategori(id: 1, isim: "Flört", renk: "FFD6F1", iconType: .flort, sorular: flortSorular),
        Kategori(id: 2, isim: "Sevgiliye Komik", renk: "AEE034", iconType: .darlingFunny, sorular: sevgiliyeKomik),
        Kategori(id: 3, isim: "Sevgiliye Romantik", renk: "FFCA28", iconType: .darlingLove, sorular: sevgiliyeRomantik)
    ]
}
