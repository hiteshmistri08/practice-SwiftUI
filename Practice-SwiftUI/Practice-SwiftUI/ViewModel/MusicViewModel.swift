//
//  MusicViewModel.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 24/12/24.
//

import Foundation
import Combine

let baseURL = "https://reqres.in/api/"
let userURL = baseURL + "users?"

final class MusicViewModel: ObservableObject {
    private(set) var totalPage: Int = 1
    private(set) var nextPageOffset: Int = 1
    
    private var users:[MusicUserResponse.User] = []
    var filteredUsers:[MusicUserResponse.User] {
        guard !searchText.trimmingCharacters(in: .whitespaces).isEmpty else { return users }
        return users.filter{ $0.firstName.contains(searchText) || $0.email.contains(searchText) }
    }
    
    @Published var isLoading = false
    @Published var searchText: String = ""

    private var cancellables = Set<AnyCancellable>()
    
    func fetchList() {
        guard !isLoading else { return }
        guard nextPageOffset <= totalPage else { return } // Ensure we don't load past total pages
        
        isLoading = true

        debugPrint("APi Initiate")
        let url = URL(string: userURL + "page=\(nextPageOffset)")!
        debugPrint("url-", url.absoluteString)
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MusicUserResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                self?.isLoading = false
                switch result {
                case .finished:
                    debugPrint("Request completed...")
                    break
                case let .failure(error):
                    debugPrint("error", error.localizedDescription)
                    break
                }
            } receiveValue: { [weak self] response in
                self?.users.append(contentsOf: response.data ?? [])
                self?.searchText = self?.searchText ?? ""
                self?.nextPageOffset += 1
                self?.totalPage = response.totalPages
            }
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.removeAll()
    }
}
