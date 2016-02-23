//
//  ViewController.swift
//  Quiz
//
//  Created by Diego Gomes on 22/02/2016.
//  Copyright © 2016 Nylon. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var btFirst: UIButton!
    @IBOutlet weak var btSecond: UIButton!
    @IBOutlet weak var btTheird: UIButton!
    @IBOutlet weak var imageFeedBack: UIView!
    @IBOutlet weak var lbFeedBack: UILabel!
    @IBOutlet weak var btFeedBack: UIButton!
    
    
    var questions : [Question]! //vetor of asks
    var currentQuestion = 0 // in what ask the player stay
    var grade = 0.0 // calc of nota
    var quizEnded = false //control of quiz stay end or not
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //here I add the vetor of questions
        let q0answers0 = Answer(answer: "Einstein ", isCorrect: true)
        let q0answers1 = Answer(answer: "I and You", isCorrect: false)
        let q0answers2 = Answer(answer: "I don't have idea !", isCorrect: false)
        let question0 = Question(question: "Waves Gravity", strImageFileName: "WaveGravitantion", ansWers: [q0answers0,q0answers1,q0answers2])
        
        let q1answers0 = Answer(answer: "Nikola Tesla ", isCorrect: true)
        let q1answers1 = Answer(answer: "Isaac Newton ", isCorrect: false)
        let q1answers2 = Answer(answer: "SomeOne ", isCorrect: false)
        let question1 = Question(question: "who discovery electricity? ", strImageFileName: "electricity", ansWers: [q1answers0,q1answers1,q1answers2])
        
        let q2answers0 = Answer(answer: "Germany ", isCorrect: true)
        let q2answers1 = Answer(answer: "EUA ", isCorrect: false)
        let q2answers2 = Answer(answer: "Greci", isCorrect: false)
        let question2 = Question(question: "Inglish is a language of origem ?", strImageFileName: "inglesh", ansWers: [q2answers0,q2answers1,q2answers2])
        
        let q3answers0 = Answer(answer: "Rosetta", isCorrect: true)
        let q3answers1 = Answer(answer: "Mage", isCorrect: false)
        let q3answers2 = Answer(answer: "Robertha", isCorrect: false)
        let question3 = Question(question: "How name of Sonda that landed on a comet ?", strImageFileName: "cometa", ansWers: [q3answers0,q3answers1,q3answers2])
        
        let q4answers0 = Answer(answer: "Goku", isCorrect: true)
        let q4answers1 = Answer(answer: "Hulk", isCorrect: false)
        let q4answers2 = Answer(answer: "superman", isCorrect: false)
        let question4  = Question(question: "Who is more Strong ?", strImageFileName: "strong", ansWers: [q4answers0,q4answers1,q4answers2])
        
        let q5answers0 = Answer(answer: "Pietro", isCorrect: true)
        let q5answers1 = Answer(answer: "Flash", isCorrect: false)
        let q5answers2 = Answer(answer: "Usain Bolt", isCorrect: false)
        let question5 = Question(question: "Who is more Fast ?", strImageFileName: "fast", ansWers: [q5answers0,q5answers1,q5answers2])
        
        
        
        questions = [question0,question1,question2,question3,question4,question5]
        
        startQuiz() // started quiz
    }

    //function that started quiz
    func startQuiz(){
        questions.shuffle() //shuffle the asks here
        for(var i=0; i < questions.count;i++){
            questions[i].ansWers.shuffle()
        }
        
        //reset progress of player
        quizEnded = false
        grade = 0.0
        currentQuestion = 0
        
        showQuestion(0) // show first ask
        
    }
    
    //function showQuestion
    func showQuestion(questionid: Int){
        
        btFirst.enabled = true
        btSecond.enabled = true
        btTheird.enabled = true
        
        //update image Label
        lbTitulo.text = questions[questionid].strQuestion
        image.image = questions[questionid].imgQuestion
        btFirst.setTitle(questions[questionid].ansWers[0].strAnswer, forState: UIControlState.Normal)
        btSecond.setTitle(questions[questionid].ansWers[1].strAnswer, forState: UIControlState.Normal)
        btTheird.setTitle(questions[questionid].ansWers[2].strAnswer, forState: UIControlState.Normal)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func awser1(sender: AnyObject) {
        selectAnswer(0)
    }
    
    @IBAction func aswer2(sender: AnyObject) {
        selectAnswer(1)
    }

    @IBAction func aswer3(sender: AnyObject) {
        selectAnswer(2)
    }
    
    //function selectAnswer
    func selectAnswer(aswerid : Int){
        //desabilited buttons of alternativeted of player can't be two time the button
        btFirst.enabled = false
        btSecond.enabled = false
        btTheird.enabled = false
        
        imageFeedBack.hidden = false
        let answer : Answer = questions[currentQuestion].ansWers[aswerid]
        
        if(answer.isCorrect == true){
            grade = grade + 1.0
            lbFeedBack.text = answer.strAnswer + "\n\nCorrect answer"
        }else{
            lbFeedBack.text = answer.strAnswer + "\n\nWrong answer! Try Again !!!"
        }
        
        if(currentQuestion < questions.count-1){
            btFeedBack.setTitle("Next Ask", forState: UIControlState.Normal)
        }else{
            btFeedBack.setTitle("Show My Nota", forState: UIControlState.Normal)
        }
    }
    
    @IBAction func aswerFeedBackBT(sender: AnyObject) {
        //button of aswer
        imageFeedBack.hidden = true
        
        if(quizEnded){
            startQuiz()
        }else{
            nextQuestion()
        }
    }
    
    func nextQuestion(){
        currentQuestion++
        
        if(currentQuestion < questions.count){
            showQuestion(currentQuestion)
        }else{
            endQuiz()
        }
    }
    
    func endQuiz(){
        grade = grade / Double(questions.count) * 100.0
        quizEnded = true
        imageFeedBack.hidden = false
        lbFeedBack.text = "Sua Nota: \(grade)"
        btFeedBack.setTitle("Remake: ", forState: UIControlState.Normal)
    }
}

