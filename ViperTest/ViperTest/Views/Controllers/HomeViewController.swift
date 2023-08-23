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
    var arrayViewDataShow = [tvShow]()

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
    func presenterPushDataView(dataShow: [tvShow]) {
        DispatchQueue.main.async { [self] in
            arrayViewDataShow = dataShow
            tableHomeView.reloadData()
        }

    }
    
    // TODO: implement view output methods
}

extension HomeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayViewDataShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellUse", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = "\(arrayViewDataShow[indexPath.row].show?.name ?? "no name")"
    
        content.secondaryText = "\(arrayViewDataShow[indexPath.row].show?.language ?? "No lang")"
        
        cell.contentConfiguration = content
        
        return cell

    }
    
    
}

extension HomeViewController: UITableViewDelegate{
    
}
