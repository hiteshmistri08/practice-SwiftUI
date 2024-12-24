//
//  MusicViewModel.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 24/12/24.
//

import Foundation

let baseURL = "https://reqres.in/api/"
let userURL = baseURL + "users?"

final class MusicViewModel: ObservableObject {
    var totalPage: Int = 0
    var nextPageOffset: Int = 0
    @Published var users:[MusicUserResponse.User] = []
    
    func fetchList() async throws -> MusicUserResponse? {
        do {
            let url = URL(string: userURL + "page=\(nextPageOffset)")!
            let (data, response) = try await URLSession.shared.data(from: url)
            debugPrint("response-", response)
            debugPrint("data-", data)
            let userResponse = try JSONDecoder().decode(MusicUserResponse.self, from: data)
            return userResponse
        } catch {
            debugPrint("error:=", error.localizedDescription)
            return nil
        }
    }
}
