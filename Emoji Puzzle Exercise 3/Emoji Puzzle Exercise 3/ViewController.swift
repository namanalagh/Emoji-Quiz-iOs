//
//  ViewController.swift
//  Emoji Puzzle Exercise 3
//
//  Created by Naman Alagh on 09/01/23.
//

import UIKit

class ViewController: UIViewController {

    var movies: [String:String] = ["🩸💎":"Blood Diamond","🐜🙋‍♂️":"Ant-Man","🥋👶":"Karate Kid","🪣📝":"The Bucket List","👨‍⚕️💤":"Doctor Sleep"]
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var revealButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    
    @IBAction func nextPressed(_ sender: UIButton) {
        if !movies.isEmpty {
            newRound()
        } else {
            emojiLabel.text = ""
            answerLabel.text = "Game Over!"
        }
       
    }
    @IBAction func revealButtonPressed(_ sender: UIButton) {
        revealAnswer()
    }
    var currentGame: Game!
    
    func revealAnswer() {
        answerLabel.text = currentGame.answer
    }
    
    func newRound() {
        let newMovie = movies.randomElement()
        currentGame = Game(movie: newMovie!.key,answer: newMovie!.value)
        movies.removeValue(forKey: newMovie!.key)
        updateUI()
    }

    func updateUI() {
        emojiLabel.text = currentGame.movie
        answerLabel.text = ""
    }
}

