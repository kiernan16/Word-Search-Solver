//
//  ViewController.swift
//  Word Search Solver
//
//  Created by Matthew Kiernan on 2/21/15.
//  Copyright (c) 2015 Matt Kiernan. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextViewDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var findTextField: UITextField!
    @IBOutlet weak var replaceTextField: UITextField!
    @IBOutlet weak var topMarginConstraint: NSLayoutConstraint!
    
    var activityIndicator:UIActivityIndicatorView!
    var originalTopMargin:CGFloat!
    
    var wordbank1 = []
    var wordbank2 = []
    var wordbank3 = []
    var wordbank4 = []
    var wordbank5 = []
    var wordbank6 = []
    var wordbank7 = []
    var wordbank8 = []
    var wordbank9 = []
    var wordbank10 = []
    
    var rows = 11
    var columns = 10
    
    var column0 = [Character]()
    var column1 = [Character]()
    var column2 = [Character]()
    var column3 = [Character]()
    var column4 = [Character]()
    var column5 = [Character]()
    var column6 = [Character]()
    var column7 = [Character]()
    var column8 = [Character]()
    var column9 = [Character]()
    var column10 = [Character]()
    
    var newrow0 = [Character]()
    var newrow1 = [Character]()
    var newrow2 = [Character]()
    var newrow3 = [Character]()
    var newrow4 = [Character]()
    var newrow5 = [Character]()
    var newrow6 = [Character]()
    var newrow7 = [Character]()
    var newrow8 = [Character]()
    var newrow9 = [Character]()
    var newrow10 = [Character]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        originalTopMargin = topMarginConstraint.constant
    }
    
    func moveViewUp() {
        if topMarginConstraint.constant != originalTopMargin {
            return
        }
        
        topMarginConstraint.constant -= 135
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    
    func moveViewDown() {
        if topMarginConstraint.constant == originalTopMargin {
            return
        }
        
        topMarginConstraint.constant = originalTopMargin
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
        
    }
    
    @IBAction func takePhoto(sender: AnyObject) {
        // 1
        view.endEditing(true)
        moveViewDown()
        
        // 2
        let imagePickerActionSheet = UIAlertController(title: "Snap/Upload Photo",
            message: nil, preferredStyle: .ActionSheet)
        
        // 3
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let cameraButton = UIAlertAction(title: "Take Photo",
                style: .Default) { (alert) -> Void in
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.sourceType = .Camera
                    self.presentViewController(imagePicker,
                        animated: true,
                        completion: nil)
            }
            imagePickerActionSheet.addAction(cameraButton)
        }
        
        // 4
        let libraryButton = UIAlertAction(title: "Choose Existing",
            style: .Default) { (alert) -> Void in
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .PhotoLibrary
                self.presentViewController(imagePicker,
                    animated: true,
                    completion: nil)
        }
        imagePickerActionSheet.addAction(libraryButton)
        
        // 5
        let cancelButton = UIAlertAction(title: "Cancel",
            style: .Cancel) { (alert) -> Void in
        }
        imagePickerActionSheet.addAction(cancelButton)
        
        // 6
        presentViewController(imagePickerActionSheet, animated: true,
            completion: nil)
    }
    
    func performImageRecognition(image: UIImage) {
        // 1
        let tesseract = G8Tesseract()
        
        // 2
       // tesseract.language = "eng+fra"
        tesseract.language = "eng"      //Try to only set to English
        
        // 3
        tesseract.engineMode = .TesseractCubeCombined
        
        // 4
        tesseract.pageSegmentationMode = .Auto
        
        // 5
        tesseract.maximumRecognitionTime = 80.0
        
        // 6
        tesseract.image = image.g8_blackAndWhite()
        tesseract.recognize()
        
        // 7
        textView.text = tesseract.recognizedText
        textView.editable = true
        
        // 8
        removeActivityIndicator()
    }
    
    // Activity Indicator methods
    
    func addActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(frame: view.bounds)
        activityIndicator.activityIndicatorViewStyle = .WhiteLarge
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.25)
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    func removeActivityIndicator() {
        activityIndicator.removeFromSuperview()
        activityIndicator = nil
    }
    
    func scaleImage(image: UIImage, maxDimension: CGFloat) -> UIImage {
        
        var scaledSize = CGSize(width: maxDimension, height: maxDimension)
        var scaleFactor: CGFloat
        
        if image.size.width > image.size.height {
            scaleFactor = image.size.height / image.size.width
            scaledSize.width = maxDimension
            scaledSize.height = scaledSize.width * scaleFactor
        } else {
            scaleFactor = image.size.width / image.size.height
            scaledSize.height = maxDimension
            scaledSize.width = scaledSize.height * scaleFactor
        }
        
        UIGraphicsBeginImageContext(scaledSize)
        image.drawInRect(CGRectMake(0, 0, scaledSize.width, scaledSize.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
    @IBAction func backgroundTapped(sender: AnyObject) {
        view.endEditing(true)
        moveViewDown()
    }
    
    //MARK: - Assign Word Bank Lines To Arrays
    
    /*
        Get picture of Word Search
        Using for statement{
            Set 1st line to Array0 {
                Assign rest of line to Array0[#]}
            Set 2nd line to Array1...}
    
    */
    
    func AssignArrays(){
        //Use textView
       let myarray = Array(textView.text)
        
//        var rows = 11
//        var columns = 10
//        
//        var column0 = [Character]()
//        var column1 = [Character]()
//        var column2 = [Character]()
//        var column3 = [Character]()
//        var column4 = [Character]()
//        var column5 = [Character]()
//        var column6 = [Character]()
//        var column7 = [Character]()
//        var column8 = [Character]()
//        var column9 = [Character]()
//        var column10 = [Character]()
        
        
        
        var tempcolumn = [Character]()
        
        var x : Int = 0
        var y = 0
        
        while x < myarray.count{
            switch(y){
            case 0:
                for (var i = 0; i<rows; i++){
                    column0.insert(myarray[myarray.count-1-x], atIndex: i)
                    x++
                    if i==rows-1{
                        for (var j = 0; j<rows; j++){
                            tempcolumn.insert(column0[column0.count-1-j], atIndex: j)
                            if j==rows-1{
                                column0=tempcolumn
                                y++
                                tempcolumn = []
                            }
                        }
                    }
                }
                break
                
            case 1:
                for (var i = 0; i<rows; i++){
                    column1.insert(myarray[myarray.count-1-x], atIndex: i)
                    x++
                    if i==rows-1{
                        for (var j = 0; j<rows; j++){
                            tempcolumn.insert(column1[column1.count-1-j], atIndex: j)
                            if j==rows-1{
                                column1=tempcolumn
                                y++
                                tempcolumn = []
                            }
                        }
                    }
                }
                break
            case 2:
                for (var i = 0; i<rows; i++){
                    column2.insert(myarray[myarray.count-1-x], atIndex: i)
                    x++
                    if i==rows-1{
                        for (var j = 0; j<rows; j++){
                            tempcolumn.insert(column2[column2.count-1-j], atIndex: j)
                            if j==rows-1{
                                column2=tempcolumn
                                y++
                                tempcolumn = []
                            }
                        }
                    }
                }
                break
            case 3:
                for (var i = 0; i<rows; i++){
                    column3.insert(myarray[myarray.count-1-x], atIndex: i)
                    x++
                    if i==rows-1{
                        for (var j = 0; j<rows; j++){
                            tempcolumn.insert(column3[column3.count-1-j], atIndex: j)
                            if j==rows-1{
                                column3=tempcolumn
                                y++
                                tempcolumn = []
                            }
                        }
                    }
                }
                break
            case 4:
                for (var i = 0; i<rows; i++){
                    column4.insert(myarray[myarray.count-1-x], atIndex: i)
                    x++
                    if i==rows-1{
                        for (var j = 0; j<rows; j++){
                            tempcolumn.insert(column4[column4.count-1-j], atIndex: j)
                            if j==rows-1{
                                column4=tempcolumn
                                y++
                                tempcolumn = []
                            }
                        }
                    }
                }
                break
            case 5:
                for (var i = 0; i<rows; i++){
                    column5.insert(myarray[myarray.count-1-x], atIndex: i)
                    x++
                    if i==rows-1{
                        for (var j = 0; j<rows; j++){
                            tempcolumn.insert(column5[column5.count-1-j], atIndex: j)
                            if j==rows-1{
                                column5=tempcolumn
                                y++
                                tempcolumn = []
                            }
                        }
                    }
                }
                break
            case 6:
                for (var i = 0; i<rows; i++){
                    column6.insert(myarray[myarray.count-1-x], atIndex: i)
                    x++
                    if i==rows-1{
                        for (var j = 0; j<rows; j++){
                            tempcolumn.insert(column6[column6.count-1-j], atIndex: j)
                            if j==rows-1{
                                column6=tempcolumn
                                y++
                                tempcolumn = []
                            }
                        }
                    }
                }
                break
            case 7:
                for (var i = 0; i<rows; i++){
                    column7.insert(myarray[myarray.count-1-x], atIndex: i)
                    x++
                    if i==rows-1{
                        for (var j = 0; j<rows; j++){
                            tempcolumn.insert(column7[column7.count-1-j], atIndex: j)
                            if j==rows-1{
                                column7=tempcolumn
                                y++
                                tempcolumn = []
                            }
                        }
                    }
                }
                break
            case 8:
                for (var i = 0; i<rows; i++){
                    column8.insert(myarray[myarray.count-1-x], atIndex: i)
                    x++
                    if i==rows-1{
                        for (var j = 0; j<rows; j++){
                            tempcolumn.insert(column8[column8.count-1-j], atIndex: j)
                            if j==rows-1{
                                column8=tempcolumn
                                y++
                                tempcolumn = []
                            }
                        }
                    }
                }
                break
            case 9:
                for (var i = 0; i<rows; i++){
                    column9.insert(myarray[myarray.count-1-x], atIndex: i)
                    x++
                    if i==rows-1{
                        for (var j = 0; j<rows; j++){
                            tempcolumn.insert(column9[column9.count-1-j], atIndex: j)
                            if j==rows-1{
                                column9=tempcolumn
                                y++
                                tempcolumn = []
                            }
                        }
                    }
                }
                break
            case 10:
                for (var i = 0; i<rows; i++){
                    column10.insert(myarray[myarray.count-1-x], atIndex: i)
                    x++
                    if i==rows-1{
                        for (var j = 0; j<rows; j++){
                            tempcolumn.insert(column10[column10.count-1-j], atIndex: j)
                            if j==rows-1{
                                column10=tempcolumn
                                y++
                                tempcolumn = []
                            }
                        }
                    }
                }
                break
            default: break
            }
        }
        
        
        println(column0)
        println(column1)
        println(column2)
        println(column3)
        println(column4)
        println(column5)
        println(column6)
        println(column7)
        println(column8)
        println(column9)
        
        tempcolumn = []
        
//        var newrow0 = [Character]()
//        var newrow1 = [Character]()
//        var newrow2 = [Character]()
//        var newrow3 = [Character]()
//        var newrow4 = [Character]()
//        var newrow5 = [Character]()
//        var newrow6 = [Character]()
//        var newrow7 = [Character]()
//        var newrow8 = [Character]()
//        var newrow9 = [Character]()
//        var newrow10 = [Character]()
        
        
        
        
        
        func SetNewRow0(){
            var z = 0
            newrow0.append(column0[z])
            newrow0.append(column1[z])
            newrow0.append(column2[z])
            newrow0.append(column3[z])
            newrow0.append(column4[z])
            newrow0.append(column5[z])
            newrow0.append(column6[z])
            newrow0.append(column7[z])
            newrow0.append(column8[z])
            newrow0.append(column9[z])
        }
        
        func SetNewRow1(){
            var z = 1
            newrow1.append(column0[z])
            newrow1.append(column1[z])
            newrow1.append(column2[z])
            newrow1.append(column3[z])
            newrow1.append(column4[z])
            newrow1.append(column5[z])
            newrow1.append(column6[z])
            newrow1.append(column7[z])
            newrow1.append(column8[z])
            newrow1.append(column9[z])
        }
        
        func SetNewRow2(){
            var z = 2
            newrow2.append(column0[z])
            newrow2.append(column1[z])
            newrow2.append(column2[z])
            newrow2.append(column3[z])
            newrow2.append(column4[z])
            newrow2.append(column5[z])
            newrow2.append(column6[z])
            newrow2.append(column7[z])
            newrow2.append(column8[z])
            newrow2.append(column9[z])
        }
        
        func SetNewRow3(){
            var z = 3
            newrow3.append(column0[z])
            newrow3.append(column1[z])
            newrow3.append(column2[z])
            newrow3.append(column3[z])
            newrow3.append(column4[z])
            newrow3.append(column5[z])
            newrow3.append(column6[z])
            newrow3.append(column7[z])
            newrow3.append(column8[z])
            newrow3.append(column9[z])
        }
        
        func SetNewRow4(){
            var z = 4
            newrow4.append(column0[z])
            newrow4.append(column1[z])
            newrow4.append(column2[z])
            newrow4.append(column3[z])
            newrow4.append(column4[z])
            newrow4.append(column5[z])
            newrow4.append(column6[z])
            newrow4.append(column7[z])
            newrow4.append(column8[z])
            newrow4.append(column9[z])
        }
        
        func SetNewRow5(){
            var z = 5
            newrow5.append(column0[z])
            newrow5.append(column1[z])
            newrow5.append(column2[z])
            newrow5.append(column3[z])
            newrow5.append(column4[z])
            newrow5.append(column5[z])
            newrow5.append(column6[z])
            newrow5.append(column7[z])
            newrow5.append(column8[z])
            newrow5.append(column9[z])
        }
        
        func SetNewRow6(){
            var z = 6
            newrow6.append(column0[z])
            newrow6.append(column1[z])
            newrow6.append(column2[z])
            newrow6.append(column3[z])
            newrow6.append(column4[z])
            newrow6.append(column5[z])
            newrow6.append(column6[z])
            newrow6.append(column7[z])
            newrow6.append(column8[z])
            newrow6.append(column9[z])
        }
        
        func SetNewRow7(){
            var z = 7
            newrow7.append(column0[z])
            newrow7.append(column1[z])
            newrow7.append(column2[z])
            newrow7.append(column3[z])
            newrow7.append(column4[z])
            newrow7.append(column5[z])
            newrow7.append(column6[z])
            newrow7.append(column7[z])
            newrow7.append(column8[z])
            newrow7.append(column9[z])
        }
        
        func SetNewRow8(){
            var z = 8
            newrow8.append(column0[z])
            newrow8.append(column1[z])
            newrow8.append(column2[z])
            newrow8.append(column3[z])
            newrow8.append(column4[z])
            newrow8.append(column5[z])
            newrow8.append(column6[z])
            newrow8.append(column7[z])
            newrow8.append(column8[z])
            newrow8.append(column9[z])
        }
        
        func SetNewRow9(){
            var z = 9
            newrow9.append(column0[z])
            newrow9.append(column1[z])
            newrow9.append(column2[z])
            newrow9.append(column3[z])
            newrow9.append(column4[z])
            newrow9.append(column5[z])
            newrow9.append(column6[z])
            newrow9.append(column7[z])
            newrow9.append(column8[z])
            newrow9.append(column9[z])
        }
        
        func SetNewRow10(){
            var z = 10
            newrow10.append(column0[z])
            newrow10.append(column1[z])
            newrow10.append(column2[z])
            newrow10.append(column3[z])
            newrow10.append(column4[z])
            newrow10.append(column5[z])
            newrow10.append(column6[z])
            newrow10.append(column7[z])
            newrow10.append(column8[z])
            newrow10.append(column9[z])
        }
        
        SetNewRow0()
        SetNewRow1()
        SetNewRow2()
        SetNewRow3()
        SetNewRow4()
        SetNewRow5()
        SetNewRow6()
        SetNewRow7()
        SetNewRow8()
        SetNewRow9()
        SetNewRow10()

    }


    
    //MARK: - Word Bank
    
    func WordBank(){
        
    }
    
    
    //MARK: - Search Algorithms
    
    //Top to Bottom
    func TopBottom(){
        
    }
    
    //Bottom to Top
    func BottomTop(){
        
    }
    
    //Left to Right (Straight)
    func LRstraight(){
        
    }
    
    //Left to Right (Diagonal UP)
    func LRdiagonalUP(){
        
    }
    
    //Left to Right (Diagonal DOWN)
    func LRdiagonalDOWN(){
        
    }
    
    //Right to Left (Straight)
    func RLstraight(){
        
    }
    
    //Right to Left (Diagonal UP)
    func RLdiagonalUP(){
        
    }
    
    //Right to Left (Diagonal DOWN)
    func RLdiagonalDOWN(){
        
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(textField: UITextField) {
        moveViewUp()
    }
    
    @IBAction func textFieldEndEditing(sender: AnyObject) {
        view.endEditing(true)
        moveViewDown()
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        moveViewDown()
    }
}



extension ViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
            let selectedPhoto = info[UIImagePickerControllerOriginalImage] as UIImage
            let scaledImage = scaleImage(selectedPhoto, maxDimension: 800)
            
            addActivityIndicator()
            
            dismissViewControllerAnimated(true, completion: {
                self.performImageRecognition(scaledImage)
            })
    }
}

