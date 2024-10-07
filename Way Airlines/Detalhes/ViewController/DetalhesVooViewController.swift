//
//  DetalhesVooViewController.swift
//  Way Airlines
//
//  Created by Gabriel Fontenele da Silva on 06/10/24.
//

import UIKit

class DetalhesVooViewController: UIViewController {
    
    var voo: Flight
    
    init(voo: Flight) {
        self.voo = voo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
    
    lazy var stackView: UIStackView = {
           let stackView = UIStackView(arrangedSubviews: [
               airportImageImageView,
               backgroundImageImageView
           ])
           stackView.translatesAutoresizingMaskIntoConstraints = false
           stackView.axis = .vertical
        stackView.alignment = .center
           stackView.spacing = 16
           return stackView
       }()
    
    lazy var airportImageImageView: UIImageView = {
       let imageView = UIImageView()
       imageView.translatesAutoresizingMaskIntoConstraints = false
       imageView.image = UIImage(named: "airport02")
       imageView.setCornerRadius(cornesRadius: 30, typeCorners:[.superiorEsquerdo, .inferiorDireito, .superiorDireito, .inferiorEsquerdo])
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
       return imageView
   }()
    
    lazy var backgroundImageImageView: UIImageView = {
       let imageView = UIImageView()
       imageView.translatesAutoresizingMaskIntoConstraints = false
       imageView.backgroundColor = .white
       imageView.setCornerRadius(cornesRadius: 30, typeCorners:[.superiorEsquerdo, .superiorDireito])
       imageView.setCardShadow()
       imageView.contentMode = .scaleAspectFit
       imageView.heightAnchor.constraint(equalToConstant: 500).isActive = true
       return imageView
   }()
    
    lazy var completeInformationLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .bold)
            label.textColor = .lightGray
            label.text = "Informações completas voo \(voo.flight_id)"
            return label
        }()
    
    lazy var flightIdLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .medium)
            label.textColor = .lightGray
            return label
        }()
    
    lazy var statusLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .medium)
            label.textColor = .lightGray
            return label
        }()
    
    lazy var completion_statusLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .medium)
            label.textColor = .lightGray
            return label
        }()
    
    lazy var departure_timeLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .medium)
            label.textColor = .lightGray
            return label
        }()
    
    lazy var arrival_timeLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .medium)
            label.textColor = .lightGray
            return label
        }()
    
    lazy var departureLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .medium)
            label.textColor = .lightGray
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            return label
        }()
    
    lazy var arrivalLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .medium)
            label.textColor = .lightGray
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            return label
        }()
    
    lazy var flightTimeLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .medium)
            label.textColor = .lightGray
            return label
        }()
    
    lazy var dateLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .medium)
            label.textColor = .lightGray
            return label
        }()
    
    lazy var airplaneLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 18, weight: .medium)
            label.textColor = .lightGray
            return label
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupSubview()
        self.setupConstraints()
        self.setInformation()

    }
    func setupNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = .systemBlue
        self.view.backgroundColor = .systemBlue
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white]
        self.title = voo.flight_id
    }
    
    func setupSubview() {
           view.addSubview(scrollView)
           scrollView.addSubview(contentView)
           contentView.addSubview(stackView)
           backgroundImageImageView.addSubview(completeInformationLabel)
           backgroundImageImageView.addSubview(flightIdLabel)
           backgroundImageImageView.addSubview(statusLabel)
           backgroundImageImageView.addSubview(completion_statusLabel)
           backgroundImageImageView.addSubview(departure_timeLabel)
           backgroundImageImageView.addSubview(arrival_timeLabel)
           backgroundImageImageView.addSubview(departureLabel)
           backgroundImageImageView.addSubview(arrivalLabel)
           backgroundImageImageView.addSubview(dateLabel)
           backgroundImageImageView.addSubview(airplaneLabel)
       }
    
    func setupConstraints() {
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                
                stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
                stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
                
                airportImageImageView.heightAnchor.constraint(equalToConstant: 250),
                
                backgroundImageImageView.topAnchor.constraint(equalTo: airportImageImageView.bottomAnchor, constant: 16),
                backgroundImageImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundImageImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                backgroundImageImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                completeInformationLabel.topAnchor.constraint(equalTo: backgroundImageImageView.topAnchor, constant: 18),
                completeInformationLabel.leadingAnchor.constraint(equalTo: backgroundImageImageView.leadingAnchor, constant: 18),
                
                flightIdLabel.topAnchor.constraint(equalTo: completeInformationLabel.bottomAnchor, constant: 18),
                flightIdLabel.leadingAnchor.constraint(equalTo: backgroundImageImageView.leadingAnchor, constant: 18),
                
                statusLabel.topAnchor.constraint(equalTo: flightIdLabel.bottomAnchor, constant: 8),
                statusLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
                
                completion_statusLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 8),
                completion_statusLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
                
                departure_timeLabel.topAnchor.constraint(equalTo: completion_statusLabel.bottomAnchor, constant: 8),
                departure_timeLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
                
                arrival_timeLabel.topAnchor.constraint(equalTo: departure_timeLabel.bottomAnchor, constant: 8),
                arrival_timeLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
                
                departureLabel.topAnchor.constraint(equalTo: arrival_timeLabel.bottomAnchor, constant: 8),
                departureLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
                departureLabel.trailingAnchor.constraint(equalTo: backgroundImageImageView.trailingAnchor, constant: -18),
                
                arrivalLabel.topAnchor.constraint(equalTo: departureLabel.bottomAnchor, constant: 8),
                arrivalLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
                arrivalLabel.trailingAnchor.constraint(equalTo: backgroundImageImageView.trailingAnchor, constant: -18),
                
                dateLabel.topAnchor.constraint(equalTo: arrivalLabel.bottomAnchor, constant: 8),
                dateLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
                
                airplaneLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
                airplaneLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor)
            ])
        }
    
    func setInformation(){
        self.flightIdLabel.text = "ID voo: \(voo.flight_id)"
        self.statusLabel.text = "Status: \(voo.status)"
        self.completion_statusLabel.text = "Situação: \(voo.completion_status)"
        self.departure_timeLabel.text = "Partida: \(voo.departure_time)"
        self.arrival_timeLabel.text = "Chegada: \(voo.arrival_time)"
        self.departureLabel.text = "Partida: \(voo.departure_airport)"
        self.arrivalLabel.text = "Chegada: \(voo.arrival_airport)"
        self.dateLabel.text = "Data do voo: \(voo.start_date)"
        self.airplaneLabel.text = "Avião: \(voo.airplane_name)"
    }
}
