//
//  MusicView.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 21/12/24.
//

import SwiftUI

struct MusicView: View {
    var viewModel = MusicViewModel()
    @State private var users:[MusicUserResponse.User] = []
    @State private var isLoading = false

    var body: some View {
        List {
            ForEach(users, id: \.id) { user in
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text("User Name:- ")
                            .font(.title2)
                            .foregroundColor(.gray.opacity(0.8))
                        Text(user.firstName)
                            .font(.title2)
                    }
                    
                    HStack(alignment: .top) {
                        Text("User Email:- ")
                            .font(.title2)
                            .foregroundColor(.gray.opacity(0.8))
                        Text(user.email)
                            .font(.title2)
                    }
                }
                .onAppear {
                    if user.id == users.last?.id, viewModel.totalPage != viewModel.nextPageOffset, isLoading == false {
                        viewModel.fetchList()
                        isLoading = true
                    }
                }
            }
            
            if isLoading {
                ProgressView()
                    .padding()
            }
        }
        .navigationTitle("Music Author")
        .onAppear {
            viewModel.completionUserListAPIState = { result in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async { [response] in
                        self.users = self.users + (response.data ?? [])
                        self.isLoading = true
                    }
                   break
                case .failure(let error):
                    debugPrint("error:-", error.localizedDescription)
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
                    break
                }
            }
            viewModel.fetchList()
        }
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
