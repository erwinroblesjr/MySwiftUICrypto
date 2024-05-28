//
//  HomeViewModel.swift
//  MySwiftUICrypto
//
//  Created by Erwin Robles on 5/27/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    private let dataSevice = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscriber()
    }
    
    func addSubscriber(){
        dataSevice.$allCoins
            .sink { [weak self] returnedCoins in
                guard let self = self else { return }
                self.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
}
