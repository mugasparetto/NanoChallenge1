//
//  ImageViewController.m
//  TesteImagemBotoes
//
//  Created by Murilo Gasparetto on 20/03/15.
//  Copyright (c) 2015 Murilo Gasparetto. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "ImageViewController.h"
#import "EstatisticaViewController.h"
#import "contadorDireita.h"
#import "contadorEsquerda.h"
#import "contadorBaixo.h"
#import "contadorCima.h"
#import "contadorAngle.h"
#import "Coordenadas.h"

@interface ImageViewController ()

{
    AVAudioPlayer *_musicaFundo;
    int _startMusica;
}

@property (nonatomic, weak) IBOutlet UIImageView *mario;
@property (nonatomic, weak) IBOutlet UIScrollView *scroll;
@property (nonatomic) UIImageView *sombra;
@property (nonatomic) CGFloat anglo;
@property CGSize startSize;

@property (nonatomic) contadorDireita *objetoContadorDireto;
@property (nonatomic) contadorEsquerda *objetoContadorEsquerda;
@property (nonatomic) contadorBaixo *objetoContadorBaixo;
@property (nonatomic) contadorCima *objetoContadorCima;
@property (nonatomic) contadorAngle *objetoContadorAngle;
@property (nonatomic) Coordenadas *vetoresCoordenadas;

@end

@implementation ImageViewController

