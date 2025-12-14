//
//  TableTableViewController.swift
//  11. Table
//
//  Created by 양나빈 on 12/14/25.
//

import UIKit

var items = ["책 구매", "수연과 약속", "스터디 준비"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]

class TableTableViewController: UITableViewController {
    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // 왼쪽 수정 버튼
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    // 뷰가 전환될 때 호출되는 함수
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData()
    }

    // MARK: - Table view data source

    // 테이블 섹션갯수 설정
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // 테이블 행갯수 설정
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    // 셀 초기화
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])
        

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // 셀 수정
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 셀 삭제
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // 삭제 버튼 이름 변경
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }

    // 셀 순서 바꾸기
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let removeIndex = (fromIndexPath as NSIndexPath).row
        let insertIndex = (to as NSIndexPath).row
        
        let itemToMove = items[removeIndex] // 이동할 아이템
        let itemImageToMove = itemsImageFile[removeIndex]
        items.remove(at: removeIndex)
        itemsImageFile.remove(at: removeIndex)
        items.insert(itemToMove, at: insertIndex)
        itemsImageFile.insert(itemImageToMove, at: insertIndex)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // 세그를 이용하여 뷰를 이동하는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(items[(indexPath! as NSIndexPath).row])
        }
    }

}
