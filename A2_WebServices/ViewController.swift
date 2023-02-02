//
//  ViewController.swift
//  A2_WebServices
//
//  Created by Cambrian on 2023-01-25.
//

import UIKit

class ViewController: UIViewController {
    
    var dog = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.rowHeight = 44.0
        DogAPIHelper.fetchdog{newArray in
            self.dog = newArray
            self.tableView.reloadData()
            
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = tableView.indexPathForSelectedRow!.row
        let selectedDog = dog[index].self
        let dst = segue.destination as! DetailsController
        dst.dogName = selectedDog
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dog.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dog", for: indexPath) as!
        DogTableViewCell
        cell.dogName.text = dog[indexPath.row]

        DogAPIHelper.fetchdog { newArray in
            let URL: String = "https://dog.ceo/api/breed/"
                let List = newArray[indexPath.row]
                let url: String = URL + List + "/images"
            
                DogAPIHelper.fetchImage(url: url ) {dogImage in

                    for _ in 0...100000{
                        continue
                    }
                    do{

                        try
                        cell.dogImage.image = UIImage(data: NSData(contentsOf: NSURL(string: dogImage[0])! as URL) as Data)
                    }catch let error{
                        print(error)
                    }
   
               }
        }
        return cell
    }
}
