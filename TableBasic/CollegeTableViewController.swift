//
//  CollegeTableViewController.swift
//  TableBasic
//
//  Created by SWUCOMPUTER on 23/04/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

class CollegeTableViewController: UITableViewController {
    
    var university:[String: [String]] = ["미래산업융합대학": ["디지털미디어학과", "소프트웨어융합학과", "정보보호학과","패션디자인학과", "산업디자인학과", "경영학과"], "사회과학대학": ["경제학과", "문헌정보학과", "사회복지학과", "아동학과","행정학과", "언론영상학부" , "교육심리학과", "체육학과" ]]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "서울여자대학교"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem //편집버튼
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return university.count
    }//한 section애 몇 개의 항목이 저장될지 결정함

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "College Cell", for: indexPath)

        // Configure the cell...
        var collegeName = Array(university.keys)
        cell.textLabel?.text = collegeName[indexPath.row] //처음에 indexpath.row는 0부터 시작함(맨 처음 첫 셀에서 0번째)
        

        return cell
    } // 각 cell의 내용을 채우는 기능을 수행함
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // Get the new view controller using segue.destinationViewController. // Pass the selected object to the new view controller.
        if segue.identifier == "todeptview" {
            if let destination = segue.destination as? DeptTableViewController {
                if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row { //row값의 첫번째 눌린 것을 인덱스 값에 가져온다(null이 아니면참)
                    destination.title = Array(university.keys) [selectedIndex] //단과대 명 골라서 배열을 만들고 인덱스 값을 주면 단과대 이름을 넘어가게될 학과명 있는 뷰의 제목에 단과대 이름을 넣어라
                    destination.departmentList = Array(university.values) [selectedIndex] }
                //넘어간 뷰의 departmentList에 유니버스티에 value을 모아서 배열로 만든 것에 인덱스 값을 통해 선택된 단과대학의 학과이름을 넣어준다.
            } }
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }//셀에 대해서 삭제, 추가등의 변경의 권한을 얻는다
    
//indexpath는 섹션과 셀의 위치를 가지고 있는 객체이다. 운영체제가 알아서 하고 우리가 쓰는건 .row 또는 .section으로 사용한다.
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { //삭제가 있고
            // Delete the row from the data source
            
            let collegeName = Array(university.keys) [indexPath.row]
            self.university.removeValue(forKey: collegeName)
            
            tableView.deleteRows(at: [indexPath], with: .fade) //deleteRows 여러개를 선택할 수 있음(특정 섹션의 셀들을 지워준다)하지만 눈앞에서 지우는 게 아니라 실질적으로 삭제해주기 위해서 위의 두 문장이 필요함
        } else if editingStyle == .insert { //추가도 할 수 있고
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
