//
//  CoreDataManager.swift
//  Effective mobile
//
//  Created by Denis Klimov on 17.03.2023.
//

import Foundation
import CoreData
import UIKit

class CoreDataUserManager {
    
    private var entityName: String
    private var appDelegate: AppDelegate
    var coreDataContext: NSManagedObjectContext
    var entity: NSEntityDescription?
    var request: NSFetchRequest<User>
    
    func save(object: NSManagedObject) {
        do {
            try coreDataContext.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func auth(login: String, password: String) -> Bool {
        var result = false
        guard let users = getAll() else { return false}
        for user in users {
            if user.login == login && user.password == password {
                result = true
                break
            } else {
                result = false
            }
        }
        return result
    }
    
    func isExisting(login: String) -> Bool {
        guard let users = getAll() else { return true }
        var result = false
        for user in users {
            if user.login == login {
                result = true
                break
            }
        }
        return result
    }
    
    func getAll() -> [User]? {
        var users: [User]? = nil
        do {
            users = try coreDataContext.fetch(request)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return users
    }
    
    func showAll() {
        do {
            let users = try coreDataContext.fetch(request)
            for user in users {
                print(user.login!)
                print(user.password!)
                print(user.email!)
                print("-------------")
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func deleteAll() {
        do {
            let users = try coreDataContext.fetch(request)
            for user in users {
                coreDataContext.delete(user)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        do {
           try coreDataContext.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    init() {
        self.entityName = "User"
        self.appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.coreDataContext = appDelegate.persistentContainer.viewContext
        self.entity = NSEntityDescription.entity(forEntityName: entityName, in: coreDataContext)
        self.request = User.fetchRequest()
    }

}
