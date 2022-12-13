//
//  ViewController.swift
//  TableViewWithImages
//
//  Created by Vinay Kumar Thapa on 2022-12-02.
//

import UIKit
import SDWebImage

class EmployeeListVC: UIViewController {

    let empViewModel =  EmployeeListVM()
    let imageLoader = ImageLoader()
    
    @IBOutlet weak var tableView: UITableView!
    
    /* Activity indicator responsible to present the loading status while requesting data.*/
    let activityIndicator: UIActivityIndicatorView = {
        
        let activityIndicator    = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicator.color  = UIColor.darkGray
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(activityIndicator)
        self.setupTableView()
        displayActivityIndicator(true)
        empViewModel.getEmployeeData()
        
        
    }
    
    
    private func setupTableView() {
        empViewModel.reloadUI = {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
                self?.displayActivityIndicator(false)
                
            }
        }
    }

}


extension EmployeeListVC: UITableViewDelegate {
    
}

extension EmployeeListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return empViewModel.empUserResponse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableCell
        cell.empFullName.text = empViewModel.empUserResponse[indexPath.row].full_name
        cell.empPhoneNum.text = empViewModel.empUserResponse[indexPath.row].phone_number
        cell.empEmailId.text = empViewModel.empUserResponse[indexPath.row].email_address
        let imageUrl = empViewModel.empUserResponse[indexPath.row].photo_url_small
        cell.empImage.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "placeholder"))

        return cell
            
    }
    
}

extension EmployeeListVC {
    /* Show/hide activity indicator. */
    func displayActivityIndicator(_ display: Bool) {
        if display {
            activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}
