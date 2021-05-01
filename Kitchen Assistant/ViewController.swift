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
    var breakfastNames: [Any] = []
    var lunchNames: [String] = []
    var dinnerNames: [String] = []
    var dessertNames: [String] = []
    var snackNames: [String] = []
    
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
                
                self.mealNames.append(meal)
                self.foodName.append(contentsOf: recipeName)
                self.foodCount.append(recipeName)
               
                
                for meal in self.mealNames{
                                if meal == "Breakfast"{
                                    let breakfastCount = (self.foodCount[0] as AnyObject).count
                                    self.breakfastNames.append(contentsOf: self.foodName[0..<breakfastCount!])
                                }else if meal == "Lunch"{
                                  self.lunchNames.append(meal)
                                }else if meal == "Dinner"{
                                  self.dinnerNames.append(meal)
                                }else if meal == "Dessert"{
                                  self.dessertNames.append(meal)
                                }else if meal == "Snack"{
                                  self.snackNames.append(meal)
                                }
                            }
            //    print(self.foodName)
            //    print(self.foodName[0...1])
                print(recipeAndDetails)
                print(self.breakfastNames)
               
                
            }
        }
        
    }
      
    
    
    
    @IBAction func whenSnackRecipeButtonPressed(_ sender: Any) {
        getFirebaseData()
    }
    @IBAction func whenDessertRecipeButtonPressed(_ sender: Any) {
        getFirebaseData()
    }
    @IBAction func whenDinnerRecipeButtonPressed(_ sender: Any) {
        getFirebaseData()
    }
    @IBAction func whenLunchRecipeButtonPressed(_ sender: Any) {
        getFirebaseData()
    }
    @IBAction func whenBreakfastRecipeButtonPressed(_ sender: Any) {
            getFirebaseData()
        
      //  print(breakfastNames)
        var random = breakfastNames.randomElement()!
        yourRecipeButton.setTitle("\(random)", for: .normal)
    }

}

