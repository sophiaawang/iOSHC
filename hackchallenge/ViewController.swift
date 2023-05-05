//
//  ViewController.swift
//  sw895_p5
//
//  Created by Sophia Wang on 3/27/23.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    // HOW IS PREP TIME NAMED????
    private var filters = ["Asian", "American", "Italian", "Breakfast", "Lunch", "Dinner", "preparationTime"]

    let addRecipeButton = UIBarButtonItem()
    let refreshControl = UIRefreshControl()
    
    var currentIndex = IndexPath()
//    private var fixedRecipes: [Recipe] = []
//    private var recipes: [Recipe] = []
        
    
//    let id: Int
//    let title: String
//    let description: String
//    let ingredients: String
//    let steps: String
//    let cuisine: [Category]
//    let meal_type: [Category]
//    let prep_time: [Category]
//
    
//    let c = [Category(id: recipes.count+1, description: cuisine)]
//    let m = [Category(id: recipes.count+1, description: meal_type)]
//    let p = [Category(id: recipes.count+1, description: prep_time)]
//
//    let r = Recipe(id: recipes.count+1, title: title, description: description, ingredients: ingredients, steps: steps, cuisine: c, meal_type: m, prep_time: p)
    
//    let c0 = [Category(id: 0, description: "Asian")]
//    let m0 = [Category(id: 0, description: meal_type)]
//    let p0 = [Category(id: 0, description: prep_time)]
    
    private var fixedRecipes : [Recipe] = [
        Recipe(id: 0, title: "Shin Ramen", description: "A quick meal during busy study", ingredients: "shin ramen, eggs, water", steps: "1. Place uncooked Shin Ramen into a microwavable bowl. Add the seasoning packet. 2. Microwave for 2 minutes until the noodles are halfway cooked. 3. Cook for another 2 minutes until the egg has been cooked. 4. Mix everything until creamy and enjoy!", cuisine: [Category(id: 0, description: "Asian")], meal_type: [Category(id: 0, description: "Dinner")], prep_time: [Category(id: 0, description: "10 minutes")]),
        
        Recipe(id: 1, title: "Cream Sandwich", description: "light and fluffy, sure to delight", ingredients: "whipped cream, fruit, bread", steps: "1. Cut slices of bread and spread the whipped cream on top of one slice. 2. Add your choice of fruit on top of the cream, and then cover with the other slice of bread.", cuisine: [Category(id: 1, description: "American")], meal_type: [Category(id: 1, description: "Lunch")], prep_time: [Category(id: 1, description: "5 minutes")]),
        
        Recipe(id: 2, title: "Avocado Toast", description: "for the california girls", ingredients: "avocado, toast, lemon juice, salt, and pepper", steps: "1. In a small bowl, combine avocado, lemon juice, salt, and pepper. Gently mash with the back of a fork. 2. Top toasted bread with mashed avocado mixture. Sprinkle over desired toppings.", cuisine: [Category(id: 2, description: "American")], meal_type: [Category(id: 2, description: "Breakfast")], prep_time: [Category(id: 2, description: "5 minutes")]),
        
        Recipe(id: 3, title: "Peanut Butter Banana Toast", description: "Sweet lunch without added sugar", ingredients: "peanut butter, honey, banna, bread", steps: "1. In a small bowl, combine avocado, lemon juice, salt, and pepper. Gently mash with the back of a fork. 2. Top toasted bread with mashed avocado mixture. Sprinkle over desired toppings.", cuisine: [Category(id: 3, description: "American")], meal_type: [Category(id: 3, description: "Lunch")], prep_time: [Category(id: 3, description: "5 minutes")]),
        
        Recipe(id: 4, title: "Overnight Oats", description: "Instagram models' favorite", ingredients: "oats, almond milk, honey, fruit", steps: "1. Mix together oats, almond milk, and honey in a container. 2. Top with your favorite fruit. 3. Cover and refrigerate overnight. 4. Enjoy in the morning!", cuisine: [Category(id: 4, description: "American")], meal_type: [Category(id: 4, description: "Breakfast")], prep_time: [Category(id: 4, description: "Overnight")]),
        
        Recipe(id: 5, title: "Mac and Cheese", description: "Easy cheesy comfort food", ingredients: "macaroni, milk, shredded cheese, butter", steps: "1. Add macaroni and water to a microwave-safe mug. Microwave for 2 minutes. 2. Drain water and add milk, shredded cheese, and butter. 3. Microwave for another 30 seconds to 1 minute until cheese is melted.", cuisine: [Category(id: 5, description: "American")], meal_type: [Category(id: 5, description: "dinner")], prep_time: [Category(id: 5, description: "5 minutes")]),
        
        Recipe(id: 6, title: "Microwave Quesadilla", description: "perfect for busy weeknights", ingredients: "tortillas, shredded cheese, salsa, optional toppings", steps: "1. Place one tortilla on a microwave-safe plate. 2. Sprinkle shredded cheese on top of the tortilla. 3. Add any desired toppings. Place the second tortilla on top of the toppings. 5. Microwave on high for 1-2 minutes. 6. Serve with salsa on the side.", cuisine: [Category(id: 6, description: "Mexican")], meal_type: [Category(id: 6, description: "Dinner")], prep_time: [Category(id: 6, description: "10 minutes")]),

    ]
    private var recipes : [Recipe] = [
        Recipe(id: 0, title: "Shin Ramen", description: "A quick meal during busy study", ingredients: "shin ramen, eggs, water", steps: "1. Place uncooked Shin Ramen into a microwavable bowl. Add the seasoning packet. 2. Microwave for 2 minutes until the noodles are halfway cooked. 3. Cook for another 2 minutes until the egg has been cooked. 4. Mix everything until creamy and enjoy!", cuisine: [Category(id: 0, description: "Asian")], meal_type: [Category(id: 0, description: "Dinner")], prep_time: [Category(id: 0, description: "10 minutes")]),
        
        Recipe(id: 1, title: "Cream Sandwich", description: "light and fluffy, sure to delight", ingredients: "whipped cream, fruit, bread", steps: "1. Cut slices of bread and spread the whipped cream on top of one slice. 2. Add your choice of fruit on top of the cream, and then cover with the other slice of bread.", cuisine: [Category(id: 1, description: "American")], meal_type: [Category(id: 1, description: "Lunch")], prep_time: [Category(id: 1, description: "5 minutes")]),
        
        Recipe(id: 2, title: "Avocado Toast", description: "for the california girls", ingredients: "avocado, toast, lemon juice, salt, and pepper", steps: "1. In a small bowl, combine avocado, lemon juice, salt, and pepper. Gently mash with the back of a fork. 2. Top toasted bread with mashed avocado mixture. Sprinkle over desired toppings.", cuisine: [Category(id: 2, description: "American")], meal_type: [Category(id: 2, description: "Breakfast")], prep_time: [Category(id: 2, description: "5 minutes")]),
        
        Recipe(id: 3, title: "Peanut Butter Banana Toast", description: "Sweet lunch without added sugar", ingredients: "peanut butter, honey, banna, bread", steps: "1. In a small bowl, combine avocado, lemon juice, salt, and pepper. Gently mash with the back of a fork. 2. Top toasted bread with mashed avocado mixture. Sprinkle over desired toppings.", cuisine: [Category(id: 3, description: "American")], meal_type: [Category(id: 3, description: "Lunch")], prep_time: [Category(id: 3, description: "5 minutes")]),
        
        Recipe(id: 4, title: "Overnight Oats", description: "Instagram models' favorite", ingredients: "oats, almond milk, honey, fruit", steps: "1. Mix together oats, almond milk, and honey in a container. 2. Top with your favorite fruit. 3. Cover and refrigerate overnight. 4. Enjoy in the morning!", cuisine: [Category(id: 4, description: "American")], meal_type: [Category(id: 4, description: "Breakfast")], prep_time: [Category(id: 4, description: "Overnight")]),
        
        Recipe(id: 5, title: "Mac and Cheese", description: "Easy cheesy comfort food", ingredients: "macaroni, milk, shredded cheese, butter", steps: "1. Add macaroni and water to a microwave-safe mug. Microwave for 2 minutes. 2. Drain water and add milk, shredded cheese, and butter. 3. Microwave for another 30 seconds to 1 minute until cheese is melted.", cuisine: [Category(id: 5, description: "American")], meal_type: [Category(id: 5, description: "dinner")], prep_time: [Category(id: 5, description: "5 minutes")]),
        
        Recipe(id: 6, title: "Microwave Quesadilla", description: "perfect for busy weeknights", ingredients: "tortillas, shredded cheese, salsa, optional toppings", steps: "1. Place one tortilla on a microwave-safe plate. 2. Sprinkle shredded cheese on top of the tortilla. 3. Add any desired toppings. Place the second tortilla on top of the toppings. 5. Microwave on high for 1-2 minutes. 6. Serve with salsa on the side.", cuisine: [Category(id: 6, description: "Mexican")], meal_type: [Category(id: 6, description: "Dinner")], prep_time: [Category(id: 6, description: "10 minutes")]),
]
    
    private var collectionView: UICollectionView!
    private var filterCollectionView: UICollectionView!
    
    // change names later
    private var filterSelectQual = [false, false, false, false, false, false, false]
    
    private let cellReuseID = "cellReuseID"
    private let filterReuseID = "filterReuseID"
    private let collectionViewTag = 0
    private let filterCollectionViewTag = 1
    
    // MARK: - Constants
    
    private struct Constants {
        static let itemPadding: CGFloat = 10
        static let sectionPadding: CGFloat = 5
        static let filterHeight: CGFloat = 100
    }
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Recipes"
        view.backgroundColor = .white
        
