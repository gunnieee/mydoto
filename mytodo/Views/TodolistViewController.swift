//
//  TodolistViewController.swift
//  mytodo
//
//  Created by APPLE M1 Max on 2023/09/20.
//

import UIKit
import SnapKit

final class TodolistViewController: UIViewController {

    private let viewModel = TodolistViewModel()
    
    private let myTableview = ListTableView()
    
    private let addButton = SetButton(title: "New", fontColor: .link)
    
}
extension TodolistViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

private extension TodolistViewController {
    
    
    func setUp(){
        view.backgroundColor = .systemBackground
        setUpTableView()
        setUpAddButton()
        viewModel.viewUpdate = { [weak self] in
            guard let self = self else { return }
            self.myTableview.reloadData()
        }
    }
    
    func setUpTableView(){
        view.addSubview(myTableview)
        myTableview.register(TodolistCell.self, forCellReuseIdentifier: TodolistCell.identifier)
        myTableview.dataSource = self
        myTableview.delegate = self
        myTableview.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func setUpAddButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        addButton.addTarget(self, action: #selector(didTappedAddButton), for: .touchUpInside)
    }
    
    @objc func didTappedAddButton(){
        let alert = UIAlertController(title: "New", message: "", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Done", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            self.viewModel.addTodo(title: text)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        alert.addTextField()
        alert.addAction(cancel)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
    
}


extension TodolistViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTodolist().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableview.dequeueReusableCell(withIdentifier: TodolistCell.identifier ,for: indexPath) as? TodolistCell else { return UITableViewCell() }
        let tasks = Array(viewModel.getTodolist().reversed())
        cell.cellDelegate = self
        cell.bind(task: tasks[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let alert = UIAlertController(title: "Memo Delete", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default) { _ in
                self.viewModel.deleteTodo(task: self.viewModel.getTodolist().reversed()[indexPath.row])
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
            alert.addAction(cancel)
            alert.addAction(ok)
            
            present(alert, animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        let alert = UIAlertController(title: "Edit", message: "", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let title = alert.textFields?.first?.text else { return }
            self.viewModel.updateTodoTitle(task: self.viewModel.getTodolist().reversed()[indexPath.row], title: title)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        alert.addTextField()
        alert.addAction(cancel)
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
    }
    
}

extension TodolistViewController: ButtonTappedDelegate{
    func toDoCellButtonTapped(task: Task) {
        
    }
    


}
