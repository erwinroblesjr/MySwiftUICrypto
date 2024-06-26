//
//  NetworkingManager.swift
//  MySwiftUICrypto
//
//  Created by Erwin Robles on 5/27/24.
//

import Foundation
import Combine

class NetworkingManager{
    
    enum NetworkinError: LocalizedError{
        case badUrlResponse(url: URL)
        case unknown
        
        var errorDescription: String?{
            switch self {
            case .badUrlResponse(let url): return "[🔥] Bad response from url. \(url)"
            case .unknown: return "[⚠️] Unknown error occured"
            }
        }
    }
    
    static func download(url: URL) ->  AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({try handleUrlResponse(output: $0, url: url)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleUrlResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{
        guard let response = output.response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode <= 300
        else { throw NetworkinError.badUrlResponse(url: url) }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>){
        switch completion{
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
