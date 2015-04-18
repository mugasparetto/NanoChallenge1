//
//  ImageViewController.h
//  TesteImagemBotoes
//
//  Created by Murilo Gasparetto on 20/03/15.
//  Copyright (c) 2015 Murilo Gasparetto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EstatisticaViewController.h"

@interface ImageViewController : UIViewController

@property (nonatomic) EstatisticaViewController *evc;
@property (nonatomic) IBOutlet UIView *viewAlert;
@property (weak, nonatomic) IBOutlet UIButton *btnOK;
@property (weak, nonatomic) IBOutlet UIButton *btnEstatisticas;

@property (weak, nonatomic) IBOutlet UIButton *btnCima;
@property (weak, nonatomic) IBOutlet UIButton *btnBaixo;
@property (weak, nonatomic) IBOutlet UIButton *btnEsq;
@property (weak, nonatomic) IBOutlet UIButton *btnDir;
@property (weak, nonatomic) IBOutlet UIButton *btnAngloEsq;
@property (weak, nonatomic) IBOutlet UIButton *btnAngloDir;

@property (weak, nonatomic) IBOutlet UIButton *btnReset;
@property (weak, nonatomic) IBOutlet UIButton *btnIrEstatisticas;

@property (nonatomic) NSMutableArray *imagens;
@property (nonatomic) NSMutableArray *sombras;

@end
