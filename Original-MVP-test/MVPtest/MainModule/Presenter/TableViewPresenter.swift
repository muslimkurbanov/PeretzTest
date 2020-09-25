//
//  TableViewPresenter.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 21.09.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import Foundation


protocol TableViewProtocol: class {
    func succes()
    func failure(error: Error)
}

protocol TableViewPresetnerProtocol: class {
    init(view: TableViewProtocol, networkService: NetworkServiceProtocol)
    func getComments()
    var searchResponce: [Model]? { get set }
}

class MainTableViewPresenter: TableViewPresetnerProtocol {
    var searchResponce: [Model]? = nil

    var main = TableViewController()

    weak var view: TableViewProtocol?
    
    let networkService: NetworkServiceProtocol!

    required init(view: TableViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getComments()
    }
    
    func getComments() {
        networkService.getComments { [weak self](result) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let searchResponce):
                    searchResponce?.map { (data) in
                        print(data.name)
                        self.searchResponce = searchResponce
                        self.view?.succes()

                    }
                    
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    
    
    
}
