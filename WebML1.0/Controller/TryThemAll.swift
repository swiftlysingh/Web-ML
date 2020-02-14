//
//  TryThemAll.swift
//  WebML1.0
//
//  Created by Pushpinder Pal Singh on 14/02/20.
//  Copyright © 2020 Pushpinder Pal Singh. All rights reserved.
//

import UIKit
import CoreML

class TryThemAll : UIViewController{
    
    var results : Int64 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
       func detect(){
           guard let output = try? HeartDisease.model.prediction(age: HeartDisease.Variables[0], sex: HeartDisease.Variables[1], cp: HeartDisease.Variables[2], trestbps: HeartDisease.Variables[3], chol: HeartDisease.Variables[4], fbs: HeartDisease.Variables[5], restecg: HeartDisease.Variables[6], thalach: HeartDisease.Variables[7], exang: HeartDisease.Variables[8], oldpeak: HeartDisease.Variables[9], slopes: HeartDisease.Variables[10], ca: HeartDisease.Variables[11], thal: HeartDisease.Variables[12]) else {
               fatalError("Input Failed")
           }
           results = output.target
           print("Heart\(results)")
        guard let output1 = try? BreastCancer.model.prediction(radius_mean: BreastCancer.Variables[0], texture_mean: BreastCancer.Variables[1], perimeter_mean: BreastCancer.Variables[2], area_mean: BreastCancer.Variables[3], smoothness_mean: BreastCancer.Variables[4], compactness_mean: BreastCancer.Variables[5], concavity_mean: BreastCancer.Variables[6], concave_points_mean: BreastCancer.Variables[7], symmetry_mean: BreastCancer.Variables[8], fractal_dimension_mean: BreastCancer.Variables[9], radius_se: BreastCancer.Variables[10], texture_se: BreastCancer.Variables[11], perimeter_se: BreastCancer.Variables[12], area_se: BreastCancer.Variables[13], smoothness_se: BreastCancer.Variables[14], compactness_se: BreastCancer.Variables[15], concavity_se: BreastCancer.Variables[16], concave_points_se: BreastCancer.Variables[17], symmetry_se: BreastCancer.Variables[18], fractal_dimension_se: BreastCancer.Variables[19], radius_worst: BreastCancer.Variables[20], texture_worst: BreastCancer.Variables[21], perimeter_worst: BreastCancer.Variables[22], area_worst: BreastCancer.Variables[23], smoothness_worst: BreastCancer.Variables[24], compactness_worst: BreastCancer.Variables[25], concavity_worst: BreastCancer.Variables[26], concave_points_worst: BreastCancer.Variables[27], symmetry_worst: BreastCancer.Variables[28], fractal_dimension_worst: BreastCancer.Variables[0]) else{
            fatalError("Input Failed")
        }
        results = output1.target
        print("BreastCancer\(results)")
        guard let output2 = try? Liver.model.prediction(Age: Liver.Variables[0], Gender: Liver.Variables[1], Total_Bilirubin: Liver.Variables[2], Direct_Bilirubin: Liver.Variables[3], Alkaline_Phosphotase: Liver.Variables[4], Alamine_Aminotransferase: Liver.Variables[5], Aspartate_Aminotransferase: Liver.Variables[6], Total_Protiens: Liver.Variables[7], Albumin: Liver.Variables[8], Albumin_and_Globulin_Ratio: Liver.Variables[9]) else{
             fatalError()
         }
        
         results = output2.Dataset
         print(results)
        guard let output3 = try? Diabetes.model.prediction(Pregnancies: Diabetes.Variables[0], Glucose: Diabetes.Variables[1], BloodPressure: Diabetes.Variables[2], SkinThickness: Diabetes.Variables[3], Insulin: Diabetes.Variables[4], BMI: Diabetes.Variables[5], DiabetesPedigreeFunction: Diabetes.Variables[6], Age: Diabetes.Variables[7])
                    else{
                        fatalError("Input")
                }
                results = output3.Outcome
        //        self.navigationItem.title = "\(results)"
                print(results)
        
       }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        detect()
    }
}
