//
//  Profile.swift
//  Resume
//
//  Created by specktro on 5/21/19.
//  Copyright © 2019 specktro. All rights reserved.
//

// MARK: - Profile struct
/// The holder from user's information
struct Profile: Codable {
    var name: String
    var nickname: String
    var summary: String
    var tools: String
    
    var sections: [Section]
}

// MARK: - Profile struct
/// The holder from user's information sections
struct Section: Codable {
    var title: String
    var url: String
    var summary: String?
}
