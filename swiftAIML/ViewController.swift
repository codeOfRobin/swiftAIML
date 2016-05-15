//
//  ViewController.swift
//  swiftAIML
//
//  Created by Robin Malhotra on 15/05/16.
//  Copyright © 2016 Robin Malhotra. All rights reserved.
//

import Cocoa
import CorePlot
class ViewController: NSViewController,CPTPlotDataSource
{

    
    @IBOutlet weak var plotView: CPTGraphHostingView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let graph = CPTXYGraph(frame: CGRectZero)
        graph.title = "Hello Graph"
        graph.paddingLeft = 0
        graph.paddingTop = 0
        graph.paddingRight = 0
        graph.paddingBottom = 0
        // hide the axes
        let axes = graph.axisSet as? CPTXYAxisSet
        let lineStyle = CPTMutableLineStyle()
        lineStyle.lineWidth = 0
        axes?.xAxis?.axisLineStyle = lineStyle
        axes?.yAxis?.axisLineStyle = lineStyle
        
        // add a pie plot
        let pie = CPTPieChart()
        pie.dataSource = self
        pie.pieRadius = (self.view.frame.size.width * 0.9)/2
        graph.addPlot(pie)
        
        
        self.plotView.hostedGraph = graph
    }

    func numberOfRecordsForPlot(plot: CPTPlot) -> UInt
    {
        return 4
    }
    
    func numberForPlot(plot: CPTPlot, field fieldEnum: UInt, recordIndex idx: UInt) -> AnyObject? {
        return idx + 1
    }
    override var representedObject: AnyObject?
    {
        didSet
        {
        // Update the view, if already loaded.
        }
    }


}

