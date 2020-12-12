//
//  PlantDiaryViewController.swift
//  rootify
//
//  Created by Jae Hoon Han on 12/4/20.
//

import UIKit
import AlamofireImage
import Parse

class PlantDiaryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {


    @IBOutlet var collectionView: UICollectionView!
    var plants = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        collectionView.delegate = self
        collectionView.dataSource = self
       
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 3/2)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className:"Plants")
        query.includeKey("owner")
        
        query.findObjectsInBackground { (plants, error) in
            if plants != nil {
                self.plants = plants!
                self.collectionView.reloadData()
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlantDiaryGridCell", for: indexPath) as! PlantDiaryGridCell
        
        let plant = plants[indexPath.item]
        cell.plantName.text = plant["Name"] as? String
        
        let imageFile = plant["Image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        cell.photoView.af_setImage(withURL: url)
        
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
