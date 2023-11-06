//
//  main.swift
//  1l_ValievaM
//
//  Created by Мадина Валиева on 21.09.2023.
//

import Foundation

//1. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

enum RunMute {
    case runEngine, muteEngine, openWindows, closeWindows, loadFromLuggage(Double), unloadFromLuggage(Double)
}

struct SportCar {
    
    var brend: String
    var yearOfIssue: Int
    var trunkVolume: Int
    var isTheEngineRunning: Bool
    var isTheWindowsOpen: Bool
    var filledLuggageVolume: Double
    
    mutating func method(_ par: RunMute) {
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
                print("багаж перегружен")
            } else {
                print("машина может ехать")
            }
        default:
            print("не удалось распознать запрос")
        }
    }
    
    // Метод map для изменения значения заполненного объема багажника
    func mapLuggageVolume(transform: (Double) -> Double) -> SportCar {
        var updatedCar = self
        updatedCar.filledLuggageVolume = transform(updatedCar.filledLuggageVolume)
        return updatedCar
    }

    // Метод filter для фильтрации объектов, чья машина заведена
    static func filterRunningCars(_ cars: [SportCar]) -> [SportCar] {
        return cars.filter { $0.isTheEngineRunning }
    }
    
    // Метод reduce для нахождения суммы заполненного багажника у всех машин
    static func reduceTotalLuggageVolume(_ cars: [SportCar]) -> Double {
        return cars.reduce(0) { $0 + $1.filledLuggageVolume }
    }
}

// Пример использования методов
var car1 = SportCar(brend: "Ferrari", yearOfIssue: 2022, trunkVolume: 100, isTheEngineRunning: false, isTheWindowsOpen: false, filledLuggageVolume: 50)
var car2 = SportCar(brend: "Lamborghini", yearOfIssue: 2023, trunkVolume: 120, isTheEngineRunning: true, isTheWindowsOpen: true, filledLuggageVolume: 70)

let cars = [car1, car2]

let updatedCar1 = car1.mapLuggageVolume { $0 + 10 }

let runningCars = SportCar.filterRunningCars(cars)

let totalLuggageVolume = SportCar.reduceTotalLuggageVolume(cars)
print("Суммарный объем багажника всех машин: \(totalLuggageVolume)")



//2.Разработать замыкание выполняющее сортировку массива схожий с методом высшего порядка sort


func kindOfSort (element1: [Int], element2: (Int) -> Bool) -> [Int] {
    
    var numbers = [Int]()
    element1.forEach { numb in
        if element2(numb) {
            numbers.append(numb)
        }
    }
    
    return numbers
    
}
let array = [4, 34, 5, 1, 12]
let example = kindOfSort(element1: array) { item in
    return item % 2 == 0
  
}
print(example)


