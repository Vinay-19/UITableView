//
//  EmpList.swift
//  TableViewWithImages
//
//  Created by Vinay Kumar Thapa on 2022-12-02.
//

import Foundation


struct EmployeeList: Codable {
    
    let employees: [EmployeesDetail]
}

struct EmployeesDetail: Codable {
    
    let full_name: String
    let phone_number: String
    let email_address: String
    let photo_url_small: String
    
}
