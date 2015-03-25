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

@interface EstatisticaViewController ()

@property (nonatomic, weak) IBOutlet UILabel *labelDireita;
@property (nonatomic, weak) IBOutlet UILabel *labelEsquerda;
@property (nonatomic, weak) IBOutlet UILabel *labelCima;
@property (nonatomic, weak) IBOutlet UILabel *labelBaixo;
@property (nonatomic, weak) IBOutlet UILabel *labelAngle;

@property (nonatomic) contadorDireita *objetoContadorDireto;
@property (nonatomic) contadorEsquerda *objetoContadorEsquerda;
@property (nonatomic) contadorBaixo *objetoContadorBaixo;
@property (nonatomic) contadorCima *objetoContadorCima;
@property (nonatomic) contadorAngle *objetoContadorAngle;


@end

@implementation EstatisticaViewController


- (void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.labelEsquerda.text = [NSString stringWithFormat:@"%d", self.objetoContadorEsquerda.valorEsquerda];
    self.labelDireita.text = [NSString stringWithFormat:@"%d", self.objetoContadorDireto.valorDireita];
    self.labelCima.text = [NSString stringWithFormat:@"%d", self.objetoContadorCima.valorCima];
    self.labelBaixo.text = [NSString stringWithFormat:@"%d", self.objetoContadorBaixo.valorBaixo];
    self.labelAngle.text = [NSString stringWithFormat:@"%d", self.objetoContadorAngle.valorAngle];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.objetoContadorEsquerda = [contadorEsquerda instance];
    self.objetoContadorDireto = [contadorDireita instance];
    self.objetoContadorCima = [contadorCima instance];
    self.objetoContadorBaixo = [contadorBaixo instance];
    self.objetoContadorAngle = [contadorAngle instance];
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
