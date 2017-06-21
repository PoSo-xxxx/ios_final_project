//
//  guess.swift
//  00357112_final project
//
//  Created by user_14 on 2017/6/20.
//  Copyright © 2017年 Elrick. All rights reserved.
//

import UIKit

class guess: UIViewController {
    
    @IBOutlet weak var real_answer: UILabel!
    @IBOutlet weak var b_count: UILabel!
    @IBOutlet weak var a_count: UILabel!
    @IBOutlet weak var answering: UITextField!
    
    var an_record = [String]()
    var a_record = [String]()
    var b_record = [String]()
    
    var q0:Int = 0; var q1:Int = 0; var q2:Int = 0; var q3:Int = 0
    var question:String = "";
    
    var ans0:Int = 0; var ans1:Int = 0; var ans2:Int = 0; var ans3:Int = 0
    var a:Int = 0; var b:Int = 0
    
override func viewDidLoad() {
        super.viewDidLoad()
    
    an_record.removeAll()
    a_record.removeAll()
    b_record.removeAll()
    
        q0 = Int(UInt32(arc4random_uniform(9)+1))
    
        q1 = Int(UInt32(arc4random_uniform(9)+1))
    while q1 == q0{
        q1 = Int(UInt32(arc4random_uniform(9)+1))
    }
    
        q2 = Int(UInt32(arc4random_uniform(9)+1))
    while q2 == q1 || q2 == q0{
        q2 = Int(UInt32(arc4random_uniform(9)+1))
    }
    
        q3 = Int(UInt32(arc4random_uniform(9)+1))
    while q3 == q2 || q3 == q1 || q3 == q0{
        q3 = Int(UInt32(arc4random_uniform(9)+1))

    }
    
    question = String(q0 * 1000 + q1 * 100 + q2 * 10 + q3)
        // Do any additional setup after loading the view.
    }

    @IBAction func cheat(_ sender: Any){
        real_answer.text = question
    }
    
    @IBAction func go(_ sender: Any){
        let answer = answering.text
        var temp_answer = Int(answer!)
        a = 0; b = 0;

        ans3 = temp_answer! % 10; temp_answer = temp_answer! / 10
        ans2 = temp_answer! % 10; temp_answer = temp_answer! / 10
        ans1 = temp_answer! % 10; temp_answer = temp_answer! / 10
        ans0 = temp_answer! % 10;
        
        if ans0 == q0{
            a = a + 1
        }
        if ans1 == q1{
            a = a + 1
        }
        if ans2 == q2{
            a = a + 1
        }
        if ans3 == q3{
            a = a + 1
        }
        
        if ans0 == q1 || ans0 == q2 || ans0 == q3{
            b = b + 1
        }
        if ans1 == q0 || ans1 == q2 || ans1 == q3{
            b = b + 1
        }
        if ans2 == q1 || ans2 == q0 || ans2 == q3{
            b = b + 1
        }
        if ans3 == q1 || ans3 == q2 || ans3 == q0{
            b = b + 1
        }
        
        a_count.text = String(a)
        b_count.text = String(b)
        
        an_record.append(answer!)
        a_record.append(String(a))
        b_record.append(String(b))
        
        if a == 4{
            let controller = self.storyboard?.instantiateViewController(withIdentifier:"congratulation_iden")
            
            self.present(controller!, animated: true, completion:
                nil)
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "to_record"{
            let next = segue.destination as! record
            next.an_record = an_record
            next.a_record = a_record
            next.b_record = b_record
            
        } else if segue.identifier == "to_congratulation"{
            let next = segue.destination as! congratulation
            next.guess_controller = self
            //讓下個controller(can)持有這個controller(guess)
            //並可以直接修改這個controller裡的資料
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
