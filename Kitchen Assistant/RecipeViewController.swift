//
//  RecipeViewController.swift
//  Kitchen Assistant
//
//  Created by user178354 on 4/30/21.
//  Copyright © 2021 user178354. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var recipeTableView: UITableView!
    var recipeDetails: [String] = []
    var recipeInstructions: [String] = []
    var randomBreakfast: String = ""
    var randomLunch: String = ""
    var randomDinner: String = ""
    var randomDessert: String = ""
    var randomSnack: String = ""
    var breakfastNames: [Any] = []
    var lunchNames: [Any] = []
    var dinnerNames: [Any] = []
    var dessertNames: [Any] = []
    var snackNames: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignRecipetoName()
        DispatchQueue.main.async {
            self.recipeTableView.reloadData()
        }
     //   print(recipeInstructions)
        
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
        nvc1.breakfastNames = breakfastNames
        nvc1.lunchNames = lunchNames
        nvc1.dinnerNames = dinnerNames
        nvc1.dessertNames = dessertNames
        nvc1.snackNames = snackNames
    }
    
    func assignRecipetoName(){
        
        }
        
    
    
}
