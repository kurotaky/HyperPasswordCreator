//
//  ViewController.swift
//  HyperPasswordCreator
//
//  Created by usr0600244 on 2015/06/03.
//  Copyright (c) 2015年 mo-fu.org. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    private let characters = Array("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

    @IBOutlet weak var randomPasswordTextField: NSTextField!
    @IBOutlet weak var passwordLength: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func buttonDidPush(sender: NSButton) {
        var password = ""
        password = generatePassword(passwordLength.integerValue)
        var pasteBoard = NSPasteboard.generalPasteboard()
        pasteBoard.clearContents()
        pasteBoard.writeObjects([password])
        randomPasswordTextField.stringValue = password
    }
    
    func generatePassword(length: Int) -> String {
        var str = ""
        for i in 0..<length {
           str.append(generateCharacter())
        }
        return str
    }
    
    func generateCharacter() -> Character {
        var index = Int(arc4random() % 58 + 1)
        return characters[index]
    }
    
    @IBAction func sliderDidChange(sender: NSSlider) {
        passwordLength.integerValue = sender.integerValue
    }
}

