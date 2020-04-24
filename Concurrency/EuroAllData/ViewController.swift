//
//  ViewController.swift
//  Concurrency
//
//  Created by MagoSpark on 4/24/20.
//  Copyright © 2020 ManarOrg. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController , EuroControllerProtocol{
    private var observableForConcurrencyArray : Observable<Array<CurrencyDisplayed>>?
    private var presenter: EuroPresenterProtocol?
    private let disposeBag = DisposeBag()
    func displayEuroCurrency(CurrencyList list: Array<CurrencyDisplayed>) {
        observableForConcurrencyArray = Observable.from(list)
        observableForConcurrencyArray?.bind(to: collectionView.rx.items(cellIdentifier: "cell", cellType: CollectionViewCell.self)){
            index,currency,cell in
            cell.currencyDetails = currency
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter = EuroPresenter()
        (presenter as! EuroPresenter).controller = self
        presenter?.getAllCurrency()
        
    }


}

