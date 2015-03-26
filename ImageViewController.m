//
//  ImageViewController.m
//  TesteImagemBotoes
//
//  Created by Murilo Gasparetto on 20/03/15.
//  Copyright (c) 2015 Murilo Gasparetto. All rights reserved.
//

#import "ImageViewController.h"
#import "EstatisticaViewController.h"
#import "contadorDireita.h"
#import "contadorEsquerda.h"
#import "contadorBaixo.h"
#import "contadorCima.h"
#import "contadorAngle.h"

@interface ImageViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *mario;
@property (nonatomic) CGFloat anglo;
@property CGSize startSize;

@property (nonatomic) contadorDireita *objetoContadorDireto;
@property (nonatomic) contadorEsquerda *objetoContadorEsquerda;
@property (nonatomic) contadorBaixo *objetoContadorBaixo;
@property (nonatomic) contadorCima *objetoContadorCima;
@property (nonatomic) contadorAngle *objetoContadorAngle;

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
    self.objetoContadorEsquerda = [contadorEsquerda instance];
    self.objetoContadorDireto = [contadorDireita instance];
    self.objetoContadorCima = [contadorCima instance];
    self.objetoContadorBaixo = [contadorBaixo instance];
    self.objetoContadorAngle = [contadorAngle instance];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)praBaixo:(id)sender {
<<<<<<< Updated upstream
    if (self.mario.frame.origin.y < 240) {
=======
    if (self.mario.frame.origin.y < 280) {
>>>>>>> Stashed changes
    [self.mario setFrame:CGRectMake(self.mario.frame.origin.x, self.mario.frame.origin.y + 20, self.mario.frame.size.width, self.mario.frame.size.height)];
       [self.mario setBounds:CGRectMake(0, 0, self.startSize.width, self.startSize.height)];
        [self.objetoContadorBaixo maisUm];
    }
}

- (IBAction)praCima:(id)sender{
    if (self.mario.frame.origin.y > 30) {
        [self.mario setFrame:CGRectMake(self.mario.frame.origin.x, self.mario.frame.origin.y-20, self.mario.frame.size.width, self.mario.frame.size.height)];
    [self.mario setBounds:CGRectMake(0, 0, self.startSize.width, self.startSize.height)];
        [self.objetoContadorCima maisUm];
    }
}

- (IBAction)praDireita:(id)sender{
    if (self.mario.frame.origin.x < 180) {
    [self.mario setFrame:CGRectMake(self.mario.frame.origin.x+20, self.mario.frame.origin.y, self.mario.frame.size.width, self.mario.frame.size.height)];
    [self.mario setBounds:CGRectMake(0, 0, self.startSize.width, self.startSize.height)];
        [self.objetoContadorDireto maisUm];
    }
}

- (IBAction)praEsquerda:(id)sender{
    if (self.mario.frame.origin.x > 30) {
    [self.mario setFrame:CGRectMake(self.mario.frame.origin.x-20, self.mario.frame.origin.y, self.mario.frame.size.width, self.mario.frame.size.height)];
    [self.mario setBounds:CGRectMake(0, 0, self.startSize.width, self.startSize.height)];
        [self.objetoContadorEsquerda maisUm];
    }
}

- (IBAction)rotacaoHorario:(id)sender{
    self.anglo = self.anglo + .34906585;
    self.mario.transform = CGAffineTransformMakeRotation(self.anglo);
    [self.objetoContadorAngle maisVinte];
}

- (IBAction)rotacaoAntiHorario:(id)sender{
    self.anglo = self.anglo - .34906585;
    self.mario.transform = CGAffineTransformMakeRotation(self.anglo);
    [self.objetoContadorAngle menosVinte];
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
