//
//  SaveViewController.swift
//  lap09coreData
//
//  Created by SWUCOMPUTER on 08/05/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class SaveViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet var ideaTitle: UITextField!
    @IBOutlet var ideaContent: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Idea", in: context)
        
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        object.setValue(ideaTitle.text, forKey: "ideaTitle")
        object.setValue(ideaContent.text, forKey: "ideaContent")
        object.setValue(Date(), forKey: "ideaDate")
        
        do{
            try context.save()
            print("saved!")
        }catch let error as NSError{
            print("error : \(error)")
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func getContext() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
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
