//
//  RootTableViewController.swift
//  lap09coreData
//
//  Created by SWUCOMPUTER on 08/05/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class RootTableViewController: UITableViewController {
    
    var ideaArray:[NSManagedObject] = []
    
    func getContext() -> NSManagedObjectContext{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        let context = self.getContext()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Idea")
        
        do{
            ideaArray = try context.fetch(fetchRequest)
        } catch let error as NSError{
            print("error : \(error)")
        }
        
        self.tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ideaArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Idea Cell", for: indexPath)

        // Configure the cell...
        let idea = ideaArray[indexPath.row]
        let dbDate: Date? = idea.value(forKey: "ideaDate") as? Date
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd h:mm a"
        
        if let unwrapDate = dbDate{
        cell.textLabel?.text = formatter.string(from: unwrapDate as Date) //날짜 출력
        cell.detailTextLabel?.text = idea.value(forKey: "ideaTitle") as? String
        }
        

        return cell
    }
    
    
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            let context = getContext()
            context.delete(ideaArray[indexPath.row])
            do{
                try context.save()
                print("deleted!")
            } catch let error as NSError{
                print("error : \(error)")
            }
            ideaArray.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
