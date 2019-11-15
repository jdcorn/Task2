//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by jdcorn on 11/14/19.
//  Copyright © 2019 jdcorn. All rights reserved.
//

import UIKit

protocol ButtonTableViewCellDelegate: class {
func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}

class ButtonTableViewCell: UITableViewCell {
    // MARK: - Variables
    
    var delegate: ButtonTableViewCellDelegate?
    
 
    // MARK: - Outlets
    
    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    
    // MARK: - Actions
    
    @IBAction func buttonTapped(_ sender: Any) {
        guard let delegate = delegate else {return}
        delegate.buttonCellButtonTapped(self)
        
    }
    
    

    
} // Class End

extension ButtonTableViewCell {
    func updateButton(_ isComplete: Bool) {
        if isComplete {
            completeButton.setImage(UIImage(named: "complete"), for: .normal)
        } else {
            completeButton.setImage(UIImage(named: "incomplete"), for: .normal)
        }
    }
}


