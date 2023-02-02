//
//  DogBreeds.swift
//  A2_WebServices
//
//  Created by Shivam Bajaj on 2023-02-01.
//

import Foundation

struct DogBreeds: Codable {
    var message: [String: [String]]
    var status: String
}

struct DogImage: Codable{
    var image: String
}


class Dog: Codable{
    var name: String
    init(name: String){
        self.name = name
    }
}
