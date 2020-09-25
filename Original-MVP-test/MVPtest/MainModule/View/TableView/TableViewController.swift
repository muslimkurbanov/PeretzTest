//
//  TableViewController.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 21.09.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var presenter: TableViewPresetnerProtocol!
    var searchResponce: [Model]? = nil
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        tableView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

    }

    // MARK: - TableViewDelegate(DataSource)
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.searchResponce?.count ?? 4
    }
    //cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! TableViewCell
        
        cell.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        let datas = presenter.searchResponce?[indexPath.row]
        
        let price = datas?.price
        
        cell.nameLabel.text = datas?.name
        cell.priceLabel.text = String(price ?? 0) + " ₽"
        cell.descriptionLabel.text = datas?.description
        
        guard let urlString = datas?.image else { return cell }
        let url = URL(string: urlString)!
        let data = try? Data(contentsOf: url)
        
        if let imageData = data {
            let image = UIImage(data: imageData)
            cell.productImageView.image = image
            cell.productImageView.contentMode = .scaleAspectFit
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
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
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
//MARK: TableViewProtocol
extension TableViewController: TableViewProtocol {
    func succes() {
        tableView.reloadData()
        
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
        
    }
    
    
}

