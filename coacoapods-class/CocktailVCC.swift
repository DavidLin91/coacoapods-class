//
//  CocktailVCC.swift
//  coacoapods-class
//
//  Created by David Lin on 2/27/20.
//  Copyright © 2020 David Lin (Passion Proj). All rights reserved.
//

import UIKit
import Kingfisher

class CocktailVCC: UIViewController {

    private let cocktailView = CocktailView()
    
    
    private lazy var swipeGesture: UISwipeGestureRecognizer = {
       let gesture = UISwipeGestureRecognizer()
        gesture.addTarget(self, action: #selector(fetchCocktail))
        gesture.direction = .left
        return gesture
    }()
    
    
    
    override func loadView() {
        view = cocktailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        fetchCocktail()
        
        cocktailView.cocktailImage.isUserInteractionEnabled = true
        cocktailView.cocktailImage.addGestureRecognizer(swipeGesture)
    }
    
    // shake device to change cocktail
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            fetchCocktail()
        }
    }
    
    
    
   @objc private func fetchCocktail() {
        APIClient.fetchCocktail { (result) in
            switch result {
            case .failure(let error):
                print("oops no cocktail for you \(error)")
            case .success(let cocktail):
                DispatchQueue.main.async {
                    self.updateUI(cocktail)
                }
            }
        }
    }
    
    
    
    
    
    private func updateUI(_ cocktail: Cocktail) {
        cocktailView.cocktailNameLabel.text = cocktail.strDrink
        cocktailView.cocktailIngredients.text = cocktail.ingredients
        guard let imageURL = URL(string: cocktail.strDrinkThumb) else {
            return
        }
        cocktailView.cocktailImage.kf.setImage(with: imageURL)
        
    }
}
