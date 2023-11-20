//
//  DummyData.swift
//  SOPT-33th-assignment
//
//  Created by 이자민 on 2023/10/30.
//

import Foundation

struct WeatherListCollectionData {
    let image: String
    var name: String
    var time: String
    var description: String
    var temp: String
    var minMax: String
    
    init(image: String, name: String, time: String, description: String, temp: String, minMax: String) {
        self.image = image
        self.name = name
        self.time = time
        self.description = description
        self.temp = temp
        self.minMax = minMax
    }
}

struct WeatherInfoListCollectionData{
    let image: String
    var label1: String
    var label2: String
    
    init(image:String, label1:String, label2:String){
        self.image = image
        self.label1 = label1
        self.label2 = label2
    }
}

struct ItemListData{
    var dayLabel: String
    var image: String
    var minLabel:String
    var rangeImage: String
    var maxLabel:String
    
    init(dayLabel: String, image: String, minLabel: String, rangeImage: String, maxLabel: String) {
        self.dayLabel = dayLabel
        self.image = image
        self.minLabel = minLabel
        self.rangeImage = rangeImage
        self.maxLabel = maxLabel
    }
}

var imageCollectionList: [WeatherListCollectionData] = [

]

var weatherInfoCollectionList: [WeatherInfoListCollectionData] = [
    .init(image: "sun.max.fill", label1: "10시", label2: "20°"),
    .init(image: "sun.max.fill", label1: "10시", label2: "20°"),
    .init(image: "sun.max.fill", label1: "10시", label2: "20°"),
    .init(image: "sun.max.fill", label1: "10시", label2: "20°"),
    .init(image: "sun.max.fill", label1: "10시", label2: "20°"),
    .init(image: "sun.max.fill", label1: "10시", label2: "20°"),
    .init(image: "sun.max.fill", label1: "10시", label2: "20°"),
    .init(image: "sun.max.fill", label1: "10시", label2: "20°"),
    .init(image: "sun.max.fill", label1: "10시", label2: "20°"),
    .init(image: "sun.max.fill", label1: "10시", label2: "20°"),
    .init(image: "sun.max.fill", label1: "10시", label2: "20°")
]


var itemListData: [ItemListData] = [
    
    .init(dayLabel: "오늘", image: "sun.max.fill", minLabel: "15", rangeImage: "rangeImage", maxLabel: "20"),
                                    .init(dayLabel: "월", image: "sun.max", minLabel: "15", rangeImage: "rangeImage", maxLabel: "20"),
                                    .init(dayLabel: "화", image: "sun.max.fill", minLabel: "15", rangeImage: "rangeImage", maxLabel: "20")
]
