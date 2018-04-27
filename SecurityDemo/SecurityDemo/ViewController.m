//
//  ViewController.m
//  SecurityDemo
//
//  Created by 李继峰 on 2018/3/20.
//  Copyright © 2018年 xxx. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "JailBreak.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textfiled;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**
     * UIKeyboardTypeDefault,                // Default type for the current input method.
     UIKeyboardTypeASCIICapable,           // Displays a keyboard which can enter ASCII characters
     UIKeyboardTypeNumbersAndPunctuation,  // Numbers and assorted punctuation.
     UIKeyboardTypeURL,                    // A type optimized for URL entry (shows . / .com prominently).
     UIKeyboardTypeNumberPad,              // A number pad with locale-appropriate digits (0-9, ۰-۹, ०-९, etc.). Suitable for PIN entry.
     UIKeyboardTypePhonePad,               // A phone pad (1-9, *, 0, #, with letters under the numbers).
     UIKeyboardTypeNamePhonePad,           // A type optimized for entering a person's name or phone number.
     UIKeyboardTypeEmailAddress,           // A type optimized for multiple email address entry (shows space @ . prominently).
     UIKeyboardTypeDecimalPad NS_ENUM_AVAILABLE_IOS(4_1),   // A number pad with a decimal point.
     UIKeyboardTypeTwitter NS_ENUM_AVAILABLE_IOS(5_0),      // A type optimized for twitter text entry (easy access to @ #)
     UIKeyboardTypeWebSearch NS_ENUM_AVAILABLE_IOS(7_0),    // A default keyboard type with URL-oriented addition (shows space . prominently).
     UIKeyboardTypeASCIICapableNumberPad NS_ENUM_AVAILABLE_IOS(10_0), // A number pad (0-9) that will always be ASCII digits.
     
     UIKeyboardTypeAlphabet = UIKeyboardTypeASCIICapable, // Deprecated
     */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [JailBreak exitApplicationWhenJailBreak];
    
}


- (IBAction)changeTypeAction:(UIButton *)sender {
    
    
}


@end
