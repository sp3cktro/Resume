//
//  Utils.swift
//  Resume
//
//  Created by specktro on 5/21/19.
//  Copyright © 2019 specktro. All rights reserved.
//

// MARK: - CellIdentifier enum
/// The enumeration for cell identifiers
enum CellIdentifier: String {
    case profile = "profile_cell"
}

// MARK: - StoryBoard enum
/// The enumeration for storyboard names
enum StoryBoard: String {
    case main = "Main"
}

// MARK: - ControllerIdentifier enum
/// The enumeration for controllers' identifiers inside storyboards
enum ControllerIdentifier: String {
    case profile = "Profile"
    case detail = "Detail"
}

// MARK: - APIError enum
/// The enumeration for API error codes
enum APIError: Int {
    case profileService = 1000
    case invalidProfile = 1001
}

// MARK: - ProfileURL enumeration
/// The enumeration to test the profile behavior
enum ProfileURL: String {
    case success = "ProfileURL"
    case invalid = "BadProfileURL"
    case noSections = "NoSectionsURL"
}
