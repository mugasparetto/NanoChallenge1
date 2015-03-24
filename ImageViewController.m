//
//  ImageViewController.m
//  TesteImagemBotoes
//
//  Created by Murilo Gasparetto on 20/03/15.
//  Copyright (c) 2015 Murilo Gasparetto. All rights reserved
//

#import "ImageViewController.h"

@interface ImageViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *mario;
@property (nonatomic) CGFloat anglo;
@property CGSize startSize;

@end

@implementation ImageViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        self.anglo = 0;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.mario.backgroundColor = [UIColor redColor];
    self.startSize = self.mario.frame.size;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)praBaixo:(id)sender {
    if (self.mario.frame.origin.y < 300) {
    [self.mario setFrame:CGRectMake(self.mario.frame.origin.x, self.mario.frame.origin.y + 20, self.mario.frame.size.width, self.mario.frame.size.height)];
       [self.mario setBounds:CGRectMake(0, 0, self.startSize.width, self.startSize.height)];
    }
}

- (IBAction)praCima:(id)sender{
    if (self.mario.frame.origin.y > 30) {
        [self.mario setFrame:CGRectMake(self.mario.frame.origin.x, self.mario.frame.origin.y-20, self.mario.frame.size.width, self.mario.frame.size.height)];
    [self.mario setBounds:CGRectMake(0, 0, self.startSize.width, self.startSize.height)];
    }
}

- (IBAction)praDireita:(id)sender{
    if (self.mario.frame.origin.x < 180) {
    [self.mario setFrame:CGRectMake(self.mario.frame.origin.x+20, self.mario.frame.origin.y, self.mario.frame.size.width, self.mario.frame.size.height)];
    [self.mario setBounds:CGRectMake(0, 0, self.startSize.width, self.startSize.height)];
    }
}

- (IBAction)praEsquerda:(id)sender{
    if (self.mario.frame.origin.x > 30) {
    [self.mario setFrame:CGRectMake(self.mario.frame.origin.x-20, self.mario.frame.origin.y, self.mario.frame.size.width, self.mario.frame.size.height)];
    [self.mario setBounds:CGRectMake(0, 0, self.startSize.width, self.startSize.height)];
    }
}

- (IBAction)rotacaoHorario:(id)sender{
    self.anglo = self.anglo + .34906585;
    self.mario.transform = CGAffineTransformMakeRotation(self.anglo);
}

- (IBAction)rotacaoAntiHorario:(id)sender{
    self.anglo = self.anglo - .34906585;
    self.mario.transform = CGAffineTransformMakeRotation(self.anglo);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
