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
        VStack {
            List {
                // List of users
                ForEach(viewModel.users, id: \.id) { user in
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
                        // Trigger pagination when the last user appears
                        if user.id == viewModel.users.last?.id {
                            // Only trigger pagination if we haven't already loaded the next page and we're not already loading
                            if !viewModel.isLoading && viewModel.nextPageOffset <= viewModel.totalPage {
                                viewModel.fetchList()
                            }
                        }
                    }
                }
                
                // Loading indicator at the end of the list
                if viewModel.isLoading {
                    ProgressView()
                        .padding()
                }
            }
            .navigationTitle("Music Author")
            .onAppear {
                // Initial API call to load the first page
                viewModel.fetchList()
            }
        }
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
