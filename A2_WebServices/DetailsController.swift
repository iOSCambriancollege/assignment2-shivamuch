//
//  DetailsController.swift
//  A2_WebServices
//
//  Created by Shivam Bajaj on 2023-02-01.
//

import Foundation

class DetailsController: UIViewController {
    var dogName: String!
    let URL: String = "https://dog.ceo/api/breed/"
    @IBOutlet weak var dogMainImage: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url: String = URL + dogName + "/images"
            DogAPIHelper.fetchImage(url: url ) {dogImage in

                for _ in 0...1000000{
                    continue
                }
                do{
                    try
                    self.dogMainImage.image = UIImage(data: NSData(contentsOf: NSURL(string: dogImage[0])! as URL) as Data)
                }catch let error{
                    print(error)
                }
          }
    }

    @IBAction func NewDogImageButton(_ sender: Any) {
        let url: String = URL + dogName + "/images"

            DogAPIHelper.fetchImage(url: url ) {dogImage in

                for _ in 0...1000000{
                    continue
                }
                         
                do{
                try
                    
                   self.dogMainImage.image = UIImage(data: NSData(contentsOf: NSURL(string: dogImage.randomElement()!)! as URL) as Data)
  
               }catch let error{
                   print(error)
               }
          }
    }
}
