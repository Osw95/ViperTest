//
//  HomeView.swift
//  ViperTest
//
//  Created by Oswaldo Ferral on 28/07/23.
//  
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    // MARK: IBoutlets
    @IBOutlet weak var tableHomeView: UITableView!
    
    // MARK: Properties
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///presenter = HomePresenter()
        
        print("Presenter")
        
        ///Aqui mandamos llamar al presenter
        presenter?.viewDidLoad()
        
        tableHomeView.dataSource = self
        
        tableHomeView.delegate = self
    
    }
}

extension HomeViewController: HomeViewProtocol {
    // TODO: implement view output methods
}

extension HomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellUse", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = "PRUEBA HARDCODED"
        
        content.secondaryText = "texto de prueba"
        
        cell.contentConfiguration = content
        
        return cell

    }
    
    
}

extension HomeViewController: UITableViewDelegate{
    
}
