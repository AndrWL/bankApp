//
//  CardBannerView.swift
//  BankApp
//
//  Created by Andrey on 07.08.2021.
//

import UIKit


final class  CardBanner: UIView, UIScrollViewDelegate {
    
    private let scrollView: UIScrollView = {
        let sc = UIScrollView()
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.isPagingEnabled = true
        return sc
    }()
    
    
    private var itemIndex: ((_ bannerView: CardBanner, _ index: Int) -> (UIView))!
    private var numberOfItems: Int = 0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        scrollView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        scrollView.delegate = self
        self.addSubview(scrollView)
        scrollView.showsHorizontalScrollIndicator = false
        
        
    }
    func reloadData(numberOfItems:Int , itemIndex:@escaping ((_ bannerView: CardBanner , _ index:Int)->(UIView)) ) {
          self.itemIndex = itemIndex
          self.numberOfItems = numberOfItems
         reloadScrollView()
      }
    
    private func reloadScrollView() {
        guard self.numberOfItems > 0 else { return }
        if self.numberOfItems == 1 {
            let firstItem:UIView = self.itemIndex(self , 0)
            addViewToIndex(view: firstItem, index: 0)
            scrollView.isScrollEnabled = false
            return
        }
        let firstItem:UIView = self.itemIndex(self , 0)
        addViewToIndex(view: firstItem, index: numberOfItems+1)
        
        let lastItem:UIView = self.itemIndex(self , numberOfItems - 1)
        addViewToIndex(view: lastItem, index: 0)
        for index in 0..<self.numberOfItems {
            let item:UIView = self.itemIndex(self , index)
            addViewToIndex(view: item, index: index+1)
        }
        scrollView.contentSize = CGSize(width: CGFloat(numberOfItems+2)*scrollView.frame.size.width, height: scrollView.frame.size.height)
        scrollView.contentOffset = CGPoint(x: self.scrollView.frame.size.width, y: self.scrollView.contentOffset.y)
    }
    
    private func addViewToIndex(view:UIView, index:Int) {
        view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(view)
        view.frame = CGRect(x: CGFloat(index)*scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage: Int = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        
        if currentPage == 0 {
            self.scrollView.contentOffset = CGPoint(x: scrollView.frame.size.width * CGFloat(numberOfItems), y: scrollView.contentOffset.y)
        } else if currentPage == numberOfItems {
            self.scrollView.contentOffset = CGPoint(x: 0, y: scrollView.contentOffset.y)
        }
    }
}









