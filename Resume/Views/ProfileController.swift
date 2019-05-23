//
//  ViewController.swift
//  Resume
//
//  Created by specktro on 5/21/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

// MARK: - ProfileController class
final class ProfileController: UITableViewController {
    // MARK: - Attributes
    public var profile: Profile?
    public var select: (Section) -> () = { _ in }
    public var askProfile: () -> () = { }
    
    // MARK: - UIViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customize()
    }
    
    deinit {
        debugPrint(">>> deinit \(String(describing: self))")
    }
    
    // MARK: - Private methods
    private func customize() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellIdentifier.profile.rawValue)
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pull(_:)), for: .valueChanged)
        self.tableView.refreshControl = refreshControl
    }
    
    // MARK: - Public methods
    public func refresh(profile: Profile) {
        self.profile = profile
        self.title = self.profile?.nickname
        self.tableView.reloadData()
    }
    
    @objc public func pull(_ sender: UIRefreshControl) {
        self.askProfile()
    }
    
    // MARK: - Table view stuff
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.profile?.sections.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = self.profile?.sections[indexPath.row] else {
            fatalError("There is not profile configured, yo need a profile to work")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.profile.rawValue, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = section.title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let section = self.profile?.sections[indexPath.row] else {
            fatalError("There is not profile configured, yo need a profile to work")
        }
        
        self.select(section)
    }
}

