//
//  main.swift
//  1l_ValievaM
//
//  Created by Мадина Валиева on 21.09.2023.
//

import Foundation

print("Hello, World!")

//ДЗ к 9 уроку

class Weapon {
    let nameWeapon: String
    var owner: Fighter?
    init(nameWeapon: String) {
        self.nameWeapon = nameWeapon
    }
}
class Fighter {
    var name: String
    var typeFighter: String {"какой то боец"}
    
    var weapon: Weapon
    private var heal = 0
    var h: Int {
        get { heal }
        set {heal = newValue}
    }
    
    var strenght: Int {1}

    
    init(name: String,  heal: Int, weapon: Weapon) {
        self.name = name
        self.weapon = weapon
        self.heal = heal
    }

    
    func reduseDamage() {
        var damage = strenght * 10
        heal = max(0, heal - damage)
    }
    func attack() {
        guard !isDead() else {
            print ("\(name) совершил атаку используя \(weapon) и погиб")
            return
        }
        print("\(name) совершил атаку")
        reduseDamage()
        
    }
    func balanceHP() {
        print("текущее состояние здоровья \(name) ровно \(heal)")
    }
    func isDead() -> Bool {
        heal == 0 ? true : false
        
    }
}

class Warrior: Fighter {
    var shieldBash: Int {30}
    
    override var strenght: Int { 2
    }
    
    func shieldBashj () {
        guard !isDead() else {
            print("\(name) атаковал используя удор щитом и погиб")
            return
        }
        print("\(name) атаковал используя удор щитом")
        h -= shieldBash
    }
    
}
let weapon = Weapon(nameWeapon: "нож")
let warrior = Warrior(name: "mark", heal: 100, weapon: weapon)
warrior.shieldBashj()
warrior.balanceHP()
warrior.attack()
warrior.balanceHP()
warrior.shieldBashj()
warrior.balanceHP()

class Mag: Fighter {

        var castSpell: Int { 20 }
        
        override var strenght: Int { 2
        }
        
        func castSpelll () {
            guard !isDead() else {
                print("\(name) атаковал используя заклинание и погиб")
                return
            }
            print("\(name) атаковал используя заклинание")
            h -= castSpell
        }
        
    }


struct Person: Hashable {
     var name: String
    var age: Int
}


protocol PeopleProtocol {
    func introduce()
}

protocol DefenseProtocol {
    func reduceDamage()
    func balanceHP()
    func isDead() -> Bool
}

protocol AttackProtocol {
    func attack()
}

struct People: PeopleProtocol {
    let name: String

    func introduce() {
        print("Меня зовут \(name).")
    }
}

extension Warrior: AttackProtocol {}
extension Mag: AttackProtocol {}

let sword = Weapon(nameWeapon: "Меч")
let warrior2 = Warrior(name: "Рыцарь", heal: 100, weapon: sword)


let staff = Weapon(nameWeapon: "Посох")
let mage = Mag(name: "Волшебник", heal: 80, weapon: staff)


let person = People(name: "Алекс")
person.introduce()

warrior.attack()
mage.attack()
warrior2.shieldBashj()
mage.castSpelll()
