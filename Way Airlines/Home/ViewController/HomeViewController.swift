//
//  HomeViewController.swift
//  Way Airlines
//
//  Created by Gabriel Fontenele da Silva on 06/10/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var flights = [Flight]()

    let viewModel: HomeViewModel
    let filterOptions = ["TODOS", "NO HORARIO", "ATRASOU", "CANCELADO"]
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var filterPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
        
    lazy var filterTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Escola uma opção para filtrar"
        textField.inputView = filterPickerView
        textField.textColor = .lightGray
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(type: VooTableViewCell.self)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.flights = viewModel.listaDeVoos()
        self.setupAddSubview()
        self.setupConstraints()
        self.setupNavigationBar()
    }
    
    func setupAddSubview() {
        self.view.addSubview(filterTextField)
        self.view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.filterTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 18),
            self.filterTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 9),
            self.filterTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -9),
            self.filterTextField.heightAnchor.constraint(equalToConstant: 32),
                   
            self.tableView.topAnchor.constraint(equalTo: self.filterTextField.bottomAnchor, constant: 10),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func setupNavigationBar() {
        self.view.backgroundColor = .systemBlue
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        title = "Lista de Voos"
    }
}

extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filterOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filterOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedFilter = filterOptions[row]
        filterTextField.text = selectedFilter
        
        flights = viewModel.filterFlights(by: selectedFilter)
        filterTextField.resignFirstResponder()
    tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: VooTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.voo = flights[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = flights[indexPath.row]
        let detalheVC = DetalhesVooViewController(voo: item)
        navigationController?.pushViewController(detalheVC, animated: true)
    }
}
