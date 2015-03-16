//
//  ViewController.swift
//  Word Search Solver
//
//  Created by Matthew Kiernan on 2/21/15.
//  Copyright (c) 2015 Matt Kiernan. All rights reserved.
//

import UIKit
import Foundation

var rows : Int = 1
var columns : Int = 1
var x = 0
var TempWord : String = ""
var wordbank1 = "ded"
var wordbank2 = ""
var wordbank3 = ""
var wordbank4 = ""
var wordbank5 = ""
var wordbank6 = ""
var wordbank7 = ""
var wordbank8 = ""
var wordbank9 = ""
var wordbank10 = ""
var wordbank11 = ""
var wordbank12 = ""

var isfound1 = false
var isfound2 = false
var isfound3 = false
var isfound4 = false
var isfound5 = false
var isfound6 = false
var isfound7 = false
var isfound8 = false
var isfound9 = false
var isfound10 = false
var isfound11 = false
var isfound12 = false

var bank1 = WordSearch()
var bank2 = WordSearch()
var bank3 = WordSearch()
var bank4 = WordSearch()
var bank5 = WordSearch()
var bank6 = WordSearch()
var bank7 = WordSearch()
var bank8 = WordSearch()
var bank9 = WordSearch()
var bank10 = WordSearch()
var bank11 = WordSearch()
var bank12 = WordSearch()

//var letters = ""
var letters: String = "ELIGHTNINGFERTNBUFFALOCKEABKELINBEFWLRBUOESUKSTREIIWGFOABSAROKEOSFLFEUINAVLKFNUNBFIFABCLHMONSTERAOUTHUNDERBIRD"

var array2D = Array<Array<String>>()

class ViewController: UIViewController, UITextViewDelegate, /*UITextFieldDelegate,*/ UINavigationControllerDelegate {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var topMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var Rows: UITextField!
    @IBOutlet weak var Columns: UITextField!
    @IBOutlet weak var WB1: UITextField!
    @IBOutlet weak var WB2: UITextField!
    @IBOutlet weak var WB3: UITextField!
    @IBOutlet weak var WB4: UITextField!
    @IBOutlet weak var WB5: UITextField!
    @IBOutlet weak var WB6: UITextField!
    @IBOutlet weak var WB7: UITextField!
    @IBOutlet weak var WB8: UITextField!
    @IBOutlet weak var WB9: UITextField!
    @IBOutlet weak var WB10: UITextField!
    @IBOutlet weak var WB11: UITextField!
    @IBOutlet weak var WB12: UITextField!
    
    var activityIndicator:UIActivityIndicatorView!
    var originalTopMargin:CGFloat!
    
    
    //let string : String = "Hello 🐶🐮 🇩🇪"
    //
    //let characters = Array(string)
    //
    //println(characters)
    //// [H, e, l, l, o,  , 🐶, 🐮,  , 🇩🇪]
    //
    //characters[0]
    //characters[4]
    //characters[6]
    
   // var letters: String = "ELIGHTNINGFERTNBUFFALOCKEABKELINBEFWLRBUOESUKSTREIIWGFOABSAROKEOSFLFEUINAVLKFNUNBFIFABCLHMONSTERAOUTHUNDERBIRD"
    //var letters: String = textView.text
    
    func SetArray(){
        var myarray = Array(letters)
var forthis = ""
        rows = Rows.text.toInt()!
        columns = Columns.text.toInt()!
   //     WordBank1 = WordBank1.uppercaseString
   //     var Word1 = Array(WordBank1)
        
    
        for col in 0..<rows {
            array2D.append(Array(count: columns, repeatedValue:""))
        }
   
        for(var i=0; i<columns; i++){
            for(var y=rows-1; y>=0; y--){
                array2D[y][i].append(myarray[myarray.count-1-x])
                x++
            }
        }

        
        for(var i=0; i<rows; i++){
            //for(var y=rows; y>=0; y--){
            for(var y=0; y<columns; y++){
               forthis += "\(array2D[i][y])\t"
             //   println(array2D[y][i])
            }
            forthis += "\n\n"
        }
        
            
       textView.text = forthis
     
    }
    
