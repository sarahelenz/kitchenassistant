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

    var foodName: [Any] = []
    var mealNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! SecondViewController
        let recipe = nvc.recipeName
        let breakfastRecipe = nvc.breakfastRecipeNames
        let lunchRecipe = nvc.lunchRecipeNames
        let dinnerRecipe = nvc.dinnerRecipeNames
        let dessertRecipe = nvc.dessertRecipeNames
        let snackRecipe = nvc.snackRecipeNames
        
    }
    func chooseRandomRecipe(){
        var ref = Database.database().reference()
        ref.observeSingleEvent(of: .value) { (snapshot) in
            
            for data in snapshot.children.allObjects as! [DataSnapshot] {
                let meal = data.key
                let recipeName = data.value as! NSDictionary
                let recipeDetails = recipeName.allKeys
                
                self.mealNames.append(meal)
                self.foodName.append(recipeName)
            }
        }
    }
      
    
    
    
    @IBAction func whenSnackRecipeButtonPressed(_ sender: Any) {
        chooseRandomRecipe()
    }
    @IBAction func whenDessertRecipeButtonPressed(_ sender: Any) {
        chooseRandomRecipe()
    }
    @IBAction func whenDinnerRecipeButtonPressed(_ sender: Any) {
        chooseRandomRecipe()
    }
    @IBAction func whenLunchRecipeButtonPressed(_ sender: Any) {
        chooseRandomRecipe()
    }
    @IBAction func whenBreakfastRecipeButtonPressed(_ sender: Any) {
        chooseRandomRecipe()
       
        
    }

}

