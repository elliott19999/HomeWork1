//
//  main.swift
//  1l_ValievaM
//
//  Created by Мадина Валиева on 21.09.2023.
//

import Foundation

// Home Work 3
//1. Сортировка чисел: Дан массив чисел. Напишите функцию, которая возвращает отсортированный массив в порядке возрастания без использования стандартной функции sort().

func bubbleSort(_ array: inout [Int]) {
    let n = array.count
    
    
    for i in 0..<n {
  
        for j in 0..<n - i - 1 {
            if array[j] > array[j + 1] {
               
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
        }
    }
}

var numbers = [64, 34, 25, 12, 22, 11, 90]
bubbleSort(&numbers)

//2. Проверка палиндрома:Напишите функцию, которая принимает строку и возвращает true, если строка является палиндромом, и false в противном случае.

var palindrom = "казак"

func searchPalindrom(stroka: String) -> Bool {
   return String (stroka.reversed()) == stroka
       
    }
print(searchPalindrom(stroka: palindrom))

//3. Сумма элементов массива:Дан массив целых чисел. Напишите функцию, которая возвращает сумму всех элементов массива.
var arrayOfNumber = [5, 34, 5, 6]

func sumOfArray(numbers: [Int]) -> Int {
    var a = 0
    for n in numbers {
    a += n
    }
    return a
}
print(sumOfArray(numbers: arrayOfNumber))

//4. Конвертация температуры: fahrenheit = (celsius * 9.0/5.0) + 32.0. Напишите функцию, которая принимает значение температуры в градусах Цельсия и возвращает его эквивалент в градусах Фаренгейта.

func fahrenheit(gradus: Int) -> Int {
    let far = (Double(gradus) * 9.0/5.0) + 32.0
    return Int(far)
}
print(fahrenheit(gradus: 25))

//5. Записная книжка: Создайте массив, который содержит имя, телефон и электронную почту. Затем напишите функцию для поиска записи по имени.

var contacts = [(name:"madina", number: "89483934", email:"valieva9719@mail.ru")]

func findContactByName(name: String) -> String? {
    for contact in contacts {
        if contact.name == name {
            print(contacts)
        } else {
            print("Контакт не найден.")
        }
    }
    return nil
}
print(findContactByName(name: "madina"))
//6. Перестановка элементов массива: Напишите функцию, которая принимает массив и возвращает новый массив, где первый элемент становится последним, а последний — первым. Остальные элементы остаются на своих местах.

var massive = [65, 54, 6, 45, 5, 9]



func reversArray(numbers: [Int]) -> [Int] {
    var reversedArray = numbers
    let pocket = numbers.first
    reversedArray[0] = reversedArray.last!
    reversedArray[numbers.count - 1] = pocket!
    return reversedArray
    
}
print(reversArray(numbers: massive))

//7. Форматирование строки: Напишите функцию, которая принимает строку и делает первую букву каждого слова заглавной.
var someString = "мне осталось решить 13 задач"

func capitalizedString(sm: String) {
    sm.prefix(1).uppercased() + sm.dropFirst()
}
print(capitalizedString(sm: someString))

//8. Напишите функцию, которая принимает день недели в форме строки и возвращает соответствующий день недели в числовом формате.

func dayOfWeekToNumber(_ dayOfWeek: String) -> Int? {
    let daysOfWeek = [
        "monday": 1,
        "tuesday": 2,
        "wednesday": 3,
        "thursday": 4,
        "friday": 5,
        "saturday": 6,
        "sunday": 7
    ]
    
    let lowercaseDayOfWeek = dayOfWeek.lowercased()
    
    if let number = daysOfWeek[lowercaseDayOfWeek] {
        return number
    } else {
        return nil
    }
}

if let dayOfWeekNumber = dayOfWeekToNumber("Monday") {
    print("Monday is day number \(dayOfWeekNumber)")
} else {
    print("Invalid day of the week")
}

print(dayOfWeekToNumber("Monday"))

//9. Уникальные символы:Напишите функцию, которая принимает строку и возвращает true, если все символы в строке уникальные, и false в противном случае.
func sort1(input: String) -> Bool {
    var checkedSymbols = [Character] ()
    for symbol in input {
        if checkedSymbols.contains(symbol) {
            return false
        }
        checkedSymbols.append(symbol)
    }
    return true
}
print(sort1(input: "Разработка"))

//10. Слияние массивов:Напишите функцию, которая принимает два массива и возвращает один массив, состоящий из элементов обоих массивов.

var firstArray = [67, 5, 2]
var secondArray = [1, 3, 5]

func appendArray (arrayFirst: [Int], arraySecond: [Int]) -> [Int] {
    var a = [Int]()
    a.append(contentsOf: arrayFirst)
    a.append(contentsOf: arraySecond)
    return a
}
print(appendArray(arrayFirst: firstArray, arraySecond: secondArray))

//11. Подсчет гласных:Напишите функцию, которая принимает строку и возвращает количество гласных в ней.

func vowelsCount (input: String) -> Int {
    let vowels = "аяуюоеёэиыaaeiou"
    var vowelCount = 0
    for letter in input.lowercased() {
        if vowels.contains(letter) {
            vowelCount += 1
        }
    }
    return vowelCount
}

var someWord = "Error Nill"
print(vowelsCount(input: someWord))

//12. Удаление дубликатов из массива: Напишите функцию, которая принимает массив и возвращает новый массив, который содержит все элементы исходного массива, но без дубликатов.

var unicArray = ["67", "67", "5", "5", "2", "Hello", "Hello"]

func sortUnicArray (array: [String]) -> [String] {
    var used = [String]()
    for ar in array {
        if !used.contains(ar) {
            used.append(ar)
        }
        
    }
    return used
}

print(sortUnicArray(array: unicArray))

//13. Сумма всех чисел до N: Напишите функцию, которая принимает число N и возвращает сумму всех чисел от 1 до N.

func summOfArray(numb: Int) -> Int {
    var a = Int()
    for i in 0...numb {
        a += i
    }
    return a
}
print(summOfArray(numb: 8))

//14. Длинное слово в строке: Напишите функцию, которая принимает строку и возвращает самое длинное слово в этой строке.

var word = "Осталось решить пять задач"
    func longestWord(str: String) -> String {
       let wordArray = str.components(separatedBy: .whitespacesAndNewlines)
       var longWord = ""
        
       for w in wordArray {
          if w.count > longWord.count {
             longWord = w
          }
       }
       
       return longWord
    }

print(longestWord(str: word))

//15. Сокращение строки:Напишите функцию, которая принимает строку и число N, затем возвращает эту  строку, но сокращенную до N символов, добавив в конец "...", если строка была усечена.

func sokratit(word: String, number: Int) -> String {
    var firstPart = word.prefix(number)
    var mnogot = "..."
    var result = firstPart + mnogot
    
    if word.count > firstPart.count {
        return String(result)
    } else {
        return word
    }
}
print(sokratit(word: "программирование и еще что то", number: 10))

//16. Объединение двух массивов без дубликатов: Напишите функцию, которая принимает два массива чисел и возвращает новый массив, содержащий элементы из обоих массивов, но без повторяющихся элементов.

var a = [1, 2, 2, 3]
let b = [3, 4, 5, 5]
func mergArrays(numberOne: [Int], numbertwo: [Int]) -> [Int] {
    var result = numberOne
    var result2 = numbertwo
    result.append(contentsOf: result2)
    return Set(result).sorted()
}

print(mergArrays(numberOne: a, numbertwo: b))

