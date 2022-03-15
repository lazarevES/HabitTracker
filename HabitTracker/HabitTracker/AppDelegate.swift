//
//  AppDelegate.swift
//  HabitTracker
//
//  Created by Егор Лазарев on 02.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .white
        
        
        let habitsViewController = HabitsViewController()
        habitsViewController.view.backgroundColor = UIColor.white
        let habitsNavigationController = UINavigationController(rootViewController: habitsViewController)
        
        let infoViewController = InfoViewController()
        infoViewController.view.backgroundColor = .white
        let infoNavigationController = UINavigationController(rootViewController: infoViewController)

        let appearanceTabBar = tabBarController.tabBar.standardAppearance
        appearanceTabBar.stackedLayoutAppearance.selected.titleTextAttributes = [ .foregroundColor: Const.purpurColor]
        appearanceTabBar.stackedLayoutAppearance.selected.iconColor = Const.purpurColor
        tabBarController.tabBar.standardAppearance = appearanceTabBar
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        
        habitsNavigationController.tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(named: "habits_tab_icon"), selectedImage: UIImage(named: "habits_tab_icon"))
        habitsNavigationController.navigationBar.titleTextAttributes = [ .foregroundColor: UIColor.black]
        habitsNavigationController.navigationBar.barTintColor = UIColor.white
        habitsNavigationController.navigationBar.standardAppearance = appearance;
        habitsNavigationController.navigationBar.scrollEdgeAppearance = habitsNavigationController.navigationBar.standardAppearance
        
        infoNavigationController.tabBarItem = UITabBarItem(title: "Информация", image: UIImage(systemName: "info.circle.fill"), selectedImage: UIImage(systemName: "info.circle.fill"))
        infoNavigationController.navigationBar.titleTextAttributes = [ .foregroundColor: UIColor.black]
        infoNavigationController.navigationBar.barTintColor = UIColor.white
        infoNavigationController.navigationBar.standardAppearance = appearance;
        infoNavigationController.navigationBar.scrollEdgeAppearance = infoNavigationController.navigationBar.standardAppearance
       
        tabBarController.viewControllers = [habitsNavigationController, infoNavigationController]
 
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
}

