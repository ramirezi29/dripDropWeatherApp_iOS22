//
//  WeatherCollectionViewCell.swift
//  dripDrop_iOS22
//
//  Created by Ivan Ramirez on 10/18/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Cell Outlets
    @IBOutlet weak var collectionSummaryLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImageLabel: UIImageView!
    @IBOutlet weak var dayOfTheWeekLabel: UILabel!
    
    // MARK: - Landing Pad
    var dailyWeather: DailyWeather? {
        didSet {
            DispatchQueue.main.async {
                
                self.updateViews()
            }
        }
    }
    
    // NOTE: - String for our time
    func stringFromTime(time: TimeInterval) -> String {
        let formatter = DateFormatter()
        // NOTE: - "EEE" filler text, not sure what that means
        formatter.dateFormat = "EEE"
        
        let date = Date(timeIntervalSince1970: time)
        
        return formatter.string(from: date)
    }
    
    func updateViews() {
        guard let dailyWeather = dailyWeather else {return}
        
        // NOTE: - grab all our labels and stuff
        collectionSummaryLabel.text = dailyWeather.summary
        
        // NOTE: - Start to conn
        dayOfTheWeekLabel.text = stringFromTime(time: dailyWeather.time)
        iconImageLabel.image = UIImage(named: dailyWeather.icon) ?? UIImage(named: "cloudy")
        
        tempLabel.text = "\(Int(dailyWeather.temperatureMax + dailyWeather.temperatureMin)/2)°"
        
        updateLabelUI()
    }
}
