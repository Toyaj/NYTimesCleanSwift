//
//  ViewController.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import UIKit

protocol HomeVCDisplayable: AnyObject {
    func displayArticles(articles: [ArcticleDetails])
    func hideProgressHud()
    func showAlert()
}

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var ib_tblView: UITableView!
    
    var interactor: HomeVCInteractable?
    var router: HomeViewControllerRoutable?
    
    let viewModel: HomeViewModel = HomeViewModel()
    let progressHUD = ProgressHud(text: Constant.ProgressHud.text.rawValue)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
        interactor?.getArticles()
    }
    
}

extension HomeViewController: HomeVCDisplayable {
    
    // MARK: - showAlert
    func showAlert() {
        DispatchQueue.main.async {
            self.alert(message: Constant.Alert.apiFailMessage.rawValue,
                       title: Constant.Alert.alert.rawValue)
        }
    }
    
    // MARK: - HideProgressHud
    func hideProgressHud() {
        DispatchQueue.main.async {
            self.progressHUD.hide()
        }
    }
    
    // MARK: - DisplayArticles
    func displayArticles(articles: [ArcticleDetails]) {
        viewModel.model = articles
        DispatchQueue.main.async {
            self.ib_tblView.reloadData()
        }
    }
    
}

private extension HomeViewController {
    
    func initialSetup() {
        
        HomeVCConfigurator().configure(withController: self)
        
    }
    
    func setUP() {
        
        self.title = Constant.ViewControllerTitle.homeTitle.rawValue
        ib_tblView.register(UINib(nibName: Constant.TableViewCellIdentifier.article.rawValue, bundle: nil),
                            forCellReuseIdentifier: Constant.TableViewCellIdentifier.article.rawValue)
        ib_tblView.tableFooterView = UIView()
        self.view.addSubview(progressHUD)
    }
}
