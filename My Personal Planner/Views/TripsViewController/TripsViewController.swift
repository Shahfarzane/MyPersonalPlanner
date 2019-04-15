//
//  TripsViewController.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-09.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {

  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    var tripIndexEdit: Int?
    var seenTipsView = "seenTipsView"
    
    @IBOutlet var helpView: UIVisualEffectView!
    
    
    @IBAction func closeButton(_ sender: AppUIButton) {
        UIView.animate(withDuration: 0.5, animations: {
            self.helpView.alpha = 0
            
        }) {(success)
            in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: self.seenTipsView)
        }
      
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrips(completion:  { [weak self] in
            // completen runs after all the data is ready
            
            self?.tableView.reloadData()
        })
        
        if UserDefaults.standard.bool(forKey: seenTipsView) == false {
            view.addSubview(helpView)
            self.helpView.frame = self.view.bounds
        }
        
  
        
        
        //updating background with the theme file:
        
        view.backgroundColor = Theme.backgroundColor
        
        // styling the  button
        
        addButton.createFloatingActionButton()
        
//        addButton.backgroundColor = Theme.tintColor
//        addButton.layer.cornerRadius = addButton.frame.height / 2
//        addButton.layer.shadowOpacity = 0.50
//        addButton.layer.shadowRadius = 5
//        addButton.layer.shadowOffset = CGSize(width: 0, height: 10)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripViewController
           //not requiered ....memory leak
            popup.tripIndexEdit = self.tripIndexEdit
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
        tripIndexEdit = nil
        }
    }
}

extension TripsViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TripsTableViewCell.identifier) as! TripsTableViewCell
        

        cell.setup(tripModel:Data.tripModels[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
        // to get the name of the trip:
        
        let tripName = Data.tripModels[indexPath.row]
    
        let delete = UIContextualAction(style: .destructive, title: "Delete"){ (contextualAction, view, actionPerformed: @escaping (Bool) -> Void) in
            let alert = UIAlertController(title: "Delete Trip?", message: "Are you sure you wanna delete \(tripName.title) from the trip list?", preferredStyle:.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
             actionPerformed(false)
            }))
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (UIAlertAction) in
                
                // performing the delete
                TripFunctions.deleteTrip(index: indexPath.row)
                // tableView.reloadData()
                tableView.deleteRows(at: [indexPath], with: .fade)
                actionPerformed(true)
            }))


            self.present(alert,animated: true)
            
    }
        delete.image = UIImage(named: "warning-1")
        
    return UISwipeActionsConfiguration(actions: [delete])
    
}
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed:(Bool) -> Void) in
            self.tripIndexEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
            // if we want the edit button go away 
            actionPerformed(true)
        }
        editAction.image = #imageLiteral(resourceName: "edit-2")
        editAction.backgroundColor = UIColor(named: "Edit")
        return UISwipeActionsConfiguration(actions: [editAction])
    }
    
    
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let trip = Data.tripModels[indexPath.row]

       let viewController = ActivitiesViewController.getInstance() as! ActivitiesViewController
    viewController.tripId = trip.id
    viewController.tripTile = trip.title
    navigationController?.pushViewController(viewController, animated: true)
    // self.present(viewController, animated: true, completion: nil)
    }
}
