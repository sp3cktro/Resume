//
//  AqueryAPI.swift
//  Resume
//
//  Created by specktro on 5/22/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation

// MARK: - QueryAPI class
/// This singleton will help to get the information for the application
final class QueryAPI {
    // MARK: - Attributes
    private var session: URLSession
    private var plist: [AnyHashable: Any]?
    
    // MARK: - Singleton stuff
    static let shared = QueryAPI()
    
    private init() {
        self.session = URLSession(configuration: .default)
        
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            self.plist = NSDictionary(contentsOfFile: path) as? [AnyHashable: Any]
        }
    }
    
    // MARK: - Public methods
    /**
     Gets the `Profile` struct
     
     - Parameter profile: a value to get different JSON responsesm its default value is success
     - Parameter fail: a closure for error call back.
     - Parameter completion: a closure for success call back.
     */
    public func getProfile(_ profile: ProfileURL = ProfileURL.success, fail: @escaping ((NSError) -> (Void)), completion: @escaping ((Profile) -> (Void))) {
        if let urlString = self.plist?[profile.rawValue] as? String, let url = URL(string: urlString) {
            let profileTask = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    DispatchQueue.main.async {
                        fail(NSError(domain: "com.specktro.resume", code: APIError.profileService.rawValue, userInfo: [NSLocalizedDescriptionKey: error.localizedDescription]))
                    }
                }
                else if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    let jsonDecoder = JSONDecoder()
                    
                    if let profile = try? jsonDecoder.decode(Profile.self, from: data) {
                        DispatchQueue.main.async {
                            completion(profile)
                        }
                    }
                    else {
                        DispatchQueue.main.async {
                            fail(NSError(domain: "com.specktro.resume", code: APIError.invalidProfile.rawValue, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("Invalid user profile", comment: "")]))
                        }
                    }
                }
            }
            
            profileTask.resume()
        }
    }
}
