//
//  ViewController.swift
//  SampleTableViewDropDown
//
//  Created by Darci Junio Soares Rodrigues on 05/04/2018.
//  Copyright © 2018 Darci Junio Soares Rodrigues. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var sections = [
        Section(typeBenefit: "LAZER", listBenefits: ["Convênio com o clube Celp (localizado em BH/MG)","Sesc: parceria com desconto"], expanded: false),
        Section(typeBenefit: "SAÚDE", listBenefits: ["Convênio com o clube Celp (localizado em BH/MG)","Sesc: parceria com desconto"], expanded: false),
        Section(typeBenefit: "PROFISSIONAL", listBenefits: ["Convênio com o clube Celp (localizado em BH/MG)","Sesc: parceria com desconto"], expanded: false),
        Section(typeBenefit: "GERAL", listBenefits: ["Convênio com o clube Celp (localizado em BH/MG)","Sesc: parceria com desconto"], expanded: false),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableview: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].listBenefits.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if ( sections[indexPath.section].expanded){
            return 44
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHeaderView()
        header.customInit(title: sections[section].typeBenefit, section: section, delegate: self)
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        cell.textLabel?.text = sections[indexPath.section].listBenefits[indexPath.row]
        return cell
    }
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        tableView.beginUpdates()
        for i in 0 ..< sections[section].listBenefits.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }

}
















