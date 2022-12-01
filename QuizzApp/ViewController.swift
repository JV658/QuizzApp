//
//  ViewController.swift
//  QuizzApp
//
//  Created by Cambrian on 2022-12-01.
//

import UIKit

class ViewController: UIViewController {
    var questions = Questions()
    var qs: [String] = []
    
    @IBOutlet weak var question1Constraint: NSLayoutConstraint!
    @IBOutlet weak var question2Constraint: NSLayoutConstraint!
    @IBOutlet weak var question2: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        qs = questions.qa.keys.sorted(by: <)
        
        let q = qs[Int.random(in: 0..<qs.count)]
        
        let a = questions.qa[q]

        answer.alpha = 0
        
        question.text = q
        answer.text = a
        
        let screenWidth = view.frame.width
        question2Constraint.constant = -screenWidth
        
    }
    @IBAction func showAnswer(_ sender: Any) {

        
        UIView.animateKeyframes(withDuration: 3, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                self.answer.alpha = 1
            }
        }
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        let q = qs[Int.random(in: 0..<qs.count)]
        
        let a = questions.qa[q]
        
        answer.alpha = 0
        
        question.text = q
        answer.text = a
        
        UIView.animate(withDuration: 2) {
            self.question2Constraint.constant = 0
            self.view.layoutIfNeeded()
        }
        
        
        
    }
    
}

