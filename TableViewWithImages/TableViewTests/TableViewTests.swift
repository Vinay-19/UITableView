//
//  TableViewTests.swift
//  TableViewTests
//
//  Created by Vinay Kumar Thapa on 2022-12-13.
//

import XCTest
@testable import TableViewWithImages

final class TableViewTests: XCTestCase {
    
    var vc: EmployeeListVC!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
         vc = storyboard.instantiateViewController(withIdentifier: "EmployeeListVC") as! EmployeeListVC
        _ = vc.view
        
    }
    
    func testInitMyTableView(){
        XCTAssertNotNil(vc.tableView)
    }

    func testTableViewDataSource(){
        XCTAssertTrue(vc.tableView.dataSource is EmployeeListVC)
    }
    
    func testTableViewDelegate(){
        XCTAssertTrue(vc.tableView.delegate is EmployeeListVC)
    }
    
}
