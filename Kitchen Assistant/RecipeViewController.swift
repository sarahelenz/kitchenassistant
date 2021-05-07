//
//  RecipeViewController.swift
//  Kitchen Assistant
//
//  Created by user178354 on 4/30/21.
//  Copyright © 2021 user178354. All rights reserved.
//

import UIKit
import Firebase

class RecipeViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var recipeTableView: UITableView!
    var recipeDetails: [String] = []
    var recipeInstructions: [Any] = []
    var randomRecipe: String = ""
    var foodName: [Any] = []
    var realFoodName: [String] = []
    var arrayCount = 0
    var realRandomRecipe: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.recipeTableView.reloadData()
        }
            assignChosenRecipe()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeInstructions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        DispatchQueue.main.async {
            self.recipeTableView.reloadData()
        }
        let cell2 = recipeTableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)
        cell2.textLabel?.text = "\(recipeInstructions[indexPath.row])"
        return cell2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let nvc2 = segue.destination as! SecondViewController
        let nvc1 = segue.destination as! ViewController
        nvc1.chosenRecipe = self.randomRecipe
    }
    
    func assignChosenRecipe(){
        var ref = Database.database().reference()
        ref.observeSingleEvent(of: .value) { (snapshot) in
            
            for data in snapshot.children.allObjects as! [DataSnapshot] {
                let meal = data.key
                let recipeAndDetails = data.value as! NSDictionary
                let recipeName = recipeAndDetails.allKeys
                let recipeInstructions = recipeAndDetails.allValues
                
                self.foodName.append(contentsOf: recipeName)
                
                
                while self.arrayCount < self.foodName.count{
                    self.realFoodName.append(self.foodName[self.arrayCount] as! String)
                    self.arrayCount += 1
                }
            }
            print(self.realFoodName)
        }
        
    }
   
    
    
    
    
}
