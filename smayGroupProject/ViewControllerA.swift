//
//  ViewControllerA.swift
//  smayGroupProject
//
//  Created by Sheldon May Gunlogson on 11/6/18.
//  Copyright © 2018 Shane May. All rights reserved.
//

import UIKit

class ViewControllerA: UIViewController {

    @IBOutlet weak var totalPointsInput: UITextField!
    @IBOutlet weak var totalHoursInput: UITextField!
    @IBOutlet weak var gpaLabel: UILabel!
    var hrs = 0
    var pts = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("A:\(arr[0])")
        
        totalPointsInput.addTarget(self, action: #selector(ViewControllerA.textFieldDidChange(_:)),
                        for: UIControl.Event.editingChanged)
        totalHoursInput.addTarget(self, action: #selector(ViewControllerA.textFieldDidChange(_:)),
                                  for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        hrs = Int(totalHoursInput.text!) ?? 0   //the ?? makes it so if it can't be turned into a value it sets it as 0
        pts = Int(totalPointsInput.text!) ?? 0
        
        totalHrs = hrs
        totalPts = pts
        
        let gpa = calcGPA(pts: pts, hrs: hrs)
        print("\(gpa)")
        gpaLabel.text = String(gpa)
    }
    
    func calcGPA(pts:Int, hrs:Int) -> Double
    {
        if(hrs < 1)
        {
            return 0.0;
        }
        return Double(pts/hrs);
    }
}
