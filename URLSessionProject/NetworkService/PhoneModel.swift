//
//  PhoneModel.swift
//  URLSessionProject
//
//  Created by WEMA on 16/01/2024.
//

import Foundation

struct PhoneModel: Codable{
    let products: [PhoneObj]?
}

struct PhoneObj: Codable{
    let title: String?
    let price: Double?
    let thumbnail: String?
}


