//
//  MusicView.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 21/12/24.
//

import SwiftUI

struct MusicView: View {
    @StateObject var viewModel = MusicViewModel()
    
    var body: some View {
        List(viewModel.users) { user in
            VStack(alignment: .leading) {
                HStack {
                    Text("User Name:- ")
                        .font(.title2)
                        .foregroundColor(.gray.opacity(0.8))
                    Text(user.firstName)
                        .font(.title2)
                }
                
                HStack {
                    Text("User Email:- ")
                        .font(.title2)
                        .foregroundColor(.gray.opacity(0.8))
                    Text(user.email)
                        .font(.title2)
                }
            }
        }
        .navigationTitle("Music Author")
        .onAppear {
            Task {
                do {
                    let response = try await viewModel.fetchList()
                    DispatchQueue.main.async { [response] in
                        self.viewModel.nextPageOffset = response?.page ?? 0
                        self.viewModel.totalPage = response?.totalPages ?? 0
                        self.viewModel.users += (response?.data ?? [])
                    }
                } catch {
                    debugPrint("error:-", error.localizedDescription)
                }
            }
        }
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
