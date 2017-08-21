//
//  ViewController.swift
//  JSON
//
//  Created by Renato Degiovanni on 21/08/17.
//  Copyright © 2017 Renato Degiovanni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "http://api.fixer.io/latest")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil
            {
                print("Error")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        //Array
                        let myJSON = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let rates = myJSON["rates"] as? NSDictionary
                        {
                            if let currency = rates["GBP"]
                            {
                                print(currency)
                            }
                        }
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

