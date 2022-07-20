//
//  FruitsProvider.swift
//  TestWorkSiberian3
//
//  Created by Наташа on 19.07.2022.
//

import Foundation

struct FruitsProvider {
    static func get() -> [Fruit] {
        return [
            Fruit(name: "Red Apple", icon: #imageLiteral(resourceName: "apple")),
            Fruit(name: "Banana", icon: #imageLiteral(resourceName: "banana")),
            Fruit(name: "Garnet", icon: #imageLiteral(resourceName: "garnet")),
            Fruit(name: "Grapes", icon: #imageLiteral(resourceName: "grapes")),
            Fruit(name: "Green Apple", icon: #imageLiteral(resourceName: "green_apple")),
            Fruit(name: "Kiwi", icon: #imageLiteral(resourceName: "kiwi")),
            Fruit(name: "Green Pears", icon: #imageLiteral(resourceName: "green_pears")),
            Fruit(name: "Mango", icon: #imageLiteral(resourceName: "mango")),
            Fruit(name: "Orange", icon: #imageLiteral(resourceName: "orange")),
            Fruit(name: "Sliced Mango", icon: #imageLiteral(resourceName: "mango2")),
            Fruit(name: "Pears", icon: #imageLiteral(resourceName: "pears")),
            Fruit(name: "Pineapple", icon: #imageLiteral(resourceName: "pineapple"))
        ]
    }
}
