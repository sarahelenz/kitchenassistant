//
//  SecondViewController.swift
//  Kitchen Assistant
//
//  Created by user178354 on 4/29/21.
//  Copyright © 2021 user178354. All rights reserved.
//

import UIKit
import Firebase

class SecondViewController: UIViewController, UITableViewDataSource {
    
    var recipeName: [String] = []
    var recipeInstructions: [String] = []
    var breakfastRecipeNames: [String] = []
    var breakfastRecipeDetails: [String] = []
    var lunchRecipeNames: [String] = []
    var lunchRecipeDetails: [String] = []
    var dinnerRecipeNames: [String] = []
    var dinnerRecipeDetails: [String] = []
    var dessertRecipeNames: [String] = []
    var dessertRecipeDetails: [String] = []
    var snackRecipeNames: [String] = []
    var snackRecipeDetails: [String] = []
    
    @IBOutlet weak var myRecipeNameTextField: UITextField!
    @IBOutlet weak var recipeDetailTextField: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        
        
    }
    
    
    
    @IBAction func whenAddButtonPressed(_ sender: Any) {
        recipeName.append(myRecipeNameTextField.text!)
        recipeInstructions.append(recipeDetailTextField.text!)
        
        myTableView.reloadData()
        recipeDetailTextField.text = ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipeInstructions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = "\(recipeInstructions[indexPath.row])"
        return cell
    }
    
    @IBAction func whenSnackButtonPressed(_ sender: Any) {
        snackRecipeNames.append(contentsOf: recipeName)
        snackRecipeDetails.append(contentsOf: recipeInstructions)
        var ref = Database.database().reference()
        ref.child("Snack").child(snackRecipeNames[snackRecipeNames.count - 1]).setValue(snackRecipeDetails)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func whenDessertButtonPressed(_ sender: Any) {
        dessertRecipeNames.append(contentsOf: recipeName)
        dessertRecipeDetails.append(contentsOf: recipeInstructions)
        var ref = Database.database().reference()
        ref.child("Dessert").child(dessertRecipeNames[dessertRecipeNames.count - 1]).setValue(dessertRecipeDetails)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func whenDinnerButtonPressed(_ sender: Any) {
        dinnerRecipeNames.append(contentsOf: recipeName)
        dinnerRecipeDetails.append(contentsOf: recipeInstructions)
        var ref = Database.database().reference()
        ref.child("Dinner").child(dinnerRecipeNames[dinnerRecipeNames.count - 1]).setValue(dinnerRecipeDetails)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func whenBreakfastButtonPressed(_ sender: Any) {
        breakfastRecipeNames.append(contentsOf: recipeName)
        breakfastRecipeDetails.append(contentsOf: recipeInstructions)
        var ref = Database.database().reference()
        ref.child("Breakfast").child(breakfastRecipeNames[breakfastRecipeNames.count - 1]).setValue(breakfastRecipeDetails)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func whenLunchButtonPressed(_ sender: Any) {
        lunchRecipeNames.append(contentsOf: recipeName)
        lunchRecipeDetails.append(contentsOf: recipeInstructions)
        var ref = Database.database().reference()
        ref.child("Lunch").child(lunchRecipeNames[lunchRecipeNames.count - 1]).setValue(lunchRecipeDetails)
        self.navigationController?.popViewController(animated: true)
    }
    
  
}

