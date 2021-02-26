//
//  CalculatePlotData.swift
//  SwiftUICorePlotExample
//
//  Created by Jeff Terry on 12/22/20.
//

import Foundation
import SwiftUI
import CorePlot

class CalculatePlotData: ObservableObject {
    
    var plotDataModel: PlotDataClass? = nil
    
    @ObservedObject private var qCalc = QuadraticCalculator()

    func plotYEqualsX()
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10.0
        plotDataModel!.changingPlotParameters.yMin = -5.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -5.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y"
        plotDataModel!.changingPlotParameters.lineColor = .red()
        plotDataModel!.changingPlotParameters.title = " y = x"
        
        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        
        
        for i in 0 ..< 120 {

            //create x values here

            let x = -2.0 + Double(i) * 0.2

        //create y values here

        let y = x


            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
        
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        
    }
    
    
    func ploteToTheMinusX()
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10
        plotDataModel!.changingPlotParameters.yMin = -3.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -3.0
        plotDataModel!.changingPlotParameters.xLabel = "x"
        plotDataModel!.changingPlotParameters.yLabel = "y = exp(-x)"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "exp(-x)"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        for i in 0 ..< 60 {

            //create x values here

            let x = -2.0 + Double(i) * 0.2

        //create y values here

        let y = exp(-x)
            
            let dataPoint: plotDataType = [.X: x, .Y: y]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
  
   //New function for error ployyinh
    func plotPlusError()
    {
        
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10.0
        plotDataModel!.changingPlotParameters.yMin = -1.0
        plotDataModel!.changingPlotParameters.xMax = 10.0
        plotDataModel!.changingPlotParameters.xMin = -1.0
        plotDataModel!.changingPlotParameters.xLabel = "n"
        plotDataModel!.changingPlotParameters.yLabel = "Relative Error"
        plotDataModel!.changingPlotParameters.lineColor = .blue()
        plotDataModel!.changingPlotParameters.title = "Plus Error"

        plotDataModel!.zeroData()
        var plotData :[plotDataType] =  []
        print("x,              y  ")
        for n in 0 ..< 60 {

            //create x values here
            let a = Float(1.0)
            let b  = Float(1.0)
            let c = pow(10,-Float(n))
            
            let x = Float(n)

        //create y values here

            //let WeirdMinus = (-2.0 * c) / (b - sqrt(pow(b,2.0) - 4.0 * a * c))
            let WeirdPlus =  (-Float(2.0) * c) / (b + sqrt(pow(b,Float(2.0)) - Float(4.0) * a * c))
            //let NormMinus = ( -b - sqrt(pow(b,2.0) - 4 * a * c)) / ( 2 * a )
            let NormPlus = ( -b + sqrt(pow(b,Float(2.0)) - Float(4.0) * a * c)) / ( Float(2.0) * a )
            
            let y = Float(100)*abs(WeirdPlus - NormPlus)/WeirdPlus
            print(x,"   ", y)
            let dataPoint: plotDataType = [.X: Double(x), .Y: Double(y)]
            plotData.append(contentsOf: [dataPoint])
            
            plotDataModel!.calculatedText += "\(x)\t\(y)\n"
            
        }
        
        plotDataModel!.appendData(dataPoint: plotData)
        
        return
    }
    
    
    //New function for error Minues
     func plotMinusError()
     {
         
         //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = 10.0
         plotDataModel!.changingPlotParameters.yMin = -1.0
         plotDataModel!.changingPlotParameters.xMax = 10.0
         plotDataModel!.changingPlotParameters.xMin = -1.0
         plotDataModel!.changingPlotParameters.xLabel = "n"
         plotDataModel!.changingPlotParameters.yLabel = "Relative Error"
         plotDataModel!.changingPlotParameters.lineColor = .blue()
         plotDataModel!.changingPlotParameters.title = "Minus Error"

         plotDataModel!.zeroData()
         var plotData :[plotDataType] =  []
         print("x,              y  ")
         for n in 0 ..< 60 {

             //create x values here
             let a = Float(1.0)
             let b  = Float(1.0)
             let c = pow(10,-Float(n))
             
             let x = Float(n)

         //create y values here

             let WeirdMinus = (-2.0 * c) / (b - sqrt(pow(b,2.0) - 4.0 * a * c))
             //let WeirdPlus =  (-Float(2.0) * c) / (b + sqrt(pow(b,Float(2.0)) - Float(4.0) * a * c))
            let NormMinus = ( -b - sqrt(pow(b,2.0) - 4.0 * a * c)) / ( 2.0 * a )
             
            
            //let NormPlus = ( -b + sqrt(pow(b,Float(2.0)) - Float(4.0) * a * c)) / ( Float(2.0) * a )
             
            let y = 100.0*abs(WeirdMinus - NormMinus)/WeirdMinus
             print(x,"   ", y)
             let dataPoint: plotDataType = [.X: Double(x), .Y: Double(y)]
             plotData.append(contentsOf: [dataPoint])
             
             plotDataModel!.calculatedText += "\(x)\t\(y)\n"
             
         }
         
         plotDataModel!.appendData(dataPoint: plotData)
         
         return
     }
    
    
    
    
    
}



