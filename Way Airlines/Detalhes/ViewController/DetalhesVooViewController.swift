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
               backgroundImageImageView,
               completeInformationLabel,
               flightIdLabel,
               statusLabel,
               completion_statusLabel,
               departure_timeLabel,
               arrival_timeLabel,
               departureLabel,
               arrivalLabel,
               dateLabel,
               airplaneLabel
           ])
           stackView.translatesAutoresizingMaskIntoConstraints = false
           stackView.axis = .vertical
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
        self.view.backgroundColor = .systemGray5
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white]
        self.title = voo.flight_id
       
    }
    
    func setupSubview(){
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(stackView)
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(stackView)

        self.stackView.addSubview(airportImageImageView)
        self.stackView.addSubview(backgroundImageImageView)
        
//        self.backgroundImageImageView.addSubview(self.completeInformationLabel)
//        self.backgroundImageImageView.addSubview(self.flightIdLabel)
//        self.backgroundImageImageView.addSubview(self.statusLabel)
//        self.backgroundImageImageView.addSubview(self.completion_statusLabel)
//        self.backgroundImageImageView.addSubview(self.departure_timeLabel)
//        self.backgroundImageImageView.addSubview(self.arrival_timeLabel)
//        self.backgroundImageImageView.addSubview(self.departureLabel)
//        self.backgroundImageImageView.addSubview(self.arrivalLabel)
//        self.backgroundImageImageView.addSubview(self.dateLabel)
//        self.backgroundImageImageView.addSubview(self.airplaneLabel)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
//            self.scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            self.scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            self.scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            self.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//            self.stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            self.stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            self.stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
//
//            self.airportImageImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//            self.airportImageImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 18),
//            self.airportImageImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -18),
//            self.airportImageImageView.heightAnchor.constraint(equalToConstant: 250),
//
//            self.backgroundImageImageView.topAnchor.constraint(equalTo: self.airportImageImageView.bottomAnchor, constant: 16),
//            self.backgroundImageImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            self.backgroundImageImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            self.backgroundImageImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//
//
//            self.completeInformationLabel.topAnchor.constraint(equalTo: self.backgroundImageImageView.topAnchor, constant: 18),
//            self.completeInformationLabel.leadingAnchor.constraint(equalTo: self.backgroundImageImageView.leadingAnchor, constant: 18),
//
//            self.flightIdLabel.topAnchor.constraint(equalTo: self.completeInformationLabel.bottomAnchor, constant: 18),
//            self.flightIdLabel.leadingAnchor.constraint(equalTo: backgroundImageImageView.leadingAnchor, constant: 18),
//
//            self.statusLabel.topAnchor.constraint(equalTo: self.flightIdLabel.bottomAnchor, constant: 8),
//            self.statusLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
//
//            self.completion_statusLabel.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 8),
//            self.completion_statusLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
//
//            self.departure_timeLabel.topAnchor.constraint(equalTo: self.completion_statusLabel.bottomAnchor, constant: 8),
//            self.departure_timeLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
//
//            self.arrival_timeLabel.topAnchor.constraint(equalTo: self.departure_timeLabel.bottomAnchor, constant: 8),
//            self.arrival_timeLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
//
//            self.departureLabel.topAnchor.constraint(equalTo: self.arrival_timeLabel.bottomAnchor, constant: 8),
//            self.departureLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
//            self.departureLabel.trailingAnchor.constraint(equalTo: backgroundImageImageView.trailingAnchor, constant: -18),
//
//            self.arrivalLabel.topAnchor.constraint(equalTo: self.departureLabel.bottomAnchor, constant: 8),
//            self.arrivalLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
//            self.arrivalLabel.trailingAnchor.constraint(equalTo: backgroundImageImageView.trailingAnchor, constant: -18),
//
//            self.dateLabel.topAnchor.constraint(equalTo: self.arrivalLabel.bottomAnchor, constant: 8),
//            self.dateLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
//
//            self.airplaneLabel.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 8),
//            self.airplaneLabel.leadingAnchor.constraint(equalTo: completeInformationLabel.leadingAnchor),
            
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
