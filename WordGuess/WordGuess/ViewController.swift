//
//  ViewController.swift
//  WordGuess
//
//  Created by Goli,Maheshwar Reddy on 2/22/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var DisplayLabel: UILabel!
    
    @IBOutlet weak var HintLabel: UILabel!
    
    @IBOutlet weak var enterLetter: UITextField!
    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var playAgain: UIButton!
    
    var words = [["SWIFT", "Programming Language"],
    ["DOG", "Animal"],
    ["CYCLE", "Two Wheeler"],
    ["MACBOOK", "Apple Device"]]
    
    var count = 0
    var word = ""
    var lettersGuessed = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkButton.isEnabled = false
        word = words[count][0]
        DisplayLabel.text = ""
        for letter in word{
            DisplayLabel.text! += "- "
        }
        HintLabel.text = "Hint: "+words[count][1]
        statusLabel.text = ""
    }

    @IBAction func CheckButtonClicked(_ sender: UIButton) {
        var letter = enterLetter.text!
        lettersGuessed = lettersGuessed + letter
        var revealedWord = ""
        for l in word{
            if lettersGuessed.contains(l){
                revealedWord += "\(l)"
            }else{
                revealedWord += "_ "
            }
        }
        DisplayLabel.text = revealedWord
        enterLetter.text = ""
        
        if DisplayLabel.text!.contains("_") == false{
            playAgain.isHidden = false
            checkButton.isEnabled = false
        }
    }
    
    @IBAction func PlayAgainButtonClicked(_ sender: UIButton) {
        playAgain.isHidden = true
        lettersGuessed = ""
        count += 1
        if count == words.count{
            statusLabel.text = "Congruations! You are done with the game!"
        }else{
            word = words[count][0]
            HintLabel.text = "Hint: "
            HintLabel.text! += words[count][1]
            checkButton.isEnabled = true
            
            DisplayLabel.text = ""
            updateUnderscores()
        }
    }
    
    @IBAction func enterLabelChnaged(_ sender: UITextField) {
        
        var textEntered = enterLetter
            .text!
        textEntered = String(textEntered.last ?? " ").trimmingCharacters(in: .whitespaces)
        enterLetter.text = textEntered
        
        if textEntered.isEmpty{
            checkButton.isEnabled = false
        }else{
            checkButton.isEnabled = true
        }
    }
    
    func updateUnderscores(){
        for letter in word{
            DisplayLabel.text! += "- "
        }
    }
}

