//
//  SceneDelegate.swift
//  Way Airlines
//
//  Created by Gabriel Fontenele da Silva on 06/10/24.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarController()
        self.navigationItem.setHidesBackButton(true, animated: true)

        // Do any additional setup after loading the view.
    }
    
    private func setupTabBarController(){
        
        let symbolConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        
        let homeViewModel = HomeViewModel()
        let home = UINavigationController(rootViewController: HomeViewController(viewModel: homeViewModel))
        let homeSymbol = UIImage(systemName: "airplane", withConfiguration: symbolConfiguration)
        home.tabBarItem.image = homeSymbol
        home.tabBarItem.title = "Voos"
                
        let menu = UINavigationController(rootViewController: AeroportosViewController(viewModel: homeViewModel))
        let menuSymbol = UIImage(systemName: "text.justify", withConfiguration: symbolConfiguration)
        menu.tabBarItem.image = menuSymbol
        menu.tabBarItem.title = "Menu"
        
        self.setViewControllers([home, menu], animated: true)
        self.tabBar.isTranslucent = false
        self.tabBar.backgroundColor = .white
    }
}

