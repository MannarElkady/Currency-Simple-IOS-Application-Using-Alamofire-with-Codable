//
//  EuroProtocols.swift
//  Concurrency
//
//  Created by MagoSpark on 4/24/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

import Foundation

protocol EuroPresenterProtocol {
    func getAllCurrency()
}

protocol EuroControllerProtocol {
    func displayEuroCurrency(CurrencyList list : Array<CurrencyDisplayed>)
}
