//
//  ExampleModel.swift
//  Sopkathon
//
//  Created by 권석기 on 5/17/25.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct ExampleModel: Encodable {}
