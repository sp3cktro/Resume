//
//  MainCoordinator.swift
//  Resume
//
//  Created by specktro on 5/21/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

// MARK: - MainCoordinator class
/// This class will control all the application flows inside de application
final class MainCoordinator {
    // MARK: - Attributes
    public weak var window: UIWindow?
    fileprivate weak var profileControler: ProfileController?
    
    // MARK: - Initializers
    init(window: UIWindow) {
        self.window = window
        
        self.initialFlow()
    }
    
    // MARK: - Private methods
    private func initialFlow() {
        let mainBoard = UIStoryboard(name: StoryBoard.main.rawValue, bundle: nil)
        let profileController = mainBoard.instantiateViewController(withIdentifier: ControllerIdentifier.profile.rawValue) as? ProfileController
        profileController?.select = self.select
        profileController?.askProfile = self.refreshProfile
        self.window?.rootViewController = UINavigationController(rootViewController: profileController!)
        self.profileControler = profileController
        
        self.refreshProfile()
    }
}

// MARK: - Profile application flow
extension MainCoordinator {
    func refreshProfile() {
        self.profileControler?.tableView.refreshControl?.beginRefreshing()
        
        let failure: (NSError) -> () = { error in
            self.profileControler?.tableView.refreshControl?.endRefreshing()
            
            let alertController = UIAlertController(title: NSLocalizedString("Resume", comment: ""),
                                                    message: error.localizedDescription,
                                                    preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""),
                                                    style: .cancel,
                                                    handler: nil))
            self.profileControler?.present(alertController, animated: true, completion: nil)
        }
        
        let completion: (Profile) -> () = { profile in
            self.profileControler?.tableView.refreshControl?.endRefreshing()
            self.profileControler?.refresh(profile: profile)
        }
        
        QueryAPI.shared.getProfile(fail: failure, completion: completion)
    }
    
    func select(section: Section) {
        let mainBoard = UIStoryboard(name: StoryBoard.main.rawValue, bundle: nil)
        let detailController = mainBoard.instantiateViewController(withIdentifier: ControllerIdentifier.detail.rawValue) as? DetailController
        detailController?.section = section
        self.profileControler?.navigationController?.pushViewController(detailController!, animated: true)
    }
}
