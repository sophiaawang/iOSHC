//
//  DetailViewController.swift
//  sw895_p5
//
//  Created by Katherine Wei on 4/29/23.
//

import UIKit

class DetailViewController: UIViewController {

    //TODO: Add picImage and NameTextField
    var recipeImageView = UIImageView()
    
    var nameLabel = UILabel()
    var descriptionLabel = UILabel()
    var ingredientsLabel = UILabel()
    var cuisineLabel = UILabel()
    var mealTypeLabel = UILabel()
    var prepTimeLabel = UILabel()
    var stepsLabel = UILabel()

    //TODO: Add weak delegate and initializer
    let recipe: Recipe
    
    weak var del: refreshDetails?

    init(recipe: Recipe) {
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let lightPink = UIColor(red: 1.0, green: 0.75, blue: 0.8, alpha: 1.0)

        if (UIImage(named: recipe.title) != nil) {
            recipeImageView.image = UIImage(named: recipe.title)
        } else {
            recipeImageView.image = UIImage(named: "default")
        }
        recipeImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(recipeImageView)
        
        nameLabel.text = recipe.title
        nameLabel.textColor = lightPink
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        descriptionLabel.text = recipe.description
        descriptionLabel.textColor = lightPink
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 20)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
        cuisineLabel.text = recipe.cuisine[0].description
        cuisineLabel.textColor = lightPink
        cuisineLabel.font = UIFont.boldSystemFont(ofSize: 20)
        cuisineLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cuisineLabel)
        
        mealTypeLabel.text = recipe.meal_type[0].description
        mealTypeLabel.textColor = lightPink
        mealTypeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        mealTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mealTypeLabel)
        
        prepTimeLabel.text = recipe.prep_time[0].description
        prepTimeLabel.textColor = lightPink
        prepTimeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        prepTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(prepTimeLabel)
        
        stepsLabel.text = recipe.steps
        stepsLabel.textColor = lightPink
        stepsLabel.lineBreakMode = .byWordWrapping
        stepsLabel.numberOfLines = 0
        stepsLabel.preferredMaxLayoutWidth = 300
        
        stepsLabel.font = UIFont.boldSystemFont(ofSize: 20)
        stepsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stepsLabel)
        
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            recipeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recipeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            recipeImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            recipeImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: 20),
            nameLabel.leftAnchor.constraint(equalTo: recipeImageView.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            descriptionLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor)
        ])

        NSLayoutConstraint.activate([
            cuisineLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            cuisineLabel.leftAnchor.constraint(equalTo: descriptionLabel.leftAnchor)
        ])

        NSLayoutConstraint.activate([
            mealTypeLabel.topAnchor.constraint(equalTo: cuisineLabel.bottomAnchor, constant: 10),
            mealTypeLabel.leftAnchor.constraint(equalTo: cuisineLabel.leftAnchor)
        ])

        NSLayoutConstraint.activate([
            prepTimeLabel.topAnchor.constraint(equalTo: mealTypeLabel.bottomAnchor, constant: 10),
            prepTimeLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor)
        ])

        NSLayoutConstraint.activate([
            stepsLabel.topAnchor.constraint(equalTo: prepTimeLabel.bottomAnchor, constant: 10),
            stepsLabel.leftAnchor.constraint(equalTo: prepTimeLabel.leftAnchor)
        ])
    }
    
    func setDetails(r: Recipe) {
        recipeImageView.image = UIImage(named: r.title)
        nameLabel.text = r.title
        descriptionLabel.text = r.description
        cuisineLabel.text = r.cuisine[0].description
        mealTypeLabel.text = r.meal_type[0].description
        prepTimeLabel.text = r.prep_time[0].description
        stepsLabel.text = r.steps
        print("setting details")
        print(r.title)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//TODO: Add protocol to change contact

protocol refreshDetails: UIViewController{
    func updateDetails(name: String, description: String, ingredients: String, cuisine: String, mealType: String, prepTime: String, steps: String)
//    func updateRecipeName(name: String)
//    func updateDescription(description: String)
//    func updateIngredients(ingredients: String)
//    func updateCuisine(cuisine: String)
//    func updateMealType(mealType: String)
//    func updatePrepTime(prepTime: String)
//    func updateSteps(steps: String)
}
