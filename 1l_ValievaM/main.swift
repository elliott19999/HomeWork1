//
//  main.swift
//  1l_ValievaM
//
//  Created by Мадина Валиева on 21.09.2023.
//

import Foundation

//1. Задание Необходимо разработать простое текстовое приложение для управления и отображения событий в календаре.
// Создаем словарь для хранения событий
var calendarEvents = [String: [String]]()

// Функция для добавления события
func addEvent(date: String, event: String) {
    if var events = calendarEvents[date] {
        events.append(event)
        calendarEvents[date] = events
    } else {
        calendarEvents[date] = [event]
    }
}

// Функция для отображения событий на определенную дату
func displayEvents(date: String) {
    if let events = calendarEvents[date] {
        print("События на \(date):")
        for event in events {
            print("- \(event)")
        }
            } else {
                print("Событий на \(date) нет.")
        }
    }

    // Функция для отображения меню и взаимодействия с пользователем
    func displayMenu() {
        while true {
            print("\nМеню:")
            print("1. Добавить событие")
            print("2. Показать события на дату")
            print("3. Выйти из приложения")

            if let choice = readLine() {
                switch choice {
                case "1":
                    print("Введите дату (в формате ДД.ММ.ГГГГ):")
                    if let date = readLine() {
                        print("Введите событие:")
                        if let event = readLine() {
                            addEvent(date: date, event: event)
                            print("Событие добавлено.")
                        } else {
                            print("Ошибка: Неверный ввод события.")
                        }
                    } else {
                        print("Ошибка: Неверный ввод даты.")
                    }

                case "2":
                    print("Введите дату для просмотра событий (в формате ДД.ММ.ГГГГ):")
                    if let date = readLine() {
                        displayEvents(date: date)
                    } else {
                        print("Ошибка: Неверный ввод даты.")
                    }

                case "3":
                    print("Выход из приложения.")
                    return

                default:
                    print("Ошибка: Неверный выбор. Попробуйте еще раз.")
                }
            }
        }
    }

//2 Задание: Хранилище настроек

var settingsDictionary: [String: String] = [:]

// Метод для установки настройки
func setSetting(key: String, value: String) {
    settingsDictionary[key] = value
}

// Метод для извлечения настройки по ключу
func getSetting(key: String) -> String? {
    return settingsDictionary[key]
}

// Метод для удаления настройки по ключу
func removeSetting(key: String) {
    settingsDictionary[key] = nil
}

// Пример использования
// Установка настройки
setSetting(key: "Language", value: "English")

// Извлечение настройки
if let language = getSetting(key: "Language") {
    print("Язык: \(language)")
} else {
    print("Настройка 'Language' не найдена.")
}

// Удаление настройки
removeSetting(key: "Language")

    // Запуск приложения
    displayMenu()
    //
//3 Задание: Простой англо-русский переводчик
    //
    // Создаем словарь с английскими и русскими словами
    
    let dictionary: [String: String] = [
        "hello": "привет",
        "world": "мир",
        // Добавьте другие слова и переводы по мере необходимости
    ]
    
    // Функция для перевода слова
    func translateWord(_ word: String) -> String? {
        return dictionary[word]
    }
    
    //// Функция для вывода меню и обработки ввода пользователя
    func showMenu() {
        
        print("Выберите опцию:")
        print("1. Перевести слово")
        print("2. Выйти из приложения")
        
        if let choice = readLine() {
            switch choice {
            case "1":
                print("Введите слово на английском:")
                if let inputWord = readLine() {
                    if let translation = translateWord(inputWord) {
                        print("Перевод: \(translation)")
                    } else {
                        print("Перевод не найден")
                    }
                }
            case "2":
                return
            default:
                print("Некорректный выбор. Попробуйте снова.")
            }
        }
    }
    
    
    // Запускаем приложение
showMenu()


//4. Задание: Справочник городов по странам
    var countriesAndCities: [String: Set<String>] = ["россия" : ["москва","питер"], "америка" : ["вашингтон","нью йорк"]]
    
    func addCityToCountry(country: String, city: String) {
        if var cities = countriesAndCities[country] {
            cities.insert(city)
            countriesAndCities[country] = cities
        } else {
            countriesAndCities[country] = [city]
        }
    }
    addCityToCountry(country: "россия", city: "саратов")
    print(countriesAndCities)
    
    // Функция для удаления города из страны
    func removeCityFromCountry(country: String, city: String) {
        if var cities = countriesAndCities[country] {
            cities.remove(city)
            if cities.isEmpty {
                countriesAndCities.removeValue(forKey: country)
            } else {
                countriesAndCities[country] = cities
            }
        }
    }
    
    // Функция для просмотра городов страны
    func viewCitiesInCountry(country: String) {
        if let cities = countriesAndCities[country] {
            if cities.isEmpty {
                print("В стране нет городов.")
            } else {
                print("Города в стране \(country):")
                for city in cities {
                    print(city)
                }
            }
        } else {
            print("Страна не найдена в базе данных.")
        }
    }
    
    // Функция для отображения меню и взаимодействия с пользователем
    func sshowMenu() {
        print("Выберите опцию:")
        print("1. Добавить город к стране")
        print("2. Удалить город из страны")
        print("3. Просмотр городов страны")
        print("4. Выйти из приложения")
        
        if let choice = readLine() {
            switch choice {
            case "1":
                print("Введите название страны:")
                if let country = readLine() {
                    print("Введите название города:")
                    if let city = readLine() {
                        addCityToCountry(country: country, city: city)
                        print("Город \(city) добавлен к стране \(country).")
                    }
                }
            case "2":
                print("Введите название страны:")
                if let country = readLine() {
                    print("Введите название города:")
                    if let city = readLine() {
                        removeCityFromCountry(country: country, city: city)
                        print("Город \(city) удален из страны \(country).")
                    }
                }
            case "3":
                print("Введите название страны:")
                if let country = readLine() {
                    viewCitiesInCountry(country: country)
                }
            case "4":
                return
            default:
                print("Некорректный выбор. Попробуйте снова.")
            }
        }
    }
    
    
    // Запускаем приложение
