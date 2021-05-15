//
//  ViewController.swift
//  Kitchen Assistant
//
//  Created by user178354 on 4/29/21.
//  Copyright © 2021 user178354. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var both: [Any] = []
    var mealNames: [String] = []
    var foodName: [Any] = []
    var foodCount:[Any] = []
    var recipeDetails: [Any] = []
    var breakfastNames: [Any] = []
    var lunchNames: [Any] = []
    var dinnerNames: [Any] = []
    var dessertNames: [Any] = []
    var snackNames: [Any] = []
    var breakfastCount: Int = 0
    var lunchCount: Int = 0
    var dinnerCount: Int = 0
    var dessertCount: Int = 0
    var snackCount: Int = 0

    
    @IBOutlet weak var yourRecipeButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFirebaseData()
    }
    override func viewDidAppear(_ animated: Bool) {
        
        getFirebaseData()
        super.viewDidLoad()
        
    }
    
    
   
    public func getFirebaseData(){
        var ref = Database.database().reference()
        ref.observeSingleEvent(of: .value) { (snapshot) in
            
            for data in snapshot.children.allObjects as! [DataSnapshot] {
                let meal = data.key
                let recipeAndDetails = data.value as! NSDictionary
                let recipeName = recipeAndDetails.allKeys
                let recipeInstructions = recipeAndDetails.allValues
                
                
                
                self.mealNames.append(meal)
                self.foodName.append(contentsOf: recipeName)
                self.foodCount.append(recipeName)
                self.recipeDetails.append(recipeInstructions)
                
                
                for meal in self.mealNames{
                    if meal == "Breakfast"{
                        self.breakfastCount = (self.foodCount[0] as AnyObject).count
                        self.breakfastNames.append(contentsOf:
                            self.foodName[0..<self.breakfastCount])
                    }else if meal == "Lunch"{
                        self.lunchCount = (self.foodCount[3] as AnyObject).count + self.dinnerCount
                        self.lunchNames.append(contentsOf: self.foodName[self.dinnerCount..<self.lunchCount])
                        print(self.foodCount[3])
                    }else if meal == "Dinner"{
                        self.dinnerCount = (self.foodCount[2] as AnyObject).count + self.dessertCount
                        self.dinnerNames.append(contentsOf:
                        self.foodName[self.dessertCount..<self.dinnerCount])
                    }else if meal == "Dessert"{
                        self.dessertCount = (self.foodCount[1] as AnyObject).count + self.breakfastCount
                        self.dessertNames.append(contentsOf: self.foodName[self.breakfastCount..<self.dessertCount])
                    }else if meal == "Snack"{
                        self.snackCount = (self.foodCount[4] as AnyObject).count + self.lunchCount
                        self.snackNames.append(contentsOf: self.foodName[self.lunchCount..<self.snackCount])
                        
                    }
                }
                print(self.recipeDetails)
                
            }
        }
        
    }
    
    
    
    
    
    @IBAction func whenSnackRecipeButtonPressed(_ sender: Any) {
        getFirebaseData()
        var randomSnack = snackNames.randomElement()!
        yourRecipeButton.setTitle("\(randomSnack)", for: .normal)
    }
    @IBAction func whenDessertRecipeButtonPressed(_ sender: Any) {
        getFirebaseData()
        var randomDessert = dessertNames.randomElement()!
        yourRecipeButton.setTitle("\(randomDessert)", for: .normal)
    }
    @IBAction func whenDinnerRecipeButtonPressed(_ sender: Any) {
        getFirebaseData()
        var randomDinner = dinnerNames.randomElement()!
        yourRecipeButton.setTitle("\(randomDinner)", for: .normal)
    }
    @IBAction func whenLunchRecipeButtonPressed(_ sender: Any) {
        getFirebaseData()
        var randomLunch = lunchNames.randomElement()!
        yourRecipeButton.setTitle("\(randomLunch)", for: .normal)
    }
    @IBAction func whenBreakfastRecipeButtonPressed(_ sender: Any) {
        getFirebaseData()
        
        //  print(breakfastNames)
        var random = breakfastNames.randomElement()!
         yourRecipeButton.setTitle("\(random)", for: .normal)
    }
    
    @IBAction func whenRecipeButtonPressed(_ sender: Any) {
        var chosenRecipe = yourRecipeButton.currentTitle!
        print(chosenRecipe)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        whenRecipeButtonPressed(AnyObject.self)
        let nvc = segue.destination as? RecipeViewController
        let nvc2 = segue.destination as? SecondViewController
        nvc?.randomRecipe = yourRecipeButton.currentTitle
        nvc?.realRecipeInstructions.append(self.recipeDetails)
    }
}