//        CollectionView.translatesAutoresizingMaskIntoConstraints = false
//        messageTableView.delegate = self
//        messageTableView.dataSource = self
//        messageTableView.register(MessageTableViewCell.self, forCellReuseIdentifier: messageReuseIdentifier)
//        view.addSubview(messageTableView)
        
        fetchAllRecipes()

        setupCollectionView()
        setupFilterCollectionView()
        
        //refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)


        addRecipeButton.image = UIImage(systemName: "plus.recipe")
        addRecipeButton.title = "add recipe"
        addRecipeButton.style = .plain
        addRecipeButton.target = self
        addRecipeButton.action = #selector(pushRecipeView)
        navigationItem.rightBarButtonItem = addRecipeButton
        
        setupConstraints()
    }
    
    @objc func pushRecipeView() {
        navigationController?.pushViewController(CreateNewRecipeViewController(delegate: self), animated: true)
    }
    
    func reorder(filter: String, selected: Bool, index: Int) {
        
        var fDI = fixedRecipes.count - 1
        // private var filters = ["asian", "american", "italian", "breakfast", "lunch", "dinner", "preparationTime"]
        print(filter)
        print(recipes)
        recipes.forEach { recipe in
            print("printing descrip")
            print(recipe.cuisine)
            print(recipe.cuisine.description)
        }
        print(recipes.filter{$0.cuisine.description == filter})
        if(filter == "Asian" || filter == "American" || filter == "Italian") {
            if (filterSelectQual[index]) {
                recipes = recipes.filter { $0.cuisine[0].description == filter }
                print(recipes)
            } else {
                while fDI >= 0 {
                    if (fixedRecipes[fDI].cuisine[0].description != filter) {
                        recipes.append(fixedRecipes[fDI])
                    }
                    fDI -= 1
                }
            }
        } else if (filter == "Breakfast" || filter == "Lunch" || filter == "Dinner") {
            if (filterSelectQual[index]) {
                recipes = recipes.filter { $0.meal_type[0].description == filter }
                print(recipes)
            } else {
                while fDI >= 0 {
                    if (fixedRecipes[fDI].meal_type[0].description != filter) {
                        recipes.append(fixedRecipes[fDI])
                    }
                    fDI -= 1
                }
            }
        }
        // TODO: else if for preptime
        
        collectionView.reloadData()
    }

    
    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = Constants.itemPadding
        flowLayout.minimumLineSpacing = Constants.itemPadding
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: Constants.sectionPadding, left: Constants.sectionPadding, bottom: Constants.sectionPadding, right: Constants.sectionPadding)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //collectionView.layer.borderWidth = 2
        //collectionView.layer.borderColor = UIColor.systemPink.cgColor
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellReuseID)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.isScrollEnabled = true
        
        
        view.addSubview(collectionView)
        collectionView.tag = collectionViewTag
    }
    
    private func setupFilterCollectionView() {
        let filterFlowLayout = UICollectionViewFlowLayout()
        filterFlowLayout.minimumLineSpacing = Constants.itemPadding
        filterFlowLayout.minimumInteritemSpacing = Constants.itemPadding
        filterFlowLayout.scrollDirection = .horizontal
        filterFlowLayout.sectionInset = UIEdgeInsets(top: Constants.sectionPadding, left: Constants.sectionPadding, bottom: Constants.sectionPadding, right: Constants.sectionPadding)
        
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: filterFlowLayout)
        filterCollectionView.register(CustomFilterCollectionViewCell.self, forCellWithReuseIdentifier: filterReuseID)
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        filterCollectionView.isScrollEnabled = true
        
        view.addSubview(filterCollectionView)
        filterCollectionView.tag = filterCollectionViewTag
    }
    
    func setupConstraints() {
        let collectionViewPadding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 50),
        ])

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor, constant: collectionViewPadding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding*2),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
    }
    
    
    
    // MARK: - Requests
    
    private func fetchAllRecipes() {
//        NetworkManager.shared.getAllRecipes { [weak self] recipes in
//            guard let `self` = self else { return }
//
//            self.fixedRecipes = recipes
//            self.recipes = recipes

//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView.tag == collectionViewTag) {
            return recipes.count
        }
        return filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView.tag == collectionViewTag) {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseID, for: indexPath) as? CollectionViewCell {
                let recipe = recipes[indexPath.item]
                cell.update(imgName: recipe.title, name: recipe.title, description: recipe.description, ingredients: recipe.ingredients, cuisine: recipe.cuisine[0].description, mealtype: recipe.meal_type[0].description, preptime: recipe.prep_time[0].description, steps: recipe.steps)
                
                return cell
            }
        }
        
        if let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: filterReuseID, for: indexPath) as? CustomFilterCollectionViewCell {
            let filter = filters[indexPath.item]
            cell.configure(filterName: filter)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView.tag == 0) {
            let len = (view.frame.width - 2 * Constants.itemPadding - Constants.sectionPadding - 30) / 2
            return CGSize(width: len, height: len)
        } else {
            let width = (view.frame.width / 2)
            return CGSize(width: width, height: 60)
        }
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == filterCollectionViewTag {
            if let cell = filterCollectionView.dequeueReusableCell(withReuseIdentifier: filterReuseID, for: indexPath) as? CustomFilterCollectionViewCell {

//                cell.changeColor()
                if (!filterSelectQual[indexPath.item]) {
//                    cell.label.backgroundColor = .systemTeal
                    //cell.changeColor(color: "teal")
                    filterSelectQual[indexPath.item] = true
                    reorder(filter: filters[indexPath.item], selected: true, index: indexPath.item)
                    return
                } else {
//                    cell.label.backgroundColor = .systemBlue
                    //cell.changeColor(color: "blue")
                    filterSelectQual[indexPath.item] = false
                    reorder(filter: filters[indexPath.item], selected: false, index: indexPath.item)
                }
            }
        } else {
            let dVC = DetailViewController(recipe: recipes[indexPath.item])
            dVC.del = self
            dVC.setDetails(r: recipes[indexPath.item])
            navigationController?.pushViewController(dVC, animated: true)
        }
    }
    
}

