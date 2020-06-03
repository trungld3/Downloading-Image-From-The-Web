//
//  ViewController.swift
//  Downloading Image From The Web
//
//  Created by TrungLD on 5/30/20.
//  Copyright © 2020 TrungLD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                              if documentsPath.count > 0 {
                                  if let documentsDirectory = documentsPath[0] as? String {
                                      let restorePath = documentsDirectory + "/bach.jpg"
                                      
                                    
                                     
                                        try image.image = UIImage(contentsOfFile: restorePath)
                                  
                                  }
                              }
        
        
        
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/d/dc/Prise_caen_1346.jpg")!
        
         let request = NSMutableURLRequest(url: url)
        
         let task = URLSession.shared.dataTask(with: request as URLRequest) {
             data, responds, error in
                 if error != nil {
                     print(error)
                 }
                 else {
                     if let data = data {
                     if let  image = UIImage(data: data) {
                         self.image.image = image
                        
                        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                        if documentsPath.count > 0 {
                            if let documentsDirectory = documentsPath[0] as? String {
                                let savePath = documentsDirectory + "/bach.jpg"
                                
                                do {
                                    try image.jpegData(compressionQuality: 1)?.write(to: URL(fileURLWithPath: savePath))
                                } catch {
                                    print("write image faild")
                                }
                            }
                        }
                         
               }
                     
                 }
                 }
             
             
         }
        task.resume()
    }


}

