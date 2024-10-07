//
//  HomeViewController.swift
//  Way Airlines
//
//  Created by Gabriel Fontenele da Silva on 06/10/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var flights = [Flight]()
    var filteredFlight :[Flight] = []
    var isSearchActive: Bool = false
    
    
    
    let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Pesquisar status do seu voo"
        search.delegate = self
        search.barTintColor = .systemGray5
        search.searchTextField.backgroundColor = .systemGray5
        return search
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGray5
        tableView.register(type: VooTableViewCell.self)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.flights = viewModel.listaDeVoos(status: nil)
        self.setupConstraints()
        self.setupNavigationBar()
        self.view.backgroundColor = .systemGray5
        
    }
    
    func setupConstraints(){
        self.view.addSubview(tableView)
         NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func setupNavigationBar(){
        self.view.backgroundColor = .lightGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        title = "Lista de Voos"
        navigationItem.titleView = searchBar
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearchActive = false
        } else {
            isSearchActive = true
            filteredFlight = flights.filter({ voo in
               print(searchText)
                return voo.status.lowercased().contains(searchText.lowercased())
            })
        }
        
        tableView.reloadData()
    
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: VooTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.voo = isSearchActive ? filteredFlight[indexPath.row] : flights[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive ? filteredFlight.count : flights.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = isSearchActive ? filteredFlight[indexPath.row] : flights[indexPath.row]
        let detalheVoo = DetalhesVooViewController(voo: item)
        navigationController?.pushViewController(detalheVoo, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
