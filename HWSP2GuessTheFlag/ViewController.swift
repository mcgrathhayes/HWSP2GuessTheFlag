//
//  ViewController.swift
//  HWSP2GuessTheFlag
//
//  Created by Philip Hayes on 6/16/20.
//  Copyright © 2020 PhilipHayes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        if questionCount < 10 {
            // keep track of number of questions
            questionCount += 1
            
            // randomize the order of the countries
            countries.shuffle()
            
            // select the country to match
            correctAnswer = Int.random(in: 0...2)
            
            // display the countries
            button1.setImage(UIImage(named: countries[0]), for: .normal)
            button2.setImage(UIImage(named: countries[1]), for: .normal)
            button3.setImage(UIImage(named: countries[2]), for: .normal)
            
            // display name of country to match
            title = "\(countries[correctAnswer].uppercased())      Score: \(score)"
        }
        else {
            // display the final score
            title = "Final Score: \(score) out of 10"
        }
    }
    
    // MARK: - Button action
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var alertTitle: String
        
        // check whether answer is correct and adjust score
        if sender.tag == correctAnswer {
            alertTitle = "Correct - You earned a point"
            score += 1
        }
        else {
            alertTitle = "Incorrect - You tapped \(countries[sender.tag].uppercased())"
        }
        
        if questionCount < 10 {
            // continue with game
            let alertMessage = ""
            let alertActionTitle = "Continue"
            
            displayAlert(alertTitle: alertTitle, alertMessage: alertMessage, actionTitle: alertActionTitle)

        }
        else {
            // display game over message and final score
            let alertMessage = "You got \(score) out of \(questionCount)"
            let actionTitle = "Game Over"
            
            displayAlert(alertTitle: alertTitle, alertMessage: alertMessage, actionTitle: actionTitle)
        }
    }
    
    // MARK: - Alerts
    
    func displayAlert(alertTitle: String, alertMessage: String, actionTitle: String) {
        let ac = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: actionTitle, style: .default, handler: askQuestion(action:))
        
        ac.addAction(alertAction)
        
        present(ac, animated: true)
    }


}

