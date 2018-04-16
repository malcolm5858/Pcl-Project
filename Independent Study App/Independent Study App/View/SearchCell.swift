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
        SaveAndLoadData.sharedInstance.saveUser(user: User(username: "TEST", profilePicture: UIImagePNGRepresentation(#imageLiteral(resourceName: "AlexProfile"))!, bio: "BIO"))
        pictureCollection = UICollectionView()
        searchController = UISearchController()
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        
        SaveAndLoadData.sharedInstance.saveUser(user: User(username: "TEST", profilePicture: UIImagePNGRepresentation(#imageLiteral(resourceName: "AlexProfile"))!, bio: "BIO"))
        
        
        pictureCollection = UICollectionView(frame: frame, collectionViewLayout: layout)
        
        searchController = {
            let searchController = UISearchController(searchResultsController: nil)
            //searchController.hidesNavigationBarDuringPresentation = true
           // searchController.dimsBackgroundDuringPresentation = false
            
            return searchController
        }()
        super.init(frame: frame)
        
    }
    
    var pics: [UIImage] = LocationPics.getPics()
    var identifiers: [String] = LocationPics.getIdentifiers()
    var filteredData = [String]()
    
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
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = true
        searchController.obscuresBackgroundDuringPresentation = false
        
        
        
        
        
        //MARK: Collection View Setup
        pictureCollection.dataSource = self
        pictureCollection.backgroundView = UIView(frame: CGRect(x: 0, y: searchController.searchBar.frame.height, width: self.frame.width, height: self.frame.width - searchController.searchBar.frame.height))
        pictureCollection.backgroundColor = .white
        pictureCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        pics = LocationPics.getPics()
        
        //MARK: Setup Search Bar
        searchController.searchBar.placeholder = "Search: "
        searchController.searchBar.barStyle = .default
        searchController.searchBar.becomeFirstResponder()
        
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
        /*
        let imageViewTest: UIImageView = {
            let imageView = UIImageView()
            return imageView
        }()
            //imageViewTest.image = filteredData[indexPath.row]
        imageViewTest.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        imageViewTest.sizeToFit()
        cell.addSubview(imageViewTest)
        
        
        return cell
         */
        //TODO: BIG PROBLEMS FIX 
        let label = UILabel()
        //label.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        if searchController.isActive {
            if let searchTerm = self.searchController.searchBar.text {
                let labelText = filteredData[indexPath.row] as String
                let searchTermMatches = self.searchString(string: labelText, searchTerm: searchTerm)
                let attributedLabelText = NSMutableAttributedString(string: labelText)
                for match in searchTermMatches as! [NSTextCheckingResult] {
                    let matchRange = match.range
                    attributedLabelText.addAttribute(NSAttributedStringKey.backgroundColor, value: UIColor.yellow, range: matchRange)
                }
                label.attributedText = attributedLabelText
            }
        } else {
            let labelText = identifiers[indexPath.row] as String
            label.attributedText = nil
            label.text = labelText
        }
        cell.addSubview(label)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.searchController.isActive {
            return filteredData.count
        }
        else {
            return identifiers.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.width / 3, height: self.bounds.height / 5)
    }
    
   
    
    func filterData() {
        filteredData = identifiers.filter({ (string) -> Bool in
            if let searchTerm = self.searchController.searchBar.text {
                let searchTermMatches = self.searchString(string: string, searchTerm: searchTerm).count > 0
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
