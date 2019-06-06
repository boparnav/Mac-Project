//
//  imgViewController.swift
//  Navigation
//
//  Created by Navdeep Boparai on 2019-05-30.
//  Copyright © 2019 Navdeep Boparai. All rights reserved.
//

import UIKit

class imgViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imgPlaceholder: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var imgPicker = UIImagePickerController()
    
    struct orgImg{
      static  var name = UIImage.init()
    }
  
    
    struct slider_options{
         static var slider_value = "1"
         static var filter_name = ""
        
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orgImg.name = imgPlaceholder.image!
        imgPicker.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeImg(_ sender: Any) {
        
     imgPlaceholder.image = UIImage(named: "flower")
        
        }
    
    @IBAction func btnClick(_ sender: Any) {
         imgPicker.sourceType = .photoLibrary
        imgPicker.allowsEditing = true
          present(imgPicker, animated: true, completion: nil)
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if(
        info[UIImagePickerController.InfoKey.originalImage ] as? UIImage != nil){
        let userSelection = info[UIImagePickerController.InfoKey.editedImage ] as? UIImage
        imgPlaceholder.image = userSelection
            orgImg.name = userSelection!
         dismiss(animated: true, completion: nil)
    }
        
    }
    
    
    
                  //FILTER BUTTONS  -1
    
    @IBAction func crystal(_ sender: Any) {
        slider_options.filter_name="crystal"
          let InputImage = orgImg.name
          let rawImg = CIImage(image: InputImage)
          let crystalParams: [String : Any] = [kCIInputImageKey: rawImg,kCIInputRadiusKey:15.0,kCIInputCenterKey:CIVector(string:"[100 100]")]
        let crystalFilter = CIFilter(name: "CICrystallize", parameters: crystalParams)
        let context = CIContext(options: nil)
            if let output = crystalFilter?.outputImage
            {
                if let ciImg = context.createCGImage(output, from: output.extent)
                {
                   imgPlaceholder.image = UIImage(cgImage: ciImg)
                }
          }
            
                                        }
    
    
    
                //FILTER BUTTONS  -2
    
    @IBAction func btnTile(_ sender: Any) {
        slider_options.filter_name="btntile"
      let InputImage = orgImg.name
      let rawImg = CIImage(image: InputImage)
      let circleParams: [String : Any] = [kCIInputImageKey: rawImg, kCIInputCenterKey: CIVector(string:"[50 50]"),  kCIInputWidthKey:2.0, kCIInputSharpnessKey:1.00]
      let circleFilter = CIFilter(name:"CICircularScreen", parameters: circleParams)
      let context = CIContext(options: nil)
        if let output = circleFilter?.outputImage
        {
            if let ciImg = context.createCGImage(output, from: output.extent)
            {
                imgPlaceholder.image = UIImage(cgImage: ciImg)
            
            }
            
        }
        
    }
    
    
    
    //FILTER BUTTONS  -3
    
    @IBAction func monobtn(_ sender: Any) {
        let InputImage = orgImg.name
        let rawImg = CIImage(image: InputImage)
        let monoParams: [String : Any] = [kCIInputImageKey: rawImg]
        let monoFilter = CIFilter(name: "CIPhotoEffectMono", parameters: monoParams)
        let context = CIContext(options: nil)
        if let output = monoFilter?.outputImage
        {
            if let ciImg = context.createCGImage(output, from: output.extent)
            {
                imgPlaceholder.image = UIImage(cgImage: ciImg)
            }
        }
    }
    
             //FILTER BUTTONS  -4
    
    @IBAction func crop(_ sender: Any) {
        let InputImage = orgImg.name
        let rawImg = CIImage(image: InputImage)
        let cropParams: [String: Any] = [kCIInputImageKey: rawImg, "inputSize": CIVector(string:"[100 100]"),"inputCropAmount" : 1, "inputCenterStretchAmount":1]

        let cropFilter = CIFilter(name: "CIStretchCrop", parameters: cropParams)
       let context = CIContext(options: nil)
        if let output = cropFilter?.outputImage
        {
            if let ciImg = context.createCGImage(output, from: output.extent)
            {
                imgPlaceholder.image = UIImage(cgImage: ciImg)
                }
        }
               }
    
      //Reset button
    
    
    @IBAction func Resetbtn(_ sender: Any) {
        
        imgPlaceholder.image = orgImg.name
        
        
        }
    
    
    
      // slider
@IBAction func mySlider(_ sender: UISlider) {
    
   label.text = String(Int(sender.value))
    
    
    if(slider_options.filter_name == "btntile"){
        
        
        
        let currentValue = Int(sender.value)
        
        let InputImage = orgImg.name
        
        let rawImg = CIImage(image: InputImage)
        
        let circleParams: [String : Any] = [kCIInputImageKey: rawImg, kCIInputCenterKey: CIVector(string:"[50 50]"),  kCIInputWidthKey:currentValue, kCIInputSharpnessKey:currentValue]
        
        let circleFilter = CIFilter(name:"CICircularScreen", parameters: circleParams)
        
        
        let context = CIContext(options: nil)
        
        if let output = circleFilter?.outputImage
        {
            
            if let ciImg = context.createCGImage(output, from: output.extent)
            {
                imgPlaceholder.image = UIImage(cgImage: ciImg)
                
            }
            
        }
    }
    
    else if(slider_options.filter_name == "crystal"){
        
         let currentValue = Int(sender.value)
        
        let InputImage = orgImg.name
        
        
        let rawImg = CIImage(image: InputImage)
        let crystalParams: [String : Any] = [kCIInputImageKey: rawImg,kCIInputRadiusKey:currentValue,kCIInputCenterKey:CIVector(string:"[100 100]")]
        let crystalFilter = CIFilter(name: "CICrystallize", parameters: crystalParams)
        
        
        let context = CIContext(options: nil)
        
        if let output = crystalFilter?.outputImage
        {
            
            if let ciImg = context.createCGImage(output, from: output.extent)
            {
                imgPlaceholder.image = UIImage(cgImage: ciImg)
                
            }
            
        }
        
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


