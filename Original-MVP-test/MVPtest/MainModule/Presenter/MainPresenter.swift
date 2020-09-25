//
//  Presenter.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 20.09.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//
//MARK: - MainPresenter

import Foundation

protocol ViewProtocol: class {
    
}

protocol ViewPresetnerProtocol: class {
    init(view: ViewProtocol)
}

class LMainPresenter: ViewPresetnerProtocol {
    
    var main = ViewController()
    weak var view: ViewProtocol?
    
    required init(view: ViewProtocol) {
        self.view = view
        
    }
}
