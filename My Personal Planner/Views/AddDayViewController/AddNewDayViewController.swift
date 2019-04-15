//
//  AddNewDayViewController.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-15.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit

class AddNewDayViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titletext: UITextField!
    @IBOutlet weak var subTitletext: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var save: UIButton!
    
    
    var doneSaving: (() -> ())?
    var tripIndexEdit: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        // self.view.backgroundColor = .clear
        
        //Shadow on titleLabel
        
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 5
        
        
    
        
    }
    
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        
        
        dismiss(animated: true)
    }
    
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        
        titletext.rightViewMode = .never
        guard titletext.hasValue, let newTitle = titletext.text else { return }



    }
}
