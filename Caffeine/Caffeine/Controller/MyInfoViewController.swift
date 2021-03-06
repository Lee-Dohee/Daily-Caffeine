//
//  MyInfoViewController.swift
//  Caffeine
//
//  Created by hyogang on 2021/08/18.
//

import UIKit

class MyInfoViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let userName = UserDefaults.standard.string(forKey: "userName"){
            tfName.text = userName
        }else{
            self.navigationItem.setHidesBackButton(true, animated: false)
        }
    }
    
    @IBAction func btnRegister(_ sender: UIButton) {
        guard let userName : String = tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines) else{ return }
        
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(20, forKey: "userAge")
        UserDefaults.standard.set(50, forKey: "userWeight")
        UserDefaults.standard.set(true, forKey: "userPregnancy")
        self.navigationController?.popViewController(animated: true)
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
