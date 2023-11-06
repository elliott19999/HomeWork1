//
//  main.swift
//  1l_ValievaM
//
//  Created by Мадина Валиева on 21.09.2023.
//

import Foundation

//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

enum AuthError: Error {
    case wronPassword
    case dataNotExists
    case serverLost
}

class Authorization {
    
    func auth(login: String, pwd: String) throws {
        let trueLog = "login"
        let truePwd = "password"
        guard login == trueLog else {
            throw AuthError.dataNotExists
        }
        guard pwd == truePwd else {
            throw AuthError.wronPassword
        }
        print("hello, admin")
    }
    
}

let enter = Authorization()

do {
   try enter.auth(login: "login", pwd: "545")
} catch AuthError.dataNotExists {
    print("wrong log")
} catch AuthError.wronPassword {
    print("wrong pwd")
}

enum AnimalErorr: Error {
    case noAnimal
}

//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
class Zoopark {
    let animals = ["cat", "dog", "pig", "tiger", "rabbit"]
    
    func toSeeAnimals (animal: String) -> Bool? {
        if animals.contains(animal) {
            return true
        } else {
            print ( AnimalErorr.noAnimal)
        }
        
        return nil
    }
}

let zoo = Zoopark()
print(zoo.toSeeAnimals(animal: "wolf"))

//3. Разработайть пошаговую боевую игру "Клуб Бойцов", в которой два игрока могут создать своих бойцов и сразиться между собой.

class Fighter {
    let name: String
    var attack: Int
    var defense: Int
    var health: Int
    var agility: Int
    
    init(name: String, attack: Int, defense: Int, health: Int, agility: Int) {
        self.name = name
        self.attack = attack
        self.defense = defense
        self.health = health
        self.agility = agility
    }
}


class Game {
    var round: Int = 0
    var player1: Fighter
    var player2: Fighter
    
    init(player1: Fighter, player2: Fighter) {
        self.player1 = player1
        self.player2 = player2
    }
    
        func playRound() {
                round += 1
                print("Round \(round)")

                // Реализация атаки и уворачивания
                let attacker = round % 2 == 1 ? player1 : player2
                let defender = round % 2 == 0 ? player1 : player2
                
                let attackPower = attacker.attack * Int.random(in: 1...10)
                let dodgeChance = defender.agility * 10
                let isDodge = Int.random(in: 1...100) <= dodgeChance
                
                if isDodge {
                    print("\(defender.name) увернулся от атаки \(attacker.name)!")
                } else {
                    let damage = max(attackPower - defender.defense, 0)
                    defender.health -= damage
                    print("\(attacker.name) атаковал \(defender.name) и нанес \(damage) урона!")
                }

        // Проверьте условия победы и ничьи
        if player1.health <= 0 && player2.health <= 0 {
            print("Ничья!")
        } else if player1.health <= 0 {
            print("\(player2.name) победил!")
        } else if player2.health <= 0 {
            print("\(player1.name) победил!")
        } else if round >= 12 {
        }
    }
}
let fighter1 = Fighter(name: "Боец 1", attack: 10, defense: 5, health: 100, agility: 8)
let fighter2 = Fighter(name: "Боец 2", attack: 8, defense: 6, health: 120, agility: 7)

let game = Game(player1: fighter1, player2: fighter2)

while game.round < 12 {
    game.playRound()
}



