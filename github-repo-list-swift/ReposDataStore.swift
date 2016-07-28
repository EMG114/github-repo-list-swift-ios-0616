//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    var repositories = [GithubRepository]()
    
    static let sharedInstance = ReposDataStore()
    
    func getRepositoriesWithCompletion(completion:() -> ()) {
        
        GithubAPIClient.getRepositoriesWithCompletion({(responseArray) in
            
            self.repositories = []
            
            for dict in responseArray {
                
                let repo = GithubRepository.init(dictionary: dict as! NSDictionary)
                
                self.repositories.append(repo)
                
             
                
            }
            if self.repositories.count > 0 {
                print("\(self.repositories.count)")
                completion()
                
            }
            
        })
        
        print(" \(self.repositories.count)")
    }
    
}