//
//  ViewController.swift
//  MainApp
//
//  Created by Muzammil Peer on 02/11/2021.
//

import UIKit
import RouterLibrary

class ViewController: UIViewController,Storyboarded {
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var btnChangeLangauge: UIButton!
    @IBOutlet weak var lblCurrentLanguage: UILabel!
    weak var coordinator: (MainModuleCoordinator)?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblHeader.text = "header_text".localized
        lblCurrentLanguage.text = LocalizationSystem.sharedInstance.getLanguage()
        btnChangeLangauge.setTitle("change_language".localized, for: .normal)
        
    }

    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.openShopModule()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        coordinator?.openAccountModule()
    }
    
    @IBAction func changeLanguage(_ sender: Any) {
        let appdelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.applyLocalization()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