    func textViewDidEndEditing(textView: UITextView){
     // TODO
    //    letters = textView.text
    }
    
/*
    func textFieldDidEndEditing(WB1: UITextField) {
        wordbank1 = WB1.text
        var WordBank1 = Array(wordbank1)
        if(isfound1==false){
            bank1.FindWordTB(wordbank1)
            println(wordbank1)
            if(bank1.FindWordTB(wordbank1) == false){
                
            }
        }
    }
*/
/*
    func textFieldDidEndEditing(textField: UITextField) {
        // TODO
        println(wordbank1)
        wordbank1 = WB1.text
        wordbank2 = WB2.text
        wordbank3 = WB3.text
        wordbank4 = WB4.text
        wordbank5 = WB5.text
        wordbank6 = WB6.text
        wordbank7 = WB7.text
        wordbank8 = WB8.text
        wordbank9 = WB9.text
        wordbank10 = WB10.text
        wordbank11 = WB11.text
        wordbank12 = WB12.text

        println(wordbank1)
        
        var WordBank1 = Array(wordbank1)
        var WordBank2 = Array(wordbank2)
        var WordBank3 = Array(wordbank3)
        var WordBank4 = Array(wordbank4)
        var WordBank5 = Array(wordbank5)
        var WordBank6 = Array(wordbank6)
        var WordBank7 = Array(wordbank7)
        var WordBank8 = Array(wordbank8)
        var WordBank9 = Array(wordbank9)
        var WordBank10 = Array(wordbank10)
        var WordBank11 = Array(wordbank11)
        var WordBank12 = Array(wordbank12)
        
        if(isfound1==false){
            bank1.FindWordTB(wordbank1)
            println(wordbank1)
            if(bank1.FindWordTB(wordbank1) == false){
                
            }
        }
        
    }
*/
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
        
   //     originalTopMargin = topMarginConstraint.constant
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
     //   moveViewDown()
        
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
        
        ///// ADDED //////
       // letters = textView.text
        SetArray()
        ///// END ADDED////
        
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
         isfound1 = false
         isfound2 = false
         isfound3 = false
         isfound4 = false
         isfound5 = false
         isfound6 = false
         isfound7 = false
         isfound8 = false
         isfound9 = false
         isfound10 = false
         isfound11 = false
         isfound12 = false
//        moveViewDown()
    }
    
    //MARK: - Assign Word Bank Lines To Arrays
    
    
    
   

}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(textField: UITextField) {
//        moveViewUp()
    }
    
    @IBAction func textFieldEndEditing(sender: AnyObject) {
        view.endEditing(true)
//        moveViewDown()
        wordbank1 = WB1.text
        wordbank2 = WB2.text
        wordbank3 = WB3.text
        wordbank4 = WB4.text
        wordbank5 = WB5.text
        wordbank6 = WB6.text
        wordbank7 = WB7.text
        wordbank8 = WB8.text
        wordbank9 = WB9.text
        wordbank10 = WB10.text
        wordbank11 = WB11.text
        wordbank12 = WB12.text
        
        
        var WordBank1 = Array(wordbank1)
        var WordBank2 = Array(wordbank2)
        var WordBank3 = Array(wordbank3)
        var WordBank4 = Array(wordbank4)
        var WordBank5 = Array(wordbank5)
        var WordBank6 = Array(wordbank6)
        var WordBank7 = Array(wordbank7)
        var WordBank8 = Array(wordbank8)
        var WordBank9 = Array(wordbank9)
        var WordBank10 = Array(wordbank10)
        var WordBank11 = Array(wordbank11)
        var WordBank12 = Array(wordbank12)
        
        //MAKE SWITCH STATEMENT
        

        if(isfound1==false){
            isfound1 = FindTheWord(WB1, wordbank: wordbank1, isfound: isfound1, bank: bank1)
        }
        if(isfound2==false){
            isfound2 = FindTheWord(WB2, wordbank: wordbank2, isfound: isfound2, bank: bank2)
        }
        if(isfound3==false){
            isfound3 = FindTheWord(WB3, wordbank: wordbank3, isfound: isfound3, bank: bank3)
        }
        if(isfound4==false){
            isfound4 = FindTheWord(WB4, wordbank: wordbank4, isfound: isfound4, bank: bank4)
        }
        if(isfound5==false){
            isfound5 = FindTheWord(WB5, wordbank: wordbank5, isfound: isfound5, bank: bank5)
        }
        if(isfound6==false){
            isfound6 = FindTheWord(WB6, wordbank: wordbank6, isfound: isfound6, bank: bank6)
        }
        if(isfound7==false){
            isfound7 = FindTheWord(WB7, wordbank: wordbank7, isfound: isfound7, bank: bank7)
        }
        if(isfound8==false){
            isfound8 = FindTheWord(WB8, wordbank: wordbank8, isfound: isfound8, bank: bank8)
        }
        if(isfound9==false){
            isfound9 = FindTheWord(WB9, wordbank: wordbank9, isfound: isfound9, bank: bank9)
        }
        if(isfound10==false){
            isfound10 = FindTheWord(WB10, wordbank: wordbank10, isfound: isfound10, bank: bank10)
        }
        if(isfound11==false){
            isfound11 = FindTheWord(WB11, wordbank: wordbank11, isfound: isfound11, bank: bank11)
        }
        if(isfound12==false){
            isfound12 = FindTheWord(WB12, wordbank: wordbank12, isfound: isfound12, bank: bank12)
        }
 
       
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
 //       moveViewDown()
    }
    
    func FindTheWord(textField: UITextField, wordbank: String, isfound: Bool, bank: WordSearch) -> Bool{
        var y = 0
        var thiswordbank = wordbank
        var thisisfound = isfound
        var thisbank = bank
        
        for(var i = 0; i<9; i++){
            
            switch y{
                
            case 0:
                // bank1.FindWordLR(wordbank1)
                y = bank.FindWordLR(thiswordbank)
                if(y==10){
                    thisisfound = true
                    i = 10
                }
                
            case 1:
                //bank1.FindWordRL(wordbank1)
                y = bank.FindWordRL(thiswordbank)
                if(y==10){
                    thisisfound = true
                    i = 10
                }
                
            case 2:
                //bank1.FindWordTB(wordbank1)
                y = bank.FindWordTB(thiswordbank)
                if(y==10){
                    thisisfound = true
                    i = 10
                }
                
            case 3:
                //bank1.FindWordBT(wordbank1)
                y = bank.FindWordBT(thiswordbank)
                if(y==10){
                    thisisfound = true
                    i = 10
                }
                
            case 4:
                //bank1.FindWordLRDiagUP(wordbank1)
                y = bank.FindWordLRDiagUP(thiswordbank)
                if(y==10){
                    thisisfound = true
                    i = 10
                }
                
            case 5:
                //bank1.FindWordRLDiagDOWN(wordbank1)
                y = bank.FindWordRLDiagDOWN(thiswordbank)
                if(y==10){
                    thisisfound = true
                    i = 10
                }
                
            case 6:
                // bank1.FindWordLRDiagDOWN(wordbank1)
                y = bank.FindWordLRDiagDOWN(thiswordbank)
                if(y==10){
                    thisisfound = true
                    i = 10
                }
                
            case 7:
                // bank1.FindWordRLDiagUP(wordbank1)
                y = bank.FindWordRLDiagUP(thiswordbank)
                if(y==10){
                    thisisfound = true
                    i = 10
                }
                
            case 8:
                i = 10
                thisisfound = false
                //CHANGE COLOR OF TEXT FIELD TO **RED**
                if(thiswordbank != ""){
                    textField.backgroundColor = UIColor.redColor()
                }
                
            case 10:
                i = 10
                thisisfound = true
                
            default:
                i = 10
                thisisfound = false
            }
            
            if(y==10){
                //CHANGE COLOR OF TEXT FIELD TO **GREEN**
                textField.backgroundColor = UIColor.greenColor()
            }
            
        }
        return thisisfound
    }

}

