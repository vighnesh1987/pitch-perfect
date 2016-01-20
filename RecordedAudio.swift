//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Vighnesh Rege on 1/19/16.
//  Copyright © 2016 Vighnesh Rege. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathUrl: NSURL!
    var title: String!
    
    init(url: NSURL!, title: String?=nil) {
        self.filePathUrl = url
        if (title != nil) {
            self.title = title!
        } else {
            self.title = self.filePathUrl.lastPathComponent
        }
        print(self.filePathUrl, self.title)
    }
}
