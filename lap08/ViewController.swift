//
//  ViewController.swift
//  lap08
//
//  Created by SWUCOMPUTER on 23/04/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var lottoTableView: UITableView!
    let size: Int = 4
    var index = 0
    var lottoArrays = Array<Array<Int>>() //2차원 배열
    //var lottoArrays = Array(1...6)
    var originalNumbers = Array(1...45)
    var isbuttonclicked: Bool = false
    var lottoArray = Array<Int>() //1차원 배열
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return size
        //4줄이니까 4로 변경하기 - 지금은 1줄씩 구현해봄
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //강의자료 내용 복붙하기
        //한줄을 만들어보고 그걸 4개 반복..?
        let cell = self.lottoTableView.dequeueReusableCell(withIdentifier: "Lotto Cell", for: indexPath) as! LottoTableViewCell
    
        //작성할 코드 : lottoArrays 값을 각 row의 label에 추가
        if !isbuttonclicked{
            cell.number1.text = "1"
            cell.number2.text = "2"
            cell.number3.text = "3"
            cell.number4.text = "4"
            cell.number5.text = "5"
            cell.number6.text = "6"
        }
        else{
            cell.number1.text = String(lottoArrays[indexPath.row][0])
            cell.number2.text = String(lottoArrays[indexPath.row][1])
            cell.number3.text = String(lottoArrays[indexPath.row][2])
            cell.number4.text = String(lottoArrays[indexPath.row][3])
            cell.number5.text = String(lottoArrays[indexPath.row][4])
            cell.number6.text = String(lottoArrays[indexPath.row][5])
        }
        
        return cell
    }
    
    
  
    

    @IBAction func doDraw(_ sender: UIBarButtonItem) {
    //to-do list
    //버튼을 누르면 1부터 45까지의 값에서 임의로 순서대로 뽑아서 새로운 배열에 넣는다.
    //그리고 뽑은 거에 대해서는 지워주기
        lottoArrays = Array()
        
        for _ in 0..<size{
            for _ in 0...5{
                //1부터 45까지 들어있는 수가 있는 배열에서 인덱스값 랜덤으로 뽑기
                index = Int(arc4random_uniform(UInt32(originalNumbers.count))) //0부터 44까지의 수를 랜덤으로 뽑는다
                //뽑은 배열의 인덱스에 있는 값을 추가하기
                lottoArray.append(originalNumbers[index]) //1차원 배열에 값넣고
                originalNumbers.remove(at: index)
            }
            originalNumbers = Array(1...45)
            
            lottoArray.sort(by: {$0 < $1})
            lottoArrays.append(lottoArray)
            
            lottoArray = Array<Int>()
        }
        
        isbuttonclicked = true
        
        lottoTableView.reloadData()
    }
    
    //이차원 배열
    //-> 6개의 값을 갖는게 1개의 배열이고 그 배열들이 모여서 4개를 이루는 이차원 배열이 필요하다
    //오리지널 넘벙 배열에서 값을 가져와서 로토 어레이점 append 하면된다
}

