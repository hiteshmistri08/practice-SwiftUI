//
//  UserResponse.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 24/12/24.
//

import Foundation

// MARK: - UserResponse
struct UserResponse: Decodable {
    let page, perPage, total, totalPages: Int
    let data: [User]?
    let support: Support?

    private enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
    
    // MARK: - User
    struct User: Decodable, Identifiable {
        let id: Int
        let email, firstName, lastName: String
        let avatar: String
        
        var fullName: String {
            firstName + " " + lastName
        }
        
        private enum CodingKeys: String, CodingKey {
            case id, email
            case firstName = "first_name"
            case lastName = "last_name"
            case avatar
        }
    }

    // MARK: - Support
    struct Support: Decodable {
        let url: String
        let text: String
    }
}