@synthesize btnCima, btnBaixo, btnDir, btnEsq, btnAngloDir, btnAngloEsq, btnEstatisticas, btnOK;

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self){
        self.anglo = 0;
        _startMusica = 1;
        self.tabBarItem.title = @"Jogo";
        UIImage *i = [UIImage imageNamed:@"IconeGame2.png"];
        self.tabBarItem.image = i;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.evc = [[EstatisticaViewController alloc] init];
    self.sombras = [[NSMutableArray alloc] init];
    
    [self.sombras addObject:[UIImage imageNamed:@"imagem1.png"]];
    [self.sombras addObject:[UIImage imageNamed:@"imagem2.png"]];
    [self.sombras addObject:[UIImage imageNamed:@"imagem3.png"]];
    
//    self.mario.backgroundColor = [UIColor redColor];
    self.startSize = self.mario.frame.size;
    self.objetoContadorEsquerda = [contadorEsquerda instance];
    self.objetoContadorDireto = [contadorDireita instance];
    self.objetoContadorCima = [contadorCima instance];
    self.objetoContadorBaixo = [contadorBaixo instance];
    self.objetoContadorAngle = [contadorAngle instance];
    self.vetoresCoordenadas = [Coordenadas instance];
    self.scroll.contentSize=CGSizeMake(960,568);
    self.scroll.bounces = NO;
    self.vetoresCoordenadas.sorteioX = arc4random()%5;
    self.vetoresCoordenadas.sorteioY = arc4random()%8;
    self.vetoresCoordenadas.sorteioAng = arc4random()%17;
    self.sombra = [[UIImageView alloc] init];
    
    [self resetImagem];
    
    [self.view insertSubview:self.sombra belowSubview:self.mario];
    // Do any additional setup after loading the view from its nib.
    
    NSString *path = [NSString stringWithFormat:@"%@/sound-mario.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    _musicaFundo = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    _musicaFundo.numberOfLoops = -1;
    [_musicaFundo play];
    
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSNumber *auxX, *auxY, *auxAng;
    auxX = [self.vetoresCoordenadas.posX objectAtIndex:self.vetoresCoordenadas.sorteioX];
    auxY = [self.vetoresCoordenadas.posY objectAtIndex:self.vetoresCoordenadas.sorteioY];
    auxAng = [self.vetoresCoordenadas.angle objectAtIndex:self.vetoresCoordenadas.sorteioAng];

    self.sombra.frame = CGRectMake ([auxX integerValue],[auxY integerValue],100,127);
    self.sombra.transform = CGAffineTransformMakeRotation([auxAng floatValue]);
    self.sombra.bounds = CGRectMake(0, 0, self.startSize.width, self.startSize.height);
    
    
    if (self.vetoresCoordenadas.resetou){
        self.anglo = 0;
        self.mario.transform = CGAffineTransformMakeRotation(self.anglo);
        [self.mario setFrame:CGRectMake(110, 190, self.startSize.width, self.startSize.height)];
        self.sombra.bounds = CGRectMake(0, 0, self.startSize.width, self.startSize.height);
        [self resetImagem];
        self.vetoresCoordenadas.resetou = NO;
    }
    
    [self.viewAlert setHidden:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)praBaixo:(id)sender {
    if (self.mario.frame.origin.y < 240) {
        [self.mario setFrame:CGRectMake(self.mario.frame.origin.x, self.mario.frame.origin.y + 20,
                                        self.mario.frame.size.width, self.mario.frame.size.height)];
        
        [self.mario setBounds:CGRectMake(0, 0,
                                         self.startSize.width, self.startSize.height)];
        
        [self.objetoContadorBaixo maisUm];
    }
    
    [self verificarEncaixe];
    
}

- (IBAction)praCima:(id)sender{
    if (self.mario.frame.origin.y > 30) {
        [self.mario setFrame:CGRectMake(self.mario.frame.origin.x, self.mario.frame.origin.y-20,
                                        self.mario.frame.size.width, self.mario.frame.size.height)];
        
        [self.mario setBounds:CGRectMake(0, 0,
                                         self.startSize.width, self.startSize.height)];
        
        [self.objetoContadorCima maisUm];
    }
    
    [self verificarEncaixe];
  
}

- (IBAction)praDireita:(id)sender{
    if (self.mario.frame.origin.x < 180) {
        [self.mario setFrame:CGRectMake(self.mario.frame.origin.x+20, self.mario.frame.origin.y,
                                    self.mario.frame.size.width, self.mario.frame.size.height)];
        
        [self.mario setBounds:CGRectMake(0, 0,
                                         self.startSize.width, self.startSize.height)];
        
        [self.objetoContadorDireto maisUm];
    }
    
    [self verificarEncaixe];
    
}

- (IBAction)praEsquerda:(id)sender{
    if (self.mario.frame.origin.x > 30) {
        [self.mario setFrame:CGRectMake(self.mario.frame.origin.x-20, self.mario.frame.origin.y,
                                        self.mario.frame.size.width, self.mario.frame.size.height)];
        
        [self.mario setBounds:CGRectMake(0, 0,
                                         self.startSize.width, self.startSize.height)];
        
        [self.objetoContadorEsquerda maisUm];
    }
    
    [self verificarEncaixe];
}

- (IBAction)rotacaoHorario:(id)sender{
    self.anglo = self.anglo + .34906585;
    self.mario.transform = CGAffineTransformMakeRotation(self.anglo);
    [self.objetoContadorAngle maisVinte];
    
    [self verificarEncaixe];
}

- (IBAction)rotacaoAntiHorario:(id)sender{
    self.anglo = self.anglo - .34906585;
    self.mario.transform = CGAffineTransformMakeRotation(self.anglo);
    [self.objetoContadorAngle menosVinte];
    
    [self verificarEncaixe];
}

- (IBAction)play:(id)sender{
    
    int aux = 1;
    
    if ([sender isSelected]) {
        [_musicaFundo play];
        aux = 1;
        UIImage *unselectedImage = [UIImage imageNamed:@"somOn.png"];
        [sender setBackgroundImage:unselectedImage forState:UIControlStateNormal];
        [sender setSelected:NO];
    }
    
    else{
        [_musicaFundo stop];
        aux = 0;
        UIImage *selectedImage = [UIImage imageNamed:@"somOff.png"];
        [sender setBackgroundImage:selectedImage forState:UIControlStateSelected];
        [sender setSelected:YES];
    }
    _startMusica = aux;

}

- (IBAction)btnOK:(id)sender{
    [self.viewAlert setHidden:YES];
    [self enableControll];
}

- (IBAction)btnEstatisticas:(id)sender{
    
    [self.navigationController pushViewController:self.evc animated:YES];
    [self.viewAlert setHidden:YES];
    [self enableControll];
}

- (IBAction)btnIrEstatisticas:(id)sender{
    [self.navigationController pushViewController:self.evc animated:YES];

}

- (IBAction)btnReset:(id)sender{
    [self reset];
}

- (void) verificarEncaixe {
    
    if (trunc(self.mario.frame.origin.x*100)/100 == trunc(self.sombra.frame.origin.x*100)/100 ){
        if (trunc(self.mario.frame.origin.y*100)/100 == trunc(self.sombra.frame.origin.y*100)/100){
            
            printf("\n\n");
            printf("M: a:%f b:%f c:%f d:%f tx:%f ty:%f \n",
                   trunc(self.mario.transform.a*10)/10, trunc(self.mario.transform.b*10)/10,
                   trunc(self.mario.transform.c*10)/10, trunc(self.mario.transform.d*10)/10,
                   trunc(self.mario.transform.tx*10)/10, trunc(self.mario.transform.ty*10)/10 );
            
            printf("S: a:%f b:%f c:%f d:%f tx:%f ty:%f \n",
                   trunc(self.sombra.transform.a*10)/10, trunc(self.sombra.transform.b*10)/10,
                   trunc(self.sombra.transform.c*10)/10, trunc(self.sombra.transform.d*10)/10,
                   trunc(self.sombra.transform.tx*10)/10, trunc(self.sombra.transform.ty*10)/10 );
            printf("\n\n");
            printf("M4: a:%f b:%f c:%f d:%f tx:%f ty:%f \n",
                   trunc((self.mario.transform.a + 0.04)*10)/10, trunc((self.mario.transform.b + 0.04)*10)/10,
                   trunc((self.mario.transform.c + 0.04)*10)/10, trunc((self.mario.transform.d + 0.04)*10)/10,
                   trunc((self.mario.transform.tx + 0.04)*10)/10, trunc((self.mario.transform.ty + 0.04)*10)/10);
            
            printf("S4: a:%f b:%f c:%f d:%f tx:%f ty:%f \n",
                   trunc((self.sombra.transform.a + 0.04)*10)/10, trunc((self.sombra.transform.b + 0.04)*10)/10,
                   trunc((self.sombra.transform.c + 0.04)*10)/10, trunc((self.sombra.transform.d + 0.04)*10)/10,
                   trunc((self.sombra.transform.tx + 0.04)*10)/10, trunc((self.sombra.transform.ty + 0.04)*10)/10);
            
            if (trunc((self.mario.transform.a + 0.04)*10)/10  == trunc((self.sombra.transform.a + 0.04)*10)/10 &&
                trunc((self.mario.transform.b + 0.04)*10)/10  == trunc((self.sombra.transform.b + 0.04)*10)/10 &&
                trunc((self.mario.transform.c + 0.04)*10)/10  == trunc((self.sombra.transform.c + 0.04)*10)/10 &&
                trunc((self.mario.transform.d + 0.04)*10)/10  == trunc((self.sombra.transform.d + 0.04)*10)/10 &&
                trunc((self.mario.transform.tx + 0.04)*10)/10 == trunc((self.sombra.transform.tx + 0.04)*10)/10 &&
                trunc((self.mario.transform.ty + 0.04)*10)/10 == trunc((self.sombra.transform.ty + 0.04)*10)/10 )  {
                
                    [self.viewAlert setHidden:NO];
                    [self disableControll];
            }
        }
    }
}

- (void) reset {
    self.objetoContadorDireto.valorDireita = 0;
    
    self.objetoContadorEsquerda.valorEsquerda = 0;
    
    self.objetoContadorCima.valorCima = 0;
    
    self.objetoContadorBaixo.valorBaixo = 0;
    
    self.objetoContadorAngle.quantidadeVoltas = 0;
    
    self.objetoContadorAngle.valorAngleAtual = 0;
    
    self.objetoContadorAngle.valorAngle = 0;
    
    self.vetoresCoordenadas.sorteioX = arc4random()%5;
    self.vetoresCoordenadas.sorteioY = arc4random()%8;
    self.vetoresCoordenadas.sorteioAng = arc4random()%17;
    
    NSNumber *auxX, *auxY, *auxAng;
    auxX = [self.vetoresCoordenadas.posX objectAtIndex:self.vetoresCoordenadas.sorteioX];
    auxY = [self.vetoresCoordenadas.posY objectAtIndex:self.vetoresCoordenadas.sorteioY];
    auxAng = [self.vetoresCoordenadas.angle objectAtIndex:self.vetoresCoordenadas.sorteioAng];
    
    self.sombra.frame = CGRectMake ([auxX integerValue],[auxY integerValue],100,127);
    self.sombra.transform = CGAffineTransformMakeRotation([auxAng floatValue]);
    self.sombra.bounds = CGRectMake(0, 0, self.startSize.width, self.startSize.height);
    
    self.anglo = 0;
    self.mario.transform = CGAffineTransformMakeRotation(self.anglo);
    [self.mario setFrame:CGRectMake(110, 190, self.startSize.width, self.startSize.height)];
    self.sombra.bounds = CGRectMake(0, 0, self.startSize.width, self.startSize.height);
    self.vetoresCoordenadas.resetou = NO;
    
    [self resetImagem];

}

- (void) enableControll {
    
    [btnCima setEnabled:YES];
    [btnBaixo setEnabled:YES];
    [btnEsq setEnabled:YES];
    [btnDir setEnabled:YES];
    [btnAngloEsq setEnabled:YES];
    [btnAngloDir setEnabled:YES];
}

- (void) disableControll {
    
    [btnCima setEnabled:NO];
    [btnBaixo setEnabled:NO];
    [btnEsq setEnabled:NO];
    [btnDir setEnabled:NO];
    [btnAngloEsq setEnabled:NO];
    [btnAngloDir setEnabled:NO];
}

- (void) resetImagem {
    
    NSInteger sorteioPersonagem = arc4random()%3;
    self.sombra.image = [self.sombras objectAtIndex:sorteioPersonagem];
    self.mario.image = [self.sombras objectAtIndex:sorteioPersonagem];
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
