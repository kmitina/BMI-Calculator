

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var sliderHeight: UISlider!
    @IBOutlet weak var sliderWeight: UISlider!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    
    @IBAction func sliderWeightChanged(_ sender: UISlider) {
        weight.text = "\(Int(sliderWeight.value))Kg"
        
    }
    
    
    
    @IBAction func sliderHeightChanged(_ sender: UISlider) {
        let sliderHeightValue = (round(100*sliderHeight.value)/100)
        height.text = "\(sliderHeightValue)m"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = sliderHeight.value
        let weight = sliderWeight.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
       
        
        
         performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
           
           
        }
    }
}

