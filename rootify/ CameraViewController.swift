//
//  CameraViewController.swift
//  rootify
//
//  Created by Fariha Mohamed on 12/11/20.
//

import UIKit
import AlamofireImage

class CameraViewController: UIViewController, UIImagePickerControllerDelegate,
                           UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    var dictionaryResponse:[String:Any] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    //Open Camera Button
    
    @IBAction func openCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        
        present(picker, animated: true, completion: nil)
    }
//Open Gallery Button
    @IBAction func openGalleryButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.sourceType = .photoLibrary
        } else {
            picker.sourceType = .camera        }
        
        present(picker, animated: true, completion: nil)
    }
        
//Resize Image and insert into imageView    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageScaled(to: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    //func convertImageToBase64String (img: UIImage) -> String {
   // return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
//}
    
    struct ImageStruct: Codable {
        var images: [Data] = []
        
        enum CodingKeys: String, CodingKey {
            case images = "images"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let customPlantVC = segue.destination as! CustomPlantViewController
        customPlantVC.apiData = dictionaryResponse
    }
    //Scan button
      @IBAction func scanButton(_ sender: Any) {
        print("working")
        let imageData:Data = imageView.image!.pngData()!
        
        // URL
        let url = URL(string:
            "https://api.plant.id/v2/identify")
        
        guard url != nil else {
                print("Error creating url object")
                return
        }
        
        // URL Request
        var request = URLRequest(url: url! , cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        // Specify the Header
        let header = [
            "Content-Type": "application/json",
            "Api-Key": "Ok64FUBCOOV95IkTngjl7hxLZkVxwH7nuj4iCvPc2zBZo5GbwY"]
        request.allHTTPHeaderFields = header
        
        
        let imageStruct = ImageStruct(images: [imageData])
        
        do {
            let requestBody = try JSONEncoder().encode(imageStruct)
//            let requestBody = try JSONSerialization.data(withJSONObject: jsonData, options: .fragmentsAllowed)
            request.httpBody = requestBody
        }
        catch {
            print("Error creating data object from JSON ")
        }
        
        //Set the Request Type
        request.httpMethod = "POST"
        
        //Get the URLSession
        let session = URLSession.shared
        
        //Create the data task
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            //Check in
            
            if error == nil && data != nil {
                //Try to parse data
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
                    self.dictionaryResponse = dictionary!
                    print(dictionary)
                } catch {
                    print("Error parsing response data")
                }
            }
        }
        
        //Fire off the Data Task
        dataTask.resume()
        
      }//end scan
        
    
        
        
    /*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

 

}
