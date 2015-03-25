//
//  contadorAngle.m
//  TesteImagemBotoes
//
//  Created by Anderson José da Silva on 25/03/15.
//  Copyright (c) 2015 Murilo Gasparetto. All rights reserved.
//

#import "contadorAngle.h"

@implementation contadorAngle

+ (instancetype) instance {
    
    static contadorAngle *auxiliar = nil;
    if (!auxiliar) {
        auxiliar = [[self alloc]initPrivite];
    }
    return auxiliar;
}

- (instancetype) init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use  + [contadorAngle]"
                                 userInfo:nil ];
    
}


- (instancetype)initPrivite {
    
    self = [super init];
    if (self) {
        self.valorAngle = 0;
    }
    
    return self;
}

- (void) maisUm{
    
    self.valorAngle ++;
    
}


@end
