//
//  HomeDatasource.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/18/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import Foundation
import LBTAComponents

class HomeDatasource: Datasource {
    
    
    override func item(_ indexPath: IndexPath) -> Any? {
         
        /*
        do {
            return  tryApi.sharedInstance.getPosts()[indexPath.row]
        }
        catch {
            return nil
        }
 */
        SaveAndLoadData.sharedInstance.loadFromServer()
        return SaveAndLoadData.sharedInstance.getPosts()[indexPath.row]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return []
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return []
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [PostCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        /*
        do {
            return try Api.sharedInstance.getPosts().count
        }
        catch {
            return 0
        }
         */
        SaveAndLoadData.sharedInstance.loadFromServer()
        print(SaveAndLoadData.sharedInstance.getPosts().count)
        return SaveAndLoadData.sharedInstance.getPosts().count
    }
    
    
}
