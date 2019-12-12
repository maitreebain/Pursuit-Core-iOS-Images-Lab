//
//  ComicViewController.swift
//  Images-Lab
//
//  Created by Maitree Bain on 12/11/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class ComicViewController: UIViewController {

    @IBOutlet weak var comicImage: UIImageView!
    
    @IBOutlet weak var comicStepper: UIStepper!
    
    @IBOutlet weak var comicTextField: UITextField!
    
    var comic = [ComicDataLoad]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comicTextField.delegate = self
        loadData(comicNum: 614)
        stepperValues()
    }
   
    func loadData(comicNum: Int) {
        ComicAPIClient.getComic(for: comicNum) { [weak self] (result) in
            
            switch result{
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let comic):
                dump(comic)
                let url = comic.img
                NetworkHelper.shared.performingDataTask(with: url ) { (result) in
                        
                        switch result{
                        case .failure(let appError):
                            print("appError: \(appError)")
                        case .success(let data):
                            DispatchQueue.main.async {
                                let image = UIImage(data: data)
                                
                                self?.comicImage.image = image
                            }

                        }
                    }
                
            }
        }
    }
    
    func stepperValues() {
        comicStepper.minimumValue = 0
        comicStepper.maximumValue = 614
        comicStepper.value = 0
        comicStepper.stepValue = 1.0
    }
    
    
    @IBAction func comicStepper(_ sender: UIStepper) {
        loadData(comicNum: Int(sender.value))
    }
    
    @IBAction func mostRecent(_ sender: UIButton) {
        loadData(comicNum: Int(comicStepper.maximumValue))
    }
    
    
    @IBAction func random(_ sender: UIButton) {
        loadData(comicNum: .random(in: 0...Int(comicStepper.maximumValue)))
    }
}

extension ComicViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
}