//extension ViewController: updateCell {
//    func updateRecipe(name: String, description: String, ingredients: String, cuisine: String, mealType: String, prepTime: String, steps: String) {
//        let id = recipes[currentIndex.row].id
//        let r = Recipe(id: id, title: name, description: description, ingredients: ingredients, steps: steps, cuisine: [Category(id: id, description: cuisine)], meal_type: [Category(id: id, description: mealType)], prep_time: [Category(id: id, description: prepTime)])
//
//        recipes[currentIndex.row] = r
//    }
//}

extension ViewController: refreshDetails {
    func updateDetails(name: String, description: String, ingredients: String, cuisine: String, mealType: String, prepTime: String, steps: String) {
//        recipeImageView.image = UIImage(named: name)
        print("does something...")
    }
}

extension ViewController: CreateRecipeDelegate {
    func createRecipe(title: String, description: String, ingredients: String, steps: String, cuisine: String, meal_type: String, prep_time: String) {
        let c = [Category(id: recipes.count+1, description: cuisine)]
        let m = [Category(id: recipes.count+1, description: meal_type)]
        let p = [Category(id: recipes.count+1, description: prep_time)]
        
        let r = Recipe(id: recipes.count+1, title: title, description: description, ingredients: ingredients, steps: steps, cuisine: c, meal_type: m, prep_time: p)
        
        print(r.title)
        print(r.description)
        
        self.fixedRecipes.append(r)
        self.recipes.append(r)
        
        collectionView.reloadData()
        
        // title description ingrdients steps
        // put recipe id in url
        // get category
//        NetworkManager.shared.createRecipe(body: "") { messages in
//            //sequentially; nothing happes until network request goes through
//            DispatchQueue.main.async {
//                self.fixedRecipes.append(r)
//                self.recipes.append(r)
//                // add onto fixedRecipes and recipes
//                self.collectionView.reloadData()
//            }
//        }
        print("success recipe created")
    }
    
    
}

// works:
/*
 creates
 push vc
 data shows and updates
 */

// doesn't work:
/*
 networking (ignore...)
 detail view controller ish done
 filtering...
 styling (main page, detail vc) + images
 
 add more hard coded data for testing...
 */
