//
//  ViewControllerB.swift
//  smayGroupProject
//
//  Created by Sheldon May Gunlogson on 11/6/18.
//  Copyright © 2018 Shane May. All rights reserved.
//

import UIKit

class ViewControllerB: UIViewController {

    @IBOutlet weak var hr1: UITextField!
    @IBOutlet weak var hr2: UITextField!
    @IBOutlet weak var hr3: UITextField!
    @IBOutlet weak var hr4: UITextField!
    @IBOutlet weak var hr5: UITextField!
    @IBOutlet weak var pt1: UITextField!
    @IBOutlet weak var pt2: UITextField!
    @IBOutlet weak var pt3: UITextField!
    @IBOutlet weak var pt4: UITextField!
    @IBOutlet weak var pt5: UITextField!
    @IBOutlet weak var gpaLabel: UILabel!
    
    var courses: [Int : Course] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("B:\(arr[1])")
        
        
        
        hr1.addTarget(self, action: #selector(ViewControllerA.textFieldDidChange(_:)),
                                  for: UIControl.Event.editingChanged)
        hr2.addTarget(self, action: #selector(ViewControllerA.textFieldDidChange(_:)),
                      for: UIControl.Event.editingChanged)
        hr3.addTarget(self, action: #selector(ViewControllerA.textFieldDidChange(_:)),
                      for: UIControl.Event.editingChanged)
        hr4.addTarget(self, action: #selector(ViewControllerA.textFieldDidChange(_:)),
                      for: UIControl.Event.editingChanged)
        hr5.addTarget(self, action: #selector(ViewControllerA.textFieldDidChange(_:)),
                      for: UIControl.Event.editingChanged)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print("input changed")
        
        courses.removeAll(keepingCapacity: false)
        
        var c1 = Course( hrs: Int(hr1.text!) ?? 0, pts: Int(pt1.text!) ?? 0 )
        var c2 = Course( hrs: Int(hr2.text!) ?? 0, pts: Int(pt2.text!) ?? 0 )
        var c3 = Course( hrs: Int(hr3.text!) ?? 0, pts: Int(pt3.text!) ?? 0 )
        var c4 = Course( hrs: Int(hr4.text!) ?? 0, pts: Int(pt4.text!) ?? 0 )
        var c5 = Course( hrs: Int(hr5.text!) ?? 0, pts: Int(pt5.text!) ?? 0 )
        
        courses[0] = c1
        courses[1] = c2
        courses[2] = c3
        courses[3] = c4
        courses[4] = c5
        
        let hrs = getTotalHrs()
        let pts = getTotalPts()
        var gpa = 0.0
        if(hrs > 0)
        {
            gpa = Double(pts / hrs)
        }
        
        gpaLabel.text = String(gpa)
    }
    
    func getTotalHrs() -> Int {
        var hrs = totalHrs
        for (index, course) in courses {
//            print("course : \(course)")
//            print("index : \(index)")
            hrs = hrs + course.hrs
        }
        return hrs
    }
    
    func getTotalPts() -> Int {
        var pts = totalPts
        for (index, course) in courses {
//            print("course : \(course)")
//            print("index : \(index)")
            pts = pts + course.pts
        }
        return pts
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
