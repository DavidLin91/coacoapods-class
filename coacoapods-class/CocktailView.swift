//
//  CocktailView.swift
//  coacoapods-class
//
//  Created by David Lin on 2/27/20.
//  Copyright © 2020 David Lin (Passion Proj). All rights reserved.
//

import UIKit
import SnapKit


class CocktailView: UIView {
    
    // cocktail name label
    public lazy var cocktailNameLabel: UILabel = {
    let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 2
        label.text = "Cocktail Name"
    return label
    }()
    
        //cocktail image
    public lazy var cocktailImage: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "photo")
        return iv
    }()
    
    public lazy var cocktailIngredients: UILabel = {
       let label = UILabel()
           label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
           label.numberOfLines = 2
           label.text = "Cocktail Ingredients"
       return label
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commonInit()
    }
    
    
    private func commonInit() {
        setupCocktailImageConstraints()
        setupCocktailNameLabelConstriant()
        setupIngredientsTextConstraints()
    }
    
    
    private func setupCocktailImageConstraints() {
        addSubview(cocktailImage)
        cocktailImage.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalTo(self)
        }
    }
    
    private func setupCocktailNameLabelConstriant() {
        addSubview(cocktailNameLabel)
        cocktailNameLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
    
    
    
    
    
    private func setupIngredientsTextConstraints() {
        addSubview(cocktailIngredients)
        cocktailIngredients.snp.makeConstraints { (make) in
            make.top.equalTo(cocktailIngredients)
            cocktailIngredients.snp.makeConstraints { (make) in
                make.bottom.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
            }
        }
    }
    
    
}
