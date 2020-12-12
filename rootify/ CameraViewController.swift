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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  //Scan button
    @IBAction func scanButton(_ sender: Any) {
      //let url = URL(string:"https://api.plant.id/v2/usage_info/?api_key=Ok64FUBCOOV95IkTngjl7hxLZkVxwH7nuj4iCvPc2zBZo5GbwY&language=en-US&page=1")!
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.plant.id/v2/identify")! as URL)
        request.addValue("Ok64FUBCOOV95IkTngjl7hxLZkVxwH7nuj4iCvPc2zBZo5GbwY", forHTTPHeaderField: "X-Auth-Token")
        request.httpMethod = "GET" // or POST or whatever
       // let task = URLSession.dataTaskWithRequest(<#URLRequest#>){(data, response, error) in // request anything needed during session
        //NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main) { (response, data, error) in
            // handle your data here
            print("Success")
        }
        //let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
      /*  let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            // This will run when the network request returns
               if let error = error {
                  print(error.localizedDescription)
               } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                  print(dataDictionary)
                  // TODO: Get the array of movies
                  // TODO: Store the movies in a property to use elsewhere
                  // TODO: Reload your table view data

               }
            }
         task.resume() //uncomment later
*/
   

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
        
    
        
        
        
    /*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

 

}
