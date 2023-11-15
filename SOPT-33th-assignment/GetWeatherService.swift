//
//  GetWeatherService.swift
//  SOPT-33th-assignment
//
//  Created by 이자민 on 2023/11/15.
//

import Foundation

class GetWeatherService{
    static let shared = GetWeatherService()
    private init(){}
    
    func fetchData(for city:String, completion: @escaping(Result<WeatherInfoDataModel,Error>) -> Void){
        let apiKey = "292c10e9de665e1a093ee05c1a988e11"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&lang=kr&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            do{
                let decoder = JSONDecoder()
                let weatherInfo = try decoder.decode(WeatherInfoDataModel.self, from: data)
                completion(.success(weatherInfo))
            }catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
        
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
}
