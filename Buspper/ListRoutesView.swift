//
//  ListRoutesViewViewController.swift
//  Buspper
//
//  Created by Carlos Linares on 2/10/16.
//  Copyright © 2016 Carlos Linares. All rights reserved.
//

import UIKit

class ListRoutesView: UIView, UITableViewDataSource, UITableViewDelegate {

    private let headerHeight: CGFloat = 40.0
    private let margin: CGFloat = 16
    var stopName: String?
    var routesNames = [["24 de Diciembre", "Plaza Mirage"], ["Av. España", "Plaza Mirage"]]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     
        backgroundColor = UIColor.clearColor()
        
        // Add UILabel
        let containerHeader = UIView(frame: CGRectMake(0, 0, self.frame.width, headerHeight))
        
        let stopNameLabel = UILabel()

        stopNameLabel.font = UIFont(name: "HelveticaNeue-Light", size: 22)
        stopNameLabel.text = "Plaza Edison"
        stopNameLabel.sizeToFit()
        stopNameLabel.center.y = containerHeader.bounds.height / 2 // Maybe a constrain is better
        stopNameLabel.frame.origin.x = 16 // Maybe a constrain is better
        stopNameLabel.textColor = UIColor.whiteColor()

        // Blur
        let blurEffect = UIBlurEffect(style: .ExtraLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.backgroundColor = UIColor.clearColor()
//        blurView.backgroundColor = UIColor.blueBuspper()
//        containerHeader.addSubview(blurView)

        containerHeader.backgroundColor = UIColor.blueBuspper()
        containerHeader.alpha = 0.75
        containerHeader.addSubview(stopNameLabel)
        addSubview(containerHeader)
        
        // Background table view
        let busLogo = UIImageView(image: UIImage(named: "bus"))
        busLogo.contentMode = UIViewContentMode.Center
        busLogo.center.y = UIScreen.mainScreen().bounds.width / 2
        busLogo.center.x = UIScreen.mainScreen().bounds.height - 100
        
        
        // Add UITableView 
        let tableView = UITableView(frame: CGRectMake(0, headerHeight, self.frame.width, self.frame.height - headerHeight))
        blurView.frame = tableView.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.alpha = 0.85
        tableView.addSubview(busLogo)
        addSubview(tableView)
   
        
        self.frame.origin.y -= UIScreen.mainScreen().bounds.height
        
    }
 
    // MARK: About UITableViewDelegate and UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routesNames.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "")
        cell.textLabel!.text = routesNames[indexPath.row][0]
        cell.textLabel!.font = UIFont(name: "HelveticaNeue-Regular", size: 14)
        cell.textLabel!.frame.origin.x = self.margin
        cell.textLabel!.frame.origin.y = 10
        
        cell.detailTextLabel?.text = "Próxima parada: \(routesNames[indexPath.row][1])"
        cell.detailTextLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        cell.detailTextLabel?.textColor = UIColor.hexToUIColor("#575757")
        return cell
        
    }
    
    // MARK: UI things
    
    func show() {
        UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
            self.frame.origin.y += UIScreen.mainScreen().bounds.height
            }, completion: nil)
    }
    
    func hide() {
        UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseIn, animations: {
            self.frame.origin.y -= UIScreen.mainScreen().bounds.height
            }, completion: nil)
    }
    
}
