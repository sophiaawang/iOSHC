//
//  CreateNewRecipeViewController.swift
//  kzw9_p7
//
//  Created by Katherine Wei on 4/22/23.
//

import Foundation
import UIKit

class CreateNewRecipeViewController: UIViewController {

    let imageView = UIImageView();
    let titleTextField = UITextField()
    let descriptionTextField = UITextField()
    let ingredientsTextView = UITextView()
    let stepsTextView = UITextView()
    let cuisineTextField = UITextField()
    let mealTypeTextField = UITextField()
    let prepTimeTextField = UITextField()
    let saveButton = UIButton()

    weak var delegate: CreateRecipeDelegate?

    init(delegate: CreateRecipeDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

//    init(delegate: EditRecipeDelegate) {
//        self.delegate = delegateE as! any CreateRecipeDelegate
//        super.init(nibName: nil, bundle: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let pink = UIColor(red: 1.0, green: 0.6, blue: 0.75, alpha: 1.0)
        let lightPink = UIColor(red: 1.0, green: 0.75, blue: 0.8, alpha: 1.0)
        view.backgroundColor = .systemGray3

        imageView.image = UIImage(named: "default")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        view.addSubview(imageView)
        
        titleTextField.placeholder = "Recipe Name"
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.clipsToBounds = true
        titleTextField.layer.cornerRadius = 5
        titleTextField.backgroundColor = lightPink
        titleTextField.font = .systemFont(ofSize: 20)
        view.addSubview(titleTextField)

        descriptionTextField.placeholder = "Description"
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextField.clipsToBounds = true
        descriptionTextField.layer.cornerRadius = 5
        descriptionTextField.backgroundColor = lightPink
        descriptionTextField.font = .systemFont(ofSize: 20)
        view.addSubview(descriptionTextField)
        
        ingredientsTextView.text = "Ingredients"
        ingredientsTextView.translatesAutoresizingMaskIntoConstraints = false
        ingredientsTextView.clipsToBounds = true
        ingredientsTextView.layer.cornerRadius = 5
        ingredientsTextView.backgroundColor = lightPink
        ingredientsTextView.font = .systemFont(ofSize: 20)
        view.addSubview(ingredientsTextView)
        
        stepsTextView.text = "Steps"
        stepsTextView.translatesAutoresizingMaskIntoConstraints = false
        stepsTextView.clipsToBounds = true
        stepsTextView.layer.cornerRadius = 5
        stepsTextView.backgroundColor = lightPink
        stepsTextView.font = .systemFont(ofSize: 20)
        view.addSubview(stepsTextView)
        
        cuisineTextField.placeholder = "Cuisine Type"
        cuisineTextField.translatesAutoresizingMaskIntoConstraints = false
        cuisineTextField.clipsToBounds = true
        cuisineTextField.layer.cornerRadius = 5
        cuisineTextField.backgroundColor = lightPink
        cuisineTextField.font = .systemFont(ofSize: 20)
        view.addSubview(cuisineTextField)
        
        mealTypeTextField.placeholder = "Meal Type (breakfast, lunch, dinner)"
        mealTypeTextField.translatesAutoresizingMaskIntoConstraints = false
        mealTypeTextField.clipsToBounds = true
        mealTypeTextField.layer.cornerRadius = 5
        mealTypeTextField.backgroundColor = lightPink
        mealTypeTextField.font = .systemFont(ofSize: 20)
        view.addSubview(mealTypeTextField)
        
        prepTimeTextField.placeholder = "Prep Time"
        prepTimeTextField.translatesAutoresizingMaskIntoConstraints = false
        prepTimeTextField.clipsToBounds = true
        prepTimeTextField.layer.cornerRadius = 5
        prepTimeTextField.backgroundColor = lightPink
        prepTimeTextField.font = .systemFont(ofSize: 20)
        view.addSubview(prepTimeTextField)

        saveButton.setTitle("Save", for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.backgroundColor = lightPink
        saveButton.layer.cornerRadius = 15
        saveButton.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        view.addSubview(saveButton)

        setupConstraints()
    }

    @objc func saveAction() {
        let title = titleTextField.text!
        let description = descriptionTextField.text!
        let ingredients = ingredientsTextView.text!
        let steps = stepsTextView.text!
        let cuisine = cuisineTextField.text!
        let meal_type = mealTypeTextField.text!
        let prep_time = prepTimeTextField.text!
        
        
        delegate?.createRecipe(title: title, description: description, ingredients: ingredients, steps: steps, cuisine: cuisine, meal_type: meal_type, prep_time: prep_time)
        
        navigationController?.popViewController(animated: true)
    }

    func setupConstraints() {
        let widthMultiplier: CGFloat = 0.75
        
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: self.view),
//            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
//
//        ])

        NSLayoutConstraint.activate([
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])

        NSLayoutConstraint.activate([
            cuisineTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cuisineTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            cuisineTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier)
        ])
        
        NSLayoutConstraint.activate([
            mealTypeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mealTypeTextField.topAnchor.constraint(equalTo: cuisineTextField.bottomAnchor, constant: 20),
            mealTypeTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier)
        ])
        
        NSLayoutConstraint.activate([
            prepTimeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            prepTimeTextField.topAnchor.constraint(equalTo: mealTypeTextField.bottomAnchor, constant: 20),
            prepTimeTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier)
        ])
        
        NSLayoutConstraint.activate([
            descriptionTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTextField.topAnchor.constraint(equalTo: prepTimeTextField.bottomAnchor, constant: 20),
            descriptionTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier)

        ])
        
        NSLayoutConstraint.activate([
            ingredientsTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ingredientsTextView.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 20),
            ingredientsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier),
            ingredientsTextView.heightAnchor.constraint(equalToConstant: 60)

        ])
        
        NSLayoutConstraint.activate([
            stepsTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stepsTextView.topAnchor.constraint(equalTo: ingredientsTextView.bottomAnchor, constant: 20),
            stepsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: widthMultiplier),
            stepsTextView.heightAnchor.constraint(equalToConstant: 60)

        ])

        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: stepsTextView.bottomAnchor, constant: 20),
            saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

protocol CreateRecipeDelegate: UIViewController {
    func createRecipe(title: String, description: String, ingredients: String, steps: String, cuisine: String, meal_type: String, prep_time: String)
    
}
