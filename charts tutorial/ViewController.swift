//
//  ViewController.swift
//  charts tutorial
//
//  Created by cheyenne jones on 6/17/21.
//

import UIKit
import Charts

class ViewController: UIViewController {
    @IBOutlet weak var lineChartBox: LineChartView!
    @IBOutlet weak var pieChartBox: PieChartView!
    @IBOutlet weak var barChartBox: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func graphLineChart (dataArray: [Int]) {
            // Make lineChartBox size have width and height both equal to width of screen
            lineChartBox.frame = CGRect(x: 0, y: 0,
                                        width: self.view.frame.size.width,
                                        height: self.view.frame.size.width / 2)
            
            // Make lineChartBox center to be horizontally centered, but
            // offset towards the top of the screen
            lineChartBox.center.x = self.view.center.x
            lineChartBox.center.y = self.view.center.y - 240
            
            // Settings when chart has no data
            lineChartBox.noDataText = "No data available."
            lineChartBox.noDataTextColor = UIColor.black
            
            // Initialize Array that wil eventually be displayed on the graph.
            var entries = [ChartDataEntry]()
            
            // For every element in given dataset
            // Set the X and Y coordinates in a data chart entry
            // and add to the entries list
            for i in 0..<dataArray.count {
                let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]))
                entries.append(value)
            }
            
            // Use the entries object and a label string to make a LineChartDataSet object
            let dataSet = LineChartDataSet(entries: entries, label: "Line Chart")
            
            // Customize graph settings to your liking
            dataSet.colors = ChartColorTemplates.joyful()
            
            // Make object that will be added to the chart
            // and set it to the variable in the Storyboard
            let data = LineChartData(dataSet: dataSet)
            lineChartBox.data = data
            
            // Add settings for the chartBox
            lineChartBox.chartDescription?.text = "Pi Values"
        
            // Animations
        lineChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
    }

}
