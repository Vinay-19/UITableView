//
//  EmployeeListVM.swift
//  TableViewWithImages
//
//  Created by Vinay Kumar Thapa on 2022-12-02.
//

import Foundation


class EmployeeListVM {
    
    static let endpoint = "https://run.mocky.io/v3/000c0dda-bbaf-4d52-9e1a-58d3a11e912b"
    
//    static let delayEndpoint = "https://run.mocky.io/v3/000c0dda-bbaf-4d52-9e1a-58d3a11e912b?mocky-delay=4000ms"
    
    var empUserResponse = [EmployeesDetail]() {
        didSet {
            self.reloadUI()
        }
    }
    
    var reloadUI: () -> Void = {}
    
    func getEmployeeData() {
        
        guard let url = URL(string: EmployeeListVM.endpoint) else {
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [self] data, _, error in
            guard let safeData = data else{
                return
            }
            do {
                let decoder = JSONDecoder()
                let empList = try decoder.decode(EmployeeList.self, from: safeData)
                self.empUserResponse = empList.employees
            }catch{
                print(error)
            }
        }
        dataTask.resume()
        
    }
    
}
