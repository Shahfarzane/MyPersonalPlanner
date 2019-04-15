//
//  ActivitiesViewController.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-12.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: AppUIButton!
    
    @IBAction func addButtonPressed(_ sender: AppUIButton) {
        let alert = UIAlertController(title: "Select the option", message: nil, preferredStyle:.actionSheet)
        
        let addNewDay = UIAlertAction(title: "New Day", style: .default, handler: handleAddNewDay)
        
        
        let activityAction = UIAlertAction(title: "Activity", style: .default, handler: handleAddNewActivity)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(addNewDay)
        alert.addAction(activityAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.sourceView = sender
        alert.popoverPresentationController?.sourceRect = CGRect(x: 0, y: -4, width: sender.bounds.width, height: sender.bounds.height)
        present(alert,animated: true)

    }
    
    var tripId: UUID!
    var sectionHeaderHeight: CGFloat = 0.0
    var tripModel:TripModel?
    var tripTile = ""

    override func viewDidLoad() {
        addButton.createFloatingActionButton()
        
        title = tripTile

        tableView.dataSource = self
        tableView.delegate = self

        TripFunctions.readTrip(by: tripId) {[weak self](model) in
            guard let self = self else { return }
            self.tripModel = model
            
            guard let model = model else { return }
            self.backgroundImageView.image = model.image
            self.tableView.reloadData()

            
        }

 
        sectionHeaderHeight = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier)?.contentView.bounds.height ?? 0
        super.viewDidLoad()

    }
    fileprivate func getTripIndex() -> Int? {
        return Data.tripModels.firstIndex(where: { (tripModel) -> Bool in
            tripModel.id == tripId
        })
    }
    
    
    func handleAddNewDay(action:UIAlertAction)  {
        
        let viewController = AddNewDayViewController.getInstance() //as! AddNewDayViewController
//        viewController.tripModel = tripModel
//        vc.tripIndex = getTripIndex()
//        vc.doneSaving = { [weak self] dayModel in
//            guard let self = self else { return }
//            self.tripModel?.dayModels.append(dayModel)
//            let indexArray = [self.tripModel?.dayModels.firstIndex(of: dayModel) ?? 0 ]
//
//            self.tableView.insertSections(IndexSet(indexArray), with: UITableView.RowAnimation.automatic)
//        }
        present(viewController, animated: true)
    }
    
    
    func handleAddNewActivity(action:UIAlertAction)  {
        
        print("print")
        
        
    }
   

}

extension ActivitiesViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let dayModel = tripModel?.dayModels[section]
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.identifier) as! HeaderTableViewCell
        cell.setUp(model: dayModel!)
        return cell.contentView
        
    }

//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let title = tripModel?.dayModels[section].title ?? ""
//        let subtitle = tripModel?.dayModels[section].subtitle ?? ""
//        return "\(title) - \(subtitle)"
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var model = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: ActivityTableViewCell.identifier) as! ActivityTableViewCell
        cell.setup(model: model!)
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        }
//
//        cell?.textLabel?.text = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row].title
//
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return sectionHeaderHeight
    }
}
