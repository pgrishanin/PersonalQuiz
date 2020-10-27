//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 26.10.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var animalEmojiLabel: UILabel!
    @IBOutlet var animalDescriptionLabel: UILabel!
    
    var answers: [Answer]?
    
    private var resultAnimal: AnimalType?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        defineResultAnimal()
        
        if let resultAnimal = resultAnimal {
            animalEmojiLabel.text = "Вы - \(resultAnimal.rawValue)"
            animalDescriptionLabel.text = resultAnimal.definition
        }
    }
    
    private func defineResultAnimal() {
        guard let answers = answers else { return }
        
        var animalsCount: [AnimalType: Int] = [
            .cat: 0,
            .dog: 0,
            .rabbit: 0,
            .turtle: 0
        ]
        
        for answer in answers {
            if let currentCount = animalsCount[answer.type] {
                animalsCount[answer.type] = currentCount + 1
            }
        }
        
        let sortedAnimalsCount = animalsCount.sorted { $0.1 > $1.1 }
        resultAnimal = sortedAnimalsCount.first?.key
    }

}
