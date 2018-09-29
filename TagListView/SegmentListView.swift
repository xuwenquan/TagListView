//
//  SegmentListView.swift
//  TagListViewDemo
//
//  Created by xuwenquan on 2018/9/17.
//  Copyright © 2018年 Guangzhou QiaoBangZhu Network Technology Co., Ltd.. All rights reserved.
//

import Foundation
import UIKit

public typealias SegmentListViewSelectedIndexChangedCallback = ( ( _ oldIndex: Int , _ newIndex: Int ) -> Void )

@objc
@IBDesignable
open class SegmentListView: UIScrollView {
    
    private var taglistView : TagListView = TagListView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadSubviews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadSubviews()
    }
    
    private func loadSubviews() {
        self.clipsToBounds = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        taglistView.multiline = false
        taglistView.selectedIndexWillChanged = { [weak self] oldIndex,newIndex in
            if let this = self {
                this.selectedIndexWillChanged?(oldIndex,newIndex)
            }
            
        }
        taglistView.selectedIndexDidChanged = { [weak self] oldIndex,newIndex in
            if let this = self {
                let tagview = this.taglistView.tagViews[newIndex]
                let left = max( 0 , tagview.frame.origin.x - (this.bounds.size.width-tagview.bounds.size.width) / 2)
                let width = min( this.taglistView.intrinsicContentSize.width , left + this.bounds.size.width )
                let rect = CGRect.init(x: left , y: 0, width: width , height: this.bounds.height )
                this.scrollRectToVisible( rect, animated: true )                
                this.selectedIndexDidChanged?(oldIndex,newIndex)
            }
        }
        super.addSubview(taglistView)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        let offsetY = self.bounds.size.height / 2  - taglistView.intrinsicContentSize.height / 2
        if taglistView.intrinsicContentSize.width  <=  self.bounds.size.width { // center if fit
            let offsetX = ( self.bounds.size.width - taglistView.intrinsicContentSize.width  ) / 2
            taglistView.frame = CGRect.init(origin: CGPoint.init(x: offsetX, y: offsetY) , size: taglistView.intrinsicContentSize)
            self.contentSize = taglistView.bounds.size
        }
        else{ // float left if not fit
            let offsetX : CGFloat = 0
            taglistView.frame = CGRect.init(origin: CGPoint.init(x: offsetX, y: offsetY) , size: taglistView.intrinsicContentSize)
            self.contentSize = taglistView.bounds.size
            self.contentInset = UIEdgeInsets.init(top: 0, left: 8, bottom: 0, right: 8)
        }
    }
    
    
    // MARK: - Interface Builder
    open override func prepareForInterfaceBuilder() {
        taglistView.addTag("Welcome")
        taglistView.addTag("to")
        taglistView.addTag("SegmentListView").isSelected = true
        taglistView.addTag("more")
    }
    
    @objc open func clear(){
        taglistView.removeAllTags();
    }
    
    @objc open var selectedIndex : Int {
        get {
            return taglistView.selectedIndex
        }
        set (newVal) {
            taglistView.selectedIndex = newVal
        }
    }
    
    @objc open var selectedIndexWillChanged : SegmentListViewSelectedIndexChangedCallback?
    @objc open var selectedIndexDidChanged : SegmentListViewSelectedIndexChangedCallback?
    
    @objc
    open func addTags(_ titles: [String]){
        taglistView.addTags(titles)
    }
    
    @IBInspectable open dynamic var textFontSize: CGFloat = 15  {
        didSet {
            taglistView.textFontSize = textFontSize
        }
    }
    
    @IBInspectable open dynamic var textColor: UIColor = UIColor.white {
        didSet {
            taglistView.textColor = textColor
        }
    }
    
    @IBInspectable open dynamic var highlightedTextColor: UIColor = UIColor.white {
        didSet {
            taglistView.highlightedTextColor = highlightedTextColor
        }
    }
    
    @IBInspectable open dynamic var selectedTextColor: UIColor = UIColor.white {
        didSet {
            taglistView.selectedTextColor = selectedTextColor
        }
    }
    
    @IBInspectable open dynamic var tagBackgroundColor: UIColor = UIColor.gray {
        didSet {
            taglistView.tagBackgroundColor = tagBackgroundColor
        }
    }
    
    @IBInspectable open dynamic var tagHighlightedBackgroundColor: UIColor? {
        didSet {
            taglistView.tagHighlightedBackgroundColor = tagHighlightedBackgroundColor
        }
    }
    
    @IBInspectable open dynamic var tagSelectedBackgroundColor: UIColor? {
        didSet {
            taglistView.tagSelectedBackgroundColor = tagSelectedBackgroundColor
        }
    }
    
    @IBInspectable open dynamic var paddingY: CGFloat = 2 {
        didSet {
            taglistView.paddingY = paddingY
        }
    }
    @IBInspectable open dynamic var paddingX: CGFloat = 5 {
        didSet {
            taglistView.paddingX = paddingX
        }
    }
    @IBInspectable open dynamic var marginY: CGFloat = 2 {
        didSet {
            taglistView.marginY = marginY
        }
    }
    @IBInspectable open dynamic var marginX: CGFloat = 5 {
        didSet {
            taglistView.marginX = marginX
        }
    }
    
    @IBInspectable open dynamic var cornerRadius: CGFloat = 0 {
        didSet {
            taglistView.cornerRadius = cornerRadius
        }
    }
    
}
