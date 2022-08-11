//
//  SecondPageViewController.swift
//  HomeWork21(shio andghuladze)
//
//  Created by shio andghuladze on 11.08.22.
//

import UIKit

class SecondPageViewController: UIViewController {
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let country = country {
            capitalLabel.text = "Capital: " + (country.capital ?? "Unknown")
            NetworkClinet.loadImageInImageView(imageView: flagImageView, imageUrl: country.flags.png)
        }

    }
    

}
