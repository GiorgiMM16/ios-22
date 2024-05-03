//
//  HomePageVC.swift
//  tbc-IsDavaleba-RomelicDzalianMovindome
//
//  Created by Giorgi Michitashvili on 5/3/24.
//

import UIKit
import NetworkNetwork


let networkService = NetworkService()





class HomePageVC: UIViewController {
    
    let urlString = "https://catfact.ninja/facts"
    var catFacts: [Fact] = []
    var tableView1 = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        super.viewDidLoad()
        configureTableView()
        fetchData()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView1.frame.width, height: 100))
        let label = UILabel(frame: CGRect(x: 16, y: 0, width: tableView1.frame.width - 32, height: 100))
        label.text = "Facts about Cats"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        headerView.addSubview(label)
        tableView1.tableHeaderView = headerView
    }



}

extension HomePageVC: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return catFacts.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.layer.cornerRadius = 10
        cell.backgroundColor = .systemGray5
        cell.teqsti.text = catFacts[indexPath.section].fact
        cell.teqsti.numberOfLines = catFacts[indexPath.section].length!
        
        
        return cell
    }
    
    func configureTableView() {
        view.addSubview(tableView1)
        tableView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView1.topAnchor.constraint(equalTo: view.topAnchor),
            tableView1.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 21),
            tableView1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -27)])
        tableView1.delegate = self
        tableView1.dataSource = self
        tableView1.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func fetchData() {
            networkService.getData(urlString: urlString) { [weak self] (result: Result<CatFact, Error>) in
                switch result {
                case .success(let facts):
                    self?.catFacts = facts.data
                    DispatchQueue.main.async {
                        self?.tableView1.reloadData()
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    
    
}

