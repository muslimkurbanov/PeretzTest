//
//  ModuleBuilder.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 17.06.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import UIKit
//MARK: - Builder
protocol Builder {
    static func createMainModule() -> UIViewController
    static func createTableViewModule() -> UITableViewController
}

class ModuleBuilder: Builder {
    
    //MARK: - CreateMainModule
    static func createMainModule() -> UIViewController {
        let view = ViewController()
        let presenter = LMainPresenter(view: view)
        view.presenter = presenter
        return view
    }
    //MARK: - CreateTableViewModule
    static func createTableViewModule() -> UITableViewController {
        let view = TableViewController()
        let networkService = NetworkService()

        let presenter = MainTableViewPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
