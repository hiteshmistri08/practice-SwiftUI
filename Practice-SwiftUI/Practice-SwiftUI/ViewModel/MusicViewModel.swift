//
//  MusicViewModel.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 24/12/24.
//

import Foundation

let baseURL = "https://reqres.in/api/"
let userURL = baseURL + "users"

final class MusicViewModel: ObservableObject {
    private var totalPage: Int = 0
    private var nextPageOffset: Int = 0
    @Published var users:[MusicUserResponse.User] = []
    
    func fetchList() async {
        do {
            let url = URL(string: userURL + "page=\(nextPageOffset)")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let userResponse = try JSONDecoder().decode(MusicUserResponse.self, from: data)
            self.users = userResponse.data ?? []
            self.nextPageOffset = userResponse.page
            self.totalPage = userResponse.totalPages
        } catch {
            debugPrint("error:=", error.localizedDescription)
        }
    }
}
