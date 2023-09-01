//
//  ViewController.swift
//  URLSession+TableView
//
//  Created by USER on 31.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var userActionDelegate: UserAction?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        insertNewAlbumTitle()
        
    }
    
    func insertNewAlbumTitle(){
        
        userActionDelegate?.didInsert(text: textField.text!)// передаем presenter вставку новой строки
      
        let indexPath = IndexPath(row: (userActionDelegate?.didCountElementsInTable())! - 1, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
        textField.text = ""
        view.endEditing(true)
    }
}

extension ViewController: Updates {
    func didUpdateAlbum(albumStruct: [String]) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userActionDelegate?.didCountElementsInTable() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: URLSessionTableViewCell.id, for: indexPath) as? URLSessionTableViewCell else {
            fatalError()
        }
        cell.labelCell.text = userActionDelegate?.didFillTable(indexOfElement: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            userActionDelegate?.didRemovet(indexOfElement: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}
