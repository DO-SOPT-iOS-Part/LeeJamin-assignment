//
//  DummyData.swift
//  SOPT-33th-assignment
//
//  Created by 이자민 on 2023/10/30.
//

import Foundation

struct WeatherListCollectionData {
    let image: String
    var label1: String
    var label2: String
    var label3: String
    var label4: String
    var label5: String
    
    init(image: String, label1: String, label2: String, label3: String, label4: String, label5: String) {
        self.image = image
        self.label1 = label1
        self.label2 = label2
        self.label3 = label3
        self.label4 = label4
        self.label5 = label5
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

var imageCollectionList: [WeatherListCollectionData] = [
    .init(image: "list", label1: "나의 위치",label2: "서울특별시", label3: "흐림", label4: "21°",label5: "최저:15° 최저:15°" )
    ,.init(image: "list", label1: "의정부시",label2: "의정부시", label3: "흐림", label4: "21°",label5: "최저:15° 최저:15°" )
    ,.init(image: "list", label1: "중구",label2: "충무로", label3: "흐림", label4: "21°",label5: "최저:15° 최저:15°" )
    ,.init(image: "list", label1: "나의 위치",label2: "서울특별시", label3: "흐림", label4: "21°",label5: "최저:15° 최저:15°" )
    ,.init(image: "list", label1: "나의 위치",label2: "서울특별시", label3: "흐림", label4: "21°",label5: "최저:15° 최저:15°" )
    ,.init(image: "list", label1: "나의 위치",label2: "서울특별시", label3: "흐림", label4: "21°",label5: "최저:15° 최저:15°" )
    ,.init(image: "list", label1: "나의 위치",label2: "서울특별시", label3: "흐림", label4: "21°",label5: "최저:15° 최저:15°" )
    ,.init(image: "list", label1: "나의 위치",label2: "서울특별시", label3: "흐림", label4: "21°",label5: "최저:15° 최저:15°" )
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
