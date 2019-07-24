//
//  AlbumTableView.swift
//  Assignment3b
//
//  Created by Jacob Rozell on 7/24/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit
import SnapKit


class AlbumCell: UITableViewCell {
    
    static let reuse = "AlbumCell"
    let card = UIView()
    let aristLabel = UILabel()
    let nameLabel = UILabel()
    let yearLabel = UILabel()
    let recordLabel = UILabel()
    let trackLabel = UILabel()
    var tracks: [String] = [String]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "AlbumCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(artist: String, name: String, year: String, recordLabel: String, tracks: [String]) {
        self.aristLabel.text = artist
        self.nameLabel.text = name
        self.nameLabel.numberOfLines = 2
        self.yearLabel.text = year
        self.recordLabel.text = recordLabel
        self.tracks = tracks
        self.trackLabel.text = "Tracks: \(tracks.count)"
        
        card.layer.cornerRadius = 8.0
        card.layer.borderColor = UIColor.gray.cgColor
        card.layer.borderWidth = 1.0
        card.layer.masksToBounds = true
        
        self.setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(card)
        card.addSubview(nameLabel)
        card.addSubview(yearLabel)
        card.addSubview(recordLabel)
        card.addSubview(trackLabel)
        card.addSubview(aristLabel)
        
        card.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(4)
            make.bottom.right.equalToSuperview().offset(-4)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(4)
            make.left.equalToSuperview().offset(4)
            make.right.equalTo(yearLabel.snp.left).offset(-4)
        }
        
        yearLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview().offset(-4)
            make.left.equalTo(nameLabel.snp.right)
        }
        
        aristLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(4)
            make.bottom.equalTo(recordLabel.snp.top).offset(-4)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        recordLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(4)
            make.right.equalTo(trackLabel.snp.left)
            make.height.equalTo(40)
        }
        
        trackLabel.snp.makeConstraints { (make) in
            make.bottom.right.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
    }
}

class AlbumTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    var albums = [AlbumModel(artist: "Drake", name: "Take Care", year: "2011", recordLabel: "Young Money", tracks: ["Over My Dead Body", "Shot for Me", "Headlines", "Crew Love", "Take Care", "Marvins Room", "Buried Alive Interlude", "Under Ground Kings", "We'll Be Fine", "Make Me Proud", "Lord Knows", "Cameras / Good Ones Go Interlude", "Doing It Wrong", "The Real Her", "Look What You've Done", "HYFR", "Practice", "The Ride"]),
                  AlbumModel(artist: "Skrillex", name: "Bangarang (EP)", year: "2011", recordLabel: "OWSLA", tracks: ["Right In", "Bangarang", "Breakin' a Sweat", "The Devil's Den", "Right on Time", "Kyoto", "Summit"]),
                  AlbumModel(artist: "Mac Miller", name: "Swimming", year: "2018", recordLabel: "REMember Music", tracks: ["Come Back to Earth", "Hurt Feelings", "What's the Use?", "Perfecto", "Self Care", "Wings", "Ladders", "Small Worlds", "Conversation Pt.1", "Dunno", "Jet Fuel", "2009", "So It Goes"]),
                  AlbumModel(artist: "Mac Miller", name: "Watching Movies with the Sound Off", year: "2013", recordLabel: "Rostrum", tracks: ["The Star Room", "Avian", "I'm Not Real", "S.D.S.", "Bird Call", "Matches", "I Am Who Am (Killin' Time)", "Objects in the Mirror", "Red Dot Music", "Gees", "Watching Movies", "Suplexes Inside of Conplexs and Duplexes", "REMember", "Someone Like You", "Aquarium", "Youforia"]),
                  AlbumModel(artist: "A Day to Remember", name: "And Their Name Was Treason", year: "2005", recordLabel: "Indianola", tracks: ["Intro", "Heartless", "Your Way with Words Is Through Silence", "A Second Glance", "Casablanca Sucked Anyways", "You Should Have Killed Me When You Had the Chance", "If Looks Could Kill", "You Had Me at Hello", "1958", "Sound the Alarm"]),
                  AlbumModel(artist: "A Day to Remember", name: "Homesick", year: "2009", recordLabel: "Victory", tracks: ["The Downfall of Us All", "My Life for Hire", "I'm Made of Wax, Larry, What Are You Made Of?", "NJ Legion Iced Tea", "Mr. Highway's Thinking About the End", "Have Faith in Me", "Welcome to the Family", "Homesick", "Holdin' It Down for the Underground", "You Already Know What You Are", "Another Song About the Weekend", "If It Means a Lot to You"]),
                  AlbumModel(artist: "The Beatles", name: "Abbey Road", year: "1969", recordLabel: "Apple", tracks: ["Come Together", "Something", "Maxwell's Silver Hammer", "Oh! Darlign", "Octopus's Garden", "I Want You (She's So Heavy)", "Here Comes the Sun", "Because", "You Never Give Me Your Money", "Sun King", "Mean Mr. Mustard", "Polythene Pam", "She Came In Through the Bathroom Window", "Golden Slumbers", "Carry That Weight", "The End", "Her Majesty"]),
                  AlbumModel(artist: "The Lumineers", name: "The Lumineers", year: "2012", recordLabel: "Dualtone", tracks: ["Flowers in Your Hair", "Classy Girls", "Submarines", "Dead Sea", "Ho Hey", "Slow It Down", "Stubborn Love", "Big Parade", "Charlie Boy", "Flapper Girl", "Morning Song"]),
                  AlbumModel(artist: "The Lumineers", name: "Cleopatra", year: "2016", recordLabel: "Dualtone", tracks: ["Sleep on the Floor", "Ophelia", "Cleopatra", "Gun Song", "Angela", "In the Light", "Gale Song", "Long way from Home", "Sick in the Head", "My Eyes", "Patience"]),
                  AlbumModel(artist: "Mumford and Sons", name: "Wilder Mind", year: "2015", recordLabel: "Gentlemen of the Road", tracks: ["Tompkins Square Park", "Believe", "The Wolf", "Wilder Mind", "Just Smoke", "Monster", "Snake Eyes", "Broad-Shouldered Beasts", "Cold Arms", "Ditmas", "Only Love", "Hot Gates"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Albums"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        
        view.addSubview(tableView)
        setup()
    }
    
    func setup() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getFromDefaults()
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.saveToDefaults()
    }
    
    @objc func addItem() {
        let alert = UIAlertController(title: "Add Item", message: "Enter an album", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Album"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Artist"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Year"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Record Label"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            guard let album = alert!.textFields![0].text, let artist = alert!.textFields![1].text, let year = alert!.textFields![2].text, let record = alert!.textFields![3].text else { return }
            
            let item = AlbumModel(artist: artist, name: album, year: year, recordLabel: record, tracks: [])
            self.albums.append(item)
            self.saveToDefaults()
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "CANCEL", style: .destructive, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(AlbumCell.self, forCellReuseIdentifier: AlbumCell.reuse)
        
        getFromDefaults()
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func saveToDefaults() {
        let jsonEncoder = JSONEncoder()
        let jsonData = (try? jsonEncoder.encode(albums)) ?? Data()
        let json = String(data: jsonData, encoding: String.Encoding.utf8)
        UserDefaults.standard.set(json, forKey: "album")
    }
    
    func getFromDefaults() {
        let defaults = UserDefaults.standard
        if let stringAlbum = defaults.string(forKey: "album") {
            let jsonDecoder = JSONDecoder()
            if let data = stringAlbum.data(using: .utf8) {
                let albumArray = try? jsonDecoder.decode([AlbumModel].self, from: data)
                self.albums = albumArray!
                self.tableView.reloadData()
            }
        } else {
            saveToDefaults()
        }
    }
    
    // MARK - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: AlbumCell.reuse, for: indexPath) as! AlbumCell
        let index = albums[indexPath.row]
        cell.setup(artist: index.artist, name: index.name, year: index.year, recordLabel: index.recordLabel, tracks: index.tracks)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(DetailView(albums: albums, indexPathRow: indexPath.row), animated: false)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (UIContextualAction, UIView, (Bool) -> Void) in
            self.albums.remove(at: indexPath.row)
            self.saveToDefaults()
            self.tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}
