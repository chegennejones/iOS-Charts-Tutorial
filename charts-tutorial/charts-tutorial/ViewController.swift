//
//  ViewController.swift
//  charts-tutorial
//
//  Created by cheyenne jones on 6/19/21.
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
        let data = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3]
        graphPieChart(dataArray: data)
    }
    func graphPieChart(dataArray: [Int]) {
        // Make lineChartBox size have width and height both equal to width of screen
        pieChartBox.frame = CGRect(x: 0, y: 0,
                                width: self.view.frame.size.width,
                                height: self.view.frame.size.width / 2)
        
        // Make lineChartBox center to be horizontally centered, but
        // offset towards the top of the screen
        pieChartBox.center.x = self.view.center.x
        pieChartBox.center.y = self.view.center.y
        
        // Settings when chart has no data
        pieChartBox.noDataText = "No data available."
        pieChartBox.noDataTextColor = UIColor.black
        
        // Initialize Array that will eventually be displayed on the graph.
        var entries = [ChartDataEntry]()
        
        // For every element in given dataset
        // Set the X and Y coordinates in a data chart entry
        // and add to the entries list
        for i in 0..<dataArray.count {
            let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }

        // Use the entries object and a label string to make a LineChartDataSet object
        let dataSet = PieChartDataSet(entries: entries, label: "Pie Chart")
        
        // Customize graph settings to your liking
        dataSet.colors = ChartColorTemplates.colorful()

        // Make object that will be added to the chart
        // and set it to the variable in the Storyboard
        let data = PieChartData(dataSet: dataSet)
        pieChartBox.data = data

        // Add settings for the chartBox
        pieChartBox.chartDescription?.text = "Pi Values"
        
        // Animations
        pieChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
    }

}

