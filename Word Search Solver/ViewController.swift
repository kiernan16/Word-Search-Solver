//
//  ViewController.swift
//  Word Search Solver
//
//  Created by Matthew Kiernan on 2/21/15.
//  Copyright (c) 2015 Matt Kiernan. All rights reserved.
//

import UIKit
import Foundation

var rows = 11
var columns = 10
var x = 0
var TempWord : String = ""
var WordBank1 = "Buffalo"
var array2D = Array<Array<String>>()

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
    var wordbank11 = []
    var wordbank12 = []
    
   // var rows = 11   ///////
 //   var columns = 10    ///////////
 //   var x = 0
    
 //   var TempWord : String = ""
 //   var WordBank1 = "Buffalo"
    
    let letters: String = "ELIGHTNINGFERTNBUFFALOCKEABKELINBEFWLRBUOESUKSTREIIWGFOABSAROKEOSFLFEUINAVLKFNUNBFIFABCLHMONSTERAOUTHUNDERBIRD"
    
    func SetArray(){
        let myarray = Array(letters)

    
        WordBank1 = WordBank1.uppercaseString
        var Word1 = Array(WordBank1)
    
    
    
  //      var array2D = Array<Array<String>>()
        for col in 0..<rows {
            array2D.append(Array(count: columns, repeatedValue:""))
        }
    
    
    
    
        for(var i=0; i<columns; i++){
            for(var y=rows-1; y>=0; y--){
                array2D[y][i].append(myarray[myarray.count-1-x])
                x++
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SetArray()
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
    

    
    //MARK: - Word Bank
    
    func WordBank(){
        
    }
    
    
    //MARK: - Search Algorithms
   

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

class WordSearch{
   // var rows = 11
    var columns = 10
    var x = 0
    var TempWord = ""
    
    func FindWordLR(WordBank : String){
        var z = 0
        if(WordBank != ""){
            var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var x = 0; x < rows; x++){
                for(var y = 0; ((y<columns)&&((TempWord != "") || !(y>columns-word2search.count))); y++){
                    if(array2D[x][y] == String(word2search[z])){
                        TempWord.append(word2search[z])
                        //  TempWord += word2search[z]
                        z++
                        // println(array2D[x][y])
                    }
                    else{
                        if(y>0){
                            if(array2D[x][y] == array2D[x][y-1]){
                            }}
                        else{
                            TempWord = ""
                            z = 0
                        }
                    }
                    if (TempWord == TheWordBank)
                    {
                        println("Found Word: \(TempWord)")
                        x = 1000
                        y = 1000
                        z = 0
                        TempWord = ""
                        isfound = true
                        
                    }
                }
            }
            if(isfound == false){
                println("\(WordBank.uppercaseString) could not be found")
            }
            word2search.removeAll(keepCapacity: false)
            z = 0
            TempWord = ""
        }}
    func FindWordRL(WordBank : String){
        var z = 0
        if(WordBank != ""){
            var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var x = 0; x < rows; x++){
                for(var y = 0; ((y<columns)&&((TempWord != "") || !(y>columns-word2search.count))); y++){
                    if(array2D[x][y] == String(word2search[word2search.count-1-z])){
                        TempWord.append(word2search[z])
                        //  TempWord += word2search[z]
                        z++
                        // println(array2D[x][y])
                    }
                    else{
                        if(y>0){
                            if(array2D[x][y] == array2D[x][y-1]){
                            }}
                        else{
                            TempWord = ""
                            z = 0
                        }
                        println(array2D[x][y])
                    }
                    if (TempWord == TheWordBank)
                    {
                        println("Found Word: \(TempWord)")
                        x = 1000
                        y = 1000
                        z = 0
                        TempWord = ""
                        isfound = true
                        
                    }
                }
            }
            if(isfound == false){
                println("\(WordBank.uppercaseString) could not be found")
            }
            word2search.removeAll(keepCapacity: false)
            z = 0
            TempWord = ""
        }
    }
    func FindWordTB(WordBank : String){
        var z = 0
        if(WordBank != ""){
            var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var y = 0; y < columns; y++){
                for(var x = 0; /*x < columns*/   ((x<rows)&&((TempWord != "") || !(x>rows-word2search.count))); x++){
                    if(array2D[x][y] == String(word2search[z])){
                        TempWord.append(word2search[z])
                        //  TempWord += word2search[z]
                        z++
                        println(array2D[x][y])
                    }
                    else{
                        if(x>0){
                            if(array2D[x][y] == array2D[x-1][y]){
                            }}
                        else{
                            TempWord = ""
                            z = 0
                        }
                        println(array2D[x][y])
                    }
                    if (TempWord == TheWordBank)
                    {
                        println("Found Word: \(TempWord)")
                        x = 1000
                        y = 1000
                        z = 0
                        TempWord = ""
                        isfound = true
                        
                    }
                }
            }
            if(isfound == false){
                println("\(WordBank.uppercaseString) could not be found")
            }
            word2search.removeAll(keepCapacity: false)
            z = 0
            TempWord = ""
        }
    }
    func FindWordBT(WordBank : String){
        var z = 0
        if(WordBank != ""){
            var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var y = 0; y < columns; y++){
                for(var x = 0; /*x < columns*/   ((x<rows)&&((TempWord != "") || !(x>rows-word2search.count))); x++){
                    if(array2D[x][y] == String(word2search[word2search.count-1-z])){
                        TempWord.append(word2search[z])
                        //  TempWord += word2search[z]
                        z++
                        println(array2D[x][y])
                    }
                    else{
                        if(x>0){
                            if(array2D[x][y] == array2D[x-1][y]){
                            }}
                        else{
                            TempWord = ""
                            z = 0
                        }
                        println(array2D[x][y])
                    }
                    if (TempWord == TheWordBank)
                    {
                        println("Found Word: \(TempWord)")
                        x = 1000
                        y = 1000
                        z = 0
                        TempWord = ""
                        isfound = true
                        
                    }
                }
            }
            if(isfound == false){
                println("\(WordBank.uppercaseString) could not be found")
            }
            word2search.removeAll(keepCapacity: false)
            z = 0
            TempWord = ""
        }
        
    }
    func FindWordLRDiagUP(WordBank : String){
        var z = 0
        var Temp1 = 0
        var Temp2 = 0
        var stop = false
        
        if(WordBank != ""){
            var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var y = 0; y < columns; y++){ //ADDED
                //   for(var x = 1; x < columns; x++){
                for(var x = rows-1; ((x >= word2search.count-1)&&(x<250)); x--){
                    Temp1 = x
                    Temp2 = y
                    
                    println("[\(x)][\(y)]")
                    
                    println(array2D[x][y])
                    
                    if(isfound==false){
                        if(array2D[x][y] == String(word2search[z])){
                            TempWord.append(word2search[z])
                            z++
                            stop = false
                            println("[\(x)][\(y)]")
                            //                        println(y)
                            
                            if (TempWord == TheWordBank){
                                println("Found Word: \(TempWord)")
                                x = 1000
                                y = 1000
                                z = 0
                                TempWord = ""
                                isfound = true
                            }
                            if(isfound==false){
                                for(x; (((x>0)&&(z<word2search.count))&&(stop==false)); x){
                                    x--
                                    ++y
                                    println(x)
                                    println(y)
                                    if((x >= 0) && (y < columns)){
                                        // if(y < columns){
                                        if(array2D[x][y] == String(word2search[z])){
                                            TempWord.append(word2search[z])
                                            z++
                                        }
                                        else{
                                            x = Temp1
                                            y = Temp2
                                            z = 0
                                            TempWord = ""
                                            println(array2D[x][y])
                                            stop = true
                                        }
                                    }
                                    else{
                                        x = Temp1
                                        y = Temp2
                                        z = 0
                                        TempWord = ""
                                        println(array2D[x][y])
                                        stop = true
                                    }
                                    
                                    if (TempWord == TheWordBank){
                                        println("Found Word: \(TempWord)")
                                        x = 1000
                                        y = 1000
                                        z = 0
                                        TempWord = ""
                                        isfound = true
                                        stop = true
                                        
                                    }
                                }
                            }
                        }
                            
                        else{
                            TempWord = ""
                            z = 0
                        }
                    }
                    
                }
            }
            
            if(isfound == false){
                println("\(WordBank.uppercaseString) could not be found")
            }
            word2search.removeAll(keepCapacity: false)
            z = 0
            TempWord = ""
        }
        
    }
    func FindWordLRDiagDOWN(WordBank : String){
        var z = 0
        var Temp1 = 0
        var Temp2 = 0
        var stop = false
        
        if(WordBank != ""){
            var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var y = 0; y < columns; y++){ //ADDED
                //   for(var x = 1; x < columns; x++){
                for(var x = 0; ((x <= rows - word2search.count)&&(x<250)); x++){
                    Temp1 = x
                    Temp2 = y
                    
                    println("[\(x)][\(y)]")
                    
                    println(array2D[x][y])
                    
                    if(isfound==false){
                        if(array2D[x][y] == String(word2search[z])){
                            TempWord.append(word2search[z])
                            z++
                            stop = false
                            println("[\(x)][\(y)]")
                            //                        println(y)
                            
                            if (TempWord == TheWordBank){
                                println("Found Word: \(TempWord)")
                                x = 1000
                                y = 1000
                                z = 0
                                TempWord = ""
                                isfound = true
                            }
                            if(isfound==false){
                                for(x; (((x<rows)&&(z<word2search.count))&&(stop==false)); x){
                                    x++
                                    ++y
                                    println(x)
                                    println(y)
                                    if((x < rows) && (y < columns)){
                                        // if(y < columns){
                                        if(array2D[x][y] == String(word2search[z])){
                                            TempWord.append(word2search[z])
                                            z++
                                        }
                                        else{
                                            x = Temp1
                                            y = Temp2
                                            z = 0
                                            TempWord = ""
                                            println(array2D[x][y])
                                            stop = true
                                        }
                                    }
                                    else{
                                        x = Temp1
                                        y = Temp2
                                        z = 0
                                        TempWord = ""
                                        println(array2D[x][y])
                                        stop = true
                                    }
                                    
                                    if (TempWord == TheWordBank){
                                        println("Found Word: \(TempWord)")
                                        x = 1000
                                        y = 1000
                                        z = 0
                                        TempWord = ""
                                        isfound = true
                                        stop = true
                                        
                                    }
                                }
                            }
                        }
                            
                        else{
                            TempWord = ""
                            z = 0
                        }
                    }
                    
                }
            }
            
            if(isfound == false){
                println("\(WordBank.uppercaseString) could not be found")
            }
            word2search.removeAll(keepCapacity: false)
            z = 0
            TempWord = ""
        }
    }
    func FindWordRLDiagUP(WordBank : String){
        var z = 0
        var Temp1 = 0
        var Temp2 = 0
        var stop = false
        
        if(WordBank != ""){
            var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var y = 0; y < columns; y++){ //ADDED
                //   for(var x = 1; x < columns; x++){
                for(var x = 0; ((x <= rows - word2search.count)&&(x<250)); x++){
                    Temp1 = x
                    Temp2 = y
                    
                    println("[\(x)][\(y)]")
                    
                    println(array2D[x][y])
                    
                    if(isfound==false){
                        if(array2D[x][y] == String(word2search[word2search.count-1-z])){
                            TempWord.append(word2search[z])
                            z++
                            stop = false
                            println("[\(x)][\(y)]")
                            //                        println(y)
                            
                            if (TempWord == TheWordBank){
                                println("Found Word: \(TempWord)")
                                x = 1000
                                y = 1000
                                z = 0
                                TempWord = ""
                                isfound = true
                            }
                            if(isfound==false){
                                for(x; (((x<rows)&&(z<word2search.count))&&(stop==false)); x){
                                    x++
                                    ++y
                                    println(x)
                                    println(y)
                                    if((x < rows) && (y < columns)){
                                        // if(y < columns){
                                        if(array2D[x][y] == String(word2search[word2search.count-1-z])){
                                            TempWord.append(word2search[z])
                                            z++
                                        }
                                        else{
                                            x = Temp1
                                            y = Temp2
                                            z = 0
                                            TempWord = ""
                                            println(array2D[x][y])
                                            stop = true
                                        }
                                    }
                                    else{
                                        x = Temp1
                                        y = Temp2
                                        z = 0
                                        TempWord = ""
                                        println(array2D[x][y])
                                        stop = true
                                    }
                                    
                                    if (TempWord == TheWordBank){
                                        println("Found Word: \(TempWord)")
                                        x = 1000
                                        y = 1000
                                        z = 0
                                        TempWord = ""
                                        isfound = true
                                        stop = true
                                        
                                    }
                                }
                            }
                        }
                            
                        else{
                            TempWord = ""
                            z = 0
                        }
                    }
                    
                }
            }
            
            if(isfound == false){
                println("\(WordBank.uppercaseString) could not be found")
            }
            word2search.removeAll(keepCapacity: false)
            z = 0
            TempWord = ""
        }
    }
    func FindWordRLDiagDOWN(WordBank : String){
        var z = 0
        var Temp1 = 0
        var Temp2 = 0
        var stop = false
        
        if(WordBank != ""){
            var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var y = 0; y < columns; y++){ //ADDED
                //   for(var x = 1; x < columns; x++){
                for(var x = rows-1; ((x >= word2search.count-1)&&(x<250)); x--){
                    Temp1 = x
                    Temp2 = y
                    
                    println("[\(x)][\(y)]")
                    
                    println(array2D[x][y])
                    
                    if(isfound==false){
                        if(array2D[x][y] == String(word2search[word2search.count-1-z])){
                            TempWord.append(word2search[z])
                            z++
                            stop = false
                            println("[\(x)][\(y)]")
                            //                        println(y)
                            
                            if (TempWord == TheWordBank){
                                println("Found Word: \(TempWord)")
                                x = 1000
                                y = 1000
                                z = 0
                                TempWord = ""
                                isfound = true
                            }
                            if(isfound==false){
                                for(x; (((x>0)&&(z<word2search.count))&&(stop==false)); x){
                                    x--
                                    ++y
                                    println(x)
                                    println(y)
                                    if((x >= 0) && (y < columns)){
                                        // if(y < columns){
                                        if(array2D[x][y] == String(word2search[word2search.count-1-z])){
                                            TempWord.append(word2search[z])
                                            z++
                                        }
                                        else{
                                            x = Temp1
                                            y = Temp2
                                            z = 0
                                            TempWord = ""
                                            println(array2D[x][y])
                                            stop = true
                                        }
                                    }
                                    else{
                                        x = Temp1
                                        y = Temp2
                                        z = 0
                                        TempWord = ""
                                        println(array2D[x][y])
                                        stop = true
                                    }
                                    
                                    if (TempWord == TheWordBank){
                                        println("Found Word: \(TempWord)")
                                        x = 1000
                                        y = 1000
                                        z = 0
                                        TempWord = ""
                                        isfound = true
                                        stop = true
                                        
                                    }
                                }
                            }
                        }
                            
                        else{
                            TempWord = ""
                            z = 0
                        }
                    }
                    
                }
            }
            
            if(isfound == false){
                println("\(WordBank.uppercaseString) could not be found")
            }
            word2search.removeAll(keepCapacity: false)
            z = 0
            TempWord = ""
        }
    }
}

