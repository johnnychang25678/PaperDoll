//
//  PaperDollViewController.swift
//  PaperDoll
//
//  Created by Chia-ming Chang on 2023/7/26.
//

import UIKit

class MyButton:UIButton {
    override open var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = UIColor.lightGray
            } else {
                backgroundColor = nil
            }
        }
    }
}

class PaperDollViewController: UIViewController {

    @IBOutlet weak var headDisplay: UIImageView!
    @IBOutlet weak var bodyDisplay: UIImageView!
    @IBOutlet weak var faceDisplay: UIImageView!
    @IBOutlet weak var glassesDisplay: UIImageView!
    
    @IBOutlet weak var headZero: MyButton!
    @IBOutlet weak var headOne: MyButton!
    @IBOutlet weak var headTwo: MyButton!
    
    @IBOutlet weak var bodyZero: MyButton!
    @IBOutlet weak var bodyOne: MyButton!
    @IBOutlet weak var bodyTwo: MyButton!
    
    
    @IBOutlet weak var faceZero: MyButton!
    @IBOutlet weak var faceOne: MyButton!
    @IBOutlet weak var faceTwo: MyButton!
    
    
    @IBOutlet weak var glassZero: MyButton!
    @IBOutlet weak var glassOne: MyButton!
    @IBOutlet weak var glassTwo: MyButton!
    @IBOutlet weak var glassThree: MyButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headZero.tag = 0
        headOne.tag = 1
        headTwo.tag = 2
        
        bodyZero.tag = 0
        bodyOne.tag = 1
        bodyTwo.tag = 2
        
        faceZero.tag = 0
        faceOne.tag = 1
        faceTwo.tag = 2
        
        glassZero.tag = 0
        glassOne.tag = 1
        glassTwo.tag = 2
        glassThree.tag = 3
        
        headDisplay.image = UIImage(named: "head-1")
        headZero.isSelected = true
        bodyDisplay.image = UIImage(named: "body-2")
        bodyOne.isSelected = true
        faceDisplay.image = UIImage(named: "face-1")
        faceZero.isSelected = true
        glassesDisplay.image = UIImage(named: "glasses-1")
        glassOne.isSelected = true
    }
    
    @IBAction func selectHead(_ sender: UIButton) {
        headSelectedToggler(senderTag: sender.tag)
        headDisplay.image = sender.configuration?.background.image
    }
    
    func headSelectedToggler(senderTag: Int) {
        if senderTag == 0 {
            headZero.isSelected = true
            headOne.isSelected = false
            headTwo.isSelected = false
        } else if senderTag == 1 {
            headZero.isSelected = false
            headOne.isSelected = true
            headTwo.isSelected = false
        } else if senderTag == 2 {
            headZero.isSelected = false
            headOne.isSelected = false
            headTwo.isSelected = true
        }
    }

    @IBAction func selectBody(_ sender: UIButton) {
        bodySelectedToggler(senderTag: sender.tag)
        bodyDisplay.image = sender.configuration?.background.image
    }
    
    func bodySelectedToggler(senderTag: Int) {
        if senderTag == 0 {
            bodyZero.isSelected = true
            bodyOne.isSelected = false
            bodyTwo.isSelected = false
        } else if senderTag == 1 {
            bodyZero.isSelected = false
            bodyOne.isSelected = true
            bodyTwo.isSelected = false
        } else if senderTag == 2 {
            bodyZero.isSelected = false
            bodyOne.isSelected = false
            bodyTwo.isSelected = true
        }
    }
    
    @IBAction func selectFace(_ sender: UIButton) {
        faceSelectedToggler(senderTag: sender.tag)
        faceDisplay.image = sender.configuration?.background.image
    }
    
    func faceSelectedToggler(senderTag: Int) {
        if senderTag == 0 {
            faceZero.isSelected = true
            faceOne.isSelected = false
            faceTwo.isSelected = false
        } else if senderTag == 1 {
            faceZero.isSelected = false
            faceOne.isSelected = true
            faceTwo.isSelected = false
        } else if senderTag == 2 {
            faceZero.isSelected = false
            faceOne.isSelected = false
            faceTwo.isSelected = true
        }
        
    }
    
    
    @IBAction func selectGlasses(_ sender: UIButton) {
        glassSelectedToggler(senderTag: sender.tag)
        glassesDisplay.image = sender.configuration?.background.image
    }
    
    func glassSelectedToggler(senderTag: Int) {
        if senderTag == 0 {
            glassZero.isSelected = true
            glassOne.isSelected = false
            glassTwo.isSelected = false
            glassThree.isSelected = false
        } else if senderTag == 1 {
            glassZero.isSelected = false
            glassOne.isSelected = true
            glassTwo.isSelected = false
            glassThree.isSelected = false
        } else if senderTag == 2 {
            glassZero.isSelected = false
            glassOne.isSelected = false
            glassTwo.isSelected = true
            glassThree.isSelected = false
        } else if senderTag == 3 {
            glassZero.isSelected = false
            glassOne.isSelected = false
            glassTwo.isSelected = false
            glassThree.isSelected = true
        }
        if (senderTag == 0) {
            glassesDisplay.isHidden = true
        } else {
            glassesDisplay.isHidden = false
        }
    }
    
    
    @IBAction func genRandomStyle(_ sender: UIButton) {
        sender.isSelected = true
        let headTag = Int.random(in: 0...2)
        headDisplay.image = UIImage(named: "head-\(headTag + 1)")
        headSelectedToggler(senderTag: headTag)
        let bodyTag = Int.random(in: 0...2)
        bodyDisplay.image = UIImage(named: "body-\(bodyTag + 1)")
        bodySelectedToggler(senderTag: bodyTag)
        let faceTag = Int.random(in: 0...2)
        faceDisplay.image = UIImage(named: "face-\(faceTag + 1)")
        faceSelectedToggler(senderTag: faceTag)
        let glassTag = Int.random(in: 0...3)
        if (glassTag > 0) {
            glassSelectedToggler(senderTag: glassTag)
            glassesDisplay.image = UIImage(named: "glasses-\(glassTag)")
        } else {
            glassesDisplay.isHidden = true
        }
        sender.isSelected = false
    }
}


#Preview {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: "PaperDollViewController")
}
