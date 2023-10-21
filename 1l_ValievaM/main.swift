//
//  main.swift
//  1l_ValievaM
//
//  Created by Мадина Валиева on 21.09.2023.
//

import Foundation

print("Hello, World!")

//ДЗ к 8 уроку

class Fighter {
    var name: String
    var weapon: String
    private var _health: Int
    
    var health:  Int {
        get {_health
        }
        set { _health = max(0, newValue)
        }
    }
    var strenth: Int { 1 }
    
    init (name:String, weapon: String, health:Int) {
        self.name = name
        self.weapon = weapon
        self._health = health
    }
    func reduceDamage () {
        let damage = strenth * 10
        
        health -= damage
        print ("алекс получил урон \(damage)")
        
    }
    
    func attack () {
        guard !isDead() else {
            print ("\(name) совершил атаку и погиб")
            return
        }
        print("алекс совершил атаку")
        reduceDamage()
    }
    
    func isDead () -> Bool {
        health == 0
    }
}
        let mag = Fighter(name: "alex", weapon: "топор", health: 30)
mag.attack()
mag.attack()
mag.attack()
mag.attack()
mag.health = 45
mag.attack()
mag.attack()
mag.attack()
mag.attack()
mag.attack()
mag.attack()