sshowMenu()

//5. Задание: Нахождение общих элементов двух массивов

    func arrays(ar1: [Int], ar2: [Int]) -> [Int] {
        let setAr = Set(ar1)
        let setAr2 = Set(ar2)
        let commonElements = setAr.intersection(setAr2)
        return Array(commonElements)
    }
    
    print(arrays(ar1: [65, 68, 8, 87], ar2:[65,8,90,7] ))
    
    
    //6 Задание: Поиск общих друзей двух пользователей
    
    var friendsList: [String:Set<String>] = ["Алекс":["Ирина", "Андрей"],
                                             "Мадина":["Ирина", "Андрей"]]
    
    func findCommonFriends (user1:String, user2:String) -> Set<String>? {
        if let us1 = friendsList[user1], let us2 = friendsList[user2] {
            let common = us1.intersection(us2)
            print("\(user1) и \(user2) общие их друзья \(common)")
            return common
        } else {
            print("один из пользователей не найден в списке друзей.")
            return nil
        }
    }
    
    if let res = findCommonFriends(user1:"Алекс", user2: "юля"){
        print(res)
    }
    // 7. Задание: Найти уникальные элементы в массиве
    
    func uniqueElements(numbers: [Int]) -> [Int] {
        var result = Set(numbers)
        return Array(result)
    }
    print(uniqueElements(numbers: [4, 5, 3, 3,4,5,1,6,7]))
    
    // 8 Задание:  Реализация простого телефонного справочника
    
    var spravochnik: [String:String] = ["Саша": "895898695",
                                        "Мадина" : "8909859550"]
    
    
    func addNumber(name: String, number: String) {
        spravochnik[name] = number
        
    }
    addNumber(name: "Алина", number: "899999999")
    print(spravochnik)
    
    //removeNumber:
    //Входной параметр: имя (name).
    //Удаляет номер телефона, связанный с данным именем из справочника.
    
    func removeNumber(name: String, number: String) {
        spravochnik.removeValue(forKey:name)
    }
    print(removeNumber(name: "Алина", number: "899999999"))
    print(spravochnik)
    
    //findNumber:
    //Входной параметр: имя (name).
    //Возвращает номер телефона для данного имени (если он есть в справочнике) или nil, если такого имени нет.
    
    func findNumber(name:String) -> String? {
        guard let number = spravochnik[name] else {
            print("имя не найдено")
            return nil
        }
        return number
    }
    if let number1 = findNumber(name: "Алена") {
        print(number1)
    }
    
    //9 Задание: Реализация теста по умножению
    
    
    var questionsAsked = Set<String>()
    var questionsAndAnswers = [String: Int]()
    var correctAnswers = 0
    
    func generateUniqueMultiplicationQuestion () -> (question: String, answer: Int) {
        var question: String
        var answer: Int
        repeat {
            let operand1 = Int.random(in: 1...10)
            let operand2 = Int.random(in: 1...10)
            question = "\(operand1) x \(operand2) = ?"
            answer = operand1 * operand2
        } while questionsAsked.contains(question)
        questionsAsked.insert(question)
        questionsAndAnswers[question] = answer
        return (question, answer)
    }
    
    
    // Функция для проведения теста
    func runMultiplicationTest() {
        var askedQuestions = Set<String>()
        var correctAnswers = 0
        
        for _ in 1...10 {
            let (question, answer) = generateUniqueMultiplicationQuestion()
            print(question)
            
            print("referf")
            
            if let userAnswer = Int(readLine() ?? "2") {
                if userAnswer == answer {
                    print("Правильно!")
                    correctAnswers += 1
                } else {
                    print("Неверно. Правильный ответ: \(answer)")
                }
            }
            
            // Определение и вывод оценки
            switch correctAnswers {
            case 10:
                print("Оценка: Отлично!")
            case 7..<10:
                print("Оценка: Хорошо!")
            case 5..<7:
                print("Оценка: Удовлетворительно.")
            default:
                print("Оценка: Нужно больше практики.")
            }
        }
    }

runMultiplicationTest()
