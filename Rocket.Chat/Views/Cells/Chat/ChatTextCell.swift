//
//  ChatTextCell.swift
//  Rocket.Chat
//
//  Created by Rafael K. Streit on 7/25/16.
//  Copyright © 2016 Rocket.Chat. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class ChatTextCell: UICollectionViewCell {
    
    static let minimumHeight = CGFloat(55)
    static let identifier = "ChatTextCell"

    var message: Message! {
        didSet {
            updateMessageInformation()
        }
    }

    @IBOutlet weak var avatarView: AvatarView! {
        didSet {
            avatarView.layer.cornerRadius = 4
            avatarView.layer.masksToBounds = true
        }
    }

    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelUsername: UILabel!
    @IBOutlet weak var labelText: UILabel!
    
    fileprivate func updateMessageInformation() {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        labelDate.text = formatter.string(from: message.createdAt! as Date)
        
        avatarView.user = message.user
        
        labelUsername.text = message.user?.username
        labelText.text = message.text
        labelText.sizeToFit()
    }
    
}