func FindIt(number:Int){
   
    
    
}

//func FindTheWord(textField: UITextField){
//    var y = 0
//    for(var i = 0; i<9; i++){
//
//        switch y{
//
//        case 0:
//           // bank1.FindWordLR(wordbank1)
//            y = bank1.FindWordLR(wordbank1)
//            if(y==10){
//                isfound1 = true
//                i = 10
//            }
//            
//        case 1:
//            //bank1.FindWordRL(wordbank1)
//            y = bank1.FindWordRL(wordbank1)
//            if(y==10){
//                isfound1 = true
//                i = 10
//            }
//            
//        case 2:
//            //bank1.FindWordTB(wordbank1)
//            y = bank1.FindWordTB(wordbank1)
//            if(y==10){
//                isfound1 = true
//                i = 10
//            }
//            
//        case 3:
//            //bank1.FindWordBT(wordbank1)
//            y = bank1.FindWordBT(wordbank1)
//            if(y==10){
//                isfound1 = true
//                i = 10
//            }
//            
//        case 4:
//            //bank1.FindWordLRDiagUP(wordbank1)
//            y = bank1.FindWordLRDiagUP(wordbank1)
//            if(y==10){
//                isfound1 = true
//                i = 10
//            }
//            
//        case 5:
//            //bank1.FindWordRLDiagDOWN(wordbank1)
//            y = bank1.FindWordRLDiagDOWN(wordbank1)
//            if(y==10){
//                isfound1 = true
//                i = 10
//            }
//            
//        case 6:
//           // bank1.FindWordLRDiagDOWN(wordbank1)
//            y = bank1.FindWordLRDiagDOWN(wordbank1)
//            if(y==10){
//                isfound1 = true
//                i = 10
//            }
//            
//        case 7:
//           // bank1.FindWordRLDiagUP(wordbank1)
//            y = bank1.FindWordRLDiagUP(wordbank1)
//            if(y==10){
//                isfound1 = true
//                i = 10
//            }
//            
//        case 8:
//            i = 10
//            isfound1 = false
//            //CHANGE COLOR OF TEXT FIELD TO **RED**
//            
//        case 10:
//            i = 10
//            isfound1 = true
//            
//        default:
//            i = 10
//        }
//        
//        if(y==10){
//            //CHANGE COLOR OF TEXT FIELD TO **GREEN**
//        }
//        
//    }
//}


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


