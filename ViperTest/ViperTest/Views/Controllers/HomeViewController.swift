//
//  HomeView.swift
//  ViperTest
//
//  Created by Oswaldo Ferral on 28/07/23.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {

    // MARK: Properties
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///presenter = HomePresenter()
        
        print("Presenter")
        ///Aqui mandamos llamar al presenter
        presenter?.viewDidLoad()
    
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}
