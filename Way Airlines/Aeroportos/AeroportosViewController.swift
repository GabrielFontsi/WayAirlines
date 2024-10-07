//
//  AeroportosViewController.swift
//  Way Airlines
//
//  Created by Gabriel Fontenele da Silva on 07/10/24.
//

import UIKit

class AeroportosViewController: UIViewController {
    
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
        search.placeholder = "Pesquise o aeroporto"
        search.delegate = self
        search.barTintColor = .lightGray
        search.searchTextField.backgroundColor = .white
        return search
    }()
    
    func uniqueAirports(from flights: [Flight]) -> [Flight] {
            var uniqueFlights = [Flight]()
            var seenAirports = Set<String>()
            
            for flight in flights {
                
                let departureAirport = flight.departure_airport.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                let arrivalAirport = flight.arrival_airport.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                
                // Combinar os dois aeroportos em uma chave única
                let airportKey = "\(departureAirport) - \(arrivalAirport)"
                
                if !seenAirports.contains(airportKey) {
                    uniqueFlights.append(flight)
                    seenAirports.insert(airportKey)
                }
            }
            return uniqueFlights
        }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(type: AeroportoTableViewCell.self)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.flights = uniqueAirports(from: viewModel.getFlights())
        self.flights = viewModel.getFlights()
        self.setupAddSubview()
        self.setupConstraints()
        self.setupNavigationBar()

    }
    
    func setupAddSubview(){
        self.view.addSubview(tableView)
    }
    
    func setupConstraints(){
         NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = .systemBlue
        self.view.backgroundColor = .systemBlue
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        title = "Lista de Aeroportos"
        navigationItem.titleView = searchBar
      
    }
}

extension AeroportosViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          if searchText.isEmpty {
              isSearchActive = false
          } else {
              isSearchActive = true
              filteredFlight = flights.filter({ voo in
                  let departureAirport = voo.departure_airport.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                  return departureAirport.contains(searchText.lowercased())
              })
          }
          tableView.reloadData()
      }
    
}

extension AeroportosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive ? filteredFlight.count : flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AeroportoTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.aeroporto = isSearchActive ? filteredFlight[indexPath.row] : flights[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
