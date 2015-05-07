//
//  APLEarthquakeTableViewCell.swift
//  SeismicXML
//
//  Created by Andy Reyes on 5/6/15.
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

import UIKit

class APLEarthquakeTableViewCell: UITableViewCell
{
    // References to the subviews which display the earthquake data.
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var magnitudeImage: UIImageView!
    
    // Lazily instantiated NSDateFormatter
    lazy private var dateFormatter: NSDateFormatter =
    {
        var tempFormatter: NSDateFormatter = NSDateFormatter()
        
        tempFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        tempFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        tempFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        
        return tempFormatter;
    }()
    
    func configureWithEarthquake(earthquake: APLEarthquake)
    {
        locationLabel.text = earthquake.location
        dateLabel.text = dateFormatter.stringFromDate(earthquake.date)
        magnitudeLabel.text = String(format: "%.1f", Double(earthquake.magnitude))
        
        if let image = imageForMagnitude(earthquake.magnitude)
        {
            magnitudeImage.image = image
        }
    }
    
    // Based on the magnitude of the earthquake, return an image indicating its seismic strength.
    private func imageForMagnitude(magnitude: CGFloat) -> UIImage?
    {
        switch magnitude
        {
        case 5...CGFloat.max:
            return UIImage(named: "5.0.png")
            
        case 4..<5:
            return UIImage(named: "4.0.png")
            
        case 3..<4:
            return UIImage(named: "3.0.png")
            
        case 2..<3:
            return UIImage(named: "2.0.png")
            
        default:
            return nil
        }
    }
}