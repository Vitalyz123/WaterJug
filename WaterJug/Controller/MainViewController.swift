//
//  MainViewController.swift
//  WaterJug
//
//  Created by Vitalii Zaitcev on 2/21/20.
//  Copyright © 2020 Vitalii Zaitcev. All rights reserved.
//

import UIKit
import Cartography

class MainViewController: UIViewController {
    private let viewModel: MainViewModel = MainViewModel()
    
    private let tableView: UITableView = {
        let tableView = UITableView.init(frame: .zero, style: .grouped)
        tableView.backgroundColor       = .clear
        tableView.keyboardDismissMode   = .onDrag
        tableView.separatorStyle        = .none
        tableView.tableHeaderView       = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 0.1))
        tableView.tableFooterView       = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 0.1))
        tableView.sectionHeaderHeight   = 0.0
        tableView.sectionFooterHeight   = 0.0
        tableView.rowHeight             = UITableView.automaticDimension
        tableView.estimatedRowHeight    = 44.0
        tableView.contentInset          = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        tableView.clipsToBounds         = true
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false

        return tableView
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Water Jug Challenge"
        
        setupSubviews()
        setupTargets()
        
        view.backgroundColor    = .white
        
        tableView.delegate      = self
        tableView.dataSource    = self
        
        tableView.register(InputTableViewCell.self,         forCellReuseIdentifier: InputTableViewCell.Identifier)
        tableView.register(SubmitInputTableViewCell.self,   forCellReuseIdentifier: SubmitInputTableViewCell.Identifier)
        tableView.register(ActionTableViewCell.self,        forCellReuseIdentifier: ActionTableViewCell.Identifier)
    }


    func setupSubviews() {
        view.addSubview(tableView)
        constrain(tableView) { $0.edges == $0.superview!.edges }
    }
    
    func setupTargets() {
        viewModel.didReceiveErrorClosure = { [weak self] message in
            self?.alert(message: message)
        }
        
        viewModel.didUpdateResultClosure = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(forSection: viewModel.section(atIndex: section))
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel.section(atIndex: indexPath.section)
        switch section {
        case .firstContainer:
            let cell: InputTableViewCell = tableView.dequeueReusableCell(withIdentifier: InputTableViewCell.Identifier) as! InputTableViewCell
            cell.containerTitle = "Container X:"
            cell.didUpdateInputValueClosure = { [weak self] value in
                self?.viewModel.setValue(value, forSection: section)
            }

            return cell
        case .secondContainer:
            let cell: InputTableViewCell = tableView.dequeueReusableCell(withIdentifier: InputTableViewCell.Identifier) as! InputTableViewCell
            cell.containerTitle = "Container Y:"
            cell.didUpdateInputValueClosure = { [weak self] value in
                self?.viewModel.setValue(value, forSection: section)
            }
            
            return cell
        case .thirdContainer:
            if indexPath.row == 0 {
                let cell: InputTableViewCell = tableView.dequeueReusableCell(withIdentifier: InputTableViewCell.Identifier) as! InputTableViewCell
                cell.containerTitle = "Container Z:"
                cell.didUpdateInputValueClosure = { [weak self] value in
                    self?.viewModel.setValue(value, forSection: section)
                }
                
                return cell
            } else if indexPath.row == 1 {
                let cell: SubmitInputTableViewCell = tableView.dequeueReusableCell(withIdentifier: SubmitInputTableViewCell.Identifier) as! SubmitInputTableViewCell
                cell.didTapSubmitClosure = { [weak self] in
                    self?.viewModel.submitInputs()
                }
                
                return cell
            } else {
                return TableViewCell()
            }
        case .results:
            let cell: ActionTableViewCell = tableView.dequeueReusableCell(withIdentifier: ActionTableViewCell.Identifier) as! ActionTableViewCell
            
            let step = viewModel.result[indexPath.row]
            
            cell.action = step.1.readableResult
            cell.state = (step.1 == .noSolution) ? "" : step.0.readableResult()

            return cell
        }
    }
}
