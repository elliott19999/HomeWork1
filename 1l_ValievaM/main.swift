//
//  main.swift
//  1l_ValievaM
//
//  Created by Мадина Валиева on 21.09.2023.
//

import Foundation

//1 -  Задание: Времена года и их температура

enum Season {
    case winter, spring, summer, fall
    var averageTemperature: String {
        switch self {
        case .winter:
            return "-27"
        case .spring:
            return "18"
        case .summer:
            return "25"
        case .fall:
            return "12"
        }
        }
    func showAvTemp() -> String {
        switch self {
        case .winter:
            return "средняя температура зимой составляет \(averageTemperature) градусов"
        case .spring:
            return "средняя температура весной составляет \(averageTemperature) градусов"
        case .summer:
            return "средняя температура летом состовляет \(averageTemperature) градусов"
        case .fall:
            return "средняя температура осенью состовляет \(averageTemperature) градусов"
        }
    }
    }

var result = Season.winter
print(result.showAvTemp())

//2 -  Задание: Информация о транспортных средствах

enum Transport {
    case car(Int)
    case bicycle(Int)
    case train(Int)
    case plane(Int)
}

func speed(par: Transport) {
    switch par {
    case .car(let value):
       print("максимальная скорость автомобиля равна \(value) км/ч")
    case .bicycle(let value):
        print("максимальная скорость мотоцикла равна \(value) км/ч")
    case .train(let value):
        print("максимальная скорость автобуса равна \(value) км/ч")
    case .plane(let value):
        print("максимальная скорость самолета равна \(value) км/ч")
    }
}

let car = Transport.car(190)
speed(par: car)

//3 -  Задание: Статусы платежей

enum PaymentStatus {
    case unpaid
    case inProgress
    case paid(paymentDate: Date)
    case error(errorMessage: String)
}

// Функция для вывода информации о платеже в зависимости от его статуса
func printPaymentDetails(status: PaymentStatus) {
    switch status {
    case .unpaid:
        print("Платеж неоплачен")
    case .inProgress:
        print("Платеж в обработке")
    case .paid(let paymentDate):
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        print("Платеж оплачен. Дата оплаты: \(dateFormatter.string(from: paymentDate))")
    case .error(let errorMessage):
        print("Ошибка в обработке платежа. Причина: \(errorMessage)")
    }
}


let unpaidPayment = PaymentStatus.unpaid
printPaymentDetails(status: unpaidPayment)
let inProgressPayment = PaymentStatus.inProgress
printPaymentDetails(status: inProgressPayment)
let paidPayment = PaymentStatus.paid(paymentDate: Date())
printPaymentDetails(status: paidPayment)
let errorPayment = PaymentStatus.error(errorMessage: "Ошибка при обработке платежа")
printPaymentDetails(status: errorPayment)

//4 -  Задание: Рекомендации по режимам камеры

enum CameraMode {
    case auto, portrait, landscape, night
    
    func comment() -> String {
        switch self {
        case .auto:
            return "полностью автоматическая съемка"
        case .portrait:
            return "внимание акцентируется на снимаемом человеке, а задний фон при этом размывается"
        case .landscape:
            return "для фотографирования пейзажей, т.е. обеспечивается фокусировка и на ближних и на удаленных объектах"
        case .night:
            return "для съемки объектов ночью"
        }
    }
        
    }
var camera = CameraMode.landscape
print(camera.comment())

//5 - Задание: Диеты животных в зоопарке
enum AnimalType {
    case predator, herbivore, insect
    
    func animalFood() -> String {
        switch self {
        case .predator:
            return "Хищники питаются мясом других животных"
        case .herbivore:
            return "Травоядные животные питаются пищей растительного происхождения, включая траву, фрукты, листья, корни, луковицы, овощи и т.д."
        case .insect:
            return "Одни насекомые питаются растениями (корни, стебли, листья), семенами, фруктами, вторые (хищные насекомые) питаются другими насекомыми"
            
        }
    }
}
var predator = AnimalType.predator
print(predator.animalFood())

//6 - Задание: Отслеживание статуса заказа в ресторане

enum OrderStatus {
    case accepted, preparing, readyToServe, delivered
    
    func status () -> String {
        switch self {
        case .accepted:
            return "статус заказа \"Принят\", следущий статус заказа \"Готовится\""
        case .preparing:
            return "статус заказа \"Готовится\", следущий статус заказа \"Готов к подаче\""
        case .readyToServe:
            return "статус заказа \"Готов к подаче\", следущий статус заказа \"Доставляется\""
        case .delivered:
            return "статус заказа \"Доставляется\"."
        
        }
    }
}
var checkStatus = OrderStatus.accepted
print(checkStatus.status())

//7 - Задание: Информация о номерах в отеле

enum RoomType {
    case single, double, suite
    var infoRoom: String {
        switch self {
        case .single:
            return "стоимость 1500руб., количество доступных номеров для выбранного типа комнаты - 5"
        case .double:
            return "стоимость 2500руб., количество доступных номеров для выбранного типа комнаты - 3"
        case .suite:
            return "стоимость 3500руб., количество доступных номеров для выбранного типа комнаты - 1"
        }
    }
}
var room = RoomType.single
print(room.infoRoom)

//8 - Задание: Уровни сложности в игре
enum DifficultyLevel {
    case easy
    case medium
    case hard
    case expert
    
    func gameParameters() -> (enemyCount: Int, timeLimit: TimeInterval) {
        switch self {
        case .easy:
            return (enemyCount: 10, timeLimit: 300)
        case .medium:
            return (enemyCount: 20, timeLimit: 240)
        case .hard:
            return (enemyCount: 30, timeLimit: 180)
        case .expert:
            return (enemyCount: 50, timeLimit: 120)
        }
    }
}

let selectedLevel = DifficultyLevel.medium
let (enemyCount, timeLimit) = selectedLevel.gameParameters()
print(selectedLevel.gameParameters())
print("Уровень сложности: \(selectedLevel)")
print("Количество врагов: \(enemyCount)")
print("Временное ограничение: \(timeLimit) секунд")

//9 - Задание: Прогноз погоды по облачности

enum Cloudiness {
    case clear
    case partlyCloudy
    case cloudy
    case overcast
    
    func precipitationProbability() -> String {
        switch self {
        case .clear:
            return "Вероятность осадков: 10%"
        case .partlyCloudy:
            return "Вероятность осадков: 30%"
        case .cloudy:
            return "Вероятность осадков: 50%"
        case .overcast:
            return "Вероятность осадков: 70%"
        }
    }
}

// Пример использования
let currentCloudiness = Cloudiness.partlyCloudy
let precipitationForecast = currentCloudiness.precipitationProbability()

print("Уровень облачности: \(currentCloudiness)")
print(precipitationForecast)

//10 - Задание: Цены напитков в автомате
enum DrinkType {
    case coffee, tea, hotChocolate, water
    var price: String {
        switch self {
        case .coffee:
            return "стоимость кофе - 100руб."
        case .tea:
            return "стоимость чая - 50руб."
        case .hotChocolate:
            return "стоимость горячего шоколада - 300руб."
        case .water:
            return "стоимость воды - 100руб."
        }
    }
}
    var priceCoffe = DrinkType.coffee
    print(priceCoffe.price)
