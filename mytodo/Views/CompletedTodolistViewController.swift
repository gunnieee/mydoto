//
//  CompletedTodolistViewController.swift
//  mytodo
//
//  Created by APPLE M1 Max on 2023/09/19.
//

import UIKit
import SnapKit

final class CompletedTodolistViewController: UIViewController {

    private let myTableview = ListTableView()
    private let viewModel = CompletedTodolistViewModel()
}

extension CompletedTodolistViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

private extension CompletedTodolistViewController{

    func setUp(){
        view.backgroundColor = .systemBackground
        setUpTableView()
    }
    
    func setUpTableView(){
        view.addSubview(myTableview)
        myTableview.delegate = self
        myTableview.dataSource = self
        myTableview.register(TodolistCell.self, forCellReuseIdentifier: TodolistCell.identifier)
        myTableview.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        viewModel.viewUpdate = { [weak self] in
            guard let self = self else {return}
            self.myTableview.reloadData()
        }
    }

}

extension CompletedTodolistViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTodoFilterlist().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableview.dequeueReusableCell(withIdentifier: TodolistCell.identifier ,for: indexPath) as? TodolistCell else { return UITableViewCell() }
        let tasks = Array(viewModel.getTodoFilterlist().reversed())
        cell.bind(task: tasks[indexPath.row])
        return cell
    }
    
    
}
