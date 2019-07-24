//
//  DetailView.swift
//  Assignment3b
//
//  Created by Jacob Rozell on 7/24/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit
import SnapKit

class DetailView: UIViewController {
    
    let tracksTableView = TrackTableView()
    var indexPath: Int = 0
    var albums: [AlbumModel] = [AlbumModel]()
    let card = UIView()
    let aristLabel = UITextField()
    let yearLabel = UITextField()
    let recordLabel = UITextField()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(albums: [AlbumModel], indexPathRow: Int) {
        self.init()
        
        let album = albums[indexPathRow]
        self.albums = albums
        self.indexPath = indexPathRow
        
        title = "\(album.name)"
        tracksTableView.setup(tracks: album.tracks)
        
        card.backgroundColor = .white
        
        aristLabel.text = "\(album.artist)"
        aristLabel.borderStyle = .roundedRect
        yearLabel.text = "\(album.year)"
        yearLabel.borderStyle = .roundedRect
        recordLabel.text = "\(album.recordLabel)"
        recordLabel.borderStyle = .roundedRect
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        view.addSubview(tracksTableView)
        view.addSubview(card)
        card.addSubview(yearLabel)
        card.addSubview(aristLabel)
        card.addSubview(recordLabel)
        
        card.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(62)
            make.left.right.equalToSuperview()
            make.height.equalTo(80)
        }
        
        yearLabel.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview()
            make.width.equalTo(75)
            make.height.equalTo(30)
        }
        
        aristLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        recordLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalTo(aristLabel.snp.bottom)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        tracksTableView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(card.snp.bottom)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let artist = aristLabel.text, let year = yearLabel.text, let record = recordLabel.text else { return }
        
        albums[indexPath] = AlbumModel(artist: artist, name: albums[indexPath].name, year: year, recordLabel: record, tracks: albums[indexPath].tracks)
        saveToDefaults()
    }
    
    func saveToDefaults() {
        let jsonEncoder = JSONEncoder()
        let jsonData = (try? jsonEncoder.encode(self.albums)) ?? Data()
        let json = String(data: jsonData, encoding: String.Encoding.utf8)
        UserDefaults.standard.set(json, forKey: "album")
    }
}

class TrackTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var tracks: [String] = [String]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(tracks: [String]) {
        self.tracks = tracks
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "track")
        cell.textLabel?.textAlignment = .left
        cell.textLabel?.text = "\(indexPath.row). \(tracks[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.deselectRow(at: indexPath, animated: true)
    }
}

