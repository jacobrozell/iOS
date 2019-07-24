//
//  ViewController.swift
//  Assignment3b
//
//  Created by Jacob Rozell on 7/24/19.
//  Copyright © 2019 Jacob Rozell. All rights reserved.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    
    let tableView: AlbumTableView = AlbumTableView(frame: .zero, style: .plain)

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
    
    override func viewWillDisappear(_ animated: Bool) {
        tableView.saveToDefaults()
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
            self.tableView.albums.append(item)
            self.tableView.saveToDefaults()
            self.tableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "CANCEL", style: .destructive, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func goToDetailView(album: AlbumModel) {
        self.dismiss(animated: true) {
            self.navigationController?.pushViewController(DetailView(album: album), animated: true)
        }
    }
}

