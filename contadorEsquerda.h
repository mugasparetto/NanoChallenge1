//
//  contadorEsquerda.h
//  TesteImagemBotoes
//
//  Created by Anderson José da Silva on 25/03/15.
//  Copyright (c) 2015 Murilo Gasparetto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface contadorEsquerda : NSObject

+ (instancetype) instance;
- (void) maisUm;

@property (nonatomic) int valorEsquerda;



@end
