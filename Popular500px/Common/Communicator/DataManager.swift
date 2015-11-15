//
//  DataManager.swift
//  Popular500px
//
//  Created by Alfonso Miranda Castro on 15/11/15.
//  Copyright © 2015 Alfonso Miranda Castro. All rights reserved.
//

import UIKit
import CoreData

class DataManager: NSObject {
    static func saveArrayPicture(pictures:[PictureModel]) {
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.privateManagedObjectContext
                
        deleteAllPictures()
        
        for pictureModel in pictures {
            let entity =  NSEntityDescription.entityForName("Picture",
                inManagedObjectContext:managedContext)
            
            let picture = NSManagedObject(entity: entity!,
                insertIntoManagedObjectContext: managedContext) as! Picture
            picture.parsePictureModel(pictureModel)
            do {
                try managedContext.save()
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
        }
    }
    
    static func loadAllPictures() -> [PictureModel] {
        var pictureArray = [PictureModel]()
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.privateManagedObjectContext
        let request : NSFetchRequest = NSFetchRequest(entityName: "Picture")
        do {
            let results : [Picture]? = try managedContext.executeFetchRequest(request) as? [Picture]
            print (results?.count)
            for picture in results! {
                ///picture)
                let pictureModel = PictureModel(picture: picture)
                pictureArray.append(pictureModel)
            }
        }
        catch {
            
        }
        return pictureArray
    }
    
    static func deleteAllPictures() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.privateManagedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Picture")
        
        do {
            let fetchedEntities = try managedContext.executeFetchRequest(fetchRequest) as! [Picture]
            
            for entity in fetchedEntities {
                managedContext.deleteObject(entity)
            }
        } catch {
            // Error
        }
        
        do {
            try managedContext.save()
        } catch {
            // Error
        }
    }
}
