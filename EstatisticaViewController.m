//
//  EstatisticaViewController.m
//  TesteImagemBotoes
//
//  Created by Anderson José da Silva on 25/03/15.
//  Copyright (c) 2015 Murilo Gasparetto. All rights reserved.
//

#import "EstatisticaViewController.h"
#import "contadorDireita.h"
#import "contadorEsquerda.h"
#import "contadorBaixo.h"
#import "contadorCima.h"
#import "contadorAngle.h"
#import "Coordenadas.h"

@interface EstatisticaViewController ()

@property (nonatomic, weak) IBOutlet UILabel *labelDireita;
@property (nonatomic, weak) IBOutlet UILabel *labelEsquerda;
@property (nonatomic, weak) IBOutlet UILabel *labelCima;
@property (nonatomic, weak) IBOutlet UILabel *labelBaixo;
@property (nonatomic, weak) IBOutlet UILabel *labelAngle;
@property (nonatomic, weak) IBOutlet UILabel *labelAngleAtual;
@property (nonatomic, weak) IBOutlet UILabel *labelQuantidadeVoltas;

@property (nonatomic) contadorDireita *objetoContadorDireto;
@property (nonatomic) contadorEsquerda *objetoContadorEsquerda;
@property (nonatomic) contadorBaixo *objetoContadorBaixo;
@property (nonatomic) contadorCima *objetoContadorCima;
@property (nonatomic) contadorAngle *objetoContadorAngle;
@property (nonatomic) Coordenadas *vetoresCoordenadas;

@end

@implementation EstatisticaViewController


- (void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.labelEsquerda.text = [NSString stringWithFormat:@"%d", self.objetoContadorEsquerda.valorEsquerda];
    self.labelDireita.text = [NSString stringWithFormat:@"%d", self.objetoContadorDireto.valorDireita];
    self.labelCima.text = [NSString stringWithFormat:@"%d", self.objetoContadorCima.valorCima];
    self.labelBaixo.text = [NSString stringWithFormat:@"%d", self.objetoContadorBaixo.valorBaixo];
    self.labelAngle.text = [NSString stringWithFormat:@"%d", self.objetoContadorAngle.valorAngle];
    self.labelAngleAtual.text = [NSString stringWithFormat:@"%d", self.objetoContadorAngle.valorAngleAtual];
    self.labelQuantidadeVoltas.text = [NSString stringWithFormat:@"%d", self.objetoContadorAngle.quantidadeVoltas];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.objetoContadorEsquerda = [contadorEsquerda instance];
    self.objetoContadorDireto = [contadorDireita instance];
    self.objetoContadorCima = [contadorCima instance];
    self.objetoContadorBaixo = [contadorBaixo instance];
    self.objetoContadorAngle = [contadorAngle instance];
    self.vetoresCoordenadas = [Coordenadas instance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)reset:(id)sender{
    
    self.objetoContadorDireto.valorDireita = 0;
    self.labelDireita.text = [NSString stringWithFormat:@"%d", self.objetoContadorDireto.valorDireita];
    
    self.objetoContadorEsquerda.valorEsquerda = 0;
    self.labelEsquerda.text = [NSString stringWithFormat:@"%d", self.objetoContadorEsquerda.valorEsquerda];
    
    self.objetoContadorCima.valorCima = 0;
    self.labelCima.text = [NSString stringWithFormat:@"%d", self.objetoContadorCima.valorCima];
    
    self.objetoContadorBaixo.valorBaixo = 0;
    self.labelBaixo.text = [NSString stringWithFormat:@"%d", self.objetoContadorBaixo.valorBaixo];
    
    self.objetoContadorAngle.quantidadeVoltas = 0;
    self.labelQuantidadeVoltas.text = [NSString stringWithFormat:@"%d", self.objetoContadorAngle.quantidadeVoltas];
    
    self.objetoContadorAngle.valorAngle = 0;
    self.labelAngle.text = [NSString stringWithFormat:@"%d", self.objetoContadorAngle.valorAngle];
    
    self.vetoresCoordenadas.sorteioX = arc4random()%5;
    self.vetoresCoordenadas.sorteioY = arc4random()%8;
    self.vetoresCoordenadas.sorteioAng = arc4random()%17;


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
