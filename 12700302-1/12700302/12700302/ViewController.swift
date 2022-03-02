//
//  ViewController.swift
//  12700302
//
//  Created by Dongwok Hong on 24/4/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var myTimer: Timer?
    var bubble = BubblePop()
    var bubbleArray = [BubblePop]()
    var remainingSeconds = 120
    var maxBubbleNumber = 20
    var score: Double = 0
    var lastBubbleValue: Double = 0
    var player: String = ""
    var rankingDictionary = [String : Double]()
    var previousRankingDictionary: Dictionary? = [String : Double]()
    var sortedHighScoreArray = [(key: String, value: Double)]()
    
    var screenWidth: UInt32
    {
        return UInt32(UIScreen.main.bounds.width)
    }
    
    var screenHeight: UInt32 {
        return UInt32(UIScreen.main.bounds.height)
    }

    @IBOutlet weak var RemainningTime: UILabel!
    @IBOutlet weak var currentScore: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousRankingDictionary = UserDefaults.standard.dictionary(forKey: "ranking") as? Dictionary<String, Double>
        if previousRankingDictionary != nil {
            rankingDictionary = previousRankingDictionary!
            sortedHighScoreArray = rankingDictionary.sorted(by: {$0.value > $1.value})
        }
        
        
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            self.setRemainingTime()
            self.remove()
            self.createBubble()
        }
    }
    
    @IBAction func bubbleTapped(_ sender: BubblePop) {
          sender.removeFromSuperview()
        if lastBubbleValue == sender.value {
            score += sender.value * 1.5
        }
        else {
            score += sender.value
        }
        lastBubbleValue = sender.value
        currentScore.text = "\(score)"
        
        if  previousRankingDictionary == nil {
            highScoreLabel.text = "\(score)"
        } else if sortedHighScoreArray[0].value < score {
            highScoreLabel.text = "\(score)"
        } else if sortedHighScoreArray[0].value >= score {
            highScoreLabel.text = "\(sortedHighScoreArray[0].value)"
        }
    }
    
    
    
    func isOverlapped(bubbleToCreate: BubblePop) -> Bool {
        for currentBubbles in bubbleArray {
            if bubbleToCreate.frame.intersects(currentBubbles.frame) {
             return true
            }
        }
        return false
    }
    
    
    
    
    
    @objc func createBubble() {
        let numberToCreate = arc4random_uniform(UInt32(maxBubbleNumber - bubbleArray.count)) + 1
        var i = 0
        
        while i < numberToCreate {
            bubble = BubblePop()
            bubble.frame = CGRect(x: CGFloat(10 + arc4random_uniform(screenWidth - 2 * bubble.radius - 20)), y: CGFloat(160 + arc4random_uniform(screenHeight - 2 * bubble.radius - 180)), width: CGFloat(2 * bubble.radius), height: CGFloat(2 * bubble.radius))
            if !isOverlapped(bubbleToCreate: bubble) {
                bubble.addTarget(self, action: #selector(bubbleTapped), for: UIControl.Event.touchUpInside)
                self.view.addSubview(bubble)
                bubble.spring()
                i += 1
                bubbleArray += [bubble]
            }
        }
    }
    
    @objc func remove() {
        var i = 0
        while i < bubbleArray.count {
            if arc4random_uniform(100) < 33 {
                bubbleArray[i].removeFromSuperview()
                bubbleArray.remove(at: i)
                i += 1
            }
        }
    }
    
    
    
    
    @objc func setRemainingTime() {
        RemainningTime.text = "\(remainingSeconds)"
        if (remainingSeconds == 0) {
            myTimer!.invalidate()
            checkHighScoreExistence()
            
            let destinationView = self.storyboard?.instantiateViewController(withIdentifier: "HighScoreViewController") as! ScoreController
            present(destinationView, animated: true, completion: nil)
        }
        remainingSeconds -= 1
    }
    
    func saveHighScore() {
        rankingDictionary.updateValue(score, forKey: "\(player)")
        UserDefaults.standard.set(rankingDictionary, forKey: "ranking")
    }
    
    func checkHighScoreExistence() {
        if previousRankingDictionary == nil {
            saveHighScore()
        } else {
            rankingDictionary = previousRankingDictionary!
            if rankingDictionary.keys.contains("\(player)") {
                let currentScore = rankingDictionary["\(player)"]!
                if currentScore < score {
                    saveHighScore()
                }
            } else {
                saveHighScore()
            }
        }
    }
    
}

