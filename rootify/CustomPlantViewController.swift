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
    @IBOutlet weak var sunlightControl: UISegmentedControl!
    @IBOutlet weak var waterCyclePicker: UIPickerView!
    @IBOutlet weak var foodCyclePicker: UIPickerView!
    var apiData:[String:Any]!
    
    var pickerData:[[String]] = [[String]]()
    var waterCycleCount = "1"
    var waterCycleCalendarType = " Days"
    var foodCycleCount = "1"
    var foodCycleCalendarType = " Days"
    var sunlightReq = "Dark"
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(apiData)
        
        waterCyclePicker.delegate = self
        waterCyclePicker.dataSource = self
        waterCyclePicker.tag = 1
        foodCyclePicker.delegate = self
        foodCyclePicker.dataSource = self
        foodCyclePicker.tag = 2
        pickerData = [["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"],
                      [" Days", " Weeks", " Months"]]
        
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            //number of picker columns
            return 2
        }
        
        // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            //number of rows per column (count of current subarray)
            return pickerData[component].count
        }
        
        // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return pickerData[component][row]
        }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            // This method is triggered whenever the user makes a change to the picker selection.
            // The parameter named row and component represents what was selected.
        //if waterCyclePicker is tagged
        if pickerView.tag == 1 {
            //if count was changed
            if component == 0 {
                waterCycleCount = pickerData[component][row]
            }
            //if calendartype was changed
            if component == 1 {
                waterCycleCalendarType = pickerData[component][row]
            }
            print("saved watercycle", waterCycleCount, waterCycleCalendarType)
        }
        
        if pickerView.tag == 2 {
            if component == 0 {
                foodCycleCount = pickerData[component][row]
            }
            if component == 1 {
                foodCycleCalendarType = pickerData[component][row]
            }
            print("saved foodcycle", foodCycleCount, foodCycleCalendarType)
        }
    }
    @IBAction func didChangeSegment(_ sender: Any) {
        //save segmented selection to variable
        let sunlight = ["Dark", "Shade", "Bright", "Full"]
        sunlightReq = sunlight[sunlightControl.selectedSegmentIndex]
        print("saved", sunlightReq)
    }

    @IBAction func onCameraButton(_ sender: Any) {
        //add photo of your plant
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
        // scale image
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
        //in case of possible change to schema
        let waterCycle = waterCycleCount + waterCycleCalendarType
        let foodCycle = foodCycleCount + foodCycleCalendarType
        print("Just Checking:)", waterCycle, foodCycle)
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)        
        let plant = PFObject(className: "Plants")
        plant["Owner"] = PFUser.current()!
        plant["Name"] = plantName.text!
        plant["Image"] = file
        plant["SunlightRequirements"] = sunlightReq
        plant["WaterCycleCount"] = waterCycleCount
        plant["WaterCycleCalendar"] = waterCycleCalendarType
        plant["foodCycleCount"] = foodCycleCount
        plant["foodCycleCalendar"] = foodCycleCalendarType

        plant.saveInBackground { (success, error) in
            if success {
                print("saved")
            } else {
                print("error!")
            }
        }
        dismiss(animated: true, completion: nil)
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
