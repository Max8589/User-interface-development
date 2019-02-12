//
//  MyGroupsTableViewController.swift
//  VKApp
//
//  Created by admin on 10/02/2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MyGroupsTableViewController: UITableViewController {

    var groups = [String]()
    
//    @IBAction func addGroup(segue: UIStoryboardSegue) {
//              // Проверяем идентификатор, чтобы убедится, что это нужный переход
//        if segue.identifier == "addGroup" {
//            // Получаем ссылку на контроллер, с которого осуществлен переход
//            let groupsTableViewController = segue.source as! GroupsTableViewController
//            // Получаем индекс выделенной ячейки
//            let indexPath = groupsTableViewController.tableView.indexPathForSelectedRow
//            // Получаем группу по индексу
//            let group = groupsTableViewController.groups[indexPath!.row]
//            // Проверяем, что такой группы нет в списке
//            if  !groups.contains(group) {
//                // Добавляем группу в список выбранных
//                groups.append(group)
//                // Обновляем таблицу
//                tableView.reloadData()
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получаем ячейку из пула
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsTableViewCell", for: indexPath) as! MyGroupsTableViewCell
        // Получаем группу для конкретной строки
        let group = groups[indexPath.row]
        
        // Устанавливаем группу в надпись ячейки
        cell.myGroupsName.text = group

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем группу из массива
            groups.remove(at: indexPath.row)
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
