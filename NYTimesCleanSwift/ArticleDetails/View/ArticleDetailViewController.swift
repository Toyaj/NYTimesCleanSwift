//
//  ArticleDetailViewController.swift
//  NYTimesCleanSwift
//
//  Created by Toyaj Nigam on 11/09/21.
//

import UIKit

protocol ArticleDetailViewControllerDisplayable: AnyObject {
    func displayArticles()
}

final class ArticleDetailViewController: UIViewController {
    
    @IBOutlet weak var ib_ImageView: UIImageView!
    @IBOutlet weak var ib_TittleLabel: UILabel!
    @IBOutlet weak var ib_SectionSubSectionLabel: UILabel!
    @IBOutlet weak var ib_ArticleDescLabel: UILabel!
    @IBOutlet weak var ib_PublishDateLabel: UILabel!
    
    var interactor: ArticleDetailsVCInteractable?
    var router: ArticleDetailsVCRoutable?
    
    let mdlView: ArticleViewModel = ArticleViewModel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.showArticle()
        setTitle()
    }
    
}

extension ArticleDetailViewController: ArticleDetailViewControllerDisplayable {
    
    func displayArticles() {
        ib_TittleLabel.text = mdlView.title
        ib_SectionSubSectionLabel.text = "\(mdlView.sectionName), \(mdlView.subSectionName)"
        ib_PublishDateLabel.text = mdlView.publishDate
        ib_ArticleDescLabel.text = mdlView.description
        guard let imageURL = mdlView.imageURl else { return }
        setImage(url: imageURL)
    }
    
    func setImage(url: String) {
        
        ib_ImageView.sd_setImage(with: URL(string: url),
                                 placeholderImage: UIImage(named: Constant.ImagePlaceholder.image.rawValue),
                                 options: [], completed: nil)
        
    }
}

private extension ArticleDetailViewController {
    
    func initialSetup() {
        
        ArticleDetailsConfigurator().configure(withController: self)
    }
    
    func setTitle() {
        title = Constant.ViewControllerTitle.articleTitle.rawValue
    }
}

