//
//  TestingVC.swift
// Swipe Gesture
//
//  Created by Sohanur Rahman on 11/1/21.
//

import UIKit

class SwipeGesture: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var swipeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeUp.direction = .up
        self.swipeView.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeDown.direction = .down
        self.swipeView.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeLeft.direction = .left
        self.swipeView.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.swipeView.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case .right:
                print("Swiped right")
                Label.text = "Swiped right"
            case .down:
                print("Swiped down")
                Label.text = "Swiped down"
            case .left:
                print("Swiped left")
                Label.text = "Swiped left"
            case .up:
                print("Swiped up")
                Label.text = "Swiped up"
            default:
                Label.text = "Swiped First"
                break
            }
        }
    }
}
