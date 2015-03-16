//
//  WordSearchClass.swift
//  Word Search Solver
//
//  Created by Matthew Kiernan on 3/10/15.
//  Copyright (c) 2015 Matt Kiernan. All rights reserved.
//

import Foundation

class WordSearch{
    
    //HAVE ALL THESE RETURN AN INT DEPENDING ON isfound
    func FindWordLR(WordBank : String) -> Int {
        var z = 0
        var isfound : Bool = false
        if(WordBank != ""){
            //var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var x = 0; x < rows; x++){
                for(var y = 0; ((y<columns)&&((TempWord != "") || !(y>columns-word2search.count))); y++){
                    if(array2D[x][y] == String(word2search[z])){
                        TempWord.append(word2search[z])
                        z++
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
        }
        if(isfound == true){
            return 10
        }
        else{
            return 1
        }
    }
    func FindWordRL(WordBank : String) -> Int{
        var z = 0
        var isfound : Bool = false
        if(WordBank != ""){
            //var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var x = 0; x < rows; x++){
                for(var y = 0; ((y<columns)&&((TempWord != "") || !(y>columns-word2search.count))); y++){
                    if(array2D[x][y] == String(word2search[word2search.count-1-z])){
                        TempWord.append(word2search[z])
                        z++
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
        }
        if(isfound == true){
            return 10
        }
        else{
            return 2
        }
    }
    func FindWordTB(WordBank : String) -> Int{
        var z = 0
        var isfound : Bool = false
        if(WordBank != ""){
            //var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var y = 0; y < columns; y++){
                for(var x = 0; /*x < columns*/   ((x<rows)&&((TempWord != "") || !(x>rows-word2search.count))); x++){
                    if(array2D[x][y] == String(word2search[z])){
                        TempWord.append(word2search[z])
                        z++
                    }
                    else{
                        if(x>0){
                            if(array2D[x][y] == array2D[x-1][y]){
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
        }
        if(isfound == true){
            return 10
        }
        else{
            return 3
        }
    }
    func FindWordBT(WordBank : String) -> Int{
        var z = 0
        var isfound : Bool = false
        if(WordBank != ""){
            //var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var y = 0; y < columns; y++){
                for(var x = 0; /*x < columns*/   ((x<rows)&&((TempWord != "") || !(x>rows-word2search.count))); x++){
                    if(array2D[x][y] == String(word2search[word2search.count-1-z])){
                        TempWord.append(word2search[z])
                        z++
                    }
                    else{
                        if(x>0){
                            if(array2D[x][y] == array2D[x-1][y]){
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
        }
        if(isfound == true){
            return 10
        }
        else{
            return 4
        }
    }
    func FindWordLRDiagUP(WordBank : String) -> Int{
        var z = 0
        var Temp1 = 0
        var Temp2 = 0
        var stop = false
        var isfound : Bool = false
        if(WordBank != ""){
            //var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var y = 0; y < columns; y++){
                for(var x = rows-1; ((x >= word2search.count-1)&&(x<250)); x--){
                    Temp1 = x
                    Temp2 = y
                    
                    
                    
                    if(isfound==false){
                        if(array2D[x][y] == String(word2search[z])){
                            TempWord.append(word2search[z])
                            z++
                            stop = false
                            
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
                                    if((x >= 0) && (y < columns)){
                                        if(array2D[x][y] == String(word2search[z])){
                                            TempWord.append(word2search[z])
                                            z++
                                        }
                                        else{
                                            x = Temp1
                                            y = Temp2
                                            z = 0
                                            TempWord = ""
                                            stop = true
                                        }
                                    }
                                    else{
                                        x = Temp1
                                        y = Temp2
                                        z = 0
                                        TempWord = ""
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
        if(isfound == true){
            return 10
        }
        else{
            return 5
        }
    }
    func FindWordLRDiagDOWN(WordBank : String) -> Int{
        var z = 0
        var Temp1 = 0
        var Temp2 = 0
        var stop = false
        var isfound : Bool = false
        if(WordBank != ""){
            //var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var y = 0; y < columns; y++){ //ADDED
                //   for(var x = 1; x < columns; x++){
                for(var x = 0; ((x <= rows - word2search.count)&&(x<250)); x++){
                    Temp1 = x
                    Temp2 = y
                    
                    if(isfound==false){
                        if(array2D[x][y] == String(word2search[z])){
                            TempWord.append(word2search[z])
                            z++
                            stop = false
                            
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
                                    if((x < rows) && (y < columns)){
                                        if(array2D[x][y] == String(word2search[z])){
                                            TempWord.append(word2search[z])
                                            z++
                                        }
                                        else{
                                            x = Temp1
                                            y = Temp2
                                            z = 0
                                            TempWord = ""
                                            stop = true
                                        }
                                    }
                                    else{
                                        x = Temp1
                                        y = Temp2
                                        z = 0
                                        TempWord = ""
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
        if(isfound == true){
            return 10
        }
        else{
            return 7
        }
    }
    func FindWordRLDiagUP(WordBank : String) -> Int{
        var z = 0
        var Temp1 = 0
        var Temp2 = 0
        var stop = false
        var isfound : Bool = false
        if(WordBank != ""){
            //var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var y = 0; y < columns; y++){ //ADDED
                //   for(var x = 1; x < columns; x++){
                for(var x = 0; ((x <= rows - word2search.count)&&(x<250)); x++){
                    Temp1 = x
                    Temp2 = y
                    
                    if(isfound==false){
                        if(array2D[x][y] == String(word2search[word2search.count-1-z])){
                            TempWord.append(word2search[z])
                            z++
                            stop = false
                            
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
                                            stop = true
                                        }
                                    }
                                    else{
                                        x = Temp1
                                        y = Temp2
                                        z = 0
                                        TempWord = ""
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
        if(isfound == true){
            return 10
        }
        else{
            return 8
        }
    }
    func FindWordRLDiagDOWN(WordBank : String) -> Int{
        var z = 0
        var Temp1 = 0
        var Temp2 = 0
        var stop = false
        var isfound : Bool = false
        if(WordBank != ""){
            //var isfound : Bool = false
            var TheWordBank = WordBank.uppercaseString
            var word2search = Array(TheWordBank)
            
            for(var y = 0; y < columns; y++){ //ADDED
                //   for(var x = 1; x < columns; x++){
                for(var x = rows-1; ((x >= word2search.count-1)&&(x<250)); x--){
                    Temp1 = x
                    Temp2 = y
                    
                    if(isfound==false){
                        if(array2D[x][y] == String(word2search[word2search.count-1-z])){
                            TempWord.append(word2search[z])
                            z++
                            stop = false
                            
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
                                            stop = true
                                        }
                                    }
                                    else{
                                        x = Temp1
                                        y = Temp2
                                        z = 0
                                        TempWord = ""
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
        if(isfound == true){
            return 10
        }
        else{
            return 6
        }
    }
}
