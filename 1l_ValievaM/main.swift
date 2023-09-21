//
//  main.swift
//  1l_ValievaM
//
//  Created by Мадина Валиева on 21.09.2023.
//

import Foundation

//HomeWork1
var vklad: Double = 1000
var procent: Double = 5/100
var period: Double = 5

var summaProcenta = (1 + procent) * (1 + procent) * (1 + procent) * (1 + procent) * (1 + procent)
var summaVklada = Int (vklad * summaProcenta)

//Ответ
print (summaVklada)


