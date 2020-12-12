//
//  CustomPlantViewController.swift
//  rootify
//
//  Created by Jae Hoon Han on 12/4/20.
//

import UIKit
import AlamofireImage
import Parse

class CustomPlantViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var plantName: UITextField!
    @IBOutlet weak var lightReq: UISegmentedControl!
    @IBOutlet weak var waterCycle: UIPickerView!
    
    var pickerData:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        waterCycle.delegate = self
        waterCycle.dataSource = self
        pickerData = [["1", "2", "3", "4", "5"][]]
        
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 2
        }
        
        // The number of rows of data
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return pickerData.count
        }
        
        // The data to return fopr the row and component (column) that's being passed in
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return pickerData[row]
        }


    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.sourceType = .photoLibrary
        } else {
            picker.sourceType = .camera
        }
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func add(_ sender: Any) {
        let plant = PFObject(className: "Plants")
        
        //plant["name"] = plantName.text!
        //plant["lightreq"] = lightReq.actionForSegment(at: Int)
        //plant["watercycle"] = waterCycle
        
        
        plant.saveInBackground { (success, error) in
            if success {
                print("saved")
            } else {
                print("error!")
            }
        }
        
        
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
