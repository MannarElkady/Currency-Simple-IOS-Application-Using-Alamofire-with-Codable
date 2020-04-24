//
//  EuroPresenter.swift
//  Concurrency
//
//  Created by MagoSpark on 4/24/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

import Foundation

class EuroPresenter : EuroPresenterProtocol{
    private lazy var network = NetworkService()
    var controller : EuroControllerProtocol?
    private lazy var arrayOfConcurrencies = Array<CurrencyDisplayed>()
    func getAllCurrency() {
        network.getResponseData(SuccessHandler:{
            (decodable:Currency) in
            print("Success\(String(describing: decodable.rates["THB"]))")
            decodable.rates.forEach({
                str,double in
                let currency = CurrencyDisplayed(currency: str, value: double)
                self.arrayOfConcurrencies.append(currency)
            })
            self.controller?.displayEuroCurrency(CurrencyList: self.arrayOfConcurrencies)
            
        }, ErrorHandler: {
            print("Failed")
        })
    }
    
}
