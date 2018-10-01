//
//  TagListViewTests.swift
//  TagListViewTests
//
//  Created by xuwenquan on 2018/10/1.
//  Copyright © 2018年 Ela. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import UIKit
import TagListView

class MySpec: QuickSpec {
    override func spec() {
        describe("underline color") {
            it("has valid snapshot") {
                let recording = false
                
                let segmentListView = SegmentListView.init(frame:CGRect.init(x: 0, y: 0, width: 150, height: 50))
                segmentListView.addTags(["one","two","three"])
                segmentListView.selectedIndex = 1
                
                if recording == true {
                    expect(segmentListView).to( recordSnapshot(named:"underline_blue")  )
                }
                else {
                    expect(segmentListView).to( haveValidSnapshot(named:"underline_blue") )
                }
                
                segmentListView.underlineColor = UIColor.yellow
                if recording == true {
                   expect(segmentListView).to( recordSnapshot(named:"underline_yellow")  )
                }
                else{
                    expect(segmentListView).to( haveValidSnapshot(named:"underline_yellow") )
                }
                
                segmentListView.selectedIndex = 0
                if recording == true {
                    expect(segmentListView).to( recordSnapshot(named:"underline_0")  )
                }
                else{
                    expect(segmentListView).to( haveValidSnapshot(named:"underline_0") )
                }
                
                segmentListView.clear()
                segmentListView.addTags(["five","six","seven"])
                segmentListView.selectedIndex = 0
                if recording == true {
                    expect(segmentListView).to( recordSnapshot(named:"underline_change_tags")  )
                }
                else{
                    expect(segmentListView).to( haveValidSnapshot(named:"underline_change_tags") )
                }
                
            }
        }
    }
}
