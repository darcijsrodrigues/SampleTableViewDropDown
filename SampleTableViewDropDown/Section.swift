//
//  Section.swift
//  SampleTableViewDropDown
//
//  Created by Darci Junio Soares Rodrigues on 05/04/2018.
//  Copyright © 2018 Darci Junio Soares Rodrigues. All rights reserved.
//

import Foundation

class Section {
    var typeBenefit: String!
    var listBenefits: [String]!
    var expanded: Bool!
    
    init(typeBenefit: String, listBenefits: [String], expanded: Bool){
        self.typeBenefit = typeBenefit
        self.listBenefits = listBenefits
        self.expanded = expanded 
    }
}
