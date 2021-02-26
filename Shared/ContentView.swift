//
//  ContentView.swift
//  Shared
//
//  Created by Spencer Lee on 2/26/21.
//

import SwiftUI
import CorePlot

typealias plotDataType = [CPTScatterPlotField : Double]

struct ContentView: View {
   // NOTE NEEDED FOR CORE PLOT
    @EnvironmentObject var plotDataModel :PlotDataClass
    @ObservedObject private var calculator = CalculatePlotData()
    @State var isChecked:Bool = false
    @State var tempInput = ""
    // ****************
    
    
    // for picker
    var errorSelect = ["Weird - Normal (Minus)", "Weird - Normal (Plus)"]
    // create a state variable
    @State private var selectedErrorIndex = 0
    
    // for a b and c manual selection
    
    @State var aText = "1.0"
    @State var bText = "1.0"
    @State var cText = "1.0"
    // State variables for quadratic answers
    @State var normQuadMinusText = "1.0"
    @State var normQuadPlusText = "1.0"
    @State var weirdQuadMinusText = "1.0"
    @State var weirdQuadPlusText = "1.0"

    // Create local instance of the quadratic calculator class
    
    @State var quadCalculator = QuadraticCalculator()
    
    
    var body: some View {
        
        VStack{
      
            CorePlot(dataForPlot: $plotDataModel.plotData, changingPlotParameters: $plotDataModel.changingPlotParameters)
                .setPlotPadding(left: 10)
                .setPlotPadding(right: 10)
                .setPlotPadding(top: 10)
                .setPlotPadding(bottom: 10)
                .padding()
            
            Divider()
            
//            HStack{
//
//                HStack(alignment: .center) {
//                    Text("temp:")
//                        .font(.callout)
//                        .bold()
//                    TextField("temp", text: $tempInput)
//                        .padding()
//                }.padding()
//
//                Toggle(isOn: $isChecked) {
//                            Text("Display Error")
//                        }
//                .padding()
//
//
//            }
            
            // Picker to select the error plot
            HStack {
                
                Picker(selection: $selectedErrorIndex, label: Text("")) {
                    
                    ForEach(0 ..< errorSelect.count){
                        Text(self.errorSelect[$0])
                        
                    }
                }
                Text("Selected Error:\(errorSelect[selectedErrorIndex])")
                    
                
            }
            .padding()
           
            
            
            // Action button
            
            
            HStack{
                Button("Plot Error", action: {self.calculate()} )
                .padding()
                
            }
            
            // This is for changing a, b, and c, and seeing the values created
            Divider()
            HStack(alignment: .center) {
                
                Text("User Input")
            }
        
            HStack {
                Text("a")
                    .padding()
                
                TextField("aText", text: $aText)
                    .padding()
                Text("b")
                    .padding()
                
                TextField("bText" , text: $bText)
                    .padding()
                
                Text("c")
                    .padding()
                
                TextField("cText", text: $cText)
                    .padding()
            
            }
            
            
            //
          
            HStack(alignment: .center){
                Text("Normal Quadratic Answers")
                Text("                                      ")
                Text("Weird Quadratic Answers")
            }
            
            
            HStack{
                VStack{
                    Text("Minus")
                    TextField("normQuadMinusText", text: $normQuadMinusText)
                        .padding()
                    
                }
                VStack{
                    Text("Plus")
                    TextField("normQuadPlusText", text: $normQuadPlusText)
                        .padding()
                }
                
                VStack{
                    
                    Text("Minus")
                    TextField("weirdQuadMinusText", text: $weirdQuadMinusText)
                        .padding()
                    
                }
                VStack{
                    Text("Plus")
                    TextField("weirdQuadPlusText", text: $weirdQuadPlusText)
                        .padding()
                }
            
            
            }
            //
            HStack{
                
                Button("Calculate Quadratics", action: {self.quadraticCalculate()} )
                .padding()
                
            }

            
            
            
        
        
        
        }
        
    }
    
    
    
    
    /// calculate
    /// Function accepts the command to start the calculation from the GUI
    func calculate(){
        
        //var temp = 0.0
        
        //pass the plotDataModel to the cosCalculator
        calculator.plotDataModel = self.plotDataModel
        
        let tempErrorIndex = selectedErrorIndex
        
        // create switch for picker
        
        switch tempErrorIndex {
        case 0:
            calculator.plotMinusError()
        case 1:
            calculator.plotPlusError()
        default:
            calculator.plotYEqualsX()
            
        }
        
        
        
        
        //Calculate the new plotting data and place in the plotDataModel
        //calculator.plotMinusError()
        
    }
    
    func quadraticCalculate() {
        
        quadCalculator.a = Double(aText)!
        quadCalculator.b = Double(bText)!
        quadCalculator.c = Double(cText)!
        
        let weirdQuadPlus = quadCalculator.weirdQuadPlusCalculator()
        weirdQuadPlusText =  "\(weirdQuadPlus)"
        
        let weirdQuadMinus = quadCalculator.weirdQuadMinusCalculator()
        weirdQuadMinusText =  "\(weirdQuadMinus)"
        
        let normQuadPlus = quadCalculator.normQuadPlusCalculator()
        normQuadPlusText = "\(normQuadPlus)"
        
        let normQuadMinus = quadCalculator.normQuadMinusCalculator()
        normQuadMinusText = "\(normQuadMinus)"    }
   
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
