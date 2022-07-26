//
//  BusinessTableViewCell.swift
//  Assignment-42Race
//
//  Created by Khoa Nguyen on 26/07/2022.
//

import UIKit
import Domain
import SDWebImage

class BusinessTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCategories: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblAddess: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblDistance: UILabel!
    
    @IBOutlet weak var imgBusinessPhoto: UIImageView!
    
    func setData(_ entity: BussinessEnity) {
        lblName.text = entity.name
        lblCategories.text = entity.categories.joined(separator: ", ")
        lblAddess.text = "Address: " + entity.addresses.joined(separator: ", ")
        lblPhone.text = "Phone: " + entity.phone
        lblRating.text = "Rate: \(entity.ratings)"
        lblDistance.text = "Distance: \(entity.distance.rounded())"
        if let url = URL(string: entity.photo) {
            imgBusinessPhoto.sd_setImage (with: url, completed: nil)
        } else {
            imgBusinessPhoto.image = nil
        }
    }
    
}
