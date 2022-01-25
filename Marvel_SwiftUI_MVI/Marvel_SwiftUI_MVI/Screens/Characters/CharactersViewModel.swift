//
//  CharactersViewModel.swift
//  Marvel_SwiftUI_MVI
//
//  Created by Павел Мишагин on 24.01.2022.
//

import SwiftUI
import Combine


final class CharactersViewModel: ObservableObject {
    
//     need to store any published
    private var cancellable: Set<AnyCancellable> =  []



    // need to connect with published and use debounce
    var quyerThroughSubject = PassthroughSubject<String, Never>()


    // OutPut Data

    @Published var state = CharactersState()
    
    // Steps Route
    var steps = PassthroughSubject<CharactersRoute, Never>()
    
    // Alert Info
    @Published var alert: AlertInfo? = nil
    
    
    
    init() {
        quyerThroughSubject
            .eraseToAnyPublisher()
            .removeDuplicates()
            .debounce(for: 0.6, scheduler: RunLoop.main)
            .sink(receiveValue: { str in

                if str == "" {
                    print("Reset")
//                    self.state = CharactersState(isLoading: false, isEmpty: true)

//                    self.steps.send(.openDetails)
                    
//                    self.alert = .init(title: "Some Title", message: "Some Message")


                } else {
                    print("make api request here",str)
                    self.state = CharactersState(isLoading: false)
                }

            }).store(in: &cancellable)
    }
    
}



extension CharactersViewModel {
  
    
    func setInputAction(_ action: CharacterAction) {
        
        switch (action) {
        case .query(let str):
            // lets use here combine framework to implemetn easy debounce
            print("Str from View",str)
            quyerThroughSubject.send(str)
            
        case .loadContent:
            state = self.state.change(path: \.isLoading, to: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.state = self.state
                    .change(path: \.isLoading, to: false)
                    .change(path: \.isEmpty, to: true)
                
            }
            
        case .pushScreen:
            self.steps.send(.openDetails)
        case.showAlertAction:
            self.alert = .init(title: "Some Title", message: "Some Message")
        }
    }
}



// MARK: - Api Calls
extension CharactersViewModel {
    
}
