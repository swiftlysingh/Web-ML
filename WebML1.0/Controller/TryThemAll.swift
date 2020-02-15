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
           guard let output = try? HeartDisease.model.prediction(age: HeartDisease.mean[0], sex: HeartDisease.mean[1], cp: HeartDisease.mean[2], trestbps: HeartDisease.mean[3], chol: HeartDisease.mean[4], fbs: HeartDisease.mean[5], restecg: HeartDisease.mean[6], thalach: HeartDisease.mean[7], exang: HeartDisease.mean[8], oldpeak: HeartDisease.mean[9], slopes: HeartDisease.mean[10], ca: HeartDisease.mean[11], thal: HeartDisease.mean[12]) else {
               fatalError("Input Failed")
           }
           results = output.target
           print("Heart\(results)")
        guard let output1 = try? BreastCancer.model.prediction(radius_mean: BreastCancer.mean[0], texture_mean: BreastCancer.mean[1], perimeter_mean: BreastCancer.mean[2], area_mean: BreastCancer.mean[3], smoothness_mean: BreastCancer.mean[4], compactness_mean: BreastCancer.mean[5], concavity_mean: BreastCancer.mean[6], concave_points_mean: BreastCancer.mean[7], symmetry_mean: BreastCancer.mean[8], fractal_dimension_mean: BreastCancer.mean[9], radius_se: BreastCancer.mean[10], texture_se: BreastCancer.mean[11], perimeter_se: BreastCancer.mean[12], area_se: BreastCancer.mean[13], smoothness_se: BreastCancer.mean[14], compactness_se: BreastCancer.mean[15], concavity_se: BreastCancer.mean[16], concave_points_se: BreastCancer.mean[17], symmetry_se: BreastCancer.mean[18], fractal_dimension_se: BreastCancer.mean[19], radius_worst: BreastCancer.mean[20], texture_worst: BreastCancer.mean[21], perimeter_worst: BreastCancer.mean[22], area_worst: BreastCancer.mean[23], smoothness_worst: BreastCancer.mean[24], compactness_worst: BreastCancer.mean[25], concavity_worst: BreastCancer.mean[26], concave_points_worst: BreastCancer.mean[27], symmetry_worst: BreastCancer.mean[28], fractal_dimension_worst: BreastCancer.mean[0]) else{
            fatalError("Input Failed")
        }
        results = output1.target
        print("BreastCancer\(results)")
        guard let output2 = try? Liver.model.prediction(Age: Liver.mean[0], Gender: Liver.mean[1], Total_Bilirubin: Liver.mean[2], Direct_Bilirubin: Liver.mean[3], Alkaline_Phosphotase: Liver.mean[4], Alamine_Aminotransferase: Liver.mean[5], Aspartate_Aminotransferase: Liver.mean[6], Total_Protiens: Liver.mean[7], Albumin: Liver.mean[8], Albumin_and_Globulin_Ratio: Liver.mean[9]) else{
             fatalError()
         }
        
         results = output2.Dataset
         print(results)
        guard let output3 = try? Diabetes.model.prediction(Pregnancies: Diabetes.mean[0], Glucose: Diabetes.mean[1], BloodPressure: Diabetes.mean[2], SkinThickness: Diabetes.mean[3], Insulin: Diabetes.mean[4], BMI: Diabetes.mean[5], DiabetesPedigreeFunction: Diabetes.mean[6], Age: Diabetes.mean[7])
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
