//
//  AlbumModel.swift
//  Assignment3b
//
//  Created by Jacob Rozell on 7/24/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit

struct AlbumModel: Codable {
    let name: String
    let year: String
    let artist: String
    let recordLabel: String
    let tracks: [String]
    
    init(artist: String, name: String, year: String, recordLabel: String, tracks: [String]) {
        self.artist = artist
        self.name = name
        self.year = year
        self.recordLabel = recordLabel
        self.tracks = tracks
    }
}
