//
//  EstatisticaViewController.m
//  TesteImagemBotoes
//
//  Created by Anderson José da Silva on 25/03/15.
//  Copyright (c) 2015 Murilo Gasparetto. All rights reserved.
//

#import "EstatisticaViewController.h"

@interface EstatisticaViewController ()

@property (nonatomic, weak) IBOutlet UILabel *labelDireita;

@property (nonatomic, weak) IBOutlet UILabel *labelEsquerda;

@property (nonatomic, weak) IBOutlet UILabel *labelCima;

@property (nonatomic, weak) IBOutlet UILabel *labelBaixo;

@property (nonatomic, weak) IBOutlet UILabel *labelAngle;


@end

@implementation EstatisticaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)reset:(id)sender{}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
