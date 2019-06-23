//
//  DeptTableViewController.swift
//  TableBasic
//
//  Created by SWUCOMPUTER on 23/04/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

class DeptTableViewController: UITableViewController {
    var departmentList: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return departmentList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Department cell", for: indexPath)

        // Configure the cell...
     cell.textLabel?.text = departmentList[indexPath.row]

        return cell
    }
   

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            departmentList.remove(at: indexPath.row) //이것만 추가함
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

    
    // MARK: - Navigation
    //하위 view에서 입력한 학과명을 넘겨받을 변수
    var addedDept:String?

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toAddDeptView" {
            if let destVC = segue.destination as? AddDeptViewController {
                destVC.title = "추가할 학과입력"
                destVC.deptVC = self //하위뷰에 가면 deptVC가 뭘 가리키는지 알아야한다
                //즉 self는 자기 자신(상위뷰)인데 하위뷰도 상위뷰를 가리키게한다.
            } }
    }
    
    //뷰가 나타나기 전에 해야할(현재의 뷰가 나타날텐데) 그 사전작업을 어떻게 할 것이냐
    override func viewWillAppear (_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let deptName = self.addedDept { //텍스트 필드에 아무것도 안쓰고 넘어올 수 있음 그래서 넘어온 자료가 널인지 아닌지
            departmentList.append(deptName)
            // tableView에 복수개를 추가할 수도 있으므로
            // 배열 형태로 IndexPath 정보를 담고 있음
            self.tableView.insertRows (at: [IndexPath (row: self.departmentList.count-1,section :0)], with: .automatic)//row는 0부터 끝까지(섹션과 로우를 지정해준 다음에) 맨 마지막 항목에 추가를 해라는 의미
            
            self.addedDept = nil
    }
    }

}
