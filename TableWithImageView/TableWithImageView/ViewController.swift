//
//  ViewController.swift
//  TableWithImageView
//
//  Created by Vinay Kumar Thapa on 2022-12-01.
//

import UIKit

class ViewController: UIViewController {

    var courses:[String] = []
    var coursesColor:[UIColor] = []
    var coursesImage = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6"), UIImage(named: "1"), UIImage(named: "2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        courses = ["Technical Communication", "Mathematics", "Project Management", "MATLAB", "Image Processing", "Machine Learning", "Computer Networks", "AESS"]
        coursesColor = [ .blue , .cyan, .black , .gray , .green, .brown , .magenta , .orange ]

    }


}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomCell
        
        let Images = coursesImage[indexPath .row]
        cell.imageView1.image = Images
        cell.imageLabel.text = courses[indexPath.row]
        return cell
    }
    
}

