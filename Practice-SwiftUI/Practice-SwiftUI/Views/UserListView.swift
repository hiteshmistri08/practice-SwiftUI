//
//  UserListView.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 21/12/24.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel = UserViewModel()

    var body: some View {
        VStack {
            List {
                // List of users
                ForEach(viewModel.filteredUsers, id: \.id) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        LazyHStack(alignment: .center) {
                            AsyncCachedImage(url: URL(string: user.avatar)) { image in
                                image
                                    .resizable()
                                
                            } placeholder: {
                                ProgressView() // Shows loading indicator until the image is downloaded
                            }
                            .frame(width: 80, height: 80)
                            .cornerRadius(10)
                            
                            VStack(alignment: .leading) {
                                Text(user.firstName)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text(user.email)
                                    .font(.body)
                            }
                        }
                        .onAppear {
                            // Trigger pagination when the last user appears
                            if user.id == viewModel.filteredUsers.last?.id, viewModel.searchText.isEmpty {
                                // Only trigger pagination if we haven't already loaded the next page and we're not already loading
                                if !viewModel.isLoading && viewModel.nextPageOffset <= viewModel.totalPage {
                                    viewModel.fetchList()
                                }
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
            .listStyle(.plain)
            .navigationTitle("User")
            .searchable(text: $viewModel.searchText)
            .onAppear {
                // Initial API call to load the first page
                viewModel.fetchList()
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
