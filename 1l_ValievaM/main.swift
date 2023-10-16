//
//  main.swift
//  1l_ValievaM
//
//  Created by Мадина Валиева on 21.09.2023.
//

import Foundation

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.


enum RunMute {
    case runEngine, muteEngine, openWindows, closeWindows, loadFromLuggage(Double), unloadFromLuggage(Double)
}

struct SportCar {
    
    var brend: String
    var yearOfIssue: Int
    var trunkVolume: Int
    var isTheEngineRunning: Bool
    var isTheWindowsOpen:Bool
    var filledLuggageVolume: Double
    
    mutating func method (par: RunMute) {
        switch par {
        case .runEngine:
            isTheEngineRunning = true
        case .muteEngine:
            isTheEngineRunning = false
        case .openWindows:
            isTheWindowsOpen = true
        case .closeWindows:
            isTheWindowsOpen = false
        case .loadFromLuggage(let volume):
            if filledLuggageVolume <= volume {
                print ("багаж перегружен")
            } else {
                print ("машина может ехать")
            }
        default:
            print("не удалось распознать запрос")
        }
    }
    
}
var ford = SportCar(brend: "Ford", yearOfIssue: 2006, trunkVolume: 685, isTheEngineRunning: true, isTheWindowsOpen: false, filledLuggageVolume: 363)
ford.method(par: .runEngine)
ford.method(par: .loadFromLuggage(345))

print(ford)


//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum CarAction {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadCargo(volume: Double)
    case unloadCargo(volume: Double)
}

class Car {
    var brand: String
    var year: Int
    var engineRunning: Bool
    var windowsOpen: Bool
    
    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
        self.engineRunning = false
        self.windowsOpen = false
    }
    
    func perform(action: CarAction) {
        // Пустой метод, который будет переопределен в подклассах
    }
}

class TrunkCar: Car {
    var cargoVolume: Double
    
    init(brand: String, year: Int, cargoVolume: Double) {
        self.cargoVolume = cargoVolume
        super.init(brand: brand, year: year)
    }
    
    override func perform(action: CarAction) {
        switch action {
        case .loadCargo(let volume):
            if cargoVolume >= volume {
                cargoVolume -= volume
                print("Груз объемом \(volume) куб. м загружен. Остаток груза: \(cargoVolume) куб. м")
            } else {
                print("Недостаточно места в багажнике для груза объемом \(volume) куб. м.")
            }
        case .unloadCargo(let volume):
            if cargoVolume + volume <= 100 {
                cargoVolume += volume
                print("Груз объемом \(volume) куб. м выгружен. Остаток груза: \(cargoVolume) куб. м")
            } else {
                print("Багажник полон, вы не можете выгрузить больше груза.")
            }
        default:
            super.perform(action: action)
        }
    }
}

class SportCar2: Car {
    var topSpeed: Int
    
    init(brand: String, year: Int, topSpeed: Int) {
        self.topSpeed = topSpeed
        super.init(brand: brand, year: year)
    }
    
    override func perform(action: CarAction) {
        switch action {
        case .loadCargo(let volume):
            if volume >= 0 {
                print ("автомобиль не предназначен для груза")
            }
        default:
            super.perform(action: action)
        }
        
        
    }
    
}
// Пример использования
var sportsCar = SportCar2(brand: "Ferrari", year: 2022, topSpeed: 250)
print(sportsCar.perform(action: .loadCargo(volume: 1)))

var trunkCar = TrunkCar(brand: "Volvo", year: 2020, cargoVolume: 50.0)
trunkCar.perform(action: .startEngine)
trunkCar.perform(action: .loadCargo(volume: 30.0))
trunkCar.perform(action: .unloadCargo(volume: 20.0))

print("Спортивный автомобиль: марка - \(sportsCar.brand), год выпуска - \(sportsCar.year), максимальная скорость - \(sportsCar.topSpeed) км/ч")
print("Грузовик: марка - \(trunkCar.brand), год выпуска - \(trunkCar.year), объем багажника - \(trunkCar.cargoVolume) куб. м")


