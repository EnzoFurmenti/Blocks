//
//  Student.m
//  Blocks
//
//  Created by EnzoF on 08.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Student.h"

static NSString *firstNames[] = {
                                    @"Милена",
                                    @"Инна",
                                    @"Богдан",
                                    @"Анатолий",
                                    @"Тимофей",
                                    @"Родион",
                                    @"Альбина",
                                    @"Семён",
                                    @"Глеб",
                                    @"Вячеслав",
                                    @"Алла",
                                    @"Василиса",
                                    @"Анжелика",
                                    @"Марат",
                                    @"Владислав",
                                    @"Ярослав",
                                    @"Маргарита",
                                    @"Матвей",
                                    @"Тимур",
                                    @"Виталий",
                                    @"Степан"
                                };
static int firstNameCount = 21;


static NSString *lastNames[] = {
                                    @"Шуткевич",
                                    @"Робинович",
                                    @"Тореро",
                                    @"Айбу",
                                    @"Хосе",
                                    @"Каншау",
                                    @"Франсуа",
                                    @"Тойбухаа",
                                    @"Качаа",
                                    @"Зиа",
                                    @"Хожулаа",
                                    @"Дурново",
                                    @"Дубяго",
                                    @"Черных",
                                    @"Сухих",
                                    @"Чутких",
                                    @"Белаго",
                                    @"Хитрово",
                                    @"Бегун",
                                    @"Мельник",
                                    @"Шевченко"
                                };
static int lastNameCount = 21;


@implementation Student


- (id)initWithRandomTheInitialValues{
    
    self = [super init];
    if(self)
    {
        self.firstName = firstNames[arc4random() % firstNameCount];
        self.lastName= lastNames[arc4random() % lastNameCount];
        self.temperature = 36.5f + (float)(arc4random() % 50)/10.f;
        self.shivering = arc4random() % 2;
        self.headAche = arc4random() % 2;
        self.stomachAche = arc4random() % 2;
        self.footAche = arc4random() % 2;
        self.goodGradeDoctor = arc4random() % 2;
    }
    return self;
}


- (BOOL) fellsBetter{
    BOOL isfellsBetter = arc4random() % 2;
    if(isfellsBetter)
    {
        [self patientFeelsBadBlockAsDelegate:self.blockAsDelegate];
        
    }
    return isfellsBetter;
}
- (void) takePill{
    NSLog(@"Пациенту %@ %@ дали таблетку",self.lastName, self.firstName);
    
}
- (void) makeShot{
    
    NSLog(@"Пациенту %@ %@ сделали укол",self.lastName, self.firstName);
}

- (void) takePillForHead{
    NSLog(@"Пациент %@ %@ принял таблетку от головной боли",self.lastName, self.firstName);
}


- (void) massage{
    NSLog(@"Пациенту %@ %@  сделали массаж",self.lastName, self.firstName);
}
- (void) takePillForStomach{
    
    NSLog(@"Пациенту %@ %@ дали таблетку от живота",self.lastName, self.firstName);
}


- (void)patientFeelsBadBlockAsDelegate:(BlockAsDelegate)blockAsdelegate{

    blockAsdelegate(self,self.temperature,
                    self.shivering,
                    self.headAche,
                    self.stomachAche,
                    self.footAche,
                    self.goodGradeDoctor);
}


- (void) askPatient:(BOOL) goodGradeDoctor{
    if(goodGradeDoctor)
    {
        NSLog(@"Пациента %@ %@ устраивает использование AppDelegate",self.lastName,self.firstName);
    }
    else
    {
    
        NSLog(@"Пациента %@ %@ не устраивает использование AppDelegate",self.lastName,self.firstName);
    }
    
    
}



@end
