//
//  PlantDiaryViewController.swift
//  rootify
//
//  Created by Jae Hoon Han on 12/4/20.
//

import UIKit

class PlantDiaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var plantDiaryTableView: UITableView!
    @IBOutlet weak var plantName: UILabel!
    @IBOutlet weak var plantPhoto: UIImageView!
    
    let plantNameArray = ["Dracaena trifasciata", "Pothos", "Aglaonema", "Peace Lily"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        plantDiaryTableView.reloadData()
    }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return plantNameArray.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath)
    cell.textLabel?.text = plantNameArray[indexPath.item]
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
