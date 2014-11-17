//
//  ViewController.swift
//  99 Red Balloons
//
//  Created by Jerry on 11/13/14.
//  Copyright (c) 2014 Jerry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var balloonLabel: UILabel!
    
    var balloons: [Balloon] = []
    let length = 99
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        make99Balloons()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func NextBarButtonPressed(sender: UIBarButtonItem) {

        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.image.image = self.balloons[self.index].image
            self.balloonLabel.text = self.balloons[self.index].count.description
            if (self.balloons[self.index].count > 1) {
                self.balloonLabel.text? += " balloons"
            }
            else {
                self.balloonLabel.text? += " balloon"
            }
            
            }, completion: {
                (finished: Bool) -> () in
        })
        index++
        if (index >= length) {index = 0}
    }
    
    func make99Balloons(){
        var lastIndex = -1
        for var i = 0; i < length; i++ {
            var randomIndex = Int(arc4random_uniform(UInt32(5)))
            do{
                randomIndex = Int(arc4random_uniform(UInt32(5)))
            }while randomIndex == lastIndex
            lastIndex = randomIndex
            fetchHelper(randomIndex)
        }
    }
    
    func fetchHelper(var x: Int){
        var balloon = Balloon()
        
        balloon.count = x
        
        switch x{
        case 1:
            balloon.image = UIImage(named: "RedBalloon1.jpg")
        case 2:
            balloon.image = UIImage(named: "RedBalloon2.jpg")
        case 3:
            balloon.image = UIImage(named: "RedBalloon3.jpg")
        case 4:
            balloon.image = UIImage(named: "RedBalloon4.jpg")
        default:
            balloon.image = UIImage(named: "BerlinTVTower.jpg")
            balloon.count = 0
        }
        self.balloons.append(balloon)

    }

}

