//
//  Extensions.swift
//  toDoApp
//
//  Created by Arika I on 2024-05-06.
//

import Foundation

extension Encodable {
    // make data more readable, into a dictionary
    
    func asDictionary() -> [String: Any]{
        guard let data = try? JSONEncoder().encode(self) else {
            return[:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
