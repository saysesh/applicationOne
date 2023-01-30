//
//  Data for Places.swift
//  kino
//
//  Created by Saida Yessirkepova on 30.01.2023.
//

import Foundation

struct DataBase {
    
    static let placeList: [Place] = [
        Place(name: "Cinemax Dostyk Multiplex", location: "г. Алматы, Самал-2, д. 111, уг.ул. Жолдасбекова, ТРЦ «Достык Плаза»", imageName: "Dostyk"),
        Place(name: "Lumiera Cinema (ЦУМ)", location: "г. Алматы, пр. Абылай хана, 62, «Арбат»", imageName: "Cym"),
        Place(name: "Kinoforum 10 (ТРЦ Forum)", location: "г. Алматы, ул. Сейфуллина, 617, ТРЦ «Forum Almaty», 5-й этаж", imageName: "Forum 1"),
        Place(name: "Kinopark 11 (Есентай) IMAX", location: "г. Алматы, пр. Аль-Фараби, 77/8, ТЦ «Esentai Mall»", imageName: "Esentai"),
        Place(name: "Chaplin MEGA Alma-Ata (ул. Розыбакиева)", location: "г. Алматы, ул. Розыбакиева, 247А, ТРЦ «MEGA Alma-Ata»", imageName: "Mega"),
        Place(name: "Chaplin MEGA Park (ул. Макатаева)", location: "г. Алматы, ул. Макатаева, 127, 3-й этаж", imageName: "Mega Park"),
        Place(name: "Kinopark 5 Premium Forum", location: "г. Алматы, ул. Сейфуллина, 617,ТРЦ «Forum Almaty», 3-й этаж", imageName: "Forum 2"),
        Place(name: "Chaplin ADK", location: "г. Алматы, ул. Сатпаева, 90 (уг. ул. Тлендиева), ТРК «АDК»", imageName: "ADK"),
        Place(name: "Kinopark 8 Moskva", location: "пр. Абая, уг. пр. Алтынсарина, ТРЦ «MOSKVA Metropolitan»", imageName: "Moskva"),
        Place(name: "Kinopark 5 Atakent", location: "ул. Тимирязева, 42, ТРЦ «Atakent Mall»", imageName: "Atakent")
    ]
}

struct Place {
    let name: String
    let location: String
    let imageName: String
}
