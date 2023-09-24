//
//  main.swift
//  1l_ValievaM
//
//  Created by Мадина Валиева on 21.09.2023.
//

import Foundation
import Dispatch

//HOME WORK 2

//1. Написать функцию, которая определяет, четное число или нет.

func chetNechet (numbers: [Int]) {
    for number in numbers {
        if number % 2 == 0 {
            print("\(number) - четное")
        } else {
                print("\(number) - нечетное")
            }
        }
    }

var arrayOfNumbers: [Int] = [34, 2, 12, 335, 58, 87, 65, 44, 26]
chetNechet(numbers: arrayOfNumbers)


//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func chetNechetTwo (numbersTwo: [Int]) {
    for number in numbersTwo {
        if number % 3 == 0 {
            print("\(number) - делится на 3 без остатка")
        } else {
                print("\(number) - не делится на 3 без остатка")
            }
        }
    }
var arrayOfNumbersTwo: [Int] = [34, 2, 12, 335, 58, 87, 65, 44, 26]

chetNechetTwo(numbersTwo: arrayOfNumbersTwo)

//3. Создать возрастающий массив из 100 чисел.

var array = [Int] (1...100)
var arrayNechet = [Int]()

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for (_, value) in array.enumerated(){
    if value % 2 == 0 && value % 3 != 0 {
        arrayNechet.append(value)
    }
}
print(arrayNechet)

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.


//6 Написать функцию которая находит факториал числа N
func factorial(number:Int) -> Int {
    if number == 0 {
        return 1
    } else {
        return (number * factorial(number: number-1))
    }
}
print (factorial(number: 6))

//7. Задача: Простой калькулятор.Вводим два числа и операцию (сложение, вычитание, умножение, деление), после чего выводим результат.

func calculate (par: Int, par2: Int, par3: Character)  {
    if par3 == "+" {
        print ("\(par + par2)")
    } else if par3 == "-" {
        print ("\(par - par2)")
    } else if par3 == "*" {
        print ("\(par * par2)")
    } else if par3 == "/" {
        print ("\(par / par2)")
    } else {
        print ("где-то есть ошибка")
    }
}
print(calculate (par: 60, par2: 4, par3: "+"))


//8. Напишите функцию которая определяет длину строки.

var name = "Madina"
print (name.count)

//9. Напишите функцию которая определит максимальное числа из трех.
// два варианта :
//первый
var numbs = [3, 2, 34]
print(numbs.max()!)

//второй
func numb (par: [Int]) -> Int {
    let max = par.max()
    return max!
    }

print(numb(par: numbs))

//10. Напишите функцию которая сделает реверс строки которую введет пользователь

var wordWithRevers = "Moskva"

func reversStr (string: String) {
    let str = String (string.reversed())
    print(str)
}
reversStr(string: wordWithRevers)

//11. Напишите функцию которая конвертирует время из секунд в минуты, минуты в часы.

func converter(time: Int) -> (hour: Int, minute: Int, seconds: Int){
        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours   = time / 3600
        return (hours,minutes,seconds)
    }
print(converter(time: 200))

//12. Напишите функцию которая подсчитает количество слов в строке.

var str = "Hello World"
var words = [String]()
words += str.components(separatedBy:" ")
print (words.count)

//13. Напишите функцию которая выведит каждое слово строки на новой строке.

var strSeparator = "Hello World"
var wordsSep = strSeparator.components(separatedBy: " ")
print (wordsSep)

//14. Напишите функцию которая выведит каждое слово через определенный интервал времени.

var str3 = "прямо сейчас я обучаюсь программированию"
var splitStr3 = str3.split(separator: " ")
print(splitStr3)

func sleep(par: Array<Any>) {
    for i in par {
      sleep(2)
        print(i)
    }
}
sleep(par: splitStr3)

//15. Напишите функцию которая выведет количество слов в введенной строке - решение данной задачи см. в задаче 12


