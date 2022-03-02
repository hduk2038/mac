//
//  HighScoreViewController.swift
//  12700302
//
//  Created by Dongwok Hong on 24/4/21.
//


import UIKit

class ScoreController: UIViewController {
    var rankingDictionary = [String : Double]()
    var sortedHighScoreArray = [(key: String, value: Double)]()
    
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player2: UILabel!
    @IBOutlet weak var player3: UILabel!
    @IBOutlet weak var highScore1: UILabel!
    @IBOutlet weak var highScore2: UILabel!
    @IBOutlet weak var highScore3: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let rankingDictionary = UserDefaults.standard.dictionary(forKey: "ranking") as! [String : Double]? {
            sortedHighScoreArray = rankingDictionary.sorted(by: {$0.value > $1.value})
            
            if sortedHighScoreArray.count == 1 {
                player1.text = sortedHighScoreArray[0].key
                highScore1.text = "\(sortedHighScoreArray[0].value)"
            }
            
            else if sortedHighScoreArray.count == 2 {
                player1.text = sortedHighScoreArray[0].key
                player2.text = sortedHighScoreArray[1].key
                highScore1.text = "\(sortedHighScoreArray[0].value)"
                highScore2.text = "\(sortedHighScoreArray[1].value)"
            }
            
            else {
                player1.text = sortedHighScoreArray[0].key
                player2.text = sortedHighScoreArray[1].key
                player3.text = sortedHighScoreArray[2].key
                highScore1.text = "\(sortedHighScoreArray[0].value)"
                highScore2.text = "\(sortedHighScoreArray[1].value)"
                highScore3.text = "\(sortedHighScoreArray[2].value)"
            }
        }
    }
    
    
    
    
    
    
    
    
    @IBAction func Tapped(_ sender: UIButton) {
        let destinationView = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeController
        present(destinationView, animated: true, completion: nil)
    }
}
