//
//  SearchCell.swift
//  Independent Study App
//
//  Created by Malcolm Machesky on 12/22/17.
//  Copyright © 2017 Malcolm Machesky. All rights reserved.
//

import LBTAComponents

class SearchCell: DatasourceCell, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchResultsUpdating  {
    
    
    func updateSearchResults(for searchController: UISearchController) {
        filterData()
        pictureCollection.reloadData()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        pictureCollection = UICollectionView()
        searchController = UISearchController()
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        pictureCollection = UICollectionView(frame: frame, collectionViewLayout: layout)
        
        searchController = {
            let searchController = UISearchController(searchResultsController: nil)
            searchController.hidesNavigationBarDuringPresentation = true
            searchController.dimsBackgroundDuringPresentation = false
            
            return searchController
        }()
        super.init(frame: frame)
        
    }
    
    var pics: [UIImage] = LocationPics.getPics()
    var identifiers: [String] = LocationPics.getIdentifiers()
    var filteredData: [UIImage] = [UIImage]()
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        return layout
    }()
    
    let searchController: UISearchController
    
    var pictureCollection : UICollectionView
    
    
    override func setupViews() {
        super.setupViews()
        
        
        //MARK: Setup delegates
        //searchController.searchBar.delegate  = self
        searchController.searchResultsUpdater = self
        pictureCollection.delegate = self
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.dimsBackgroundDuringPresentation = false
        
        
        
        
        //MARK: Collection View Setup
        pictureCollection.dataSource = self
        pictureCollection.backgroundView = UIView(frame: CGRect(x: 0, y: searchController.searchBar.frame.height, width: self.frame.width, height: self.frame.width - searchController.searchBar.frame.height))
        pictureCollection.backgroundColor = .white
        pictureCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        pics = LocationPics.getPics()
        
        //MARK: Setup Search Bar
        searchController.searchBar.placeholder = "Search: "
        searchController.searchBar.barStyle = .default
        
        //MARK: addSubview
        searchController.searchBar.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        addSubview(searchController.searchBar)
        searchController.searchBar.sizeToFit()
        addSubview(pictureCollection)
        
        //MARK: Anchor
        
        pictureCollection.anchor(searchController.searchBar.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let imageViewTest: UIImageView = {
            let imageView = UIImageView()
            return imageView
        }()
        if searchController.isActive {
            imageViewTest.image = filteredData[indexPath.row]
        }
        else {
            imageViewTest.image = pics[indexPath.row]
        }
        
        cell.addSubview(imageViewTest)
        imageViewTest.anchor(cell.topAnchor, left: cell.leftAnchor, bottom: cell.bottomAnchor, right: cell.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredData.count
        }
        else{
            return pics.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.width / 3, height: self.bounds.height / 5)
    }
    
   
    
    func filterData() {
        filteredData = pics.filter({ (uiImage) -> Bool in
            if let searchTerm = self.searchController.searchBar.text {
                let searchTermMatches = self.searchString(string: identifiers[pics.index(of: uiImage)!], searchTerm: searchTerm).count > 0
                if searchTermMatches {
                    return true
                }
            }
            return false
        })
    }
    
    func searchString(string: String, searchTerm: String) -> Array<AnyObject> {
        var matches: Array<AnyObject> = []
        do {
            let regex = try NSRegularExpression(pattern: string, options: [.caseInsensitive, .allowCommentsAndWhitespace])
            let range = NSMakeRange(0, string.count)
            matches = regex.matches(in: string, options: [], range: range)
            return matches
        }
        catch _ {
            
        }
        return matches
    }
    
}
