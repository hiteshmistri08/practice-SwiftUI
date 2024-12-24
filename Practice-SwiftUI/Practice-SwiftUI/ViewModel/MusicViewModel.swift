//
//  MusicViewModel.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 24/12/24.
//

import Foundation

let baseURL = "https://reqres.in/api/"
let userURL = baseURL + "users?"

final class MusicViewModel {
    private(set) var totalPage: Int = 0
    private(set) var nextPageOffset: Int = 0
    
    var completionUserListAPIState:((Result<MusicUserResponse, Error>) -> Void)?
    
    func fetchList() {
        debugPrint("APi Initiate")
        Task {
            do {
                let url = URL(string: userURL + "page=\(nextPageOffset)")!
                debugPrint("url-", url.absoluteString)
                let (data, response) = try await URLSession.shared.data(from: url)
                debugPrint("response-", response)
                debugPrint("data-", data)
                let userResponse = try JSONDecoder().decode(MusicUserResponse.self, from: data)
                totalPage = userResponse.totalPages
                nextPageOffset = userResponse.page
                completionUserListAPIState?(.success(userResponse))
            } catch {
                debugPrint("error:=", error.localizedDescription)
                completionUserListAPIState?(.failure(error))
            }
        }
    }
}
