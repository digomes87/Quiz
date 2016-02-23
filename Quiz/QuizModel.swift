//
//  QuizModel.swift
//  Quiz
//
//  Created by Diego Gomes on 23/02/2016.
//  Copyright © 2016 Nylon. All rights reserved.
//

import Foundation
import UIKit

class Question {
    
    var strQuestion : String!
    var imgQuestion : UIImage!
    var ansWers :  [Answer]!
    
    
    //function of inicialazi the object the class answers
    
    init(question : String ,strImageFileName : String, ansWers : [Answer]){
        self.strQuestion = question
        self.imgQuestion = UIImage(named: strImageFileName)
        self.ansWers = ansWers
        
    }
    
}

class Answer {
    var strAnswer : String!
    var isCorrect : Bool!
    
    //function for inicializa class Answer
    init(answer: String, isCorrect : Bool){
        self.strAnswer = answer
        self.isCorrect = isCorrect
    }
}